@implementation ALCMExerciseMinute

- (int)mode
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_mode;
  else
    return 0;
}

- (void)setMode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)modeAsString:(int)a3
{
  if (a3 >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_1021AA458 + a3);
}

- (int)StringAsMode:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kModeThreshold")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kModeBurst")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kModeCoverage")))
    return 2;
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCMExerciseMinute;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCMExerciseMinute description](&v3, "description"), -[ALCMExerciseMinute dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  uint64_t mode;
  NSString *v5;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_avgIntensity), CFSTR("avgIntensity"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    mode = self->_mode;
    if (mode >= 3)
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mode);
    else
      v5 = (NSString *)*(&off_1021AA458 + mode);
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mode"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1012460A4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteDoubleField(a3, 1, self->_avgIntensity);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field(a3, self->_mode, 2);
}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_avgIntensity;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_mode;
    *((_BYTE *)a3 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_avgIntensity;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 4) = self->_mode;
    *((_BYTE *)result + 20) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_avgIntensity != *((double *)a3 + 1))
      goto LABEL_7;
    LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 1) != 0 && self->_mode == *((_DWORD *)a3 + 4))
      {
        LOBYTE(v5) = 1;
        return v5;
      }
LABEL_7:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  double avgIntensity;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  avgIntensity = self->_avgIntensity;
  v4 = -avgIntensity;
  if (avgIntensity >= 0.0)
    v4 = self->_avgIntensity;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 >= 0.0)
    v10 = v9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_mode;
  else
    v11 = 0;
  return v11 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  self->_avgIntensity = *((double *)a3 + 1);
  if ((*((_BYTE *)a3 + 20) & 1) != 0)
  {
    self->_mode = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (double)avgIntensity
{
  return self->_avgIntensity;
}

- (void)setAvgIntensity:(double)a3
{
  self->_avgIntensity = a3;
}

@end
