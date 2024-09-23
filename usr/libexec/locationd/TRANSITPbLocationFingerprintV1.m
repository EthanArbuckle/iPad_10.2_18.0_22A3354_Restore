@implementation TRANSITPbLocationFingerprintV1

- (void)dealloc
{
  objc_super v3;

  -[TRANSITPbLocationFingerprintV1 setLocationId:](self, "setLocationId:", 0);
  -[TRANSITPbLocationFingerprintV1 setMacModes:](self, "setMacModes:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbLocationFingerprintV1;
  -[TRANSITPbLocationFingerprintV1 dealloc](&v3, "dealloc");
}

- (BOOL)hasLocationId
{
  return self->_locationId != 0;
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
  *(_BYTE *)&self->_has |= 2u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLongitude
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearMacModes
{
  -[NSMutableArray removeAllObjects](self->_macModes, "removeAllObjects");
}

- (void)addMacModes:(id)a3
{
  NSMutableArray *macModes;

  macModes = self->_macModes;
  if (!macModes)
  {
    macModes = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_macModes = macModes;
  }
  -[NSMutableArray addObject:](macModes, "addObject:", a3);
}

- (unint64_t)macModesCount
{
  return (unint64_t)-[NSMutableArray count](self->_macModes, "count");
}

- (id)macModesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_macModes, "objectAtIndex:", a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbLocationFingerprintV1;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[TRANSITPbLocationFingerprintV1 description](&v3, "description"), -[TRANSITPbLocationFingerprintV1 dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *locationId;
  char has;
  id v7;
  NSMutableArray *macModes;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  locationId = self->_locationId;
  if (locationId)
    objc_msgSend(v3, "setObject:forKey:", locationId, CFSTR("locationId"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude), CFSTR("latitude"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitude), CFSTR("longitude"));
  if (-[NSMutableArray count](self->_macModes, "count"))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_macModes, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    macModes = self->_macModes;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](macModes, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(macModes);
          objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](macModes, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("macModes"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F6C33C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *locationId;
  char has;
  NSMutableArray *macModes;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  locationId = self->_locationId;
  if (locationId)
    PBDataWriterWriteStringField(a3, locationId, 1);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 2, self->_latitude);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField(a3, 3, self->_longitude);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  macModes = self->_macModes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](macModes, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(macModes);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), 4);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](macModes, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  if (self->_locationId)
    objc_msgSend(a3, "setLocationId:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_latitude;
    *((_BYTE *)a3 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_longitude;
    *((_BYTE *)a3 + 40) |= 2u;
  }
  if (-[TRANSITPbLocationFingerprintV1 macModesCount](self, "macModesCount"))
  {
    objc_msgSend(a3, "clearMacModes");
    v6 = -[TRANSITPbLocationFingerprintV1 macModesCount](self, "macModesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addMacModes:", -[TRANSITPbLocationFingerprintV1 macModesAtIndex:](self, "macModesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  char has;
  NSMutableArray *macModes;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");

  v5[3] = -[NSString copyWithZone:](self->_locationId, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = *(id *)&self->_latitude;
    *((_BYTE *)v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[2] = *(id *)&self->_longitude;
    *((_BYTE *)v5 + 40) |= 2u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  macModes = self->_macModes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](macModes, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(macModes);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v5, "addMacModes:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](macModes, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *locationId;
  NSMutableArray *macModes;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    locationId = self->_locationId;
    if (!((unint64_t)locationId | *((_QWORD *)a3 + 3))
      || (v5 = -[NSString isEqual:](locationId, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_latitude != *((double *)a3 + 1))
          goto LABEL_16;
      }
      else if ((*((_BYTE *)a3 + 40) & 1) != 0)
      {
LABEL_16:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_longitude != *((double *)a3 + 2))
          goto LABEL_16;
      }
      else if ((*((_BYTE *)a3 + 40) & 2) != 0)
      {
        goto LABEL_16;
      }
      macModes = self->_macModes;
      if ((unint64_t)macModes | *((_QWORD *)a3 + 4))
        LOBYTE(v5) = -[NSMutableArray isEqual:](macModes, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double latitude;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double longitude;
  double v12;
  long double v13;
  double v14;

  v3 = -[NSString hash](self->_locationId, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    latitude = self->_latitude;
    v7 = -latitude;
    if (latitude >= 0.0)
      v7 = self->_latitude;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 2) != 0)
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
  return v5 ^ v3 ^ v10 ^ (unint64_t)-[NSMutableArray hash](self->_macModes, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (*((_QWORD *)a3 + 3))
    -[TRANSITPbLocationFingerprintV1 setLocationId:](self, "setLocationId:");
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 1) != 0)
  {
    self->_latitude = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_longitude = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[TRANSITPbLocationFingerprintV1 addMacModes:](self, "addMacModes:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (NSString)locationId
{
  return self->_locationId;
}

- (void)setLocationId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (NSMutableArray)macModes
{
  return self->_macModes;
}

- (void)setMacModes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
