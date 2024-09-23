@implementation CLStreamedLocationInternal

- (CLStreamedLocationInternal)initWithDaemonLocation:(const CLDaemonLocation *)a3
{
  CLStreamedLocationInternal *v4;
  CLStreamedLocationInternal *v5;

  v4 = -[CLStreamedLocationInternal init](self, "init");
  v5 = v4;
  if (v4)
  {
    if (*(double *)((char *)&a3->lifespan + 4) != 0.0)
      -[CLStreamedLocationInternal setRawCoordinateLatitude:](v4, "setRawCoordinateLatitude:");
    if (*(double *)(&a3->type + 1) != 0.0)
      -[CLStreamedLocationInternal setRawCoordinateLongitude:](v5, "setRawCoordinateLongitude:");
  }
  return v5;
}

- (void)mergeIntoDaemonLocation:(CLDaemonLocation *)a3
{
  uint64_t v5;
  uint64_t v6;

  if (-[CLStreamedLocationInternal hasRawCoordinateLatitude](self, "hasRawCoordinateLatitude"))
  {
    -[CLStreamedLocationInternal rawCoordinateLatitude](self, "rawCoordinateLatitude");
    *(_QWORD *)((char *)&a3->lifespan + 4) = v5;
  }
  if (-[CLStreamedLocationInternal hasRawCoordinateLongitude](self, "hasRawCoordinateLongitude"))
  {
    -[CLStreamedLocationInternal rawCoordinateLongitude](self, "rawCoordinateLongitude");
    *(_QWORD *)(&a3->type + 1) = v6;
  }
}

- (void)setRawCoordinateLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rawCoordinateLatitude = a3;
}

- (void)setHasRawCoordinateLatitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRawCoordinateLatitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRawCoordinateLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rawCoordinateLongitude = a3;
}

- (void)setHasRawCoordinateLongitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRawCoordinateLongitude
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLStreamedLocationInternal;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[CLStreamedLocationInternal description](&v3, "description"), -[CLStreamedLocationInternal dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rawCoordinateLatitude), CFSTR("rawCoordinateLatitude"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rawCoordinateLongitude), CFSTR("rawCoordinateLongitude"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100FE45E4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 1, self->_rawCoordinateLatitude);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField(a3, 2, self->_rawCoordinateLongitude);
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return;
LABEL_5:
    *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_rawCoordinateLongitude;
    *((_BYTE *)a3 + 24) |= 2u;
    return;
  }
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_rawCoordinateLatitude;
  *((_BYTE *)a3 + 24) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_rawCoordinateLatitude;
    *((_BYTE *)result + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_rawCoordinateLongitude;
    *((_BYTE *)result + 24) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_rawCoordinateLatitude != *((double *)a3 + 1))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_rawCoordinateLongitude != *((double *)a3 + 2))
        goto LABEL_11;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double rawCoordinateLatitude;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double rawCoordinateLongitude;
  double v11;
  long double v12;
  double v13;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    rawCoordinateLatitude = self->_rawCoordinateLatitude;
    v6 = -rawCoordinateLatitude;
    if (rawCoordinateLatitude >= 0.0)
      v6 = self->_rawCoordinateLatitude;
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
  if ((has & 2) != 0)
  {
    rawCoordinateLongitude = self->_rawCoordinateLongitude;
    v11 = -rawCoordinateLongitude;
    if (rawCoordinateLongitude >= 0.0)
      v11 = self->_rawCoordinateLongitude;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  return v9 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 24) & 1) == 0)
  {
    if ((*((_BYTE *)a3 + 24) & 2) == 0)
      return;
LABEL_5:
    self->_rawCoordinateLongitude = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
  self->_rawCoordinateLatitude = *((double *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 24) & 2) != 0)
    goto LABEL_5;
}

- (double)rawCoordinateLatitude
{
  return self->_rawCoordinateLatitude;
}

- (double)rawCoordinateLongitude
{
  return self->_rawCoordinateLongitude;
}

@end
