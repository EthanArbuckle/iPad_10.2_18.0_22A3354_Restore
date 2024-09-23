@implementation PersistentSearchRequestHistoryItem

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (BOOL)hasDisplayQuery
{
  return self->_displayQuery != 0;
}

- (BOOL)hasDisplayLocation
{
  return self->_displayLocation != 0;
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

- (void)setLatitudeSpan:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_latitudeSpan = a3;
}

- (void)setHasLatitudeSpan:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLatitudeSpan
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLongitudeSpan:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_longitudeSpan = a3;
}

- (void)setHasLongitudeSpan:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLongitudeSpan
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (void)setPosition:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPosition
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PersistentSearchRequestHistoryItem;
  v3 = -[PersistentSearchRequestHistoryItem description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentSearchRequestHistoryItem dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  GEOPlaceSearchRequest *request;
  void *v5;
  NSString *displayQuery;
  NSString *displayLocation;
  char has;
  void *v9;
  GEOPlaceSearchResponse *response;
  void *v11;
  NSString *syncIdentifier;
  char v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  request = self->_request;
  if (request)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceSearchRequest dictionaryRepresentation](request, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request"));

  }
  displayQuery = self->_displayQuery;
  if (displayQuery)
    objc_msgSend(v3, "setObject:forKey:", displayQuery, CFSTR("displayQuery"));
  displayLocation = self->_displayLocation;
  if (displayLocation)
    objc_msgSend(v3, "setObject:forKey:", displayLocation, CFSTR("displayLocation"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("latitude"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitude));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("longitude"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_23:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitudeSpan));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("latitudeSpan"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitudeSpan));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("longitudeSpan"));

  }
LABEL_12:
  response = self->_response;
  if (response)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceSearchResponse dictionaryRepresentation](response, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("response"));

  }
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier)
    objc_msgSend(v3, "setObject:forKey:", syncIdentifier, CFSTR("syncIdentifier"));
  v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_position));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("position"));

    v13 = (char)self->_has;
  }
  if ((v13 & 0x20) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("timestamp"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100A68114((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  GEOPlaceSearchRequest *request;
  NSString *displayQuery;
  NSString *displayLocation;
  char has;
  GEOPlaceSearchResponse *response;
  NSString *syncIdentifier;
  char v11;
  id v12;

  v4 = a3;
  request = self->_request;
  v12 = v4;
  if (request)
  {
    PBDataWriterWriteSubmessage(v4, request, 10);
    v4 = v12;
  }
  displayQuery = self->_displayQuery;
  if (displayQuery)
  {
    PBDataWriterWriteStringField(v12, displayQuery, 11);
    v4 = v12;
  }
  displayLocation = self->_displayLocation;
  if (displayLocation)
  {
    PBDataWriterWriteStringField(v12, displayLocation, 12);
    v4 = v12;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v12, 20, self->_latitude);
    v4 = v12;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField(v12, 21, self->_longitude);
  v4 = v12;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_23:
  PBDataWriterWriteDoubleField(v12, 22, self->_latitudeSpan);
  v4 = v12;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteDoubleField(v12, 23, self->_longitudeSpan);
    v4 = v12;
  }
LABEL_12:
  response = self->_response;
  if (response)
  {
    PBDataWriterWriteSubmessage(v12, response, 24);
    v4 = v12;
  }
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier)
  {
    PBDataWriterWriteStringField(v12, syncIdentifier, 26);
    v4 = v12;
  }
  v11 = (char)self->_has;
  if ((v11 & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField(v12, 27, self->_position);
    v4 = v12;
    v11 = (char)self->_has;
  }
  if ((v11 & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField(v12, 28, self->_timestamp);
    v4 = v12;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_request)
  {
    objc_msgSend(v4, "setRequest:");
    v4 = v7;
  }
  if (self->_displayQuery)
  {
    objc_msgSend(v7, "setDisplayQuery:");
    v4 = v7;
  }
  if (self->_displayLocation)
  {
    objc_msgSend(v7, "setDisplayLocation:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_latitude;
    *((_BYTE *)v4 + 96) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_longitude;
  *((_BYTE *)v4 + 96) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_23:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_latitudeSpan;
  *((_BYTE *)v4 + 96) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_longitudeSpan;
    *((_BYTE *)v4 + 96) |= 8u;
  }
LABEL_12:
  if (self->_response)
  {
    objc_msgSend(v7, "setResponse:");
    v4 = v7;
  }
  if (self->_syncIdentifier)
  {
    objc_msgSend(v7, "setSyncIdentifier:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_position;
    *((_BYTE *)v4 + 96) |= 0x10u;
    v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 96) |= 0x20u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char has;
  id v13;
  void *v14;
  id v15;
  void *v16;
  char v17;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[GEOPlaceSearchRequest copyWithZone:](self->_request, "copyWithZone:", a3);
  v7 = (void *)v5[9];
  v5[9] = v6;

  v8 = -[NSString copyWithZone:](self->_displayQuery, "copyWithZone:", a3);
  v9 = (void *)v5[8];
  v5[8] = v8;

  v10 = -[NSString copyWithZone:](self->_displayLocation, "copyWithZone:", a3);
  v11 = (void *)v5[7];
  v5[7] = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_latitude;
    *((_BYTE *)v5 + 96) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = *(_QWORD *)&self->_longitude;
  *((_BYTE *)v5 + 96) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  v5[2] = *(_QWORD *)&self->_latitudeSpan;
  *((_BYTE *)v5 + 96) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5[4] = *(_QWORD *)&self->_longitudeSpan;
    *((_BYTE *)v5 + 96) |= 8u;
  }
LABEL_6:
  v13 = -[GEOPlaceSearchResponse copyWithZone:](self->_response, "copyWithZone:", a3);
  v14 = (void *)v5[10];
  v5[10] = v13;

  v15 = -[NSString copyWithZone:](self->_syncIdentifier, "copyWithZone:", a3);
  v16 = (void *)v5[11];
  v5[11] = v15;

  v17 = (char)self->_has;
  if ((v17 & 0x10) != 0)
  {
    v5[5] = *(_QWORD *)&self->_position;
    *((_BYTE *)v5 + 96) |= 0x10u;
    v17 = (char)self->_has;
  }
  if ((v17 & 0x20) != 0)
  {
    v5[6] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v5 + 96) |= 0x20u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPlaceSearchRequest *request;
  NSString *displayQuery;
  NSString *displayLocation;
  GEOPlaceSearchResponse *response;
  NSString *syncIdentifier;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_41;
  request = self->_request;
  if ((unint64_t)request | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPlaceSearchRequest isEqual:](request, "isEqual:"))
      goto LABEL_41;
  }
  displayQuery = self->_displayQuery;
  if ((unint64_t)displayQuery | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](displayQuery, "isEqual:"))
      goto LABEL_41;
  }
  displayLocation = self->_displayLocation;
  if ((unint64_t)displayLocation | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](displayLocation, "isEqual:"))
      goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_latitude != *((double *)v4 + 1))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
LABEL_41:
    v10 = 0;
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 4) == 0 || self->_longitude != *((double *)v4 + 3))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_latitudeSpan != *((double *)v4 + 2))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 8) == 0 || self->_longitudeSpan != *((double *)v4 + 4))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 96) & 8) != 0)
  {
    goto LABEL_41;
  }
  response = self->_response;
  if ((unint64_t)response | *((_QWORD *)v4 + 10)
    && !-[GEOPlaceSearchResponse isEqual:](response, "isEqual:"))
  {
    goto LABEL_41;
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](syncIdentifier, "isEqual:"))
      goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 0x10) == 0 || self->_position != *((double *)v4 + 5))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 96) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  v10 = (*((_BYTE *)v4 + 96) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 0x20) == 0 || self->_timestamp != *((double *)v4 + 6))
      goto LABEL_41;
    v10 = 1;
  }
LABEL_42:

  return v10;
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
  double longitude;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double latitudeSpan;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double longitudeSpan;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  NSUInteger v25;
  char v26;
  unint64_t v27;
  double position;
  double v29;
  long double v30;
  double v31;
  unint64_t v32;
  double timestamp;
  double v34;
  long double v35;
  double v36;
  NSUInteger v38;
  NSUInteger v39;
  unint64_t v40;

  v40 = (unint64_t)-[GEOPlaceSearchRequest hash](self->_request, "hash");
  v39 = -[NSString hash](self->_displayQuery, "hash");
  v38 = -[NSString hash](self->_displayLocation, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    latitude = self->_latitude;
    v6 = -latitude;
    if (latitude >= 0.0)
      v6 = self->_latitude;
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
  if ((has & 4) != 0)
  {
    longitude = self->_longitude;
    v11 = -longitude;
    if (longitude >= 0.0)
      v11 = self->_longitude;
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
  if ((has & 2) != 0)
  {
    latitudeSpan = self->_latitudeSpan;
    v16 = -latitudeSpan;
    if (latitudeSpan >= 0.0)
      v16 = self->_latitudeSpan;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 8) != 0)
  {
    longitudeSpan = self->_longitudeSpan;
    v21 = -longitudeSpan;
    if (longitudeSpan >= 0.0)
      v21 = self->_longitudeSpan;
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
  v24 = (unint64_t)-[GEOPlaceSearchResponse hash](self->_response, "hash");
  v25 = -[NSString hash](self->_syncIdentifier, "hash");
  v26 = (char)self->_has;
  if ((v26 & 0x10) != 0)
  {
    position = self->_position;
    v29 = -position;
    if (position >= 0.0)
      v29 = self->_position;
    v30 = floor(v29 + 0.5);
    v31 = (v29 - v30) * 1.84467441e19;
    v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0)
        v27 += (unint64_t)v31;
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    v27 = 0;
  }
  if ((v26 & 0x20) != 0)
  {
    timestamp = self->_timestamp;
    v34 = -timestamp;
    if (timestamp >= 0.0)
      v34 = self->_timestamp;
    v35 = floor(v34 + 0.5);
    v36 = (v34 - v35) * 1.84467441e19;
    v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0)
        v32 += (unint64_t)v36;
    }
    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }
  else
  {
    v32 = 0;
  }
  return v39 ^ v40 ^ v38 ^ v4 ^ v9 ^ v14 ^ v19 ^ v24 ^ v25 ^ v27 ^ v32;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOPlaceSearchRequest *request;
  uint64_t v6;
  char v7;
  GEOPlaceSearchResponse *response;
  uint64_t v9;
  char v10;
  id v11;

  v4 = a3;
  request = self->_request;
  v6 = *((_QWORD *)v4 + 9);
  v11 = v4;
  if (request)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOPlaceSearchRequest mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PersistentSearchRequestHistoryItem setRequest:](self, "setRequest:");
  }
  v4 = v11;
LABEL_7:
  if (*((_QWORD *)v4 + 8))
  {
    -[PersistentSearchRequestHistoryItem setDisplayQuery:](self, "setDisplayQuery:");
    v4 = v11;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[PersistentSearchRequestHistoryItem setDisplayLocation:](self, "setDisplayLocation:");
    v4 = v11;
  }
  v7 = *((_BYTE *)v4 + 96);
  if ((v7 & 1) != 0)
  {
    self->_latitude = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 96);
    if ((v7 & 4) == 0)
    {
LABEL_13:
      if ((v7 & 2) == 0)
        goto LABEL_14;
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)v4 + 96) & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_longitude = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v7 = *((_BYTE *)v4 + 96);
  if ((v7 & 2) == 0)
  {
LABEL_14:
    if ((v7 & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_21:
  self->_latitudeSpan = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 96) & 8) != 0)
  {
LABEL_15:
    self->_longitudeSpan = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_16:
  response = self->_response;
  v9 = *((_QWORD *)v4 + 10);
  if (response)
  {
    if (!v9)
      goto LABEL_26;
    -[GEOPlaceSearchResponse mergeFrom:](response, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_26;
    -[PersistentSearchRequestHistoryItem setResponse:](self, "setResponse:");
  }
  v4 = v11;
LABEL_26:
  if (*((_QWORD *)v4 + 11))
  {
    -[PersistentSearchRequestHistoryItem setSyncIdentifier:](self, "setSyncIdentifier:");
    v4 = v11;
  }
  v10 = *((_BYTE *)v4 + 96);
  if ((v10 & 0x10) != 0)
  {
    self->_position = *((double *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
    v10 = *((_BYTE *)v4 + 96);
  }
  if ((v10 & 0x20) != 0)
  {
    self->_timestamp = *((double *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
  }

}

- (GEOPlaceSearchRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSString)displayQuery
{
  return self->_displayQuery;
}

- (void)setDisplayQuery:(id)a3
{
  objc_storeStrong((id *)&self->_displayQuery, a3);
}

- (NSString)displayLocation
{
  return self->_displayLocation;
}

- (void)setDisplayLocation:(id)a3
{
  objc_storeStrong((id *)&self->_displayLocation, a3);
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitudeSpan
{
  return self->_latitudeSpan;
}

- (double)longitudeSpan
{
  return self->_longitudeSpan;
}

- (GEOPlaceSearchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSString)syncIdentifier
{
  return self->_syncIdentifier;
}

- (void)setSyncIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentifier, a3);
}

- (double)position
{
  return self->_position;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_displayQuery, 0);
  objc_storeStrong((id *)&self->_displayLocation, 0);
}

@end
