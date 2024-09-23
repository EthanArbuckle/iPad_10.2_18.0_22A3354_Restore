@implementation PersistentDirectionsHistoryItem

- (BOOL)hasStartSearchResult
{
  return self->_startSearchResult != 0;
}

- (BOOL)hasEndSearchResult
{
  return self->_endSearchResult != 0;
}

- (BOOL)hasDirectionsResponseID
{
  return self->_directionsResponseID != 0;
}

- (BOOL)hasReportAProblemAttachment
{
  return self->_reportAProblemAttachment != 0;
}

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (void)setPosition:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPosition
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTransportType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTransportType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1011E0B50 + a3);
}

- (int)StringAsTransportType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PersistentDirectionsHistoryItem;
  v3 = -[PersistentDirectionsHistoryItem description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentDirectionsHistoryItem dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SearchResult *startSearchResult;
  void *v5;
  SearchResult *endSearchResult;
  void *v7;
  NSData *directionsResponseID;
  NSString *reportAProblemAttachment;
  NSString *syncIdentifier;
  char has;
  void *v12;
  void *v14;
  uint64_t transportType;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  startSearchResult = self->_startSearchResult;
  if (startSearchResult)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr dictionaryRepresentation](startSearchResult, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("startSearchResult"));

  }
  endSearchResult = self->_endSearchResult;
  if (endSearchResult)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultRepr dictionaryRepresentation](endSearchResult, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("endSearchResult"));

  }
  directionsResponseID = self->_directionsResponseID;
  if (directionsResponseID)
    objc_msgSend(v3, "setObject:forKey:", directionsResponseID, CFSTR("directionsResponseID"));
  reportAProblemAttachment = self->_reportAProblemAttachment;
  if (reportAProblemAttachment)
    objc_msgSend(v3, "setObject:forKey:", reportAProblemAttachment, CFSTR("reportAProblemAttachment"));
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier)
    objc_msgSend(v3, "setObject:forKey:", syncIdentifier, CFSTR("syncIdentifier"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_13;
LABEL_17:
    transportType = self->_transportType;
    if (transportType >= 7)
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transportType));
    else
      v16 = *(&off_1011E0B50 + transportType);
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("transportType"));

    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_14;
    return v3;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_position));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("position"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_13:
  if ((has & 2) != 0)
  {
LABEL_14:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("timestamp"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100A5CC9C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  SearchResult *startSearchResult;
  SearchResult *endSearchResult;
  NSData *directionsResponseID;
  NSString *reportAProblemAttachment;
  NSString *syncIdentifier;
  char has;
  id v11;

  v4 = a3;
  startSearchResult = self->_startSearchResult;
  v11 = v4;
  if (startSearchResult)
  {
    PBDataWriterWriteSubmessage(v4, startSearchResult, 1);
    v4 = v11;
  }
  endSearchResult = self->_endSearchResult;
  if (endSearchResult)
  {
    PBDataWriterWriteSubmessage(v11, endSearchResult, 2);
    v4 = v11;
  }
  directionsResponseID = self->_directionsResponseID;
  if (directionsResponseID)
  {
    PBDataWriterWriteDataField(v11, directionsResponseID, 3);
    v4 = v11;
  }
  reportAProblemAttachment = self->_reportAProblemAttachment;
  if (reportAProblemAttachment)
  {
    PBDataWriterWriteStringField(v11, reportAProblemAttachment, 4);
    v4 = v11;
  }
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier)
  {
    PBDataWriterWriteStringField(v11, syncIdentifier, 5);
    v4 = v11;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_13;
LABEL_17:
    PBDataWriterWriteInt32Field(v11, self->_transportType, 7);
    v4 = v11;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  PBDataWriterWriteDoubleField(v11, 6, self->_position);
  v4 = v11;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_13:
  if ((has & 2) != 0)
  {
LABEL_14:
    PBDataWriterWriteDoubleField(v11, 8, self->_timestamp);
    v4 = v11;
  }
LABEL_15:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_startSearchResult)
  {
    objc_msgSend(v4, "setStartSearchResult:");
    v4 = v6;
  }
  if (self->_endSearchResult)
  {
    objc_msgSend(v6, "setEndSearchResult:");
    v4 = v6;
  }
  if (self->_directionsResponseID)
  {
    objc_msgSend(v6, "setDirectionsResponseID:");
    v4 = v6;
  }
  if (self->_reportAProblemAttachment)
  {
    objc_msgSend(v6, "setReportAProblemAttachment:");
    v4 = v6;
  }
  if (self->_syncIdentifier)
  {
    objc_msgSend(v6, "setSyncIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_13;
LABEL_17:
    *((_DWORD *)v4 + 16) = self->_transportType;
    *((_BYTE *)v4 + 68) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_position;
  *((_BYTE *)v4 + 68) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_13:
  if ((has & 2) != 0)
  {
LABEL_14:
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 68) |= 2u;
  }
LABEL_15:

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
  id v12;
  void *v13;
  id v14;
  void *v15;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[SearchResult copyWithZone:](self->_startSearchResult, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[SearchResult copyWithZone:](self->_endSearchResult, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSData copyWithZone:](self->_directionsResponseID, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_reportAProblemAttachment, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[NSString copyWithZone:](self->_syncIdentifier, "copyWithZone:", a3);
  v15 = (void *)v5[7];
  v5[7] = v14;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *((_DWORD *)v5 + 16) = self->_transportType;
    *((_BYTE *)v5 + 68) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v5;
    goto LABEL_4;
  }
  v5[1] = *(_QWORD *)&self->_position;
  *((_BYTE *)v5 + 68) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v5[2] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v5 + 68) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SearchResult *startSearchResult;
  SearchResult *endSearchResult;
  NSData *directionsResponseID;
  NSString *reportAProblemAttachment;
  NSString *syncIdentifier;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_26;
  startSearchResult = self->_startSearchResult;
  if ((unint64_t)startSearchResult | *((_QWORD *)v4 + 6))
  {
    if (!-[SearchResult isEqual:](startSearchResult, "isEqual:"))
      goto LABEL_26;
  }
  endSearchResult = self->_endSearchResult;
  if ((unint64_t)endSearchResult | *((_QWORD *)v4 + 4))
  {
    if (!-[SearchResult isEqual:](endSearchResult, "isEqual:"))
      goto LABEL_26;
  }
  directionsResponseID = self->_directionsResponseID;
  if ((unint64_t)directionsResponseID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](directionsResponseID, "isEqual:"))
      goto LABEL_26;
  }
  reportAProblemAttachment = self->_reportAProblemAttachment;
  if ((unint64_t)reportAProblemAttachment | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](reportAProblemAttachment, "isEqual:"))
      goto LABEL_26;
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](syncIdentifier, "isEqual:"))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_position != *((double *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_26:
    v10 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_transportType != *((_DWORD *)v4 + 16))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_26;
  }
  v10 = (*((_BYTE *)v4 + 68) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_timestamp != *((double *)v4 + 2))
      goto LABEL_26;
    v10 = 1;
  }
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  char has;
  unint64_t v9;
  double position;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  double timestamp;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;

  v3 = -[SearchResult hash](self->_startSearchResult, "hash");
  v4 = -[SearchResult hash](self->_endSearchResult, "hash");
  v5 = (unint64_t)-[NSData hash](self->_directionsResponseID, "hash");
  v6 = -[NSString hash](self->_reportAProblemAttachment, "hash");
  v7 = -[NSString hash](self->_syncIdentifier, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    position = self->_position;
    v11 = -position;
    if (position >= 0.0)
      v11 = self->_position;
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
  if ((has & 4) != 0)
  {
    v14 = 2654435761 * self->_transportType;
    if ((has & 2) != 0)
      goto LABEL_11;
LABEL_16:
    v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14 ^ v19;
  }
  v14 = 0;
  if ((has & 2) == 0)
    goto LABEL_16;
LABEL_11:
  timestamp = self->_timestamp;
  v16 = -timestamp;
  if (timestamp >= 0.0)
    v16 = self->_timestamp;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0)
      v19 += (unint64_t)v18;
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SearchResult *startSearchResult;
  uint64_t v6;
  SearchResult *endSearchResult;
  uint64_t v8;
  char v9;
  id v10;

  v4 = a3;
  startSearchResult = self->_startSearchResult;
  v6 = *((_QWORD *)v4 + 6);
  v10 = v4;
  if (startSearchResult)
  {
    if (!v6)
      goto LABEL_7;
    -[SearchResultRepr mergeFrom:](startSearchResult, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PersistentDirectionsHistoryItem setStartSearchResult:](self, "setStartSearchResult:");
  }
  v4 = v10;
LABEL_7:
  endSearchResult = self->_endSearchResult;
  v8 = *((_QWORD *)v4 + 4);
  if (endSearchResult)
  {
    if (!v8)
      goto LABEL_13;
    -[SearchResultRepr mergeFrom:](endSearchResult, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[PersistentDirectionsHistoryItem setEndSearchResult:](self, "setEndSearchResult:");
  }
  v4 = v10;
LABEL_13:
  if (*((_QWORD *)v4 + 3))
  {
    -[PersistentDirectionsHistoryItem setDirectionsResponseID:](self, "setDirectionsResponseID:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PersistentDirectionsHistoryItem setReportAProblemAttachment:](self, "setReportAProblemAttachment:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[PersistentDirectionsHistoryItem setSyncIdentifier:](self, "setSyncIdentifier:");
    v4 = v10;
  }
  v9 = *((_BYTE *)v4 + 68);
  if ((v9 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0)
      goto LABEL_21;
LABEL_25:
    self->_transportType = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 68) & 2) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  self->_position = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v9 = *((_BYTE *)v4 + 68);
  if ((v9 & 4) != 0)
    goto LABEL_25;
LABEL_21:
  if ((v9 & 2) != 0)
  {
LABEL_22:
    self->_timestamp = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_23:

}

- (SearchResult)startSearchResult
{
  return self->_startSearchResult;
}

- (void)setStartSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_startSearchResult, a3);
}

- (SearchResult)endSearchResult
{
  return self->_endSearchResult;
}

- (void)setEndSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_endSearchResult, a3);
}

- (NSData)directionsResponseID
{
  return self->_directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
  objc_storeStrong((id *)&self->_directionsResponseID, a3);
}

- (NSString)reportAProblemAttachment
{
  return self->_reportAProblemAttachment;
}

- (void)setReportAProblemAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_reportAProblemAttachment, a3);
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

- (int)transportType
{
  return self->_transportType;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_startSearchResult, 0);
  objc_storeStrong((id *)&self->_reportAProblemAttachment, 0);
  objc_storeStrong((id *)&self->_endSearchResult, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
}

@end
