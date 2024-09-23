@implementation PEGASUSSchemaPEGASUSVideoExecution

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
  v13.super_class = (Class)PEGASUSSchemaPEGASUSVideoExecution;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSVideoExecution videoInteraction](self, "videoInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PEGASUSSchemaPEGASUSVideoExecution deleteVideoInteraction](self, "deleteVideoInteraction");
  -[PEGASUSSchemaPEGASUSVideoExecution videoExperienceProperty](self, "videoExperienceProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PEGASUSSchemaPEGASUSVideoExecution deleteVideoExperienceProperty](self, "deleteVideoExperienceProperty");

  return v5;
}

- (BOOL)hasVideoInteraction
{
  return self->_videoInteraction != 0;
}

- (void)deleteVideoInteraction
{
  -[PEGASUSSchemaPEGASUSVideoExecution setVideoInteraction:](self, "setVideoInteraction:", 0);
}

- (BOOL)hasVideoExperienceProperty
{
  return self->_videoExperienceProperty != 0;
}

- (void)deleteVideoExperienceProperty
{
  -[PEGASUSSchemaPEGASUSVideoExecution setVideoExperienceProperty:](self, "setVideoExperienceProperty:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSVideoExecutionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PEGASUSSchemaPEGASUSVideoExecution videoInteraction](self, "videoInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PEGASUSSchemaPEGASUSVideoExecution videoInteraction](self, "videoInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSVideoExecution videoExperienceProperty](self, "videoExperienceProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PEGASUSSchemaPEGASUSVideoExecution videoExperienceProperty](self, "videoExperienceProperty");
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
  -[PEGASUSSchemaPEGASUSVideoExecution videoInteraction](self, "videoInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[PEGASUSSchemaPEGASUSVideoExecution videoInteraction](self, "videoInteraction");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSVideoExecution videoInteraction](self, "videoInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSVideoExecution videoExperienceProperty](self, "videoExperienceProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoExperienceProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSVideoExecution videoExperienceProperty](self, "videoExperienceProperty");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSVideoExecution videoExperienceProperty](self, "videoExperienceProperty");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoExperienceProperty");
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

  v3 = -[PEGASUSSchemaPEGASUSVideoInteraction hash](self->_videoInteraction, "hash");
  return -[PEGASUSSchemaPEGASUSVideoExperienceProperty hash](self->_videoExperienceProperty, "hash") ^ v3;
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
  if (self->_videoExperienceProperty)
  {
    -[PEGASUSSchemaPEGASUSVideoExecution videoExperienceProperty](self, "videoExperienceProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("videoExperienceProperty"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("videoExperienceProperty"));

    }
  }
  if (self->_videoInteraction)
  {
    -[PEGASUSSchemaPEGASUSVideoExecution videoInteraction](self, "videoInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("videoInteraction"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("videoInteraction"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSVideoExecution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSVideoExecution)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSVideoExecution *v5;
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
    self = -[PEGASUSSchemaPEGASUSVideoExecution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSVideoExecution)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSVideoExecution *v5;
  void *v6;
  PEGASUSSchemaPEGASUSVideoInteraction *v7;
  void *v8;
  PEGASUSSchemaPEGASUSVideoExperienceProperty *v9;
  PEGASUSSchemaPEGASUSVideoExecution *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PEGASUSSchemaPEGASUSVideoExecution;
  v5 = -[PEGASUSSchemaPEGASUSVideoExecution init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoInteraction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PEGASUSSchemaPEGASUSVideoInteraction initWithDictionary:]([PEGASUSSchemaPEGASUSVideoInteraction alloc], "initWithDictionary:", v6);
      -[PEGASUSSchemaPEGASUSVideoExecution setVideoInteraction:](v5, "setVideoInteraction:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoExperienceProperty"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PEGASUSSchemaPEGASUSVideoExperienceProperty initWithDictionary:]([PEGASUSSchemaPEGASUSVideoExperienceProperty alloc], "initWithDictionary:", v8);
      -[PEGASUSSchemaPEGASUSVideoExecution setVideoExperienceProperty:](v5, "setVideoExperienceProperty:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (PEGASUSSchemaPEGASUSVideoInteraction)videoInteraction
{
  return self->_videoInteraction;
}

- (void)setVideoInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_videoInteraction, a3);
}

- (PEGASUSSchemaPEGASUSVideoExperienceProperty)videoExperienceProperty
{
  return self->_videoExperienceProperty;
}

- (void)setVideoExperienceProperty:(id)a3
{
  objc_storeStrong((id *)&self->_videoExperienceProperty, a3);
}

- (void)setHasVideoInteraction:(BOOL)a3
{
  self->_hasVideoInteraction = a3;
}

- (void)setHasVideoExperienceProperty:(BOOL)a3
{
  self->_hasVideoExperienceProperty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoExperienceProperty, 0);
  objc_storeStrong((id *)&self->_videoInteraction, 0);
}

@end
