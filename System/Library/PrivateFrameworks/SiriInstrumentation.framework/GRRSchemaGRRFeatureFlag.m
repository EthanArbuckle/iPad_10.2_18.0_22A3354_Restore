@implementation GRRSchemaGRRFeatureFlag

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasFeatureFlagKey
{
  return self->_featureFlagKey != 0;
}

- (void)deleteFeatureFlagKey
{
  -[GRRSchemaGRRFeatureFlag setFeatureFlagKey:](self, "setFeatureFlagKey:", 0);
}

- (void)setIsEnabled:(BOOL)a3
{
  *(&self->_isEnabled + 1) |= 1u;
  self->_isEnabled = a3;
}

- (BOOL)hasIsEnabled
{
  return *(&self->_isEnabled + 1);
}

- (void)setHasIsEnabled:(BOOL)a3
{
  *(&self->_isEnabled + 1) = *(&self->_isEnabled + 1) & 0xFE | a3;
}

- (void)deleteIsEnabled
{
  -[GRRSchemaGRRFeatureFlag setIsEnabled:](self, "setIsEnabled:", 0);
  *(&self->_isEnabled + 1) &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRFeatureFlagReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GRRSchemaGRRFeatureFlag featureFlagKey](self, "featureFlagKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (*(&self->_isEnabled + 1))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int isEnabled;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[GRRSchemaGRRFeatureFlag featureFlagKey](self, "featureFlagKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureFlagKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[GRRSchemaGRRFeatureFlag featureFlagKey](self, "featureFlagKey");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[GRRSchemaGRRFeatureFlag featureFlagKey](self, "featureFlagKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureFlagKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if (*(&self->_isEnabled + 1) != (v4[17] & 1))
    goto LABEL_12;
  if (*(&self->_isEnabled + 1))
  {
    isEnabled = self->_isEnabled;
    if (isEnabled != objc_msgSend(v4, "isEnabled"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_featureFlagKey, "hash");
  if (*(&self->_isEnabled + 1))
    v4 = 2654435761 * self->_isEnabled;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_featureFlagKey)
  {
    -[GRRSchemaGRRFeatureFlag featureFlagKey](self, "featureFlagKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("featureFlagKey"));

  }
  if (*(&self->_isEnabled + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GRRSchemaGRRFeatureFlag isEnabled](self, "isEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isEnabled"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[GRRSchemaGRRFeatureFlag dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (GRRSchemaGRRFeatureFlag)initWithJSON:(id)a3
{
  void *v4;
  GRRSchemaGRRFeatureFlag *v5;
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
    self = -[GRRSchemaGRRFeatureFlag initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (GRRSchemaGRRFeatureFlag)initWithDictionary:(id)a3
{
  id v4;
  GRRSchemaGRRFeatureFlag *v5;
  void *v6;
  void *v7;
  void *v8;
  GRRSchemaGRRFeatureFlag *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GRRSchemaGRRFeatureFlag;
  v5 = -[GRRSchemaGRRFeatureFlag init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("featureFlagKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[GRRSchemaGRRFeatureFlag setFeatureFlagKey:](v5, "setFeatureFlagKey:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[GRRSchemaGRRFeatureFlag setIsEnabled:](v5, "setIsEnabled:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (NSString)featureFlagKey
{
  return self->_featureFlagKey;
}

- (void)setFeatureFlagKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setHasFeatureFlagKey:(BOOL)a3
{
  *(&self->_isEnabled + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlagKey, 0);
}

@end
