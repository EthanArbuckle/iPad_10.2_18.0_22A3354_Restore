@implementation FLOWSchemaFLOWVoiceShortcutAction

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (void)deleteAppId
{
  -[FLOWSchemaFLOWVoiceShortcutAction setAppId:](self, "setAppId:", 0);
}

- (BOOL)hasIntentCategory
{
  return self->_intentCategory != 0;
}

- (void)deleteIntentCategory
{
  -[FLOWSchemaFLOWVoiceShortcutAction setIntentCategory:](self, "setIntentCategory:", 0);
}

- (BOOL)hasIntentName
{
  return self->_intentName != 0;
}

- (void)deleteIntentName
{
  -[FLOWSchemaFLOWVoiceShortcutAction setIntentName:](self, "setIntentName:", 0);
}

- (BOOL)hasIntentNLDomain
{
  return self->_intentNLDomain != 0;
}

- (void)deleteIntentNLDomain
{
  -[FLOWSchemaFLOWVoiceShortcutAction setIntentNLDomain:](self, "setIntentNLDomain:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWVoiceShortcutActionReadFrom(self, (uint64_t)a3);
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
  -[FLOWSchemaFLOWVoiceShortcutAction appId](self, "appId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[FLOWSchemaFLOWVoiceShortcutAction intentCategory](self, "intentCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[FLOWSchemaFLOWVoiceShortcutAction intentName](self, "intentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[FLOWSchemaFLOWVoiceShortcutAction intentNLDomain](self, "intentNLDomain");
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
  -[FLOWSchemaFLOWVoiceShortcutAction appId](self, "appId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[FLOWSchemaFLOWVoiceShortcutAction appId](self, "appId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWVoiceShortcutAction appId](self, "appId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[FLOWSchemaFLOWVoiceShortcutAction intentCategory](self, "intentCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[FLOWSchemaFLOWVoiceShortcutAction intentCategory](self, "intentCategory");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLOWSchemaFLOWVoiceShortcutAction intentCategory](self, "intentCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentCategory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[FLOWSchemaFLOWVoiceShortcutAction intentName](self, "intentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[FLOWSchemaFLOWVoiceShortcutAction intentName](self, "intentName");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[FLOWSchemaFLOWVoiceShortcutAction intentName](self, "intentName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[FLOWSchemaFLOWVoiceShortcutAction intentNLDomain](self, "intentNLDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentNLDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[FLOWSchemaFLOWVoiceShortcutAction intentNLDomain](self, "intentNLDomain");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[FLOWSchemaFLOWVoiceShortcutAction intentNLDomain](self, "intentNLDomain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentNLDomain");
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

  v3 = -[NSString hash](self->_appId, "hash");
  v4 = -[NSString hash](self->_intentCategory, "hash") ^ v3;
  v5 = -[NSString hash](self->_intentName, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_intentNLDomain, "hash");
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
  if (self->_appId)
  {
    -[FLOWSchemaFLOWVoiceShortcutAction appId](self, "appId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appId"));

  }
  if (self->_intentCategory)
  {
    -[FLOWSchemaFLOWVoiceShortcutAction intentCategory](self, "intentCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentCategory"));

  }
  if (self->_intentNLDomain)
  {
    -[FLOWSchemaFLOWVoiceShortcutAction intentNLDomain](self, "intentNLDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intentNLDomain"));

  }
  if (self->_intentName)
  {
    -[FLOWSchemaFLOWVoiceShortcutAction intentName](self, "intentName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("intentName"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWVoiceShortcutAction dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWVoiceShortcutAction)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWVoiceShortcutAction *v5;
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
    self = -[FLOWSchemaFLOWVoiceShortcutAction initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWVoiceShortcutAction)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWVoiceShortcutAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FLOWSchemaFLOWVoiceShortcutAction *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FLOWSchemaFLOWVoiceShortcutAction;
  v5 = -[FLOWSchemaFLOWVoiceShortcutAction init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[FLOWSchemaFLOWVoiceShortcutAction setAppId:](v5, "setAppId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentCategory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[FLOWSchemaFLOWVoiceShortcutAction setIntentCategory:](v5, "setIntentCategory:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[FLOWSchemaFLOWVoiceShortcutAction setIntentName:](v5, "setIntentName:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentNLDomain"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[FLOWSchemaFLOWVoiceShortcutAction setIntentNLDomain:](v5, "setIntentNLDomain:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)intentCategory
{
  return self->_intentCategory;
}

- (void)setIntentCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)intentName
{
  return self->_intentName;
}

- (void)setIntentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)intentNLDomain
{
  return self->_intentNLDomain;
}

- (void)setIntentNLDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasAppId:(BOOL)a3
{
  self->_hasAppId = a3;
}

- (void)setHasIntentCategory:(BOOL)a3
{
  self->_hasIntentCategory = a3;
}

- (void)setHasIntentName:(BOOL)a3
{
  self->_hasIntentName = a3;
}

- (void)setHasIntentNLDomain:(BOOL)a3
{
  self->_hasIntentNLDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentNLDomain, 0);
  objc_storeStrong((id *)&self->_intentName, 0);
  objc_storeStrong((id *)&self->_intentCategory, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end
