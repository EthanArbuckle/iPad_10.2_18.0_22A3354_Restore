@implementation RapUserProfileRecord

- (BOOL)hasMapItemStorage
{
  return self->_mapItemStorage != 0;
}

- (BOOL)hasDirections
{
  return self->_directions != 0;
}

- (BOOL)hasCuratedCollectionIdentifier
{
  return self->_curatedCollectionIdentifier != 0;
}

- (BOOL)hasCuratedCollectionProviderIdentifier
{
  return self->_curatedCollectionProviderIdentifier != 0;
}

- (BOOL)hasMuninViewState
{
  return self->_muninViewState != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RapUserProfileRecord;
  v3 = -[RapUserProfileRecord description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RapUserProfileRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  GEOMapItemStorage *mapItemStorage;
  void *v5;
  RAPDirectionsRecording *directions;
  void *v7;
  NSString *curatedCollectionIdentifier;
  NSString *curatedCollectionProviderIdentifier;
  GEOMuninViewState *muninViewState;
  void *v11;
  NSString *title;
  NSString *subtitle;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  mapItemStorage = self->_mapItemStorage;
  if (mapItemStorage)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapItemStorage dictionaryRepresentation](mapItemStorage, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mapItemStorage"));

  }
  directions = self->_directions;
  if (directions)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsRecording dictionaryRepresentation](directions, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("directions"));

  }
  curatedCollectionIdentifier = self->_curatedCollectionIdentifier;
  if (curatedCollectionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", curatedCollectionIdentifier, CFSTR("curatedCollectionIdentifier"));
  curatedCollectionProviderIdentifier = self->_curatedCollectionProviderIdentifier;
  if (curatedCollectionProviderIdentifier)
    objc_msgSend(v3, "setObject:forKey:", curatedCollectionProviderIdentifier, CFSTR("curatedCollectionProviderIdentifier"));
  muninViewState = self->_muninViewState;
  if (muninViewState)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMuninViewState dictionaryRepresentation](muninViewState, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("muninViewState"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v3, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  int v11;
  RAPDirectionsRecording *v13;
  uint64_t v14;
  uint64_t String;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];

  if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                            + OBJC_IVAR___PBDataReader__length))
    return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  while (2)
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
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
      if (v6++ >= 9)
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
      return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    switch((v7 >> 3))
    {
      case 1u:
        v13 = (RAPDirectionsRecording *)objc_alloc_init((Class)GEOMapItemStorage);
        v14 = 32;
        goto LABEL_25;
      case 2u:
        v13 = objc_alloc_init(RAPDirectionsRecording);
        v14 = 24;
        goto LABEL_25;
      case 3u:
        String = PBReaderReadString(a3);
        v16 = objc_claimAutoreleasedReturnValue(String);
        v17 = 8;
        goto LABEL_30;
      case 4u:
        v18 = PBReaderReadString(a3);
        v16 = objc_claimAutoreleasedReturnValue(v18);
        v17 = 16;
        goto LABEL_30;
      case 5u:
        v13 = (RAPDirectionsRecording *)objc_alloc_init((Class)GEOMuninViewState);
        v14 = 40;
LABEL_25:
        objc_storeStrong((id *)&self->PBCodable_opaque[v14], v13);
        v22[0] = 0;
        v22[1] = 0;
        if (PBReaderPlaceMark(a3, v22) && -[RAPDirectionsRecording readFrom:](v13, "readFrom:", a3))
        {
          PBReaderRecallMark(a3, v22);
LABEL_31:

LABEL_32:
          if (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
          continue;
        }

        return 0;
      case 6u:
        v19 = PBReaderReadString(a3);
        v16 = objc_claimAutoreleasedReturnValue(v19);
        v17 = 56;
        goto LABEL_30;
      case 7u:
        v20 = PBReaderReadString(a3);
        v16 = objc_claimAutoreleasedReturnValue(v20);
        v17 = 48;
LABEL_30:
        v13 = *(RAPDirectionsRecording **)&self->PBCodable_opaque[v17];
        *(_QWORD *)&self->PBCodable_opaque[v17] = v16;
        goto LABEL_31;
      default:
        if ((PBReaderSkipValueWithTag(a3) & 1) == 0)
          return 0;
        goto LABEL_32;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4;
  GEOMapItemStorage *mapItemStorage;
  RAPDirectionsRecording *directions;
  NSString *curatedCollectionIdentifier;
  NSString *curatedCollectionProviderIdentifier;
  GEOMuninViewState *muninViewState;
  NSString *title;
  NSString *subtitle;
  id v12;

  v4 = a3;
  mapItemStorage = self->_mapItemStorage;
  v12 = v4;
  if (mapItemStorage)
  {
    PBDataWriterWriteSubmessage(v4, mapItemStorage, 1);
    v4 = v12;
  }
  directions = self->_directions;
  if (directions)
  {
    PBDataWriterWriteSubmessage(v12, directions, 2);
    v4 = v12;
  }
  curatedCollectionIdentifier = self->_curatedCollectionIdentifier;
  if (curatedCollectionIdentifier)
  {
    PBDataWriterWriteStringField(v12, curatedCollectionIdentifier, 3);
    v4 = v12;
  }
  curatedCollectionProviderIdentifier = self->_curatedCollectionProviderIdentifier;
  if (curatedCollectionProviderIdentifier)
  {
    PBDataWriterWriteStringField(v12, curatedCollectionProviderIdentifier, 4);
    v4 = v12;
  }
  muninViewState = self->_muninViewState;
  if (muninViewState)
  {
    PBDataWriterWriteSubmessage(v12, muninViewState, 5);
    v4 = v12;
  }
  title = self->_title;
  if (title)
  {
    PBDataWriterWriteStringField(v12, title, 6);
    v4 = v12;
  }
  subtitle = self->_subtitle;
  if (subtitle)
  {
    PBDataWriterWriteStringField(v12, subtitle, 7);
    v4 = v12;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_mapItemStorage)
  {
    objc_msgSend(v4, "setMapItemStorage:");
    v4 = v5;
  }
  if (self->_directions)
  {
    objc_msgSend(v5, "setDirections:");
    v4 = v5;
  }
  if (self->_curatedCollectionIdentifier)
  {
    objc_msgSend(v5, "setCuratedCollectionIdentifier:");
    v4 = v5;
  }
  if (self->_curatedCollectionProviderIdentifier)
  {
    objc_msgSend(v5, "setCuratedCollectionProviderIdentifier:");
    v4 = v5;
  }
  if (self->_muninViewState)
  {
    objc_msgSend(v5, "setMuninViewState:");
    v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v5, "setSubtitle:");
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
  id v18;
  void *v19;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[GEOMapItemStorage copyWithZone:](self->_mapItemStorage, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[RAPDirectionsRecording copyWithZone:](self->_directions, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_curatedCollectionIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_curatedCollectionProviderIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[GEOMuninViewState copyWithZone:](self->_muninViewState, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v17 = (void *)v5[7];
  v5[7] = v16;

  v18 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v19 = (void *)v5[6];
  v5[6] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOMapItemStorage *mapItemStorage;
  RAPDirectionsRecording *directions;
  NSString *curatedCollectionIdentifier;
  NSString *curatedCollectionProviderIdentifier;
  GEOMuninViewState *muninViewState;
  NSString *title;
  NSString *subtitle;
  unsigned __int8 v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((mapItemStorage = self->_mapItemStorage, !((unint64_t)mapItemStorage | v4[4]))
     || -[GEOMapItemStorage isEqual:](mapItemStorage, "isEqual:"))
    && ((directions = self->_directions, !((unint64_t)directions | v4[3]))
     || -[RAPDirectionsRecording isEqual:](directions, "isEqual:"))
    && ((curatedCollectionIdentifier = self->_curatedCollectionIdentifier,
         !((unint64_t)curatedCollectionIdentifier | v4[1]))
     || -[NSString isEqual:](curatedCollectionIdentifier, "isEqual:"))
    && ((curatedCollectionProviderIdentifier = self->_curatedCollectionProviderIdentifier,
         !((unint64_t)curatedCollectionProviderIdentifier | v4[2]))
     || -[NSString isEqual:](curatedCollectionProviderIdentifier, "isEqual:"))
    && ((muninViewState = self->_muninViewState, !((unint64_t)muninViewState | v4[5]))
     || -[GEOMuninViewState isEqual:](muninViewState, "isEqual:"))
    && ((title = self->_title, !((unint64_t)title | v4[7]))
     || -[NSString isEqual:](title, "isEqual:")))
  {
    subtitle = self->_subtitle;
    if ((unint64_t)subtitle | v4[6])
      v12 = -[NSString isEqual:](subtitle, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = (unint64_t)-[GEOMapItemStorage hash](self->_mapItemStorage, "hash");
  v4 = -[RAPDirectionsRecording hash](self->_directions, "hash") ^ v3;
  v5 = -[NSString hash](self->_curatedCollectionIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_curatedCollectionProviderIdentifier, "hash");
  v7 = (unint64_t)-[GEOMuninViewState hash](self->_muninViewState, "hash");
  v8 = v7 ^ -[NSString hash](self->_title, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_subtitle, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOMapItemStorage *mapItemStorage;
  uint64_t v6;
  RAPDirectionsRecording *directions;
  uint64_t v8;
  GEOMuninViewState *muninViewState;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  mapItemStorage = self->_mapItemStorage;
  v11 = v4;
  v6 = v4[4];
  if (mapItemStorage)
  {
    if (v6)
      -[GEOMapItemStorage mergeFrom:](mapItemStorage, "mergeFrom:");
  }
  else if (v6)
  {
    -[RapUserProfileRecord setMapItemStorage:](self, "setMapItemStorage:");
  }
  directions = self->_directions;
  v8 = v11[3];
  if (directions)
  {
    if (v8)
      -[RAPDirectionsRecording mergeFrom:](directions, "mergeFrom:");
  }
  else if (v8)
  {
    -[RapUserProfileRecord setDirections:](self, "setDirections:");
  }
  if (v11[1])
    -[RapUserProfileRecord setCuratedCollectionIdentifier:](self, "setCuratedCollectionIdentifier:");
  if (v11[2])
    -[RapUserProfileRecord setCuratedCollectionProviderIdentifier:](self, "setCuratedCollectionProviderIdentifier:");
  muninViewState = self->_muninViewState;
  v10 = v11[5];
  if (muninViewState)
  {
    if (v10)
      -[GEOMuninViewState mergeFrom:](muninViewState, "mergeFrom:");
  }
  else if (v10)
  {
    -[RapUserProfileRecord setMuninViewState:](self, "setMuninViewState:");
  }
  if (v11[7])
    -[RapUserProfileRecord setTitle:](self, "setTitle:");
  if (v11[6])
    -[RapUserProfileRecord setSubtitle:](self, "setSubtitle:");

}

- (GEOMapItemStorage)mapItemStorage
{
  return self->_mapItemStorage;
}

- (void)setMapItemStorage:(id)a3
{
  objc_storeStrong((id *)&self->_mapItemStorage, a3);
}

- (RAPDirectionsRecording)directions
{
  return self->_directions;
}

- (void)setDirections:(id)a3
{
  objc_storeStrong((id *)&self->_directions, a3);
}

- (NSString)curatedCollectionIdentifier
{
  return self->_curatedCollectionIdentifier;
}

- (void)setCuratedCollectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_curatedCollectionIdentifier, a3);
}

- (NSString)curatedCollectionProviderIdentifier
{
  return self->_curatedCollectionProviderIdentifier;
}

- (void)setCuratedCollectionProviderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_curatedCollectionProviderIdentifier, a3);
}

- (GEOMuninViewState)muninViewState
{
  return self->_muninViewState;
}

- (void)setMuninViewState:(id)a3
{
  objc_storeStrong((id *)&self->_muninViewState, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_mapItemStorage, 0);
  objc_storeStrong((id *)&self->_directions, 0);
  objc_storeStrong((id *)&self->_curatedCollectionProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_curatedCollectionIdentifier, 0);
}

@end
