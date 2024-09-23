@implementation _SFPBPhotosAttributes

- (_SFPBPhotosAttributes)initWithFacade:(id)a3
{
  id v4;
  _SFPBPhotosAttributes *v5;
  _SFPBPhotosAttributes *v6;

  v4 = a3;
  v5 = -[_SFPBPhotosAttributes init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasPositionIndex"))
      -[_SFPBPhotosAttributes setPositionIndex:](v5, "setPositionIndex:", objc_msgSend(v4, "positionIndex"));
    if (objc_msgSend(v4, "hasIsEmbeddingMatched"))
      -[_SFPBPhotosAttributes setIsEmbeddingMatched:](v5, "setIsEmbeddingMatched:", objc_msgSend(v4, "isEmbeddingMatched"));
    if (objc_msgSend(v4, "hasIsMetadataMatched"))
      -[_SFPBPhotosAttributes setIsMetadataMatched:](v5, "setIsMetadataMatched:", objc_msgSend(v4, "isMetadataMatched"));
    if (objc_msgSend(v4, "hasIsVideo"))
      -[_SFPBPhotosAttributes setIsVideo:](v5, "setIsVideo:", objc_msgSend(v4, "isVideo"));
    if (objc_msgSend(v4, "hasIsFavorite"))
      -[_SFPBPhotosAttributes setIsFavorite:](v5, "setIsFavorite:", objc_msgSend(v4, "isFavorite"));
    if (objc_msgSend(v4, "hasPhotosSuggestionType"))
      -[_SFPBPhotosAttributes setPhotosSuggestionType:](v5, "setPhotosSuggestionType:", objc_msgSend(v4, "photosSuggestionType"));
    v6 = v5;
  }

  return v5;
}

- (void)setPositionIndex:(unint64_t)a3
{
  self->_positionIndex = a3;
}

- (void)setIsEmbeddingMatched:(BOOL)a3
{
  self->_isEmbeddingMatched = a3;
}

- (void)setIsMetadataMatched:(BOOL)a3
{
  self->_isMetadataMatched = a3;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (void)setPhotosSuggestionType:(int)a3
{
  self->_photosSuggestionType = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPhotosAttributesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_SFPBPhotosAttributes positionIndex](self, "positionIndex"))
    PBDataWriterWriteUint64Field();
  if (-[_SFPBPhotosAttributes isEmbeddingMatched](self, "isEmbeddingMatched"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBPhotosAttributes isMetadataMatched](self, "isMetadataMatched"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBPhotosAttributes isVideo](self, "isVideo"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBPhotosAttributes isFavorite](self, "isFavorite"))
    PBDataWriterWriteBOOLField();
  v4 = -[_SFPBPhotosAttributes photosSuggestionType](self, "photosSuggestionType");
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t positionIndex;
  int isEmbeddingMatched;
  int isMetadataMatched;
  int isVideo;
  int isFavorite;
  int photosSuggestionType;
  BOOL v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (positionIndex = self->_positionIndex, positionIndex == objc_msgSend(v4, "positionIndex"))
    && (isEmbeddingMatched = self->_isEmbeddingMatched,
        isEmbeddingMatched == objc_msgSend(v4, "isEmbeddingMatched"))
    && (isMetadataMatched = self->_isMetadataMatched,
        isMetadataMatched == objc_msgSend(v4, "isMetadataMatched"))
    && (isVideo = self->_isVideo, isVideo == objc_msgSend(v4, "isVideo"))
    && (isFavorite = self->_isFavorite, isFavorite == objc_msgSend(v4, "isFavorite")))
  {
    photosSuggestionType = self->_photosSuggestionType;
    v11 = photosSuggestionType == objc_msgSend(v4, "photosSuggestionType");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (self->_isEmbeddingMatched)
    v2 = 2654435761;
  else
    v2 = 0;
  if (self->_isMetadataMatched)
    v3 = 2654435761;
  else
    v3 = 0;
  if (self->_isVideo)
    v4 = 2654435761;
  else
    v4 = 0;
  if (self->_isFavorite)
    v5 = 2654435761;
  else
    v5 = 0;
  return v2 ^ v3 ^ v4 ^ v5 ^ (2654435761u * self->_positionIndex) ^ (2654435761 * self->_photosSuggestionType);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isEmbeddingMatched)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBPhotosAttributes isEmbeddingMatched](self, "isEmbeddingMatched"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isEmbeddingMatched"));

  }
  if (self->_isFavorite)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBPhotosAttributes isFavorite](self, "isFavorite"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isFavorite"));

  }
  if (self->_isMetadataMatched)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBPhotosAttributes isMetadataMatched](self, "isMetadataMatched"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isMetadataMatched"));

  }
  if (self->_isVideo)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBPhotosAttributes isVideo](self, "isVideo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isVideo"));

  }
  if (self->_photosSuggestionType)
  {
    v8 = -[_SFPBPhotosAttributes photosSuggestionType](self, "photosSuggestionType");
    if (v8 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = *(&off_1E40420A0 + v8);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("photosSuggestionType"));

  }
  if (self->_positionIndex)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBPhotosAttributes positionIndex](self, "positionIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("positionIndex"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPhotosAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBPhotosAttributes)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPhotosAttributes *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBPhotosAttributes initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPhotosAttributes)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPhotosAttributes *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBPhotosAttributes *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBPhotosAttributes;
  v5 = -[_SFPBPhotosAttributes init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("positionIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosAttributes setPositionIndex:](v5, "setPositionIndex:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEmbeddingMatched"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosAttributes setIsEmbeddingMatched:](v5, "setIsEmbeddingMatched:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMetadataMatched"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosAttributes setIsMetadataMatched:](v5, "setIsMetadataMatched:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isVideo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosAttributes setIsVideo:](v5, "setIsVideo:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFavorite"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosAttributes setIsFavorite:](v5, "setIsFavorite:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("photosSuggestionType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPhotosAttributes setPhotosSuggestionType:](v5, "setPhotosSuggestionType:", objc_msgSend(v11, "intValue"));
    v12 = v5;

  }
  return v5;
}

- (unint64_t)positionIndex
{
  return self->_positionIndex;
}

- (BOOL)isEmbeddingMatched
{
  return self->_isEmbeddingMatched;
}

- (BOOL)isMetadataMatched
{
  return self->_isMetadataMatched;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (int)photosSuggestionType
{
  return self->_photosSuggestionType;
}

@end
