@implementation ALCLAllDayHeartRate

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLAllDayHeartRate;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLAllDayHeartRate description](&v3, "description"), -[ALCLAllDayHeartRate dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  double v4;
  double v5;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime), CFSTR("startTime"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mode), CFSTR("mode"));
  *(float *)&v4 = self->_confidence;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("confidence"));
  *(float *)&v5 = self->_heartRate;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5), CFSTR("heartRate"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1009884D0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteDoubleField(a3, 1, self->_startTime);
  PBDataWriterWriteUint32Field(a3, self->_mode, 2);
  PBDataWriterWriteFloatField(a3, 3, self->_confidence);
  PBDataWriterWriteFloatField(a3, 4, self->_heartRate);
}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_startTime;
  *((_DWORD *)a3 + 6) = self->_mode;
  *((_DWORD *)a3 + 4) = LODWORD(self->_confidence);
  *((_DWORD *)a3 + 5) = LODWORD(self->_heartRate);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_startTime;
  *((_DWORD *)result + 6) = self->_mode;
  *((_DWORD *)result + 4) = LODWORD(self->_confidence);
  *((_DWORD *)result + 5) = LODWORD(self->_heartRate);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
    LOBYTE(v5) = self->_startTime == *((double *)a3 + 1)
              && self->_mode == *((_DWORD *)a3 + 6)
              && self->_confidence == *((float *)a3 + 4)
              && self->_heartRate == *((float *)a3 + 5);
  return v5;
}

- (unint64_t)hash
{
  double startTime;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int mode;
  float confidence;
  float v14;
  float v15;
  float v16;
  float v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  float heartRate;
  float v23;
  float v24;
  float v25;
  float v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  startTime = self->_startTime;
  v4 = -startTime;
  if (startTime >= 0.0)
    v4 = self->_startTime;
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
  mode = self->_mode;
  confidence = self->_confidence;
  v14 = -confidence;
  if (confidence >= 0.0)
    v14 = self->_confidence;
  v15 = floorf(v14 + 0.5);
  v16 = (float)(v14 - v15) * 1.8447e19;
  v17 = fmodf(v15, 1.8447e19);
  v18 = 2654435761u * (unint64_t)v17;
  v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0)
    v19 = 2654435761u * (unint64_t)v17;
  v20 = v18 - (unint64_t)fabsf(v16);
  if (v16 < 0.0)
    v21 = v20;
  else
    v21 = v19;
  heartRate = self->_heartRate;
  v23 = -heartRate;
  if (heartRate >= 0.0)
    v23 = self->_heartRate;
  v24 = floorf(v23 + 0.5);
  v25 = (float)(v23 - v24) * 1.8447e19;
  v26 = fmodf(v24, 1.8447e19);
  v27 = 2654435761u * (unint64_t)v26;
  v28 = v27 + (unint64_t)v25;
  if (v25 <= 0.0)
    v28 = 2654435761u * (unint64_t)v26;
  v29 = v27 - (unint64_t)fabsf(v25);
  if (v25 >= 0.0)
    v29 = v28;
  return (2654435761 * mode) ^ v29 ^ v11 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  self->_startTime = *((double *)a3 + 1);
  self->_mode = *((_DWORD *)a3 + 6);
  self->_confidence = *((float *)a3 + 4);
  self->_heartRate = *((float *)a3 + 5);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)heartRate
{
  return self->_heartRate;
}

- (void)setHeartRate:(float)a3
{
  self->_heartRate = a3;
}

@end
