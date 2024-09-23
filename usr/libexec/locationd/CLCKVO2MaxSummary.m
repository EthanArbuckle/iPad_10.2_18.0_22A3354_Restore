@implementation CLCKVO2MaxSummary

- (void)setStartTime:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasStartTime
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setWorkoutType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasWorkoutType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setDurationInSeconds:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_durationInSeconds = a3;
}

- (void)setHasDurationInSeconds:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDurationInSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPointCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_pointCount = a3;
}

- (void)setHasPointCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPointCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHrMin:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_hrMin = a3;
}

- (void)setHasHrMin:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHrMin
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHrMax:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hrMax = a3;
}

- (void)setHasHrMax:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHrMax
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHrMean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_hrMean = a3;
}

- (void)setHasHrMean:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHrMean
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHrConfidenceMean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hrConfidenceMean = a3;
}

- (void)setHasHrConfidenceMean:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHrConfidenceMean
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHrCadenceAgreementMean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_hrCadenceAgreementMean = a3;
}

- (void)setHasHrCadenceAgreementMean:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasHrCadenceAgreementMean
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setVo2Mean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_vo2Mean = a3;
}

- (void)setHasVo2Mean:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasVo2Mean
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setSpeedMean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_speedMean = a3;
}

- (void)setHasSpeedMean:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSpeedMean
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setGradeMean:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_gradeMean = a3;
}

- (void)setHasGradeMean:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasGradeMean
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCadenceMean:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_cadenceMean = a3;
}

- (void)setHasCadenceMean:(BOOL)a3
{
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCadenceMean
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHrVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hrVariance = a3;
}

- (void)setHasHrVariance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHrVariance
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHrConfidenceVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hrConfidenceVariance = a3;
}

- (void)setHasHrConfidenceVariance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHrConfidenceVariance
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHrCadenceAgreementVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_hrCadenceAgreementVariance = a3;
}

- (void)setHasHrCadenceAgreementVariance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasHrCadenceAgreementVariance
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setVo2Variance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_vo2Variance = a3;
}

- (void)setHasVo2Variance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasVo2Variance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSpeedVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_speedVariance = a3;
}

- (void)setHasSpeedVariance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSpeedVariance
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setGradeVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_gradeVariance = a3;
}

- (void)setHasGradeVariance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasGradeVariance
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setVo2MaxModelSource:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_vo2MaxModelSource = a3;
}

- (void)setHasVo2MaxModelSource:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasVo2MaxModelSource
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSessionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_sessionType = a3;
}

- (void)setHasSessionType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSessionType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxSummary;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[CLCKVO2MaxSummary description](&v3, "description"), -[CLCKVO2MaxSummary dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime), CFSTR("startTime"));
    has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_workoutType), CFSTR("workoutType"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_durationInSeconds), CFSTR("durationInSeconds"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_pointCount), CFSTR("pointCount"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrMin), CFSTR("hrMin"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrMax), CFSTR("hrMax"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrMean), CFSTR("hrMean"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrConfidenceMean), CFSTR("hrConfidenceMean"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrCadenceAgreementMean), CFSTR("hrCadenceAgreementMean"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_vo2Mean), CFSTR("vo2Mean"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_speedMean), CFSTR("speedMean"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_gradeMean), CFSTR("gradeMean"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_cadenceMean), CFSTR("cadenceMean"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrVariance), CFSTR("hrVariance"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrConfidenceVariance), CFSTR("hrConfidenceVariance"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrCadenceAgreementVariance), CFSTR("hrCadenceAgreementVariance"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_vo2Variance), CFSTR("vo2Variance"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_speedVariance), CFSTR("speedVariance"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_21;
LABEL_43:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_vo2MaxModelSource), CFSTR("vo2MaxModelSource"));
    if ((*(_DWORD *)&self->_has & 0x40000) == 0)
      return v3;
    goto LABEL_22;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_gradeVariance), CFSTR("gradeVariance"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
    goto LABEL_43;
LABEL_21:
  if ((*(_DWORD *)&has & 0x40000) != 0)
LABEL_22:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sessionType), CFSTR("sessionType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100EDE230((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has;

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 1, self->_startTime);
    has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_workoutType, 2);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField(a3, 3, self->_durationInSeconds);
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field(a3, self->_pointCount, 4);
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField(a3, 5, self->_hrMin);
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField(a3, 6, self->_hrMax);
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField(a3, 7, self->_hrMean);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField(a3, 8, self->_hrConfidenceMean);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField(a3, 9, self->_hrCadenceAgreementMean);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField(a3, 10, self->_vo2Mean);
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField(a3, 11, self->_speedMean);
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField(a3, 12, self->_gradeMean);
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField(a3, 13, self->_cadenceMean);
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField(a3, 14, self->_hrVariance);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteDoubleField(a3, 15, self->_hrConfidenceVariance);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteDoubleField(a3, 16, self->_hrCadenceAgreementVariance);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteDoubleField(a3, 17, self->_vo2Variance);
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_20;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteDoubleField(a3, 18, self->_speedVariance);
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField(a3, 19, self->_gradeVariance);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      return;
LABEL_43:
    PBDataWriterWriteInt32Field(a3, self->_sessionType, 21);
    return;
  }
LABEL_42:
  PBDataWriterWriteInt32Field(a3, self->_vo2MaxModelSource, 20);
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
    goto LABEL_43;
}

- (void)copyTo:(id)a3
{
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has;

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    *((_QWORD *)a3 + 16) = *(_QWORD *)&self->_startTime;
    *((_DWORD *)a3 + 41) |= 0x8000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 40) = self->_workoutType;
  *((_DWORD *)a3 + 41) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_durationInSeconds;
  *((_DWORD *)a3 + 41) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)a3 + 13) = self->_pointCount;
  *((_DWORD *)a3 + 41) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)a3 + 11) = *(_QWORD *)&self->_hrMin;
  *((_DWORD *)a3 + 41) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)a3 + 9) = *(_QWORD *)&self->_hrMax;
  *((_DWORD *)a3 + 41) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)a3 + 10) = *(_QWORD *)&self->_hrMean;
  *((_DWORD *)a3 + 41) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)a3 + 7) = *(_QWORD *)&self->_hrConfidenceMean;
  *((_DWORD *)a3 + 41) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)a3 + 5) = *(_QWORD *)&self->_hrCadenceAgreementMean;
  *((_DWORD *)a3 + 41) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)a3 + 17) = *(_QWORD *)&self->_vo2Mean;
  *((_DWORD *)a3 + 41) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)a3 + 14) = *(_QWORD *)&self->_speedMean;
  *((_DWORD *)a3 + 41) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_gradeMean;
  *((_DWORD *)a3 + 41) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_cadenceMean;
  *((_DWORD *)a3 + 41) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)a3 + 12) = *(_QWORD *)&self->_hrVariance;
  *((_DWORD *)a3 + 41) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)a3 + 8) = *(_QWORD *)&self->_hrConfidenceVariance;
  *((_DWORD *)a3 + 41) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)a3 + 6) = *(_QWORD *)&self->_hrCadenceAgreementVariance;
  *((_DWORD *)a3 + 41) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)a3 + 18) = *(_QWORD *)&self->_vo2Variance;
  *((_DWORD *)a3 + 41) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_20;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)a3 + 15) = *(_QWORD *)&self->_speedVariance;
  *((_DWORD *)a3 + 41) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)a3 + 4) = *(_QWORD *)&self->_gradeVariance;
  *((_DWORD *)a3 + 41) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      return;
LABEL_43:
    *((_DWORD *)a3 + 38) = self->_sessionType;
    *((_DWORD *)a3 + 41) |= 0x40000u;
    return;
  }
LABEL_42:
  *((_DWORD *)a3 + 39) = self->_vo2MaxModelSource;
  *((_DWORD *)a3 + 41) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
    goto LABEL_43;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    *((_QWORD *)result + 16) = *(_QWORD *)&self->_startTime;
    *((_DWORD *)result + 41) |= 0x8000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 40) = self->_workoutType;
  *((_DWORD *)result + 41) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_durationInSeconds;
  *((_DWORD *)result + 41) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)result + 13) = self->_pointCount;
  *((_DWORD *)result + 41) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)result + 11) = *(_QWORD *)&self->_hrMin;
  *((_DWORD *)result + 41) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)result + 9) = *(_QWORD *)&self->_hrMax;
  *((_DWORD *)result + 41) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)result + 10) = *(_QWORD *)&self->_hrMean;
  *((_DWORD *)result + 41) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_hrConfidenceMean;
  *((_DWORD *)result + 41) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_hrCadenceAgreementMean;
  *((_DWORD *)result + 41) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)result + 17) = *(_QWORD *)&self->_vo2Mean;
  *((_DWORD *)result + 41) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)result + 14) = *(_QWORD *)&self->_speedMean;
  *((_DWORD *)result + 41) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_gradeMean;
  *((_DWORD *)result + 41) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_cadenceMean;
  *((_DWORD *)result + 41) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)result + 12) = *(_QWORD *)&self->_hrVariance;
  *((_DWORD *)result + 41) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_hrConfidenceVariance;
  *((_DWORD *)result + 41) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_hrCadenceAgreementVariance;
  *((_DWORD *)result + 41) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)result + 18) = *(_QWORD *)&self->_vo2Variance;
  *((_DWORD *)result + 41) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)result + 15) = *(_QWORD *)&self->_speedVariance;
  *((_DWORD *)result + 41) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_gradeVariance;
  *((_DWORD *)result + 41) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      return result;
    goto LABEL_22;
  }
LABEL_43:
  *((_DWORD *)result + 39) = self->_vo2MaxModelSource;
  *((_DWORD *)result + 41) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x40000) == 0)
    return result;
LABEL_22:
  *((_DWORD *)result + 38) = self->_sessionType;
  *((_DWORD *)result + 41) |= 0x40000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has;
  int v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 41);
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_startTime != *((double *)a3 + 16))
        goto LABEL_106;
    }
    else if ((v7 & 0x8000) != 0)
    {
LABEL_106:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_workoutType != *((_DWORD *)a3 + 40))
        goto LABEL_106;
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_durationInSeconds != *((double *)a3 + 2))
        goto LABEL_106;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_pointCount != *((_QWORD *)a3 + 13))
        goto LABEL_106;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_hrMin != *((double *)a3 + 11))
        goto LABEL_106;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_hrMax != *((double *)a3 + 9))
        goto LABEL_106;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_hrMean != *((double *)a3 + 10))
        goto LABEL_106;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_hrConfidenceMean != *((double *)a3 + 7))
        goto LABEL_106;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_hrCadenceAgreementMean != *((double *)a3 + 5))
        goto LABEL_106;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_vo2Mean != *((double *)a3 + 17))
        goto LABEL_106;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_speedMean != *((double *)a3 + 14))
        goto LABEL_106;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_gradeMean != *((double *)a3 + 3))
        goto LABEL_106;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_cadenceMean != *((double *)a3 + 1))
        goto LABEL_106;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_hrVariance != *((double *)a3 + 12))
        goto LABEL_106;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_hrConfidenceVariance != *((double *)a3 + 8))
        goto LABEL_106;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_hrCadenceAgreementVariance != *((double *)a3 + 6))
        goto LABEL_106;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_vo2Variance != *((double *)a3 + 18))
        goto LABEL_106;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_speedVariance != *((double *)a3 + 15))
        goto LABEL_106;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_gradeVariance != *((double *)a3 + 4))
        goto LABEL_106;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_vo2MaxModelSource != *((_DWORD *)a3 + 39))
        goto LABEL_106;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_106;
    }
    LOBYTE(v5) = (v7 & 0x40000) == 0;
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_sessionType != *((_DWORD *)a3 + 38))
        goto LABEL_106;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has;
  unint64_t v4;
  double startTime;
  double v6;
  long double v7;
  double v8;
  double durationInSeconds;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  double hrMin;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  double hrMax;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double hrMean;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double hrConfidenceMean;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double hrCadenceAgreementMean;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  double vo2Mean;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  double speedMean;
  double v46;
  long double v47;
  double v48;
  unint64_t v49;
  double gradeMean;
  double v51;
  long double v52;
  double v53;
  unint64_t v54;
  double cadenceMean;
  double v56;
  long double v57;
  double v58;
  unint64_t v59;
  double hrVariance;
  double v61;
  long double v62;
  double v63;
  unint64_t v64;
  double hrConfidenceVariance;
  double v66;
  long double v67;
  double v68;
  unint64_t v69;
  double hrCadenceAgreementVariance;
  double v71;
  long double v72;
  double v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  double vo2Variance;
  double v78;
  long double v79;
  double v80;
  unint64_t v81;
  double speedVariance;
  double v83;
  long double v84;
  double v85;
  unint64_t v86;
  double gradeVariance;
  double v88;
  long double v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
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
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v104 = 2654435761 * self->_workoutType;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_11;
LABEL_16:
    v13 = 0;
    goto LABEL_19;
  }
  v104 = 0;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_16;
LABEL_11:
  durationInSeconds = self->_durationInSeconds;
  v10 = -durationInSeconds;
  if (durationInSeconds >= 0.0)
    v10 = self->_durationInSeconds;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_19:
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v103 = 2654435761u * self->_pointCount;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_21;
LABEL_26:
    v18 = 0;
    goto LABEL_29;
  }
  v103 = 0;
  if ((*(_WORD *)&has & 0x400) == 0)
    goto LABEL_26;
LABEL_21:
  hrMin = self->_hrMin;
  v15 = -hrMin;
  if (hrMin >= 0.0)
    v15 = self->_hrMin;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_29:
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    hrMax = self->_hrMax;
    v21 = -hrMax;
    if (hrMax >= 0.0)
      v21 = self->_hrMax;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    hrMean = self->_hrMean;
    v26 = -hrMean;
    if (hrMean >= 0.0)
      v26 = self->_hrMean;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    hrConfidenceMean = self->_hrConfidenceMean;
    v31 = -hrConfidenceMean;
    if (hrConfidenceMean >= 0.0)
      v31 = self->_hrConfidenceMean;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    hrCadenceAgreementMean = self->_hrCadenceAgreementMean;
    v36 = -hrCadenceAgreementMean;
    if (hrCadenceAgreementMean >= 0.0)
      v36 = self->_hrCadenceAgreementMean;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    vo2Mean = self->_vo2Mean;
    v41 = -vo2Mean;
    if (vo2Mean >= 0.0)
      v41 = self->_vo2Mean;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  v98 = v39;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    speedMean = self->_speedMean;
    v46 = -speedMean;
    if (speedMean >= 0.0)
      v46 = self->_speedMean;
    v47 = floor(v46 + 0.5);
    v48 = (v46 - v47) * 1.84467441e19;
    v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  v97 = v44;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    gradeMean = self->_gradeMean;
    v51 = -gradeMean;
    if (gradeMean >= 0.0)
      v51 = self->_gradeMean;
    v52 = floor(v51 + 0.5);
    v53 = (v51 - v52) * 1.84467441e19;
    v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0)
        v49 += (unint64_t)v53;
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    v49 = 0;
  }
  v96 = v49;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    cadenceMean = self->_cadenceMean;
    v56 = -cadenceMean;
    if (cadenceMean >= 0.0)
      v56 = self->_cadenceMean;
    v57 = floor(v56 + 0.5);
    v58 = (v56 - v57) * 1.84467441e19;
    v54 = 2654435761u * (unint64_t)fmod(v57, 1.84467441e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0)
        v54 += (unint64_t)v58;
    }
    else
    {
      v54 -= (unint64_t)fabs(v58);
    }
  }
  else
  {
    v54 = 0;
  }
  v95 = v54;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    hrVariance = self->_hrVariance;
    v61 = -hrVariance;
    if (hrVariance >= 0.0)
      v61 = self->_hrVariance;
    v62 = floor(v61 + 0.5);
    v63 = (v61 - v62) * 1.84467441e19;
    v59 = 2654435761u * (unint64_t)fmod(v62, 1.84467441e19);
    if (v63 >= 0.0)
    {
      if (v63 > 0.0)
        v59 += (unint64_t)v63;
    }
    else
    {
      v59 -= (unint64_t)fabs(v63);
    }
  }
  else
  {
    v59 = 0;
  }
  v94 = v59;
  v102 = v18;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    hrConfidenceVariance = self->_hrConfidenceVariance;
    v66 = -hrConfidenceVariance;
    if (hrConfidenceVariance >= 0.0)
      v66 = self->_hrConfidenceVariance;
    v67 = floor(v66 + 0.5);
    v68 = (v66 - v67) * 1.84467441e19;
    v64 = 2654435761u * (unint64_t)fmod(v67, 1.84467441e19);
    if (v68 >= 0.0)
    {
      if (v68 > 0.0)
        v64 += (unint64_t)v68;
    }
    else
    {
      v64 -= (unint64_t)fabs(v68);
    }
  }
  else
  {
    v64 = 0;
  }
  v100 = v29;
  v101 = v19;
  v99 = v13;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    hrCadenceAgreementVariance = self->_hrCadenceAgreementVariance;
    v71 = -hrCadenceAgreementVariance;
    if (hrCadenceAgreementVariance >= 0.0)
      v71 = self->_hrCadenceAgreementVariance;
    v72 = floor(v71 + 0.5);
    v73 = (v71 - v72) * 1.84467441e19;
    v69 = 2654435761u * (unint64_t)fmod(v72, 1.84467441e19);
    if (v73 >= 0.0)
    {
      if (v73 > 0.0)
        v69 += (unint64_t)v73;
    }
    else
    {
      v69 -= (unint64_t)fabs(v73);
    }
  }
  else
  {
    v69 = 0;
  }
  v74 = v4;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    vo2Variance = self->_vo2Variance;
    v78 = -vo2Variance;
    if (vo2Variance >= 0.0)
      v78 = self->_vo2Variance;
    v79 = floor(v78 + 0.5);
    v80 = (v78 - v79) * 1.84467441e19;
    v76 = 2654435761u * (unint64_t)fmod(v79, 1.84467441e19);
    v75 = v34;
    if (v80 >= 0.0)
    {
      if (v80 > 0.0)
        v76 += (unint64_t)v80;
    }
    else
    {
      v76 -= (unint64_t)fabs(v80);
    }
  }
  else
  {
    v75 = v34;
    v76 = 0;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    speedVariance = self->_speedVariance;
    v83 = -speedVariance;
    if (speedVariance >= 0.0)
      v83 = self->_speedVariance;
    v84 = floor(v83 + 0.5);
    v85 = (v83 - v84) * 1.84467441e19;
    v81 = 2654435761u * (unint64_t)fmod(v84, 1.84467441e19);
    if (v85 >= 0.0)
    {
      if (v85 > 0.0)
        v81 += (unint64_t)v85;
    }
    else
    {
      v81 -= (unint64_t)fabs(v85);
    }
  }
  else
  {
    v81 = 0;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    gradeVariance = self->_gradeVariance;
    v88 = -gradeVariance;
    if (gradeVariance >= 0.0)
      v88 = self->_gradeVariance;
    v89 = floor(v88 + 0.5);
    v90 = (v88 - v89) * 1.84467441e19;
    v86 = 2654435761u * (unint64_t)fmod(v89, 1.84467441e19);
    if (v90 >= 0.0)
    {
      if (v90 > 0.0)
        v86 += (unint64_t)v90;
    }
    else
    {
      v86 -= (unint64_t)fabs(v90);
    }
  }
  else
  {
    v86 = 0;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    v91 = 2654435761 * self->_vo2MaxModelSource;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_143;
LABEL_145:
    v92 = 0;
    return v104 ^ v74 ^ v99 ^ v103 ^ v102 ^ v101 ^ v24 ^ v100 ^ v75 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v64 ^ v69 ^ v76 ^ v81 ^ v86 ^ v91 ^ v92;
  }
  v91 = 0;
  if ((*(_DWORD *)&has & 0x40000) == 0)
    goto LABEL_145;
LABEL_143:
  v92 = 2654435761 * self->_sessionType;
  return v104 ^ v74 ^ v99 ^ v103 ^ v102 ^ v101 ^ v24 ^ v100 ^ v75 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v64 ^ v69 ^ v76 ^ v81 ^ v86 ^ v91 ^ v92;
}

- (void)mergeFrom:(id)a3
{
  int v3;

  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x8000) != 0)
  {
    self->_startTime = *((double *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x8000u;
    v3 = *((_DWORD *)a3 + 41);
    if ((v3 & 0x100000) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((v3 & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  self->_workoutType = *((_DWORD *)a3 + 40);
  *(_DWORD *)&self->_has |= 0x100000u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  self->_durationInSeconds = *((double *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x1000) == 0)
  {
LABEL_5:
    if ((v3 & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  self->_pointCount = *((_QWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x400) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  self->_hrMin = *((double *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  self->_hrMax = *((double *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x200) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  self->_hrMean = *((double *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x40) == 0)
  {
LABEL_9:
    if ((v3 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  self->_hrConfidenceMean = *((double *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x10) == 0)
  {
LABEL_10:
    if ((v3 & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  self->_hrCadenceAgreementMean = *((double *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x10000) == 0)
  {
LABEL_11:
    if ((v3 & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  self->_vo2Mean = *((double *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x2000) == 0)
  {
LABEL_12:
    if ((v3 & 4) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  self->_speedMean = *((double *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 4) == 0)
  {
LABEL_13:
    if ((v3 & 1) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  self->_gradeMean = *((double *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 1) == 0)
  {
LABEL_14:
    if ((v3 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  self->_cadenceMean = *((double *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x800) == 0)
  {
LABEL_15:
    if ((v3 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  self->_hrVariance = *((double *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x80) == 0)
  {
LABEL_16:
    if ((v3 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  self->_hrConfidenceVariance = *((double *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x20) == 0)
  {
LABEL_17:
    if ((v3 & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  self->_hrCadenceAgreementVariance = *((double *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x20000) == 0)
  {
LABEL_18:
    if ((v3 & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  self->_vo2Variance = *((double *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x4000) == 0)
  {
LABEL_19:
    if ((v3 & 8) == 0)
      goto LABEL_20;
    goto LABEL_41;
  }
LABEL_40:
  self->_speedVariance = *((double *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 8) == 0)
  {
LABEL_20:
    if ((v3 & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_42;
  }
LABEL_41:
  self->_gradeVariance = *((double *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x80000) == 0)
  {
LABEL_21:
    if ((v3 & 0x40000) == 0)
      return;
LABEL_43:
    self->_sessionType = *((_DWORD *)a3 + 38);
    *(_DWORD *)&self->_has |= 0x40000u;
    return;
  }
LABEL_42:
  self->_vo2MaxModelSource = *((_DWORD *)a3 + 39);
  *(_DWORD *)&self->_has |= 0x80000u;
  if ((*((_DWORD *)a3 + 41) & 0x40000) != 0)
    goto LABEL_43;
}

- (double)startTime
{
  return self->_startTime;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (unint64_t)pointCount
{
  return self->_pointCount;
}

- (double)hrMin
{
  return self->_hrMin;
}

- (double)hrMax
{
  return self->_hrMax;
}

- (double)hrMean
{
  return self->_hrMean;
}

- (double)hrConfidenceMean
{
  return self->_hrConfidenceMean;
}

- (double)hrCadenceAgreementMean
{
  return self->_hrCadenceAgreementMean;
}

- (double)vo2Mean
{
  return self->_vo2Mean;
}

- (double)speedMean
{
  return self->_speedMean;
}

- (double)gradeMean
{
  return self->_gradeMean;
}

- (double)cadenceMean
{
  return self->_cadenceMean;
}

- (double)hrVariance
{
  return self->_hrVariance;
}

- (double)hrConfidenceVariance
{
  return self->_hrConfidenceVariance;
}

- (double)hrCadenceAgreementVariance
{
  return self->_hrCadenceAgreementVariance;
}

- (double)vo2Variance
{
  return self->_vo2Variance;
}

- (double)speedVariance
{
  return self->_speedVariance;
}

- (double)gradeVariance
{
  return self->_gradeVariance;
}

- (int)vo2MaxModelSource
{
  return self->_vo2MaxModelSource;
}

- (int)sessionType
{
  return self->_sessionType;
}

@end
