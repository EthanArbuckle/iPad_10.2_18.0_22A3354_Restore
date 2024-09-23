@implementation ALCLOdometer

- (void)setDistance:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDistance
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAccuracy:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_accuracy = a3;
}

- (void)setHasAccuracy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAccuracy
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setGpsAltitude:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_gpsAltitude = a3;
}

- (void)setHasGpsAltitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasGpsAltitude
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSpeed:(float)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_speed = a3;
}

- (void)setHasSpeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSpeed
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setRawSpeed:(float)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_rawSpeed = a3;
}

- (void)setHasRawSpeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRawSpeed
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setGpsSpeedAccuracy:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_gpsSpeedAccuracy = a3;
}

- (void)setHasGpsSpeedAccuracy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasGpsSpeedAccuracy
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTimestampGps:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestampGps = a3;
}

- (void)setHasTimestampGps:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampGps
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)quality
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_quality;
  else
    return 0;
}

- (void)setQuality:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_quality = a3;
}

- (void)setHasQuality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasQuality
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)qualityAsString:(int)a3
{
  if (a3 >= 4)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_1021B7820 + a3);
}

- (int)StringAsQuality:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kUnknown")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kGood")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kMed")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kPoor")))
    return 3;
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLOdometer;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLOdometer description](&v3, "description"), -[ALCLOdometer dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  double v4;
  char has;
  double v6;
  char v7;
  uint64_t quality;
  NSString *v9;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)&v4 = self->_distance;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("distance"));
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
  *(float *)&v4 = self->_accuracy;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("accuracy"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *(float *)&v4 = self->_gpsAltitude;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("gpsAltitude"));
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  *(float *)&v4 = self->_speed;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("speed"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *(float *)&v4 = self->_rawSpeed;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("rawSpeed"));
  }
LABEL_7:
  *(float *)&v4 = self->_odometer;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("odometer"));
  v7 = (char)self->_has;
  if ((v7 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestampGps), CFSTR("timestampGps"));
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_18;
  }
  *(float *)&v6 = self->_gpsSpeedAccuracy;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6), CFSTR("gpsSpeedAccuracy"));
  v7 = (char)self->_has;
  if ((v7 & 1) != 0)
    goto LABEL_17;
LABEL_9:
  if ((v7 & 0x20) == 0)
    return v3;
LABEL_18:
  quality = self->_quality;
  if (quality >= 4)
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_quality);
  else
    v9 = (NSString *)*(&off_1021B7820 + quality);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("quality"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1014639A8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField(a3, 1, self->_distance);
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
  PBDataWriterWriteFloatField(a3, 2, self->_accuracy);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteFloatField(a3, 3, self->_gpsAltitude);
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  PBDataWriterWriteFloatField(a3, 4, self->_speed);
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_6:
    PBDataWriterWriteFloatField(a3, 5, self->_rawSpeed);
LABEL_7:
  PBDataWriterWriteFloatField(a3, 6, self->_odometer);
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteFloatField(a3, 7, self->_gpsSpeedAccuracy);
    v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0)
        return;
LABEL_18:
      PBDataWriterWriteInt32Field(a3, self->_quality, 9);
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField(a3, 8, self->_timestampGps);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    goto LABEL_18;
}

- (void)copyTo:(id)a3
{
  char has;
  char v4;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = LODWORD(self->_distance);
    *((_BYTE *)a3 + 48) |= 4u;
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
  *((_DWORD *)a3 + 4) = LODWORD(self->_accuracy);
  *((_BYTE *)a3 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 6) = LODWORD(self->_gpsAltitude);
  *((_BYTE *)a3 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  *((_DWORD *)a3 + 11) = LODWORD(self->_speed);
  *((_BYTE *)a3 + 48) |= 0x80u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 10) = LODWORD(self->_rawSpeed);
    *((_BYTE *)a3 + 48) |= 0x40u;
  }
LABEL_7:
  *((_DWORD *)a3 + 8) = LODWORD(self->_odometer);
  v4 = (char)self->_has;
  if ((v4 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 7) = LODWORD(self->_gpsSpeedAccuracy);
    *((_BYTE *)a3 + 48) |= 0x10u;
    v4 = (char)self->_has;
    if ((v4 & 1) == 0)
    {
LABEL_9:
      if ((v4 & 0x20) == 0)
        return;
LABEL_18:
      *((_DWORD *)a3 + 9) = self->_quality;
      *((_BYTE *)a3 + 48) |= 0x20u;
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_timestampGps;
  *((_BYTE *)a3 + 48) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    goto LABEL_18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;
  char v6;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 5) = LODWORD(self->_distance);
    *((_BYTE *)result + 48) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = LODWORD(self->_accuracy);
  *((_BYTE *)result + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 6) = LODWORD(self->_gpsAltitude);
  *((_BYTE *)result + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  *((_DWORD *)result + 11) = LODWORD(self->_speed);
  *((_BYTE *)result + 48) |= 0x80u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *((_DWORD *)result + 10) = LODWORD(self->_rawSpeed);
    *((_BYTE *)result + 48) |= 0x40u;
  }
LABEL_7:
  *((_DWORD *)result + 8) = LODWORD(self->_odometer);
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)result + 7) = LODWORD(self->_gpsSpeedAccuracy);
    *((_BYTE *)result + 48) |= 0x10u;
    v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0)
        return result;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_timestampGps;
  *((_BYTE *)result + 48) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return result;
LABEL_10:
  *((_DWORD *)result + 9) = self->_quality;
  *((_BYTE *)result + 48) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_distance != *((float *)a3 + 5))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)a3 + 48) & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_accuracy != *((float *)a3 + 4))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)a3 + 48) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_gpsAltitude != *((float *)a3 + 6))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)a3 + 48) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 0x80) == 0 || self->_speed != *((float *)a3 + 11))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)a3 + 48) & 0x80) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 0x40) == 0 || self->_rawSpeed != *((float *)a3 + 10))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)a3 + 48) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if (self->_odometer != *((float *)a3 + 8))
  {
LABEL_42:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 0x10) == 0 || self->_gpsSpeedAccuracy != *((float *)a3 + 7))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)a3 + 48) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_timestampGps != *((double *)a3 + 1))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    goto LABEL_42;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 48) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)a3 + 48) & 0x20) == 0 || self->_quality != *((_DWORD *)a3 + 9))
      goto LABEL_42;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float distance;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  float accuracy;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float gpsAltitude;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  float speed;
  float v21;
  float v22;
  float v23;
  float v24;
  unint64_t v25;
  float rawSpeed;
  float v27;
  float v28;
  float v29;
  float v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  float odometer;
  float v36;
  float v37;
  float v38;
  float v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  float gpsSpeedAccuracy;
  float v46;
  float v47;
  float v48;
  unint64_t v49;
  double timestampGps;
  double v51;
  long double v52;
  double v53;
  uint64_t v54;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    distance = self->_distance;
    v6 = -distance;
    if (distance >= 0.0)
      v6 = self->_distance;
    v7 = floorf(v6 + 0.5);
    v8 = (float)(v6 - v7) * 1.8447e19;
    v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    accuracy = self->_accuracy;
    v11 = -accuracy;
    if (accuracy >= 0.0)
      v11 = self->_accuracy;
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
  if ((has & 8) != 0)
  {
    gpsAltitude = self->_gpsAltitude;
    v16 = -gpsAltitude;
    if (gpsAltitude >= 0.0)
      v16 = self->_gpsAltitude;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if (has < 0)
  {
    speed = self->_speed;
    v21 = -speed;
    if (speed >= 0.0)
      v21 = self->_speed;
    v22 = floorf(v21 + 0.5);
    v23 = (float)(v21 - v22) * 1.8447e19;
    v24 = fmodf(v22, 1.8447e19);
    v25 = 2654435761u * (unint64_t)v24;
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 = v25 + (unint64_t)v23;
      else
        v19 = 2654435761u * (unint64_t)v24;
      if ((has & 0x40) == 0)
        goto LABEL_43;
    }
    else
    {
      v19 = v25 - (unint64_t)fabsf(v23);
      if ((has & 0x40) == 0)
      {
LABEL_43:
        v34 = 0;
        goto LABEL_44;
      }
    }
  }
  else
  {
    v19 = 0;
    if ((has & 0x40) == 0)
      goto LABEL_43;
  }
  rawSpeed = self->_rawSpeed;
  v27 = -rawSpeed;
  if (rawSpeed >= 0.0)
    v27 = self->_rawSpeed;
  v28 = floorf(v27 + 0.5);
  v29 = (float)(v27 - v28) * 1.8447e19;
  v30 = fmodf(v28, 1.8447e19);
  v31 = 2654435761u * (unint64_t)v30;
  v32 = v31 + (unint64_t)v29;
  if (v29 <= 0.0)
    v32 = 2654435761u * (unint64_t)v30;
  v33 = v31 - (unint64_t)fabsf(v29);
  if (v29 < 0.0)
    v34 = v33;
  else
    v34 = v32;
LABEL_44:
  odometer = self->_odometer;
  v36 = -odometer;
  if (odometer >= 0.0)
    v36 = self->_odometer;
  v37 = floorf(v36 + 0.5);
  v38 = (float)(v36 - v37) * 1.8447e19;
  v39 = fmodf(v37, 1.8447e19);
  v40 = 2654435761u * (unint64_t)v39;
  v41 = v40 + (unint64_t)v38;
  if (v38 <= 0.0)
    v41 = 2654435761u * (unint64_t)v39;
  v42 = v40 - (unint64_t)fabsf(v38);
  if (v38 < 0.0)
    v43 = v42;
  else
    v43 = v41;
  if ((has & 0x10) != 0)
  {
    gpsSpeedAccuracy = self->_gpsSpeedAccuracy;
    v46 = -gpsSpeedAccuracy;
    if (gpsSpeedAccuracy >= 0.0)
      v46 = self->_gpsSpeedAccuracy;
    v47 = floorf(v46 + 0.5);
    v48 = (float)(v46 - v47) * 1.8447e19;
    v44 = 2654435761u * (unint64_t)fmodf(v47, 1.8447e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabsf(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  if ((has & 1) != 0)
  {
    timestampGps = self->_timestampGps;
    v51 = -timestampGps;
    if (timestampGps >= 0.0)
      v51 = self->_timestampGps;
    v52 = floor(v51 + 0.5);
    v53 = (v51 - v52) * 1.84467441e19;
    v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0)
        v49 += (unint64_t)v53;
      if ((has & 0x20) == 0)
        goto LABEL_70;
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
      if ((has & 0x20) == 0)
      {
LABEL_70:
        v54 = 0;
        return v9 ^ v4 ^ v14 ^ v19 ^ v44 ^ v49 ^ v54 ^ v34 ^ v43;
      }
    }
  }
  else
  {
    v49 = 0;
    if ((has & 0x20) == 0)
      goto LABEL_70;
  }
  v54 = 2654435761 * self->_quality;
  return v9 ^ v4 ^ v14 ^ v19 ^ v44 ^ v49 ^ v54 ^ v34 ^ v43;
}

- (void)mergeFrom:(id)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 4) != 0)
  {
    self->_distance = *((float *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 48);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_accuracy = *((float *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_gpsAltitude = *((float *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 48);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  self->_speed = *((float *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x80u;
  if ((*((_BYTE *)a3 + 48) & 0x40) != 0)
  {
LABEL_6:
    self->_rawSpeed = *((float *)a3 + 10);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_7:
  self->_odometer = *((float *)a3 + 8);
  v4 = *((_BYTE *)a3 + 48);
  if ((v4 & 0x10) != 0)
  {
    self->_gpsSpeedAccuracy = *((float *)a3 + 7);
    *(_BYTE *)&self->_has |= 0x10u;
    v4 = *((_BYTE *)a3 + 48);
    if ((v4 & 1) == 0)
    {
LABEL_9:
      if ((v4 & 0x20) == 0)
        return;
LABEL_18:
      self->_quality = *((_DWORD *)a3 + 9);
      *(_BYTE *)&self->_has |= 0x20u;
      return;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_timestampGps = *((double *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 48) & 0x20) != 0)
    goto LABEL_18;
}

- (float)distance
{
  return self->_distance;
}

- (float)accuracy
{
  return self->_accuracy;
}

- (float)gpsAltitude
{
  return self->_gpsAltitude;
}

- (float)speed
{
  return self->_speed;
}

- (float)rawSpeed
{
  return self->_rawSpeed;
}

- (float)odometer
{
  return self->_odometer;
}

- (void)setOdometer:(float)a3
{
  self->_odometer = a3;
}

- (float)gpsSpeedAccuracy
{
  return self->_gpsSpeedAccuracy;
}

- (double)timestampGps
{
  return self->_timestampGps;
}

@end
