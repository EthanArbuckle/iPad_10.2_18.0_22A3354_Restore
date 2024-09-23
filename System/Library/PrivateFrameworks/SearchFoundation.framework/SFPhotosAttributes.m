@implementation SFPhotosAttributes

- (SFPhotosAttributes)initWithProtobuf:(id)a3
{
  id v4;
  SFPhotosAttributes *v5;
  SFPhotosAttributes *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFPhotosAttributes;
  v5 = -[SFPhotosAttributes init](&v8, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "positionIndex"))
      -[SFPhotosAttributes setPositionIndex:](v5, "setPositionIndex:", objc_msgSend(v4, "positionIndex"));
    if (objc_msgSend(v4, "isEmbeddingMatched"))
      -[SFPhotosAttributes setIsEmbeddingMatched:](v5, "setIsEmbeddingMatched:", objc_msgSend(v4, "isEmbeddingMatched"));
    if (objc_msgSend(v4, "isMetadataMatched"))
      -[SFPhotosAttributes setIsMetadataMatched:](v5, "setIsMetadataMatched:", objc_msgSend(v4, "isMetadataMatched"));
    if (objc_msgSend(v4, "isVideo"))
      -[SFPhotosAttributes setIsVideo:](v5, "setIsVideo:", objc_msgSend(v4, "isVideo"));
    if (objc_msgSend(v4, "isFavorite"))
      -[SFPhotosAttributes setIsFavorite:](v5, "setIsFavorite:", objc_msgSend(v4, "isFavorite"));
    if (objc_msgSend(v4, "photosSuggestionType"))
      -[SFPhotosAttributes setPhotosSuggestionType:](v5, "setPhotosSuggestionType:", objc_msgSend(v4, "photosSuggestionType"));
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPositionIndex:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_positionIndex = a3;
}

- (BOOL)hasPositionIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsEmbeddingMatched:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isEmbeddingMatched = a3;
}

- (BOOL)hasIsEmbeddingMatched
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsMetadataMatched:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isMetadataMatched = a3;
}

- (BOOL)hasIsMetadataMatched
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsVideo:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isVideo = a3;
}

- (BOOL)hasIsVideo
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsFavorite:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isFavorite = a3;
}

- (BOOL)hasIsFavorite
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPhotosSuggestionType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_photosSuggestionType = a3;
}

- (BOOL)hasPhotosSuggestionType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (SFPhotosAttributes)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPhotosAttributes *v6;
  SFPhotosAttributes *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBPhotosAttributes initWithData:]([_SFPBPhotosAttributes alloc], "initWithData:", v5);
  v7 = -[SFPhotosAttributes initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPhotosAttributes *v6;

  v4 = a3;
  v6 = -[_SFPBPhotosAttributes initWithFacade:]([_SFPBPhotosAttributes alloc], "initWithFacade:", self);
  -[_SFPBPhotosAttributes data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPhotosAttributes *v2;
  void *v3;

  v2 = -[_SFPBPhotosAttributes initWithFacade:]([_SFPBPhotosAttributes alloc], "initWithFacade:", self);
  -[_SFPBPhotosAttributes dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPhotosAttributes *v2;
  void *v3;

  v2 = -[_SFPBPhotosAttributes initWithFacade:]([_SFPBPhotosAttributes alloc], "initWithFacade:", self);
  -[_SFPBPhotosAttributes jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setPositionIndex:", -[SFPhotosAttributes positionIndex](self, "positionIndex"));
  objc_msgSend(v4, "setIsEmbeddingMatched:", -[SFPhotosAttributes isEmbeddingMatched](self, "isEmbeddingMatched"));
  objc_msgSend(v4, "setIsMetadataMatched:", -[SFPhotosAttributes isMetadataMatched](self, "isMetadataMatched"));
  objc_msgSend(v4, "setIsVideo:", -[SFPhotosAttributes isVideo](self, "isVideo"));
  objc_msgSend(v4, "setIsFavorite:", -[SFPhotosAttributes isFavorite](self, "isFavorite"));
  objc_msgSend(v4, "setPhotosSuggestionType:", -[SFPhotosAttributes photosSuggestionType](self, "photosSuggestionType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFPhotosAttributes *v4;
  SFPhotosAttributes *v5;
  unint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  BOOL v11;
  int v13;

  v4 = (SFPhotosAttributes *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFPhotosAttributes isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SFPhotosAttributes positionIndex](self, "positionIndex");
    if (v6 == -[SFPhotosAttributes positionIndex](v5, "positionIndex")
      && (v7 = -[SFPhotosAttributes isEmbeddingMatched](self, "isEmbeddingMatched"),
          v7 == -[SFPhotosAttributes isEmbeddingMatched](v5, "isEmbeddingMatched"))
      && (v8 = -[SFPhotosAttributes isMetadataMatched](self, "isMetadataMatched"),
          v8 == -[SFPhotosAttributes isMetadataMatched](v5, "isMetadataMatched"))
      && (v9 = -[SFPhotosAttributes isVideo](self, "isVideo"), v9 == -[SFPhotosAttributes isVideo](v5, "isVideo"))
      && (v10 = -[SFPhotosAttributes isFavorite](self, "isFavorite"),
          v10 == -[SFPhotosAttributes isFavorite](v5, "isFavorite")))
    {
      v13 = -[SFPhotosAttributes photosSuggestionType](self, "photosSuggestionType");
      v11 = v13 == -[SFPhotosAttributes photosSuggestionType](v5, "photosSuggestionType");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[SFPhotosAttributes positionIndex](self, "positionIndex");
  v4 = v3 ^ -[SFPhotosAttributes isEmbeddingMatched](self, "isEmbeddingMatched");
  v5 = -[SFPhotosAttributes isMetadataMatched](self, "isMetadataMatched");
  v6 = v4 ^ v5 ^ -[SFPhotosAttributes isVideo](self, "isVideo");
  v7 = -[SFPhotosAttributes isFavorite](self, "isFavorite");
  return v6 ^ v7 ^ -[SFPhotosAttributes photosSuggestionType](self, "photosSuggestionType");
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
