@implementation RAPSearchRecording

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (BOOL)hasCorrectedSearchTemplate
{
  return self->_correctedSearchTemplate != 0;
}

- (void)clearAuxiliaryControls
{
  -[NSMutableArray removeAllObjects](self->_auxiliaryControls, "removeAllObjects");
}

- (void)addAuxiliaryControls:(id)a3
{
  id v4;
  NSMutableArray *auxiliaryControls;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  auxiliaryControls = self->_auxiliaryControls;
  v8 = v4;
  if (!auxiliaryControls)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_auxiliaryControls;
    self->_auxiliaryControls = v6;

    v4 = v8;
    auxiliaryControls = self->_auxiliaryControls;
  }
  -[NSMutableArray addObject:](auxiliaryControls, "addObject:", v4);

}

- (unint64_t)auxiliaryControlsCount
{
  return (unint64_t)-[NSMutableArray count](self->_auxiliaryControls, "count");
}

- (id)auxiliaryControlsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_auxiliaryControls, "objectAtIndex:", a3);
}

+ (Class)auxiliaryControlsType
{
  return (Class)objc_opt_class(GEORPAuxiliaryControl);
}

- (void)setOriginatingAuxiliaryControlIndex:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_originatingAuxiliaryControlIndex = a3;
}

- (void)setHasOriginatingAuxiliaryControlIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOriginatingAuxiliaryControlIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RAPSearchRecording;
  v3 = -[RAPSearchRecording description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchRecording dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  GEOPlaceSearchRequest *request;
  void *v5;
  GEOPlaceSearchResponse *response;
  void *v7;
  GEORPCorrectedSearch *correctedSearchTemplate;
  void *v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  request = self->_request;
  if (request)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceSearchRequest dictionaryRepresentation](request, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request"));

  }
  response = self->_response;
  if (response)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceSearchResponse dictionaryRepresentation](response, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("response"));

  }
  correctedSearchTemplate = self->_correctedSearchTemplate;
  if (correctedSearchTemplate)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPCorrectedSearch dictionaryRepresentation](correctedSearchTemplate, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("correctedSearchTemplate"));

  }
  if (-[NSMutableArray count](self->_auxiliaryControls, "count"))
  {
    v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_auxiliaryControls, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = self->_auxiliaryControls;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v19));
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("auxiliaryControls"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_originatingAuxiliaryControlIndex));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("originatingAuxiliaryControlIndex"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  id v13;
  uint64_t v14;
  int v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  _QWORD v22[2];

  if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      v5 = 0;
      v6 = 0;
      v7 = 0;
      while (1)
      {
        v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v8 == -1 || v8 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          break;
        v9 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0)
          goto LABEL_11;
        v5 += 7;
        v10 = v6++ >= 9;
        if (v10)
        {
          v7 = 0;
          v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
        v7 = 0;
LABEL_13:
      if (v11 || (v7 & 7) == 4)
        break;
      switch((v7 >> 3))
      {
        case 1u:
          v13 = objc_alloc_init((Class)GEOPlaceSearchRequest);
          v14 = 32;
          goto LABEL_23;
        case 2u:
          v13 = objc_alloc_init((Class)GEOPlaceSearchResponse);
          v14 = 40;
          goto LABEL_23;
        case 3u:
          v13 = objc_alloc_init((Class)GEORPCorrectedSearch);
          v14 = 24;
LABEL_23:
          objc_storeStrong((id *)&self->PBCodable_opaque[v14], v13);
          goto LABEL_25;
        case 4u:
          v13 = objc_alloc_init((Class)GEORPAuxiliaryControl);
          -[RAPSearchRecording addAuxiliaryControls:](self, "addAuxiliaryControls:", v13);
LABEL_25:
          v22[0] = 0;
          v22[1] = 0;
          if (!PBReaderPlaceMark(a3, v22) || (objc_msgSend(v13, "readFrom:", a3) & 1) == 0)
          {

            LOBYTE(v15) = 0;
            return v15;
          }
          PBReaderRecallMark(a3, v22);

LABEL_39:
          if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_40;
          break;
        case 5u:
          v16 = 0;
          v17 = 0;
          v18 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            v19 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v19 == -1 || v19 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              v20 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v19);
              *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
              v18 |= (unint64_t)(v20 & 0x7F) << v16;
              if (v20 < 0)
              {
                v16 += 7;
                v10 = v17++ >= 9;
                if (v10)
                {
                  v18 = 0;
                  goto LABEL_38;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
            v18 = 0;
LABEL_38:
          self->_originatingAuxiliaryControlIndex = v18;
          goto LABEL_39;
        default:
          v15 = PBReaderSkipValueWithTag(a3);
          if (!v15)
            return v15;
          goto LABEL_39;
      }
    }
  }
LABEL_40:
  LOBYTE(v15) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v15;
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  GEOPlaceSearchRequest *request;
  GEOPlaceSearchResponse *response;
  GEORPCorrectedSearch *correctedSearchTemplate;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = v4;
  request = self->_request;
  if (request)
    PBDataWriterWriteSubmessage(v4, request, 1);
  response = self->_response;
  if (response)
    PBDataWriterWriteSubmessage(v5, response, 2);
  correctedSearchTemplate = self->_correctedSearchTemplate;
  if (correctedSearchTemplate)
    PBDataWriterWriteSubmessage(v5, correctedSearchTemplate, 3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_auxiliaryControls;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), 4);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field(v5, self->_originatingAuxiliaryControlIndex, 5);

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_request)
    objc_msgSend(v8, "setRequest:");
  if (self->_response)
    objc_msgSend(v8, "setResponse:");
  if (self->_correctedSearchTemplate)
    objc_msgSend(v8, "setCorrectedSearchTemplate:");
  if (-[RAPSearchRecording auxiliaryControlsCount](self, "auxiliaryControlsCount"))
  {
    objc_msgSend(v8, "clearAuxiliaryControls");
    v4 = -[RAPSearchRecording auxiliaryControlsCount](self, "auxiliaryControlsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchRecording auxiliaryControlsAtIndex:](self, "auxiliaryControlsAtIndex:", i));
        objc_msgSend(v8, "addAuxiliaryControls:", v7);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v8 + 1) = self->_originatingAuxiliaryControlIndex;
    *((_BYTE *)v8 + 48) |= 1u;
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
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[GEOPlaceSearchRequest copyWithZone:](self->_request, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[GEOPlaceSearchResponse copyWithZone:](self->_response, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[GEORPCorrectedSearch copyWithZone:](self->_correctedSearchTemplate, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_auxiliaryControls;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addAuxiliaryControls:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_originatingAuxiliaryControlIndex;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPlaceSearchRequest *request;
  GEOPlaceSearchResponse *response;
  GEORPCorrectedSearch *correctedSearchTemplate;
  NSMutableArray *auxiliaryControls;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_14;
  request = self->_request;
  if ((unint64_t)request | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPlaceSearchRequest isEqual:](request, "isEqual:"))
      goto LABEL_14;
  }
  response = self->_response;
  if ((unint64_t)response | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPlaceSearchResponse isEqual:](response, "isEqual:"))
      goto LABEL_14;
  }
  correctedSearchTemplate = self->_correctedSearchTemplate;
  if ((unint64_t)correctedSearchTemplate | *((_QWORD *)v4 + 3))
  {
    if (!-[GEORPCorrectedSearch isEqual:](correctedSearchTemplate, "isEqual:"))
      goto LABEL_14;
  }
  auxiliaryControls = self->_auxiliaryControls;
  if ((unint64_t)auxiliaryControls | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](auxiliaryControls, "isEqual:"))
      goto LABEL_14;
  }
  v9 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0 && self->_originatingAuxiliaryControlIndex == *((_QWORD *)v4 + 1))
    {
      v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = (unint64_t)-[GEOPlaceSearchRequest hash](self->_request, "hash");
  v4 = (unint64_t)-[GEOPlaceSearchResponse hash](self->_response, "hash");
  v5 = (unint64_t)-[GEORPCorrectedSearch hash](self->_correctedSearchTemplate, "hash");
  v6 = (unint64_t)-[NSMutableArray hash](self->_auxiliaryControls, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761u * self->_originatingAuxiliaryControlIndex;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOPlaceSearchRequest *request;
  uint64_t v6;
  GEOPlaceSearchResponse *response;
  uint64_t v8;
  GEORPCorrectedSearch *correctedSearchTemplate;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  request = self->_request;
  v6 = *((_QWORD *)v4 + 4);
  if (request)
  {
    if (v6)
      -[GEOPlaceSearchRequest mergeFrom:](request, "mergeFrom:");
  }
  else if (v6)
  {
    -[RAPSearchRecording setRequest:](self, "setRequest:");
  }
  response = self->_response;
  v8 = *((_QWORD *)v4 + 5);
  if (response)
  {
    if (v8)
      -[GEOPlaceSearchResponse mergeFrom:](response, "mergeFrom:");
  }
  else if (v8)
  {
    -[RAPSearchRecording setResponse:](self, "setResponse:");
  }
  correctedSearchTemplate = self->_correctedSearchTemplate;
  v10 = *((_QWORD *)v4 + 3);
  if (correctedSearchTemplate)
  {
    if (v10)
      -[GEORPCorrectedSearch mergeFrom:](correctedSearchTemplate, "mergeFrom:");
  }
  else if (v10)
  {
    -[RAPSearchRecording setCorrectedSearchTemplate:](self, "setCorrectedSearchTemplate:");
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v4 + 2);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[RAPSearchRecording addAuxiliaryControls:](self, "addAuxiliaryControls:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_originatingAuxiliaryControlIndex = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
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

- (GEOPlaceSearchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (GEORPCorrectedSearch)correctedSearchTemplate
{
  return self->_correctedSearchTemplate;
}

- (void)setCorrectedSearchTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_correctedSearchTemplate, a3);
}

- (NSMutableArray)auxiliaryControls
{
  return self->_auxiliaryControls;
}

- (void)setAuxiliaryControls:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryControls, a3);
}

- (unint64_t)originatingAuxiliaryControlIndex
{
  return self->_originatingAuxiliaryControlIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_correctedSearchTemplate, 0);
  objc_storeStrong((id *)&self->_auxiliaryControls, 0);
}

@end
