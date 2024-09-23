@implementation SADSchemaSADTrialRollout

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasRolloutId
{
  return self->_rolloutId != 0;
}

- (void)deleteRolloutId
{
  -[SADSchemaSADTrialRollout setRolloutId:](self, "setRolloutId:", 0);
}

- (void)setDeployment:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deployment = a3;
}

- (BOOL)hasDeployment
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeployment:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDeployment
{
  -[SADSchemaSADTrialRollout setDeployment:](self, "setDeployment:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasFactorPack
{
  return self->_factorPack != 0;
}

- (void)deleteFactorPack
{
  -[SADSchemaSADTrialRollout setFactorPack:](self, "setFactorPack:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SADSchemaSADTrialRolloutReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SADSchemaSADTrialRollout rolloutId](self, "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[SADSchemaSADTrialRollout factorPack](self, "factorPack");
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
  unsigned int deployment;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[SADSchemaSADTrialRollout rolloutId](self, "rolloutId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rolloutId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[SADSchemaSADTrialRollout rolloutId](self, "rolloutId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SADSchemaSADTrialRollout rolloutId](self, "rolloutId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rolloutId");
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
    deployment = self->_deployment;
    if (deployment != objc_msgSend(v4, "deployment"))
      goto LABEL_15;
  }
  -[SADSchemaSADTrialRollout factorPack](self, "factorPack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "factorPack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SADSchemaSADTrialRollout factorPack](self, "factorPack");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[SADSchemaSADTrialRollout factorPack](self, "factorPack");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "factorPack");
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

  v3 = -[NSString hash](self->_rolloutId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_deployment;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_factorPack, "hash");
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SADSchemaSADTrialRollout deployment](self, "deployment"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("deployment"));

  }
  if (self->_factorPack)
  {
    -[SADSchemaSADTrialRollout factorPack](self, "factorPack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("factorPack"));

  }
  if (self->_rolloutId)
  {
    -[SADSchemaSADTrialRollout rolloutId](self, "rolloutId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("rolloutId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SADSchemaSADTrialRollout dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SADSchemaSADTrialRollout)initWithJSON:(id)a3
{
  void *v4;
  SADSchemaSADTrialRollout *v5;
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
    self = -[SADSchemaSADTrialRollout initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SADSchemaSADTrialRollout)initWithDictionary:(id)a3
{
  id v4;
  SADSchemaSADTrialRollout *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SADSchemaSADTrialRollout *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SADSchemaSADTrialRollout;
  v5 = -[SADSchemaSADTrialRollout init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rolloutId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SADSchemaSADTrialRollout setRolloutId:](v5, "setRolloutId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deployment"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SADSchemaSADTrialRollout setDeployment:](v5, "setDeployment:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("factorPack"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[SADSchemaSADTrialRollout setFactorPack:](v5, "setFactorPack:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (void)setRolloutId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)deployment
{
  return self->_deployment;
}

- (NSString)factorPack
{
  return self->_factorPack;
}

- (void)setFactorPack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasRolloutId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasFactorPack:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPack, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
}

@end
