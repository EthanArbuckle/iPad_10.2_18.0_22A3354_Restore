@implementation ODDSiriSchemaODDtvOSDevicePropertiesReported

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
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ODDSiriSchemaODDtvOSDevicePropertiesReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported general](self, "general");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported deleteGeneral](self, "deleteGeneral");
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported assistant](self, "assistant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported deleteAssistant](self, "deleteAssistant");
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported dictation](self, "dictation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported deleteDictation](self, "deleteDictation");
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported tvOSAssistant](self, "tvOSAssistant");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported deleteTvOSAssistant](self, "deleteTvOSAssistant");

  return v5;
}

- (BOOL)hasGeneral
{
  return self->_general != 0;
}

- (void)deleteGeneral
{
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported setGeneral:](self, "setGeneral:", 0);
}

- (BOOL)hasAssistant
{
  return self->_assistant != 0;
}

- (void)deleteAssistant
{
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported setAssistant:](self, "setAssistant:", 0);
}

- (BOOL)hasDictation
{
  return self->_dictation != 0;
}

- (void)deleteDictation
{
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported setDictation:](self, "setDictation:", 0);
}

- (BOOL)hasTvOSAssistant
{
  return self->_tvOSAssistant != 0;
}

- (void)deleteTvOSAssistant
{
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported setTvOSAssistant:](self, "setTvOSAssistant:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDtvOSDevicePropertiesReportedReadFrom(self, (uint64_t)a3);
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
  id v12;

  v12 = a3;
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported general](self, "general");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported general](self, "general");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported assistant](self, "assistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported assistant](self, "assistant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported dictation](self, "dictation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported dictation](self, "dictation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported tvOSAssistant](self, "tvOSAssistant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported tvOSAssistant](self, "tvOSAssistant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported general](self, "general");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "general");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported general](self, "general");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported general](self, "general");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "general");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported assistant](self, "assistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported assistant](self, "assistant");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported assistant](self, "assistant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported dictation](self, "dictation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported dictation](self, "dictation");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported dictation](self, "dictation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDtvOSDevicePropertiesReported tvOSAssistant](self, "tvOSAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tvOSAssistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported tvOSAssistant](self, "tvOSAssistant");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported tvOSAssistant](self, "tvOSAssistant");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvOSAssistant");
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[ODDSiriSchemaODDGeneralProperties hash](self->_general, "hash");
  v4 = -[ODDSiriSchemaODDAssistantProperties hash](self->_assistant, "hash") ^ v3;
  v5 = -[ODDSiriSchemaODDDictationProperties hash](self->_dictation, "hash");
  return v4 ^ v5 ^ -[ODDSiriSchemaODDtvOSAssistantProperties hash](self->_tvOSAssistant, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_assistant)
  {
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported assistant](self, "assistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assistant"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("assistant"));

    }
  }
  if (self->_dictation)
  {
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported dictation](self, "dictation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("dictation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dictation"));

    }
  }
  if (self->_general)
  {
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported general](self, "general");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("general"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("general"));

    }
  }
  if (self->_tvOSAssistant)
  {
    -[ODDSiriSchemaODDtvOSDevicePropertiesReported tvOSAssistant](self, "tvOSAssistant");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("tvOSAssistant"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("tvOSAssistant"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDtvOSDevicePropertiesReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDtvOSDevicePropertiesReported)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *v5;
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
    self = -[ODDSiriSchemaODDtvOSDevicePropertiesReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDtvOSDevicePropertiesReported)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *v5;
  void *v6;
  ODDSiriSchemaODDGeneralProperties *v7;
  void *v8;
  ODDSiriSchemaODDAssistantProperties *v9;
  void *v10;
  ODDSiriSchemaODDDictationProperties *v11;
  void *v12;
  ODDSiriSchemaODDtvOSAssistantProperties *v13;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODDSiriSchemaODDtvOSDevicePropertiesReported;
  v5 = -[ODDSiriSchemaODDtvOSDevicePropertiesReported init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("general"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDGeneralProperties initWithDictionary:]([ODDSiriSchemaODDGeneralProperties alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDtvOSDevicePropertiesReported setGeneral:](v5, "setGeneral:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistant"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ODDSiriSchemaODDAssistantProperties initWithDictionary:]([ODDSiriSchemaODDAssistantProperties alloc], "initWithDictionary:", v8);
      -[ODDSiriSchemaODDtvOSDevicePropertiesReported setAssistant:](v5, "setAssistant:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ODDSiriSchemaODDDictationProperties initWithDictionary:]([ODDSiriSchemaODDDictationProperties alloc], "initWithDictionary:", v10);
      -[ODDSiriSchemaODDtvOSDevicePropertiesReported setDictation:](v5, "setDictation:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tvOSAssistant"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ODDSiriSchemaODDtvOSAssistantProperties initWithDictionary:]([ODDSiriSchemaODDtvOSAssistantProperties alloc], "initWithDictionary:", v12);
      -[ODDSiriSchemaODDtvOSDevicePropertiesReported setTvOSAssistant:](v5, "setTvOSAssistant:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (ODDSiriSchemaODDGeneralProperties)general
{
  return self->_general;
}

- (void)setGeneral:(id)a3
{
  objc_storeStrong((id *)&self->_general, a3);
}

- (ODDSiriSchemaODDAssistantProperties)assistant
{
  return self->_assistant;
}

- (void)setAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_assistant, a3);
}

- (ODDSiriSchemaODDDictationProperties)dictation
{
  return self->_dictation;
}

- (void)setDictation:(id)a3
{
  objc_storeStrong((id *)&self->_dictation, a3);
}

- (ODDSiriSchemaODDtvOSAssistantProperties)tvOSAssistant
{
  return self->_tvOSAssistant;
}

- (void)setTvOSAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_tvOSAssistant, a3);
}

- (void)setHasGeneral:(BOOL)a3
{
  self->_hasGeneral = a3;
}

- (void)setHasAssistant:(BOOL)a3
{
  self->_hasAssistant = a3;
}

- (void)setHasDictation:(BOOL)a3
{
  self->_hasDictation = a3;
}

- (void)setHasTvOSAssistant:(BOOL)a3
{
  self->_hasTvOSAssistant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvOSAssistant, 0);
  objc_storeStrong((id *)&self->_dictation, 0);
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_general, 0);
}

@end
