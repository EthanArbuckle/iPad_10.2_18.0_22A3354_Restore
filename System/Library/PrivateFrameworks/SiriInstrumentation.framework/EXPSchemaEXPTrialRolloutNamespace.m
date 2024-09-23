@implementation EXPSchemaEXPTrialRolloutNamespace

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)deleteName
{
  -[EXPSchemaEXPTrialRolloutNamespace setName:](self, "setName:", 0);
}

- (void)setCompatibilityVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_compatibilityVersion = a3;
}

- (BOOL)hasCompatibilityVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCompatibilityVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCompatibilityVersion
{
  -[EXPSchemaEXPTrialRolloutNamespace setCompatibilityVersion:](self, "setCompatibilityVersion:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasFactorPackId
{
  return self->_factorPackId != 0;
}

- (void)deleteFactorPackId
{
  -[EXPSchemaEXPTrialRolloutNamespace setFactorPackId:](self, "setFactorPackId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return EXPSchemaEXPTrialRolloutNamespaceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[EXPSchemaEXPTrialRolloutNamespace name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[EXPSchemaEXPTrialRolloutNamespace factorPackId](self, "factorPackId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int compatibilityVersion;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[EXPSchemaEXPTrialRolloutNamespace name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[EXPSchemaEXPTrialRolloutNamespace name](self, "name");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[EXPSchemaEXPTrialRolloutNamespace name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    compatibilityVersion = self->_compatibilityVersion;
    if (compatibilityVersion != objc_msgSend(v4, "compatibilityVersion"))
      goto LABEL_15;
  }
  -[EXPSchemaEXPTrialRolloutNamespace factorPackId](self, "factorPackId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "factorPackId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[EXPSchemaEXPTrialRolloutNamespace factorPackId](self, "factorPackId");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[EXPSchemaEXPTrialRolloutNamespace factorPackId](self, "factorPackId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "factorPackId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_compatibilityVersion;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_factorPackId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[EXPSchemaEXPTrialRolloutNamespace compatibilityVersion](self, "compatibilityVersion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("compatibilityVersion"));

  }
  if (self->_factorPackId)
  {
    -[EXPSchemaEXPTrialRolloutNamespace factorPackId](self, "factorPackId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("factorPackId"));

  }
  if (self->_name)
  {
    -[EXPSchemaEXPTrialRolloutNamespace name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("name"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[EXPSchemaEXPTrialRolloutNamespace dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (EXPSchemaEXPTrialRolloutNamespace)initWithJSON:(id)a3
{
  void *v4;
  EXPSchemaEXPTrialRolloutNamespace *v5;
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
    self = -[EXPSchemaEXPTrialRolloutNamespace initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (EXPSchemaEXPTrialRolloutNamespace)initWithDictionary:(id)a3
{
  id v4;
  EXPSchemaEXPTrialRolloutNamespace *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  EXPSchemaEXPTrialRolloutNamespace *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EXPSchemaEXPTrialRolloutNamespace;
  v5 = -[EXPSchemaEXPTrialRolloutNamespace init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[EXPSchemaEXPTrialRolloutNamespace setName:](v5, "setName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compatibilityVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EXPSchemaEXPTrialRolloutNamespace setCompatibilityVersion:](v5, "setCompatibilityVersion:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("factorPackId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[EXPSchemaEXPTrialRolloutNamespace setFactorPackId:](v5, "setFactorPackId:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (NSString)factorPackId
{
  return self->_factorPackId;
}

- (void)setFactorPackId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasFactorPackId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
