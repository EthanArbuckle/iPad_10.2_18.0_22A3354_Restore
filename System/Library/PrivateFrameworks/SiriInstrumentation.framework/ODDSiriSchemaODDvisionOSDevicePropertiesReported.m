@implementation ODDSiriSchemaODDvisionOSDevicePropertiesReported

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
  v16.super_class = (Class)ODDSiriSchemaODDvisionOSDevicePropertiesReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported general](self, "general");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported deleteGeneral](self, "deleteGeneral");
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported assistant](self, "assistant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported deleteAssistant](self, "deleteAssistant");
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported dictation](self, "dictation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported deleteDictation](self, "deleteDictation");

  return v5;
}

- (BOOL)hasGeneral
{
  return self->_general != 0;
}

- (void)deleteGeneral
{
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported setGeneral:](self, "setGeneral:", 0);
}

- (BOOL)hasAssistant
{
  return self->_assistant != 0;
}

- (void)deleteAssistant
{
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported setAssistant:](self, "setAssistant:", 0);
}

- (BOOL)hasDictation
{
  return self->_dictation != 0;
}

- (void)deleteDictation
{
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported setDictation:](self, "setDictation:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDvisionOSDevicePropertiesReportedReadFrom(self, (uint64_t)a3);
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
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported general](self, "general");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported general](self, "general");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported assistant](self, "assistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported assistant](self, "assistant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported dictation](self, "dictation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported dictation](self, "dictation");
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
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported general](self, "general");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "general");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported general](self, "general");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported general](self, "general");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "general");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported assistant](self, "assistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported assistant](self, "assistant");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported assistant](self, "assistant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported dictation](self, "dictation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported dictation](self, "dictation");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported dictation](self, "dictation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictation");
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

  v3 = -[ODDSiriSchemaODDGeneralProperties hash](self->_general, "hash");
  v4 = -[ODDSiriSchemaODDAssistantProperties hash](self->_assistant, "hash") ^ v3;
  return v4 ^ -[ODDSiriSchemaODDDictationProperties hash](self->_dictation, "hash");
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
  if (self->_assistant)
  {
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported assistant](self, "assistant");
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
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported dictation](self, "dictation");
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
    -[ODDSiriSchemaODDvisionOSDevicePropertiesReported general](self, "general");
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
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDvisionOSDevicePropertiesReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDvisionOSDevicePropertiesReported)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *v5;
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
    self = -[ODDSiriSchemaODDvisionOSDevicePropertiesReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDvisionOSDevicePropertiesReported)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *v5;
  void *v6;
  ODDSiriSchemaODDGeneralProperties *v7;
  void *v8;
  ODDSiriSchemaODDAssistantProperties *v9;
  void *v10;
  ODDSiriSchemaODDDictationProperties *v11;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODDSiriSchemaODDvisionOSDevicePropertiesReported;
  v5 = -[ODDSiriSchemaODDvisionOSDevicePropertiesReported init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("general"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDGeneralProperties initWithDictionary:]([ODDSiriSchemaODDGeneralProperties alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDvisionOSDevicePropertiesReported setGeneral:](v5, "setGeneral:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistant"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ODDSiriSchemaODDAssistantProperties initWithDictionary:]([ODDSiriSchemaODDAssistantProperties alloc], "initWithDictionary:", v8);
      -[ODDSiriSchemaODDvisionOSDevicePropertiesReported setAssistant:](v5, "setAssistant:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ODDSiriSchemaODDDictationProperties initWithDictionary:]([ODDSiriSchemaODDDictationProperties alloc], "initWithDictionary:", v10);
      -[ODDSiriSchemaODDvisionOSDevicePropertiesReported setDictation:](v5, "setDictation:", v11);

    }
    v12 = v5;

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictation, 0);
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_general, 0);
}

@end
