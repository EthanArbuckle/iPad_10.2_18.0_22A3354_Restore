@implementation TRANSITPbLocationFingerprint

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear(&self->_macs, a2);
  PBRepeatedDoubleClear(&self->_modes);
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbLocationFingerprint;
  -[TRANSITPbLocationFingerprint dealloc](&v3, "dealloc");
}

- (void)setLocationId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_locationId = a3;
}

- (void)setHasLocationId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocationId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLongitude
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unint64_t)macsCount
{
  return self->_macs.count;
}

- (unint64_t)macs
{
  return self->_macs.list;
}

- (void)clearMacs
{
  PBRepeatedUInt64Clear(&self->_macs, a2);
}

- (void)addMacs:(unint64_t)a3
{
  PBRepeatedUInt64Add(&self->_macs, a3);
}

- (unint64_t)macsAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_macs;
  unint64_t count;

  p_macs = &self->_macs;
  count = self->_macs.count;
  if (count <= a3)
    -[NSException raise](+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count), 0), "raise");
  return p_macs->list[a3];
}

- (void)setMacs:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set(&self->_macs, a3, a4);
}

- (unint64_t)modesCount
{
  return self->_modes.count;
}

- (double)modes
{
  return self->_modes.list;
}

- (void)clearModes
{
  PBRepeatedDoubleClear(&self->_modes);
}

- (void)addModes:(double)a3
{
  PBRepeatedDoubleAdd(&self->_modes, a2, a3);
}

- (double)modesAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_modes;
  unint64_t count;

  p_modes = &self->_modes;
  count = self->_modes.count;
  if (count <= a3)
    -[NSException raise](+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count), 0), "raise");
  return p_modes->list[a3];
}

- (void)setModes:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet(&self->_modes, a3, a4);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbLocationFingerprint;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[TRANSITPbLocationFingerprint description](&v3, "description"), -[TRANSITPbLocationFingerprint dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude), CFSTR("latitude"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_locationId), CFSTR("locationId"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitude), CFSTR("longitude"));
LABEL_5:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt64NSArray(&self->_macs), CFSTR("macs"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedDoubleNSArray(&self->_modes), CFSTR("modes"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100B67698((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  unint64_t v6;
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_modes;
  unint64_t v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(a3, self->_locationId, 1);
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField(a3, 2, self->_latitude);
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteDoubleField(a3, 3, self->_longitude);
LABEL_5:
  if (self->_macs.count)
  {
    v6 = 0;
    do
      PBDataWriterWriteUint64Field(a3, self->_macs.list[v6++], 4);
    while (v6 < self->_macs.count);
  }
  p_modes = &self->_modes;
  if (p_modes->count)
  {
    v8 = 0;
    do
      PBDataWriterWriteDoubleField(a3, 5, p_modes->list[v8++]);
    while (v8 < p_modes->count);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_15:
    *((_QWORD *)a3 + 7) = *(_QWORD *)&self->_latitude;
    *((_BYTE *)a3 + 80) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_QWORD *)a3 + 8) = self->_locationId;
  *((_BYTE *)a3 + 80) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_QWORD *)a3 + 9) = *(_QWORD *)&self->_longitude;
    *((_BYTE *)a3 + 80) |= 4u;
  }
LABEL_5:
  if (-[TRANSITPbLocationFingerprint macsCount](self, "macsCount"))
  {
    objc_msgSend(a3, "clearMacs");
    v6 = -[TRANSITPbLocationFingerprint macsCount](self, "macsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addMacs:", -[TRANSITPbLocationFingerprint macsAtIndex:](self, "macsAtIndex:", i));
    }
  }
  if (-[TRANSITPbLocationFingerprint modesCount](self, "modesCount"))
  {
    objc_msgSend(a3, "clearModes");
    v9 = -[TRANSITPbLocationFingerprint modesCount](self, "modesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[TRANSITPbLocationFingerprint modesAtIndex:](self, "modesAtIndex:", j);
        objc_msgSend(a3, "addModes:");
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  char *v5;
  char has;

  v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_latitude;
    v4[80] |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_QWORD *)v4 + 8) = self->_locationId;
  v4[80] |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_longitude;
    v4[80] |= 4u;
  }
LABEL_5:
  PBRepeatedUInt64Copy(v4 + 8, &self->_macs);
  PBRepeatedDoubleCopy(v5 + 32, &self->_modes);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2)))
    return 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 2) == 0 || self->_locationId != *((_QWORD *)a3 + 8))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 80) & 2) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 1) == 0 || self->_latitude != *((double *)a3 + 7))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 80) & 1) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 80) & 4) == 0 || self->_longitude != *((double *)a3 + 9))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 80) & 4) != 0)
  {
    return 0;
  }
  if (PBRepeatedUInt64IsEqual(&self->_macs, (char *)a3 + 8))
    return PBRepeatedDoubleIsEqual(&self->_modes, (char *)a3 + 32);
  return 0;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double latitude;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double longitude;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4 = 2654435761u * self->_locationId;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  latitude = self->_latitude;
  v6 = -latitude;
  if (latitude >= 0.0)
    v6 = self->_latitude;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    longitude = self->_longitude;
    v12 = -longitude;
    if (longitude >= 0.0)
      v12 = self->_longitude;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = v9 ^ v4 ^ v10 ^ PBRepeatedUInt64Hash(&self->_macs);
  return v15 ^ PBRepeatedDoubleHash(&self->_modes);
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char *v6;
  char *v7;
  char *i;
  char *v9;
  char *v10;
  char *j;

  v5 = *((_BYTE *)a3 + 80);
  if ((v5 & 2) != 0)
  {
    self->_locationId = *((_QWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 80);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 80) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_latitude = *((double *)a3 + 7);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 80) & 4) != 0)
  {
LABEL_4:
    self->_longitude = *((double *)a3 + 9);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  v6 = (char *)objc_msgSend(a3, "macsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[TRANSITPbLocationFingerprint addMacs:](self, "addMacs:", objc_msgSend(a3, "macsAtIndex:", i));
  }
  v9 = (char *)objc_msgSend(a3, "modesCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
    {
      objc_msgSend(a3, "modesAtIndex:", j);
      -[TRANSITPbLocationFingerprint addModes:](self, "addModes:");
    }
  }
}

- (unint64_t)locationId
{
  return self->_locationId;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

@end
