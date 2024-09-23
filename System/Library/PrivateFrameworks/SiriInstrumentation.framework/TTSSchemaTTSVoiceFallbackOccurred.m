@implementation TTSSchemaTTSVoiceFallbackOccurred

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
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TTSSchemaTTSVoiceFallbackOccurred;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSSchemaTTSVoiceFallbackOccurred voiceSettings](self, "voiceSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[TTSSchemaTTSVoiceFallbackOccurred deleteVoiceSettings](self, "deleteVoiceSettings");
  -[TTSSchemaTTSVoiceFallbackOccurred context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[TTSSchemaTTSVoiceFallbackOccurred deleteContext](self, "deleteContext");
  -[TTSSchemaTTSVoiceFallbackOccurred contextId](self, "contextId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[TTSSchemaTTSVoiceFallbackOccurred deleteContextId](self, "deleteContextId");

  return v5;
}

- (BOOL)hasVoiceSettings
{
  return self->_voiceSettings != 0;
}

- (void)deleteVoiceSettings
{
  -[TTSSchemaTTSVoiceFallbackOccurred setVoiceSettings:](self, "setVoiceSettings:", 0);
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (void)deleteContext
{
  -[TTSSchemaTTSVoiceFallbackOccurred setContext:](self, "setContext:", 0);
}

- (BOOL)hasContextId
{
  return self->_contextId != 0;
}

- (void)deleteContextId
{
  -[TTSSchemaTTSVoiceFallbackOccurred setContextId:](self, "setContextId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSVoiceFallbackOccurredReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[TTSSchemaTTSVoiceFallbackOccurred voiceSettings](self, "voiceSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TTSSchemaTTSVoiceFallbackOccurred voiceSettings](self, "voiceSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSVoiceFallbackOccurred context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TTSSchemaTTSVoiceFallbackOccurred context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSVoiceFallbackOccurred contextId](self, "contextId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TTSSchemaTTSVoiceFallbackOccurred contextId](self, "contextId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

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
  -[TTSSchemaTTSVoiceFallbackOccurred voiceSettings](self, "voiceSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[TTSSchemaTTSVoiceFallbackOccurred voiceSettings](self, "voiceSettings");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TTSSchemaTTSVoiceFallbackOccurred voiceSettings](self, "voiceSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[TTSSchemaTTSVoiceFallbackOccurred context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[TTSSchemaTTSVoiceFallbackOccurred context](self, "context");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[TTSSchemaTTSVoiceFallbackOccurred context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[TTSSchemaTTSVoiceFallbackOccurred contextId](self, "contextId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[TTSSchemaTTSVoiceFallbackOccurred contextId](self, "contextId");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[TTSSchemaTTSVoiceFallbackOccurred contextId](self, "contextId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextId");
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
  unint64_t v3;
  unint64_t v4;

  v3 = -[SISchemaVoiceSettings hash](self->_voiceSettings, "hash");
  v4 = -[TTSSchemaTTSVoiceContext hash](self->_context, "hash") ^ v3;
  return v4 ^ -[SISchemaUUID hash](self->_contextId, "hash");
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
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_context)
  {
    -[TTSSchemaTTSVoiceFallbackOccurred context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("context"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("context"));

    }
  }
  if (self->_contextId)
  {
    -[TTSSchemaTTSVoiceFallbackOccurred contextId](self, "contextId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("contextId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("contextId"));

    }
  }
  if (self->_voiceSettings)
  {
    -[TTSSchemaTTSVoiceFallbackOccurred voiceSettings](self, "voiceSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("voiceSettings"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("voiceSettings"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTSSchemaTTSVoiceFallbackOccurred dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (TTSSchemaTTSVoiceFallbackOccurred)initWithJSON:(id)a3
{
  void *v4;
  TTSSchemaTTSVoiceFallbackOccurred *v5;
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
    self = -[TTSSchemaTTSVoiceFallbackOccurred initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTSSchemaTTSVoiceFallbackOccurred)initWithDictionary:(id)a3
{
  id v4;
  TTSSchemaTTSVoiceFallbackOccurred *v5;
  void *v6;
  SISchemaVoiceSettings *v7;
  void *v8;
  TTSSchemaTTSVoiceContext *v9;
  void *v10;
  SISchemaUUID *v11;
  TTSSchemaTTSVoiceFallbackOccurred *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TTSSchemaTTSVoiceFallbackOccurred;
  v5 = -[TTSSchemaTTSVoiceFallbackOccurred init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceSettings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaVoiceSettings initWithDictionary:]([SISchemaVoiceSettings alloc], "initWithDictionary:", v6);
      -[TTSSchemaTTSVoiceFallbackOccurred setVoiceSettings:](v5, "setVoiceSettings:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("context"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[TTSSchemaTTSVoiceContext initWithDictionary:]([TTSSchemaTTSVoiceContext alloc], "initWithDictionary:", v8);
      -[TTSSchemaTTSVoiceFallbackOccurred setContext:](v5, "setContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[TTSSchemaTTSVoiceFallbackOccurred setContextId:](v5, "setContextId:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (SISchemaVoiceSettings)voiceSettings
{
  return self->_voiceSettings;
}

- (void)setVoiceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_voiceSettings, a3);
}

- (TTSSchemaTTSVoiceContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (void)setContextId:(id)a3
{
  objc_storeStrong((id *)&self->_contextId, a3);
}

- (void)setHasVoiceSettings:(BOOL)a3
{
  self->_hasVoiceSettings = a3;
}

- (void)setHasContext:(BOOL)a3
{
  self->_hasContext = a3;
}

- (void)setHasContextId:(BOOL)a3
{
  self->_hasContextId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextId, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_voiceSettings, 0);
}

@end
