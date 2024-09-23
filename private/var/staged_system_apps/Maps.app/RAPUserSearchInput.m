@implementation RAPUserSearchInput

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (BOOL)hasSingleLineAddressString
{
  return self->_singleLineAddressString != 0;
}

- (BOOL)hasPlaceMapItemStorage
{
  return self->_placeMapItemStorage != 0;
}

- (BOOL)hasCompletionStorage
{
  return self->_completionStorage != 0;
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (void)setOrigin:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOrigin
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)originAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_1011C0F70[a3];
}

- (int)StringAsOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DROPPED_PIN")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasFindMyHandleID
{
  return self->_findMyHandleID != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RAPUserSearchInput;
  v3 = -[RAPUserSearchInput description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPUserSearchInput dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *searchString;
  NSString *singleLineAddressString;
  GEOMapItemStorage *placeMapItemStorage;
  void *v8;
  GEOStorageCompletion *completionStorage;
  void *v10;
  GEOLatLng *coordinate;
  void *v12;
  uint64_t origin;
  __CFString *v14;
  NSString *findMyHandleID;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  searchString = self->_searchString;
  if (searchString)
    objc_msgSend(v3, "setObject:forKey:", searchString, CFSTR("searchString"));
  singleLineAddressString = self->_singleLineAddressString;
  if (singleLineAddressString)
    objc_msgSend(v4, "setObject:forKey:", singleLineAddressString, CFSTR("singleLineAddressString"));
  placeMapItemStorage = self->_placeMapItemStorage;
  if (placeMapItemStorage)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapItemStorage dictionaryRepresentation](placeMapItemStorage, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("placeMapItemStorage"));

  }
  completionStorage = self->_completionStorage;
  if (completionStorage)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOStorageCompletion dictionaryRepresentation](completionStorage, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("completionStorage"));

  }
  coordinate = self->_coordinate;
  if (coordinate)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOLatLng dictionaryRepresentation](coordinate, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("coordinate"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    origin = self->_origin;
    if (origin >= 4)
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_origin));
    else
      v14 = off_1011C0F70[origin];
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("origin"));

  }
  findMyHandleID = self->_findMyHandleID;
  if (findMyHandleID)
    objc_msgSend(v4, "setObject:forKey:", findMyHandleID, CFSTR("findMyHandleID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1006FEB20((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *searchString;
  NSString *singleLineAddressString;
  GEOMapItemStorage *placeMapItemStorage;
  GEOStorageCompletion *completionStorage;
  GEOLatLng *coordinate;
  NSString *findMyHandleID;
  id v11;

  v4 = a3;
  searchString = self->_searchString;
  v11 = v4;
  if (searchString)
  {
    PBDataWriterWriteStringField(v4, searchString, 1);
    v4 = v11;
  }
  singleLineAddressString = self->_singleLineAddressString;
  if (singleLineAddressString)
  {
    PBDataWriterWriteStringField(v11, singleLineAddressString, 2);
    v4 = v11;
  }
  placeMapItemStorage = self->_placeMapItemStorage;
  if (placeMapItemStorage)
  {
    PBDataWriterWriteSubmessage(v11, placeMapItemStorage, 3);
    v4 = v11;
  }
  completionStorage = self->_completionStorage;
  if (completionStorage)
  {
    PBDataWriterWriteSubmessage(v11, completionStorage, 4);
    v4 = v11;
  }
  coordinate = self->_coordinate;
  if (coordinate)
  {
    PBDataWriterWriteSubmessage(v11, coordinate, 5);
    v4 = v11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v11, self->_origin, 6);
    v4 = v11;
  }
  findMyHandleID = self->_findMyHandleID;
  if (findMyHandleID)
  {
    PBDataWriterWriteStringField(v11, findMyHandleID, 7);
    v4 = v11;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_searchString)
  {
    objc_msgSend(v4, "setSearchString:");
    v4 = v5;
  }
  if (self->_singleLineAddressString)
  {
    objc_msgSend(v5, "setSingleLineAddressString:");
    v4 = v5;
  }
  if (self->_placeMapItemStorage)
  {
    objc_msgSend(v5, "setPlaceMapItemStorage:");
    v4 = v5;
  }
  if (self->_completionStorage)
  {
    objc_msgSend(v5, "setCompletionStorage:");
    v4 = v5;
  }
  if (self->_coordinate)
  {
    objc_msgSend(v5, "setCoordinate:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_origin;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (self->_findMyHandleID)
  {
    objc_msgSend(v5, "setFindMyHandleID:");
    v4 = v5;
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
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[NSString copyWithZone:](self->_singleLineAddressString, "copyWithZone:", a3);
  v9 = (void *)v5[7];
  v5[7] = v8;

  v10 = -[GEOMapItemStorage copyWithZone:](self->_placeMapItemStorage, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[GEOStorageCompletion copyWithZone:](self->_completionStorage, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  v14 = -[GEOLatLng copyWithZone:](self->_coordinate, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_origin;
    *((_BYTE *)v5 + 64) |= 1u;
  }
  v16 = -[NSString copyWithZone:](self->_findMyHandleID, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *searchString;
  NSString *singleLineAddressString;
  GEOMapItemStorage *placeMapItemStorage;
  GEOStorageCompletion *completionStorage;
  GEOLatLng *coordinate;
  NSString *findMyHandleID;
  unsigned __int8 v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_19;
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](searchString, "isEqual:"))
      goto LABEL_19;
  }
  singleLineAddressString = self->_singleLineAddressString;
  if ((unint64_t)singleLineAddressString | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](singleLineAddressString, "isEqual:"))
      goto LABEL_19;
  }
  placeMapItemStorage = self->_placeMapItemStorage;
  if ((unint64_t)placeMapItemStorage | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOMapItemStorage isEqual:](placeMapItemStorage, "isEqual:"))
      goto LABEL_19;
  }
  completionStorage = self->_completionStorage;
  if ((unint64_t)completionStorage | *((_QWORD *)v4 + 1))
  {
    if (!-[GEOStorageCompletion isEqual:](completionStorage, "isEqual:"))
      goto LABEL_19;
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](coordinate, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_origin != *((_DWORD *)v4 + 8))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  findMyHandleID = self->_findMyHandleID;
  if ((unint64_t)findMyHandleID | *((_QWORD *)v4 + 3))
    v11 = -[NSString isEqual:](findMyHandleID, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_searchString, "hash");
  v4 = -[NSString hash](self->_singleLineAddressString, "hash");
  v5 = (unint64_t)-[GEOMapItemStorage hash](self->_placeMapItemStorage, "hash");
  v6 = (unint64_t)-[GEOStorageCompletion hash](self->_completionStorage, "hash");
  v7 = (unint64_t)-[GEOLatLng hash](self->_coordinate, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_origin;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_findMyHandleID, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOMapItemStorage *placeMapItemStorage;
  uint64_t v6;
  GEOStorageCompletion *completionStorage;
  uint64_t v8;
  GEOLatLng *coordinate;
  uint64_t v10;
  int *v11;

  v4 = (int *)a3;
  v11 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[RAPUserSearchInput setSearchString:](self, "setSearchString:");
    v4 = v11;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[RAPUserSearchInput setSingleLineAddressString:](self, "setSingleLineAddressString:");
    v4 = v11;
  }
  placeMapItemStorage = self->_placeMapItemStorage;
  v6 = *((_QWORD *)v4 + 5);
  if (placeMapItemStorage)
  {
    if (!v6)
      goto LABEL_11;
    -[GEOMapItemStorage mergeFrom:](placeMapItemStorage, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[RAPUserSearchInput setPlaceMapItemStorage:](self, "setPlaceMapItemStorage:");
  }
  v4 = v11;
LABEL_11:
  completionStorage = self->_completionStorage;
  v8 = *((_QWORD *)v4 + 1);
  if (completionStorage)
  {
    if (!v8)
      goto LABEL_17;
    -[GEOStorageCompletion mergeFrom:](completionStorage, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    -[RAPUserSearchInput setCompletionStorage:](self, "setCompletionStorage:");
  }
  v4 = v11;
LABEL_17:
  coordinate = self->_coordinate;
  v10 = *((_QWORD *)v4 + 2);
  if (coordinate)
  {
    if (!v10)
      goto LABEL_23;
    -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_23;
    -[RAPUserSearchInput setCoordinate:](self, "setCoordinate:");
  }
  v4 = v11;
LABEL_23:
  if ((v4[16] & 1) != 0)
  {
    self->_origin = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[RAPUserSearchInput setFindMyHandleID:](self, "setFindMyHandleID:");
    v4 = v11;
  }

}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (NSString)singleLineAddressString
{
  return self->_singleLineAddressString;
}

- (void)setSingleLineAddressString:(id)a3
{
  objc_storeStrong((id *)&self->_singleLineAddressString, a3);
}

- (GEOMapItemStorage)placeMapItemStorage
{
  return self->_placeMapItemStorage;
}

- (void)setPlaceMapItemStorage:(id)a3
{
  objc_storeStrong((id *)&self->_placeMapItemStorage, a3);
}

- (GEOStorageCompletion)completionStorage
{
  return self->_completionStorage;
}

- (void)setCompletionStorage:(id)a3
{
  objc_storeStrong((id *)&self->_completionStorage, a3);
}

- (GEOLatLng)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (int)origin
{
  return self->_origin;
}

- (NSString)findMyHandleID
{
  return self->_findMyHandleID;
}

- (void)setFindMyHandleID:(id)a3
{
  objc_storeStrong((id *)&self->_findMyHandleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleLineAddressString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_placeMapItemStorage, 0);
  objc_storeStrong((id *)&self->_findMyHandleID, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_completionStorage, 0);
}

@end
