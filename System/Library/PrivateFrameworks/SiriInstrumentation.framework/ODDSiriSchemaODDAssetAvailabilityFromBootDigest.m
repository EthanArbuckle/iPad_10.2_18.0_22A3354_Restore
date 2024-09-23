@implementation ODDSiriSchemaODDAssetAvailabilityFromBootDigest

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
  v13.super_class = (Class)ODDSiriSchemaODDAssetAvailabilityFromBootDigest;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest dimensions](self, "dimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest deleteDimensions](self, "deleteDimensions");
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest tuples](self, "tuples");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest deleteTuples](self, "deleteTuples");

  return v5;
}

- (BOOL)hasDimensions
{
  return self->_dimensions != 0;
}

- (void)deleteDimensions
{
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest setDimensions:](self, "setDimensions:", 0);
}

- (BOOL)hasTuples
{
  return self->_tuples != 0;
}

- (void)deleteTuples
{
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest setTuples:](self, "setTuples:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssetAvailabilityFromBootDigestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest dimensions](self, "dimensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest dimensions](self, "dimensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest tuples](self, "tuples");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest tuples](self, "tuples");
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
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest dimensions](self, "dimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest dimensions](self, "dimensions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest dimensions](self, "dimensions");
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
  -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest tuples](self, "tuples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tuples");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest tuples](self, "tuples");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest tuples](self, "tuples");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tuples");
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

  v3 = -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions hash](self->_dimensions, "hash");
  return -[ODDSiriSchemaODDAssetAvailabilityFromBootTuples hash](self->_tuples, "hash") ^ v3;
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
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest dimensions](self, "dimensions");
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
  if (self->_tuples)
  {
    -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest tuples](self, "tuples");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("tuples"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("tuples"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDAssetAvailabilityFromBootDigest)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigest *v5;
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
    self = -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAssetAvailabilityFromBootDigest)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigest *v5;
  void *v6;
  ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *v7;
  void *v8;
  ODDSiriSchemaODDAssetAvailabilityFromBootTuples *v9;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigest *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDAssetAvailabilityFromBootDigest;
  v5 = -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dimensions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions initWithDictionary:]([ODDSiriSchemaODDAssetAvailabilityFromBootDimensions alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest setDimensions:](v5, "setDimensions:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tuples"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ODDSiriSchemaODDAssetAvailabilityFromBootTuples initWithDictionary:]([ODDSiriSchemaODDAssetAvailabilityFromBootTuples alloc], "initWithDictionary:", v8);
      -[ODDSiriSchemaODDAssetAvailabilityFromBootDigest setTuples:](v5, "setTuples:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (ODDSiriSchemaODDAssetAvailabilityFromBootDimensions)dimensions
{
  return self->_dimensions;
}

- (void)setDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_dimensions, a3);
}

- (ODDSiriSchemaODDAssetAvailabilityFromBootTuples)tuples
{
  return self->_tuples;
}

- (void)setTuples:(id)a3
{
  objc_storeStrong((id *)&self->_tuples, a3);
}

- (void)setHasDimensions:(BOOL)a3
{
  self->_hasDimensions = a3;
}

- (void)setHasTuples:(BOOL)a3
{
  self->_hasTuples = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuples, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end
