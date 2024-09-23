@implementation LTSchemaDisambiguationSpeechTranslationEvent

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)deleteRequestID
{
  -[LTSchemaDisambiguationSpeechTranslationEvent setRequestID:](self, "setRequestID:", 0);
}

- (BOOL)hasSourceLocale
{
  return self->_sourceLocale != 0;
}

- (void)deleteSourceLocale
{
  -[LTSchemaDisambiguationSpeechTranslationEvent setSourceLocale:](self, "setSourceLocale:", 0);
}

- (BOOL)hasSenseID
{
  return self->_senseID != 0;
}

- (void)deleteSenseID
{
  -[LTSchemaDisambiguationSpeechTranslationEvent setSenseID:](self, "setSenseID:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaDisambiguationSpeechTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[LTSchemaDisambiguationSpeechTranslationEvent requestID](self, "requestID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[LTSchemaDisambiguationSpeechTranslationEvent sourceLocale](self, "sourceLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[LTSchemaDisambiguationSpeechTranslationEvent senseID](self, "senseID");
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
  -[LTSchemaDisambiguationSpeechTranslationEvent requestID](self, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[LTSchemaDisambiguationSpeechTranslationEvent requestID](self, "requestID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[LTSchemaDisambiguationSpeechTranslationEvent requestID](self, "requestID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[LTSchemaDisambiguationSpeechTranslationEvent sourceLocale](self, "sourceLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[LTSchemaDisambiguationSpeechTranslationEvent sourceLocale](self, "sourceLocale");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[LTSchemaDisambiguationSpeechTranslationEvent sourceLocale](self, "sourceLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[LTSchemaDisambiguationSpeechTranslationEvent senseID](self, "senseID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "senseID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[LTSchemaDisambiguationSpeechTranslationEvent senseID](self, "senseID");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[LTSchemaDisambiguationSpeechTranslationEvent senseID](self, "senseID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "senseID");
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

  v3 = -[NSString hash](self->_requestID, "hash");
  v4 = -[NSString hash](self->_sourceLocale, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_senseID, "hash");
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
  if (self->_requestID)
  {
    -[LTSchemaDisambiguationSpeechTranslationEvent requestID](self, "requestID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("requestID"));

  }
  if (self->_senseID)
  {
    -[LTSchemaDisambiguationSpeechTranslationEvent senseID](self, "senseID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("senseID"));

  }
  if (self->_sourceLocale)
  {
    -[LTSchemaDisambiguationSpeechTranslationEvent sourceLocale](self, "sourceLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sourceLocale"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LTSchemaDisambiguationSpeechTranslationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LTSchemaDisambiguationSpeechTranslationEvent)initWithJSON:(id)a3
{
  void *v4;
  LTSchemaDisambiguationSpeechTranslationEvent *v5;
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
    self = -[LTSchemaDisambiguationSpeechTranslationEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LTSchemaDisambiguationSpeechTranslationEvent)initWithDictionary:(id)a3
{
  id v4;
  LTSchemaDisambiguationSpeechTranslationEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LTSchemaDisambiguationSpeechTranslationEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LTSchemaDisambiguationSpeechTranslationEvent;
  v5 = -[LTSchemaDisambiguationSpeechTranslationEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[LTSchemaDisambiguationSpeechTranslationEvent setRequestID:](v5, "setRequestID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceLocale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[LTSchemaDisambiguationSpeechTranslationEvent setSourceLocale:](v5, "setSourceLocale:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("senseID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[LTSchemaDisambiguationSpeechTranslationEvent setSenseID:](v5, "setSenseID:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sourceLocale
{
  return self->_sourceLocale;
}

- (void)setSourceLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)senseID
{
  return self->_senseID;
}

- (void)setSenseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasRequestID:(BOOL)a3
{
  self->_hasRequestID = a3;
}

- (void)setHasSourceLocale:(BOOL)a3
{
  self->_hasSourceLocale = a3;
}

- (void)setHasSenseID:(BOOL)a3
{
  self->_hasSenseID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senseID, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end
