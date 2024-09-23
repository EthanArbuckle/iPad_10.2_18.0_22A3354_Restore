@implementation ODMSiriSchemaODMSiriCounts

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
  v13.super_class = (Class)ODMSiriSchemaODMSiriCounts;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODMSiriSchemaODMSiriCounts dimensions](self, "dimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODMSiriSchemaODMSiriCounts deleteDimensions](self, "deleteDimensions");
  -[ODMSiriSchemaODMSiriCounts taskCounts](self, "taskCounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODMSiriSchemaODMSiriCounts deleteTaskCounts](self, "deleteTaskCounts");

  return v5;
}

- (BOOL)hasDimensions
{
  return self->_dimensions != 0;
}

- (void)deleteDimensions
{
  -[ODMSiriSchemaODMSiriCounts setDimensions:](self, "setDimensions:", 0);
}

- (BOOL)hasTaskCounts
{
  return self->_taskCounts != 0;
}

- (void)deleteTaskCounts
{
  -[ODMSiriSchemaODMSiriCounts setTaskCounts:](self, "setTaskCounts:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriCountsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ODMSiriSchemaODMSiriCounts dimensions](self, "dimensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODMSiriSchemaODMSiriCounts dimensions](self, "dimensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODMSiriSchemaODMSiriCounts taskCounts](self, "taskCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODMSiriSchemaODMSiriCounts taskCounts](self, "taskCounts");
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
  -[ODMSiriSchemaODMSiriCounts dimensions](self, "dimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[ODMSiriSchemaODMSiriCounts dimensions](self, "dimensions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODMSiriSchemaODMSiriCounts dimensions](self, "dimensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[ODMSiriSchemaODMSiriCounts taskCounts](self, "taskCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODMSiriSchemaODMSiriCounts taskCounts](self, "taskCounts");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[ODMSiriSchemaODMSiriCounts taskCounts](self, "taskCounts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskCounts");
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

  v3 = -[ODMSiriSchemaODMDynamicDimensions hash](self->_dimensions, "hash");
  return -[ODMSiriSchemaODMSiriTaskCounts hash](self->_taskCounts, "hash") ^ v3;
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
  if (self->_dimensions)
  {
    -[ODMSiriSchemaODMSiriCounts dimensions](self, "dimensions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dimensions"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("dimensions"));

    }
  }
  if (self->_taskCounts)
  {
    -[ODMSiriSchemaODMSiriCounts taskCounts](self, "taskCounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("taskCounts"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("taskCounts"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODMSiriSchemaODMSiriCounts dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODMSiriSchemaODMSiriCounts)initWithJSON:(id)a3
{
  void *v4;
  ODMSiriSchemaODMSiriCounts *v5;
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
    self = -[ODMSiriSchemaODMSiriCounts initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODMSiriSchemaODMSiriCounts)initWithDictionary:(id)a3
{
  id v4;
  ODMSiriSchemaODMSiriCounts *v5;
  void *v6;
  ODMSiriSchemaODMDynamicDimensions *v7;
  void *v8;
  ODMSiriSchemaODMSiriTaskCounts *v9;
  ODMSiriSchemaODMSiriCounts *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODMSiriSchemaODMSiriCounts;
  v5 = -[ODMSiriSchemaODMSiriCounts init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dimensions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODMSiriSchemaODMDynamicDimensions initWithDictionary:]([ODMSiriSchemaODMDynamicDimensions alloc], "initWithDictionary:", v6);
      -[ODMSiriSchemaODMSiriCounts setDimensions:](v5, "setDimensions:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskCounts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ODMSiriSchemaODMSiriTaskCounts initWithDictionary:]([ODMSiriSchemaODMSiriTaskCounts alloc], "initWithDictionary:", v8);
      -[ODMSiriSchemaODMSiriCounts setTaskCounts:](v5, "setTaskCounts:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (ODMSiriSchemaODMDynamicDimensions)dimensions
{
  return self->_dimensions;
}

- (void)setDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_dimensions, a3);
}

- (ODMSiriSchemaODMSiriTaskCounts)taskCounts
{
  return self->_taskCounts;
}

- (void)setTaskCounts:(id)a3
{
  objc_storeStrong((id *)&self->_taskCounts, a3);
}

- (void)setHasDimensions:(BOOL)a3
{
  self->_hasDimensions = a3;
}

- (void)setHasTaskCounts:(BOOL)a3
{
  self->_hasTaskCounts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskCounts, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end
