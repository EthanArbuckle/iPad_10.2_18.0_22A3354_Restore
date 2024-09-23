@implementation PEGASUSSchemaPEGASUSKGQAQualifierTier1

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
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSKGQAQualifierTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 deletePropId](self, "deletePropId");
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 deleteValue](self, "deleteValue");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 deletePropId](self, "deletePropId");
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 deleteValue](self, "deleteValue");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 deletePropId](self, "deletePropId");
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 deleteValue](self, "deleteValue");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 deletePropId](self, "deletePropId");
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 deleteValue](self, "deleteValue");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 deletePropId](self, "deletePropId");
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 deleteValue](self, "deleteValue");
  }

  return v5;
}

- (BOOL)hasPropId
{
  return self->_propId != 0;
}

- (void)deletePropId
{
  -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 setPropId:](self, "setPropId:", 0);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)deleteValue
{
  -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 setValue:](self, "setValue:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSKGQAQualifierTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 propId](self, "propId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();

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
  -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 propId](self, "propId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 propId](self, "propId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 propId](self, "propId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 value](self, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 value](self, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_propId, "hash");
  return -[NSString hash](self->_value, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_propId)
  {
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 propId](self, "propId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("propId"));

  }
  if (self->_value)
  {
    -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("value"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSKGQAQualifierTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSKGQAQualifierTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSKGQAQualifierTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSKGQAQualifierTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PEGASUSSchemaPEGASUSKGQAQualifierTier1 *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PEGASUSSchemaPEGASUSKGQAQualifierTier1;
  v5 = -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("propId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 setPropId:](v5, "setPropId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 setValue:](v5, "setValue:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSString)propId
{
  return self->_propId;
}

- (void)setPropId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasPropId:(BOOL)a3
{
  self->_hasPropId = a3;
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_propId, 0);
}

@end
