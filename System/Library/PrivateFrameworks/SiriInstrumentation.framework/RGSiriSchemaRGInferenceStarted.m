@implementation RGSiriSchemaRGInferenceStarted

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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RGSiriSchemaRGInferenceStarted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RGSiriSchemaRGInferenceStarted modelVersion](self, "modelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[RGSiriSchemaRGInferenceStarted deleteModelVersion](self, "deleteModelVersion");
  -[RGSiriSchemaRGInferenceStarted promptVersion](self, "promptVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[RGSiriSchemaRGInferenceStarted deletePromptVersion](self, "deletePromptVersion");

  return v5;
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteModelVersion
{
  -[RGSiriSchemaRGInferenceStarted setModelVersion:](self, "setModelVersion:", 0);
}

- (BOOL)hasPromptVersion
{
  return self->_promptVersion != 0;
}

- (void)deletePromptVersion
{
  -[RGSiriSchemaRGInferenceStarted setPromptVersion:](self, "setPromptVersion:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return RGSiriSchemaRGInferenceStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[RGSiriSchemaRGInferenceStarted modelVersion](self, "modelVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RGSiriSchemaRGInferenceStarted modelVersion](self, "modelVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RGSiriSchemaRGInferenceStarted promptVersion](self, "promptVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RGSiriSchemaRGInferenceStarted promptVersion](self, "promptVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[RGSiriSchemaRGInferenceStarted modelVersion](self, "modelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[RGSiriSchemaRGInferenceStarted modelVersion](self, "modelVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[RGSiriSchemaRGInferenceStarted modelVersion](self, "modelVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[RGSiriSchemaRGInferenceStarted promptVersion](self, "promptVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "promptVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[RGSiriSchemaRGInferenceStarted promptVersion](self, "promptVersion");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[RGSiriSchemaRGInferenceStarted promptVersion](self, "promptVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "promptVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SISchemaVersion hash](self->_modelVersion, "hash");
  return -[SISchemaVersion hash](self->_promptVersion, "hash") ^ v3;
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
  if (self->_modelVersion)
  {
    -[RGSiriSchemaRGInferenceStarted modelVersion](self, "modelVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("modelVersion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("modelVersion"));

    }
  }
  if (self->_promptVersion)
  {
    -[RGSiriSchemaRGInferenceStarted promptVersion](self, "promptVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("promptVersion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("promptVersion"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RGSiriSchemaRGInferenceStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RGSiriSchemaRGInferenceStarted)initWithJSON:(id)a3
{
  void *v4;
  RGSiriSchemaRGInferenceStarted *v5;
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
    self = -[RGSiriSchemaRGInferenceStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RGSiriSchemaRGInferenceStarted)initWithDictionary:(id)a3
{
  id v4;
  RGSiriSchemaRGInferenceStarted *v5;
  void *v6;
  SISchemaVersion *v7;
  void *v8;
  SISchemaVersion *v9;
  RGSiriSchemaRGInferenceStarted *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RGSiriSchemaRGInferenceStarted;
  v5 = -[RGSiriSchemaRGInferenceStarted init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaVersion initWithDictionary:]([SISchemaVersion alloc], "initWithDictionary:", v6);
      -[RGSiriSchemaRGInferenceStarted setModelVersion:](v5, "setModelVersion:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("promptVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaVersion initWithDictionary:]([SISchemaVersion alloc], "initWithDictionary:", v8);
      -[RGSiriSchemaRGInferenceStarted setPromptVersion:](v5, "setPromptVersion:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (SISchemaVersion)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_modelVersion, a3);
}

- (SISchemaVersion)promptVersion
{
  return self->_promptVersion;
}

- (void)setPromptVersion:(id)a3
{
  objc_storeStrong((id *)&self->_promptVersion, a3);
}

- (void)setHasModelVersion:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (void)setHasPromptVersion:(BOOL)a3
{
  self->_hasPromptVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

@end
