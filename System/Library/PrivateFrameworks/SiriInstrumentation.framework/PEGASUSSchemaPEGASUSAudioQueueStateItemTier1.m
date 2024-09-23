@implementation PEGASUSSchemaPEGASUSAudioQueueStateItemTier1

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
  v7.super_class = (Class)PEGASUSSchemaPEGASUSAudioQueueStateItemTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioAlbum](self, "deleteAudioAlbum");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioArtist](self, "deleteAudioArtist");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioClientId](self, "deleteAudioClientId");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioTitle](self, "deleteAudioTitle");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioAlbum](self, "deleteAudioAlbum");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioArtist](self, "deleteAudioArtist");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioClientId](self, "deleteAudioClientId");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioTitle](self, "deleteAudioTitle");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioAlbum](self, "deleteAudioAlbum");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioArtist](self, "deleteAudioArtist");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioClientId](self, "deleteAudioClientId");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioTitle](self, "deleteAudioTitle");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioAlbum](self, "deleteAudioAlbum");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioArtist](self, "deleteAudioArtist");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioClientId](self, "deleteAudioClientId");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioTitle](self, "deleteAudioTitle");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioAlbum](self, "deleteAudioAlbum");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioArtist](self, "deleteAudioArtist");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioClientId](self, "deleteAudioClientId");
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 deleteAudioTitle](self, "deleteAudioTitle");
  }

  return v5;
}

- (BOOL)hasAudioAlbum
{
  return self->_audioAlbum != 0;
}

- (void)deleteAudioAlbum
{
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 setAudioAlbum:](self, "setAudioAlbum:", 0);
}

- (BOOL)hasAudioArtist
{
  return self->_audioArtist != 0;
}

- (void)deleteAudioArtist
{
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 setAudioArtist:](self, "setAudioArtist:", 0);
}

- (BOOL)hasAudioClientId
{
  return self->_audioClientId != 0;
}

- (void)deleteAudioClientId
{
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 setAudioClientId:](self, "setAudioClientId:", 0);
}

- (BOOL)hasAudioTitle
{
  return self->_audioTitle != 0;
}

- (void)deleteAudioTitle
{
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 setAudioTitle:](self, "setAudioTitle:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAudioQueueStateItemTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioAlbum](self, "audioAlbum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioArtist](self, "audioArtist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioClientId](self, "audioClientId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioTitle](self, "audioTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioAlbum](self, "audioAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioAlbum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioAlbum](self, "audioAlbum");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioAlbum](self, "audioAlbum");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioAlbum");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioArtist](self, "audioArtist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioArtist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioArtist](self, "audioArtist");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioArtist](self, "audioArtist");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioArtist");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioClientId](self, "audioClientId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioClientId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioClientId](self, "audioClientId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioClientId](self, "audioClientId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioClientId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioTitle](self, "audioTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioTitle](self, "audioTitle");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioTitle](self, "audioTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_audioAlbum, "hash");
  v4 = -[NSString hash](self->_audioArtist, "hash") ^ v3;
  v5 = -[NSString hash](self->_audioClientId, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_audioTitle, "hash");
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
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audioAlbum)
  {
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioAlbum](self, "audioAlbum");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioAlbum"));

  }
  if (self->_audioArtist)
  {
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioArtist](self, "audioArtist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioArtist"));

  }
  if (self->_audioClientId)
  {
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioClientId](self, "audioClientId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("audioClientId"));

  }
  if (self->_audioTitle)
  {
    -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 audioTitle](self, "audioTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("audioTitle"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSAudioQueueStateItemTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSAudioQueueStateItemTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PEGASUSSchemaPEGASUSAudioQueueStateItemTier1;
  v5 = -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioAlbum"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 setAudioAlbum:](v5, "setAudioAlbum:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioArtist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 setAudioArtist:](v5, "setAudioArtist:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioClientId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 setAudioClientId:](v5, "setAudioClientId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[PEGASUSSchemaPEGASUSAudioQueueStateItemTier1 setAudioTitle:](v5, "setAudioTitle:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (NSString)audioAlbum
{
  return self->_audioAlbum;
}

- (void)setAudioAlbum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)audioArtist
{
  return self->_audioArtist;
}

- (void)setAudioArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)audioClientId
{
  return self->_audioClientId;
}

- (void)setAudioClientId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)audioTitle
{
  return self->_audioTitle;
}

- (void)setAudioTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasAudioAlbum:(BOOL)a3
{
  self->_hasAudioAlbum = a3;
}

- (void)setHasAudioArtist:(BOOL)a3
{
  self->_hasAudioArtist = a3;
}

- (void)setHasAudioClientId:(BOOL)a3
{
  self->_hasAudioClientId = a3;
}

- (void)setHasAudioTitle:(BOOL)a3
{
  self->_hasAudioTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTitle, 0);
  objc_storeStrong((id *)&self->_audioClientId, 0);
  objc_storeStrong((id *)&self->_audioArtist, 0);
  objc_storeStrong((id *)&self->_audioAlbum, 0);
}

@end
