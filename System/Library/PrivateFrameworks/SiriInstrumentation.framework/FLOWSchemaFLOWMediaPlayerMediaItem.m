@implementation FLOWSchemaFLOWMediaPlayerMediaItem

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
  v7.super_class = (Class)FLOWSchemaFLOWMediaPlayerMediaItem;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteTitle](self, "deleteTitle");
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteArtist](self, "deleteArtist");
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteEntityId](self, "deleteEntityId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteTitle](self, "deleteTitle");
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteArtist](self, "deleteArtist");
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteEntityId](self, "deleteEntityId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteTitle](self, "deleteTitle");
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteArtist](self, "deleteArtist");
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteEntityId](self, "deleteEntityId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteTitle](self, "deleteTitle");
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteArtist](self, "deleteArtist");
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteEntityId](self, "deleteEntityId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteTitle](self, "deleteTitle");
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteArtist](self, "deleteArtist");
    -[FLOWSchemaFLOWMediaPlayerMediaItem deleteEntityId](self, "deleteEntityId");
  }

  return v5;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)deleteTitle
{
  -[FLOWSchemaFLOWMediaPlayerMediaItem setTitle:](self, "setTitle:", 0);
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (void)deleteArtist
{
  -[FLOWSchemaFLOWMediaPlayerMediaItem setArtist:](self, "setArtist:", 0);
}

- (void)setMediaType:(int)a3
{
  *(&self->_isAlternative + 1) |= 1u;
  self->_mediaType = a3;
}

- (BOOL)hasMediaType
{
  return *(&self->_isAlternative + 1);
}

- (void)setHasMediaType:(BOOL)a3
{
  *(&self->_isAlternative + 1) = *(&self->_isAlternative + 1) & 0xFE | a3;
}

- (void)deleteMediaType
{
  -[FLOWSchemaFLOWMediaPlayerMediaItem setMediaType:](self, "setMediaType:", 0);
  *(&self->_isAlternative + 1) &= ~1u;
}

- (BOOL)hasEntityId
{
  return self->_entityId != 0;
}

- (void)deleteEntityId
{
  -[FLOWSchemaFLOWMediaPlayerMediaItem setEntityId:](self, "setEntityId:", 0);
}

- (void)setIsAlternative:(BOOL)a3
{
  *(&self->_isAlternative + 1) |= 2u;
  self->_isAlternative = a3;
}

- (BOOL)hasIsAlternative
{
  return (*((unsigned __int8 *)&self->_isAlternative + 1) >> 1) & 1;
}

- (void)setHasIsAlternative:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isAlternative + 1) = *(&self->_isAlternative + 1) & 0xFD | v3;
}

- (void)deleteIsAlternative
{
  -[FLOWSchemaFLOWMediaPlayerMediaItem setIsAlternative:](self, "setIsAlternative:", 0);
  *(&self->_isAlternative + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWMediaPlayerMediaItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[FLOWSchemaFLOWMediaPlayerMediaItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[FLOWSchemaFLOWMediaPlayerMediaItem artist](self, "artist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if (*(&self->_isAlternative + 1))
    PBDataWriterWriteInt32Field();
  -[FLOWSchemaFLOWMediaPlayerMediaItem entityId](self, "entityId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v7 = v8;
  if ((*(&self->_isAlternative + 1) & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
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
  int mediaType;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  int v25;
  int isAlternative;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[FLOWSchemaFLOWMediaPlayerMediaItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[FLOWSchemaFLOWMediaPlayerMediaItem title](self, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWMediaPlayerMediaItem title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  -[FLOWSchemaFLOWMediaPlayerMediaItem artist](self, "artist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[FLOWSchemaFLOWMediaPlayerMediaItem artist](self, "artist");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLOWSchemaFLOWMediaPlayerMediaItem artist](self, "artist");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artist");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_20;
  }
  else
  {

  }
  if (*(&self->_isAlternative + 1) != (v4[41] & 1))
    goto LABEL_20;
  if (*(&self->_isAlternative + 1))
  {
    mediaType = self->_mediaType;
    if (mediaType != objc_msgSend(v4, "mediaType"))
      goto LABEL_20;
  }
  -[FLOWSchemaFLOWMediaPlayerMediaItem entityId](self, "entityId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  -[FLOWSchemaFLOWMediaPlayerMediaItem entityId](self, "entityId");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[FLOWSchemaFLOWMediaPlayerMediaItem entityId](self, "entityId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_20;
  }
  else
  {

  }
  v25 = (*((unsigned __int8 *)&self->_isAlternative + 1) >> 1) & 1;
  if (v25 == ((v4[41] >> 1) & 1))
  {
    if (!v25
      || (isAlternative = self->_isAlternative, isAlternative == objc_msgSend(v4, "isAlternative")))
    {
      v23 = 1;
      goto LABEL_21;
    }
  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_artist, "hash");
  if (*(&self->_isAlternative + 1))
    v5 = 2654435761 * self->_mediaType;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_entityId, "hash");
  if ((*(&self->_isAlternative + 1) & 2) != 0)
    v7 = 2654435761 * self->_isAlternative;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_artist)
  {
    -[FLOWSchemaFLOWMediaPlayerMediaItem artist](self, "artist");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("artist"));

  }
  if (self->_entityId)
  {
    -[FLOWSchemaFLOWMediaPlayerMediaItem entityId](self, "entityId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("entityId"));

  }
  v8 = *(&self->_isAlternative + 1);
  if ((v8 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerMediaItem isAlternative](self, "isAlternative"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isAlternative"));

    v8 = *(&self->_isAlternative + 1);
  }
  if ((v8 & 1) != 0)
  {
    v10 = -[FLOWSchemaFLOWMediaPlayerMediaItem mediaType](self, "mediaType") - 1;
    if (v10 > 0x1B)
      v11 = CFSTR("FLOWMEDIATYPE_UNKNOWN");
    else
      v11 = off_1E56397E8[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("mediaType"));
  }
  if (self->_title)
  {
    -[FLOWSchemaFLOWMediaPlayerMediaItem title](self, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("title"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWMediaPlayerMediaItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWMediaPlayerMediaItem)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWMediaPlayerMediaItem *v5;
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
    self = -[FLOWSchemaFLOWMediaPlayerMediaItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWMediaPlayerMediaItem)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWMediaPlayerMediaItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FLOWSchemaFLOWMediaPlayerMediaItem *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FLOWSchemaFLOWMediaPlayerMediaItem;
  v5 = -[FLOWSchemaFLOWMediaPlayerMediaItem init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[FLOWSchemaFLOWMediaPlayerMediaItem setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("artist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[FLOWSchemaFLOWMediaPlayerMediaItem setArtist:](v5, "setArtist:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerMediaItem setMediaType:](v5, "setMediaType:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[FLOWSchemaFLOWMediaPlayerMediaItem setEntityId:](v5, "setEntityId:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAlternative"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWMediaPlayerMediaItem setIsAlternative:](v5, "setIsAlternative:", objc_msgSend(v13, "BOOLValue"));
    v14 = v5;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)mediaType
{
  return self->_mediaType;
}

- (NSString)entityId
{
  return self->_entityId;
}

- (void)setEntityId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isAlternative
{
  return self->_isAlternative;
}

- (void)setHasTitle:(BOOL)a3
{
  *(&self->_isAlternative + 2) = a3;
}

- (void)setHasArtist:(BOOL)a3
{
  *(&self->_isAlternative + 3) = a3;
}

- (void)setHasEntityId:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityId, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
