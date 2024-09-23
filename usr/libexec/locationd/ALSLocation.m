@implementation ALSLocation

- (void)setLocationType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLocationType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAltitude:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAltitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setVerticalAccuracy:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_verticalAccuracy = a3;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVerticalAccuracy
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidence
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setScore:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasScore
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setReach:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_reach = a3;
}

- (void)setHasReach:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReach
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setInfoMask:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_infoMask = a3;
}

- (void)setHasInfoMask:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInfoMask
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALSLocation;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALSLocation description](&v3, "description"), -[ALSLocation dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_latitude), CFSTR("Latitude"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_longitude), CFSTR("Longitude"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_accuracy), CFSTR("accuracy"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_locationType), CFSTR("locationType"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_altitude), CFSTR("altitude"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_verticalAccuracy), CFSTR("verticalAccuracy"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_confidence), CFSTR("confidence"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_reach), CFSTR("reach"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_score), CFSTR("score"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 4) != 0)
LABEL_8:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_infoMask), CFSTR("infoMask"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F02DFC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  PBDataWriterWriteInt64Field(a3, self->_latitude, 1);
  PBDataWriterWriteInt64Field(a3, self->_longitude, 2);
  PBDataWriterWriteInt32Field(a3, self->_accuracy, 3);
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_locationType, 4);
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_altitude, 5);
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field(a3, self->_verticalAccuracy, 6);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field(a3, self->_confidence, 7);
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field(a3, self->_score, 11);
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      return;
LABEL_15:
    PBDataWriterWriteUint32Field(a3, self->_infoMask, 13);
    return;
  }
LABEL_14:
  PBDataWriterWriteInt32Field(a3, self->_reach, 12);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;

  *((_QWORD *)a3 + 1) = self->_latitude;
  *((_QWORD *)a3 + 2) = self->_longitude;
  *((_DWORD *)a3 + 6) = self->_accuracy;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_locationType;
    *((_BYTE *)a3 + 56) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_altitude;
  *((_BYTE *)a3 + 56) |= 1u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 13) = self->_verticalAccuracy;
  *((_BYTE *)a3 + 56) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)a3 + 8) = self->_confidence;
  *((_BYTE *)a3 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 12) = self->_score;
  *((_BYTE *)a3 + 56) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      return;
LABEL_15:
    *((_DWORD *)a3 + 9) = self->_infoMask;
    *((_BYTE *)a3 + 56) |= 4u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 11) = self->_reach;
  *((_BYTE *)a3 + 56) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_latitude;
  *((_QWORD *)result + 2) = self->_longitude;
  *((_DWORD *)result + 6) = self->_accuracy;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 10) = self->_locationType;
    *((_BYTE *)result + 56) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_altitude;
  *((_BYTE *)result + 56) |= 1u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 13) = self->_verticalAccuracy;
  *((_BYTE *)result + 56) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 8) = self->_confidence;
  *((_BYTE *)result + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 12) = self->_score;
  *((_BYTE *)result + 56) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 11) = self->_reach;
  *((_BYTE *)result + 56) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_8:
  *((_DWORD *)result + 9) = self->_infoMask;
  *((_BYTE *)result + 56) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_latitude != *((_QWORD *)a3 + 1)
      || self->_longitude != *((_QWORD *)a3 + 2)
      || self->_accuracy != *((_DWORD *)a3 + 6))
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 8) == 0 || self->_locationType != *((_DWORD *)a3 + 10))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 56) & 8) != 0)
    {
LABEL_39:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_altitude != *((_DWORD *)a3 + 7))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 56) & 1) != 0)
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x40) == 0 || self->_verticalAccuracy != *((_DWORD *)a3 + 13))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x40) != 0)
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_confidence != *((_DWORD *)a3 + 8))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 56) & 2) != 0)
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x20) == 0 || self->_score != *((_DWORD *)a3 + 12))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x20) != 0)
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 0x10) == 0 || self->_reach != *((_DWORD *)a3 + 11))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 56) & 0x10) != 0)
    {
      goto LABEL_39;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 56) & 4) == 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_infoMask != *((_DWORD *)a3 + 9))
        goto LABEL_39;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v2 = 2654435761 * self->_locationType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_altitude;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_verticalAccuracy;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_confidence;
    goto LABEL_10;
  }
LABEL_9:
  v5 = 0;
LABEL_10:
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v6 = 2654435761 * self->_score;
  else
    v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v7 = 2654435761 * self->_reach;
  else
    v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v8 = 2654435761 * self->_infoMask;
  else
    v8 = 0;
  return (2654435761 * self->_longitude) ^ (2654435761 * self->_latitude) ^ (2654435761 * self->_accuracy) ^ v2 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  self->_latitude = *((_QWORD *)a3 + 1);
  self->_longitude = *((_QWORD *)a3 + 2);
  self->_accuracy = *((_DWORD *)a3 + 6);
  v3 = *((_BYTE *)a3 + 56);
  if ((v3 & 8) != 0)
  {
    self->_locationType = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 8u;
    v3 = *((_BYTE *)a3 + 56);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_altitude = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 1u;
  v3 = *((_BYTE *)a3 + 56);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_verticalAccuracy = *((_DWORD *)a3 + 13);
  *(_BYTE *)&self->_has |= 0x40u;
  v3 = *((_BYTE *)a3 + 56);
  if ((v3 & 2) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  self->_confidence = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 56);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  self->_score = *((_DWORD *)a3 + 12);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 56);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 4) == 0)
      return;
LABEL_15:
    self->_infoMask = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 4u;
    return;
  }
LABEL_14:
  self->_reach = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 56) & 4) != 0)
    goto LABEL_15;
}

- (int64_t)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(int64_t)a3
{
  self->_latitude = a3;
}

- (int64_t)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(int64_t)a3
{
  self->_longitude = a3;
}

- (int)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(int)a3
{
  self->_accuracy = a3;
}

- (int)locationType
{
  return self->_locationType;
}

- (int)altitude
{
  return self->_altitude;
}

- (int)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (int)confidence
{
  return self->_confidence;
}

- (unsigned)score
{
  return self->_score;
}

- (int)reach
{
  return self->_reach;
}

- (unsigned)infoMask
{
  return self->_infoMask;
}

@end
