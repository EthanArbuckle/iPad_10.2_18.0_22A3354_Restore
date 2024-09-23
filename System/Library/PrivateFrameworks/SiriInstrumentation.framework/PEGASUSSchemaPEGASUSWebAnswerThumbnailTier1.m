@implementation PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteImageUrl](self, "deleteImageUrl");
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteTouchIcon](self, "deleteTouchIcon");
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteFavIcon](self, "deleteFavIcon");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteImageUrl](self, "deleteImageUrl");
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteTouchIcon](self, "deleteTouchIcon");
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteFavIcon](self, "deleteFavIcon");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteImageUrl](self, "deleteImageUrl");
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteTouchIcon](self, "deleteTouchIcon");
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteFavIcon](self, "deleteFavIcon");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteImageUrl](self, "deleteImageUrl");
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteTouchIcon](self, "deleteTouchIcon");
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteFavIcon](self, "deleteFavIcon");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteImageUrl](self, "deleteImageUrl");
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteTouchIcon](self, "deleteTouchIcon");
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 deleteFavIcon](self, "deleteFavIcon");
  }

  return v5;
}

- (BOOL)hasImageUrl
{
  return self->_imageUrl != 0;
}

- (void)deleteImageUrl
{
  -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 setImageUrl:](self, "setImageUrl:", 0);
}

- (BOOL)hasTouchIcon
{
  return self->_touchIcon != 0;
}

- (void)deleteTouchIcon
{
  -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 setTouchIcon:](self, "setTouchIcon:", 0);
}

- (BOOL)hasFavIcon
{
  return self->_favIcon != 0;
}

- (void)deleteFavIcon
{
  -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 setFavIcon:](self, "setFavIcon:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 imageUrl](self, "imageUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 touchIcon](self, "touchIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 favIcon](self, "favIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 imageUrl](self, "imageUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 imageUrl](self, "imageUrl");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 imageUrl](self, "imageUrl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageUrl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 touchIcon](self, "touchIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "touchIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 touchIcon](self, "touchIcon");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 touchIcon](self, "touchIcon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "touchIcon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 favIcon](self, "favIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "favIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 favIcon](self, "favIcon");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 favIcon](self, "favIcon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "favIcon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_imageUrl, "hash");
  v4 = -[NSString hash](self->_touchIcon, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_favIcon, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_favIcon)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 favIcon](self, "favIcon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("favIcon"));

  }
  if (self->_imageUrl)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 imageUrl](self, "imageUrl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("imageUrl"));

  }
  if (self->_touchIcon)
  {
    -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 touchIcon](self, "touchIcon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("touchIcon"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1;
  v5 = -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageUrl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 setImageUrl:](v5, "setImageUrl:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("touchIcon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 setTouchIcon:](v5, "setTouchIcon:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("favIcon"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 setFavIcon:](v5, "setFavIcon:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)imageUrl
{
  return self->_imageUrl;
}

- (void)setImageUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)touchIcon
{
  return self->_touchIcon;
}

- (void)setTouchIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)favIcon
{
  return self->_favIcon;
}

- (void)setFavIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasImageUrl:(BOOL)a3
{
  self->_hasImageUrl = a3;
}

- (void)setHasTouchIcon:(BOOL)a3
{
  self->_hasTouchIcon = a3;
}

- (void)setHasFavIcon:(BOOL)a3
{
  self->_hasFavIcon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favIcon, 0);
  objc_storeStrong((id *)&self->_touchIcon, 0);
  objc_storeStrong((id *)&self->_imageUrl, 0);
}

@end
