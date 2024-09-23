@implementation NLXSchemaCDMInternalSpanData

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
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NLXSchemaCDMInternalSpanData;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaCDMInternalSpanData siriVocabularySpanData](self, "siriVocabularySpanData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaCDMInternalSpanData deleteSiriVocabularySpanData](self, "deleteSiriVocabularySpanData");
  -[NLXSchemaCDMInternalSpanData plumSpanData](self, "plumSpanData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLXSchemaCDMInternalSpanData deletePlumSpanData](self, "deletePlumSpanData");
  -[NLXSchemaCDMInternalSpanData mentionDetectorSpanData](self, "mentionDetectorSpanData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[NLXSchemaCDMInternalSpanData deleteMentionDetectorSpanData](self, "deleteMentionDetectorSpanData");
  -[NLXSchemaCDMInternalSpanData mentionResolverSpanData](self, "mentionResolverSpanData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[NLXSchemaCDMInternalSpanData deleteMentionResolverSpanData](self, "deleteMentionResolverSpanData");
  -[NLXSchemaCDMInternalSpanData contextualSpanData](self, "contextualSpanData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[NLXSchemaCDMInternalSpanData deleteContextualSpanData](self, "deleteContextualSpanData");

  return v5;
}

- (BOOL)hasSiriVocabularySpanData
{
  return self->_siriVocabularySpanData != 0;
}

- (void)deleteSiriVocabularySpanData
{
  -[NLXSchemaCDMInternalSpanData setSiriVocabularySpanData:](self, "setSiriVocabularySpanData:", 0);
}

- (BOOL)hasPlumSpanData
{
  return self->_plumSpanData != 0;
}

- (void)deletePlumSpanData
{
  -[NLXSchemaCDMInternalSpanData setPlumSpanData:](self, "setPlumSpanData:", 0);
}

- (BOOL)hasMentionDetectorSpanData
{
  return self->_mentionDetectorSpanData != 0;
}

- (void)deleteMentionDetectorSpanData
{
  -[NLXSchemaCDMInternalSpanData setMentionDetectorSpanData:](self, "setMentionDetectorSpanData:", 0);
}

- (BOOL)hasMentionResolverSpanData
{
  return self->_mentionResolverSpanData != 0;
}

- (void)deleteMentionResolverSpanData
{
  -[NLXSchemaCDMInternalSpanData setMentionResolverSpanData:](self, "setMentionResolverSpanData:", 0);
}

- (BOOL)hasContextualSpanData
{
  return self->_contextualSpanData != 0;
}

- (void)deleteContextualSpanData
{
  -[NLXSchemaCDMInternalSpanData setContextualSpanData:](self, "setContextualSpanData:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMInternalSpanDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[NLXSchemaCDMInternalSpanData siriVocabularySpanData](self, "siriVocabularySpanData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLXSchemaCDMInternalSpanData siriVocabularySpanData](self, "siriVocabularySpanData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMInternalSpanData plumSpanData](self, "plumSpanData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NLXSchemaCDMInternalSpanData plumSpanData](self, "plumSpanData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMInternalSpanData mentionDetectorSpanData](self, "mentionDetectorSpanData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NLXSchemaCDMInternalSpanData mentionDetectorSpanData](self, "mentionDetectorSpanData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMInternalSpanData mentionResolverSpanData](self, "mentionResolverSpanData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NLXSchemaCDMInternalSpanData mentionResolverSpanData](self, "mentionResolverSpanData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMInternalSpanData contextualSpanData](self, "contextualSpanData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NLXSchemaCDMInternalSpanData contextualSpanData](self, "contextualSpanData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[NLXSchemaCDMInternalSpanData siriVocabularySpanData](self, "siriVocabularySpanData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriVocabularySpanData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[NLXSchemaCDMInternalSpanData siriVocabularySpanData](self, "siriVocabularySpanData");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLXSchemaCDMInternalSpanData siriVocabularySpanData](self, "siriVocabularySpanData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriVocabularySpanData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[NLXSchemaCDMInternalSpanData plumSpanData](self, "plumSpanData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plumSpanData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[NLXSchemaCDMInternalSpanData plumSpanData](self, "plumSpanData");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NLXSchemaCDMInternalSpanData plumSpanData](self, "plumSpanData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plumSpanData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[NLXSchemaCDMInternalSpanData mentionDetectorSpanData](self, "mentionDetectorSpanData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mentionDetectorSpanData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[NLXSchemaCDMInternalSpanData mentionDetectorSpanData](self, "mentionDetectorSpanData");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[NLXSchemaCDMInternalSpanData mentionDetectorSpanData](self, "mentionDetectorSpanData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mentionDetectorSpanData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[NLXSchemaCDMInternalSpanData mentionResolverSpanData](self, "mentionResolverSpanData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mentionResolverSpanData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[NLXSchemaCDMInternalSpanData mentionResolverSpanData](self, "mentionResolverSpanData");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[NLXSchemaCDMInternalSpanData mentionResolverSpanData](self, "mentionResolverSpanData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mentionResolverSpanData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[NLXSchemaCDMInternalSpanData contextualSpanData](self, "contextualSpanData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextualSpanData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[NLXSchemaCDMInternalSpanData contextualSpanData](self, "contextualSpanData");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[NLXSchemaCDMInternalSpanData contextualSpanData](self, "contextualSpanData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextualSpanData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NLXSchemaCDMSiriVocabularySpanData hash](self->_siriVocabularySpanData, "hash");
  v4 = -[NLXSchemaPLUMSpanData hash](self->_plumSpanData, "hash") ^ v3;
  v5 = -[NLXSchemaMentionDetectorSpanData hash](self->_mentionDetectorSpanData, "hash");
  v6 = v4 ^ v5 ^ -[NLXSchemaMentionResolverSpanData hash](self->_mentionResolverSpanData, "hash");
  return v6 ^ -[NLXSchemaContextualSpanData hash](self->_contextualSpanData, "hash");
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contextualSpanData)
  {
    -[NLXSchemaCDMInternalSpanData contextualSpanData](self, "contextualSpanData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contextualSpanData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("contextualSpanData"));

    }
  }
  if (self->_mentionDetectorSpanData)
  {
    -[NLXSchemaCDMInternalSpanData mentionDetectorSpanData](self, "mentionDetectorSpanData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mentionDetectorSpanData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mentionDetectorSpanData"));

    }
  }
  if (self->_mentionResolverSpanData)
  {
    -[NLXSchemaCDMInternalSpanData mentionResolverSpanData](self, "mentionResolverSpanData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("mentionResolverSpanData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("mentionResolverSpanData"));

    }
  }
  if (self->_plumSpanData)
  {
    -[NLXSchemaCDMInternalSpanData plumSpanData](self, "plumSpanData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("plumSpanData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("plumSpanData"));

    }
  }
  if (self->_siriVocabularySpanData)
  {
    -[NLXSchemaCDMInternalSpanData siriVocabularySpanData](self, "siriVocabularySpanData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("siriVocabularySpanData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("siriVocabularySpanData"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMInternalSpanData dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMInternalSpanData)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMInternalSpanData *v5;
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
    self = -[NLXSchemaCDMInternalSpanData initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMInternalSpanData)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMInternalSpanData *v5;
  void *v6;
  NLXSchemaCDMSiriVocabularySpanData *v7;
  void *v8;
  NLXSchemaPLUMSpanData *v9;
  void *v10;
  NLXSchemaMentionDetectorSpanData *v11;
  void *v12;
  NLXSchemaMentionResolverSpanData *v13;
  void *v14;
  NLXSchemaContextualSpanData *v15;
  NLXSchemaCDMInternalSpanData *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NLXSchemaCDMInternalSpanData;
  v5 = -[NLXSchemaCDMInternalSpanData init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriVocabularySpanData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NLXSchemaCDMSiriVocabularySpanData initWithDictionary:]([NLXSchemaCDMSiriVocabularySpanData alloc], "initWithDictionary:", v6);
      -[NLXSchemaCDMInternalSpanData setSiriVocabularySpanData:](v5, "setSiriVocabularySpanData:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plumSpanData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[NLXSchemaPLUMSpanData initWithDictionary:]([NLXSchemaPLUMSpanData alloc], "initWithDictionary:", v8);
      -[NLXSchemaCDMInternalSpanData setPlumSpanData:](v5, "setPlumSpanData:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mentionDetectorSpanData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[NLXSchemaMentionDetectorSpanData initWithDictionary:]([NLXSchemaMentionDetectorSpanData alloc], "initWithDictionary:", v10);
      -[NLXSchemaCDMInternalSpanData setMentionDetectorSpanData:](v5, "setMentionDetectorSpanData:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mentionResolverSpanData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[NLXSchemaMentionResolverSpanData initWithDictionary:]([NLXSchemaMentionResolverSpanData alloc], "initWithDictionary:", v12);
      -[NLXSchemaCDMInternalSpanData setMentionResolverSpanData:](v5, "setMentionResolverSpanData:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextualSpanData"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[NLXSchemaContextualSpanData initWithDictionary:]([NLXSchemaContextualSpanData alloc], "initWithDictionary:", v14);
      -[NLXSchemaCDMInternalSpanData setContextualSpanData:](v5, "setContextualSpanData:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (NLXSchemaCDMSiriVocabularySpanData)siriVocabularySpanData
{
  return self->_siriVocabularySpanData;
}

- (void)setSiriVocabularySpanData:(id)a3
{
  objc_storeStrong((id *)&self->_siriVocabularySpanData, a3);
}

- (NLXSchemaPLUMSpanData)plumSpanData
{
  return self->_plumSpanData;
}

- (void)setPlumSpanData:(id)a3
{
  objc_storeStrong((id *)&self->_plumSpanData, a3);
}

- (NLXSchemaMentionDetectorSpanData)mentionDetectorSpanData
{
  return self->_mentionDetectorSpanData;
}

- (void)setMentionDetectorSpanData:(id)a3
{
  objc_storeStrong((id *)&self->_mentionDetectorSpanData, a3);
}

- (NLXSchemaMentionResolverSpanData)mentionResolverSpanData
{
  return self->_mentionResolverSpanData;
}

- (void)setMentionResolverSpanData:(id)a3
{
  objc_storeStrong((id *)&self->_mentionResolverSpanData, a3);
}

- (NLXSchemaContextualSpanData)contextualSpanData
{
  return self->_contextualSpanData;
}

- (void)setContextualSpanData:(id)a3
{
  objc_storeStrong((id *)&self->_contextualSpanData, a3);
}

- (void)setHasSiriVocabularySpanData:(BOOL)a3
{
  self->_hasSiriVocabularySpanData = a3;
}

- (void)setHasPlumSpanData:(BOOL)a3
{
  self->_hasPlumSpanData = a3;
}

- (void)setHasMentionDetectorSpanData:(BOOL)a3
{
  self->_hasMentionDetectorSpanData = a3;
}

- (void)setHasMentionResolverSpanData:(BOOL)a3
{
  self->_hasMentionResolverSpanData = a3;
}

- (void)setHasContextualSpanData:(BOOL)a3
{
  self->_hasContextualSpanData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualSpanData, 0);
  objc_storeStrong((id *)&self->_mentionResolverSpanData, 0);
  objc_storeStrong((id *)&self->_mentionDetectorSpanData, 0);
  objc_storeStrong((id *)&self->_plumSpanData, 0);
  objc_storeStrong((id *)&self->_siriVocabularySpanData, 0);
}

@end
