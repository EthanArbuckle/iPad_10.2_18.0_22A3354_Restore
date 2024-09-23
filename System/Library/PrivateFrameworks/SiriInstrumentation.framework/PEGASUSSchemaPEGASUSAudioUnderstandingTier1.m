@implementation PEGASUSSchemaPEGASUSAudioUnderstandingTier1

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
  v7.super_class = (Class)PEGASUSSchemaPEGASUSAudioUnderstandingTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioArtist](self, "deleteAudioArtist");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioAppName](self, "deleteAudioAppName");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioEntity](self, "deleteAudioEntity");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioEntityOriginalValue](self, "deleteAudioEntityOriginalValue");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioArtist](self, "deleteAudioArtist");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioAppName](self, "deleteAudioAppName");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioEntity](self, "deleteAudioEntity");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioEntityOriginalValue](self, "deleteAudioEntityOriginalValue");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioArtist](self, "deleteAudioArtist");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioAppName](self, "deleteAudioAppName");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioEntity](self, "deleteAudioEntity");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioEntityOriginalValue](self, "deleteAudioEntityOriginalValue");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioArtist](self, "deleteAudioArtist");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioAppName](self, "deleteAudioAppName");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioEntity](self, "deleteAudioEntity");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioEntityOriginalValue](self, "deleteAudioEntityOriginalValue");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioArtist](self, "deleteAudioArtist");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioAppName](self, "deleteAudioAppName");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioEntity](self, "deleteAudioEntity");
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 deleteAudioEntityOriginalValue](self, "deleteAudioEntityOriginalValue");
  }

  return v5;
}

- (BOOL)hasAudioArtist
{
  return self->_audioArtist != 0;
}

- (void)deleteAudioArtist
{
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 setAudioArtist:](self, "setAudioArtist:", 0);
}

- (BOOL)hasAudioAppName
{
  return self->_audioAppName != 0;
}

- (void)deleteAudioAppName
{
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 setAudioAppName:](self, "setAudioAppName:", 0);
}

- (BOOL)hasAudioEntity
{
  return self->_audioEntity != 0;
}

- (void)deleteAudioEntity
{
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 setAudioEntity:](self, "setAudioEntity:", 0);
}

- (BOOL)hasAudioEntityOriginalValue
{
  return self->_audioEntityOriginalValue != 0;
}

- (void)deleteAudioEntityOriginalValue
{
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 setAudioEntityOriginalValue:](self, "setAudioEntityOriginalValue:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAudioUnderstandingTier1ReadFrom(self, (uint64_t)a3);
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
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioArtist](self, "audioArtist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioAppName](self, "audioAppName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioEntity](self, "audioEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioEntityOriginalValue](self, "audioEntityOriginalValue");
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
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioArtist](self, "audioArtist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioArtist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioArtist](self, "audioArtist");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioArtist](self, "audioArtist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioArtist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioAppName](self, "audioAppName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioAppName](self, "audioAppName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioAppName](self, "audioAppName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioAppName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioEntity](self, "audioEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioEntity](self, "audioEntity");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioEntity](self, "audioEntity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioEntity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioEntityOriginalValue](self, "audioEntityOriginalValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioEntityOriginalValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioEntityOriginalValue](self, "audioEntityOriginalValue");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioEntityOriginalValue](self, "audioEntityOriginalValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioEntityOriginalValue");
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

  v3 = -[NSString hash](self->_audioArtist, "hash");
  v4 = -[NSString hash](self->_audioAppName, "hash") ^ v3;
  v5 = -[NSString hash](self->_audioEntity, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_audioEntityOriginalValue, "hash");
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
  if (self->_audioAppName)
  {
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioAppName](self, "audioAppName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioAppName"));

  }
  if (self->_audioArtist)
  {
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioArtist](self, "audioArtist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioArtist"));

  }
  if (self->_audioEntity)
  {
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioEntity](self, "audioEntity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("audioEntity"));

  }
  if (self->_audioEntityOriginalValue)
  {
    -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 audioEntityOriginalValue](self, "audioEntityOriginalValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("audioEntityOriginalValue"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSAudioUnderstandingTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSAudioUnderstandingTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PEGASUSSchemaPEGASUSAudioUnderstandingTier1 *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PEGASUSSchemaPEGASUSAudioUnderstandingTier1;
  v5 = -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioArtist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 setAudioArtist:](v5, "setAudioArtist:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioAppName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 setAudioAppName:](v5, "setAudioAppName:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioEntity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 setAudioEntity:](v5, "setAudioEntity:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioEntityOriginalValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[PEGASUSSchemaPEGASUSAudioUnderstandingTier1 setAudioEntityOriginalValue:](v5, "setAudioEntityOriginalValue:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (NSString)audioArtist
{
  return self->_audioArtist;
}

- (void)setAudioArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)audioAppName
{
  return self->_audioAppName;
}

- (void)setAudioAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)audioEntity
{
  return self->_audioEntity;
}

- (void)setAudioEntity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)audioEntityOriginalValue
{
  return self->_audioEntityOriginalValue;
}

- (void)setAudioEntityOriginalValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasAudioArtist:(BOOL)a3
{
  self->_hasAudioArtist = a3;
}

- (void)setHasAudioAppName:(BOOL)a3
{
  self->_hasAudioAppName = a3;
}

- (void)setHasAudioEntity:(BOOL)a3
{
  self->_hasAudioEntity = a3;
}

- (void)setHasAudioEntityOriginalValue:(BOOL)a3
{
  self->_hasAudioEntityOriginalValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioEntityOriginalValue, 0);
  objc_storeStrong((id *)&self->_audioEntity, 0);
  objc_storeStrong((id *)&self->_audioAppName, 0);
  objc_storeStrong((id *)&self->_audioArtist, 0);
}

@end
