@implementation ODMSiriSchemaODMTrialExperimentIdentifiers

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ODMSiriSchemaODMTrialExperimentIdentifiers;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODMSiriSchemaODMTrialExperimentIdentifiers treatmentId](self, "treatmentId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODMSiriSchemaODMTrialExperimentIdentifiers deleteTreatmentId](self, "deleteTreatmentId");
  return v5;
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (void)deleteExperimentId
{
  -[ODMSiriSchemaODMTrialExperimentIdentifiers setExperimentId:](self, "setExperimentId:", 0);
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (void)deleteTreatmentId
{
  -[ODMSiriSchemaODMTrialExperimentIdentifiers setTreatmentId:](self, "setTreatmentId:", 0);
}

- (void)setDeploymentId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deploymentId = a3;
}

- (BOOL)hasDeploymentId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeploymentId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDeploymentId
{
  -[ODMSiriSchemaODMTrialExperimentIdentifiers setDeploymentId:](self, "setDeploymentId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMTrialExperimentIdentifiersReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ODMSiriSchemaODMTrialExperimentIdentifiers experimentId](self, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[ODMSiriSchemaODMTrialExperimentIdentifiers treatmentId](self, "treatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ODMSiriSchemaODMTrialExperimentIdentifiers treatmentId](self, "treatmentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();

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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int64_t deploymentId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[ODMSiriSchemaODMTrialExperimentIdentifiers experimentId](self, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[ODMSiriSchemaODMTrialExperimentIdentifiers experimentId](self, "experimentId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODMSiriSchemaODMTrialExperimentIdentifiers experimentId](self, "experimentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[ODMSiriSchemaODMTrialExperimentIdentifiers treatmentId](self, "treatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[ODMSiriSchemaODMTrialExperimentIdentifiers treatmentId](self, "treatmentId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODMSiriSchemaODMTrialExperimentIdentifiers treatmentId](self, "treatmentId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "treatmentId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[32] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (deploymentId = self->_deploymentId, deploymentId == objc_msgSend(v4, "deploymentId")))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_experimentId, "hash");
  v4 = -[SISchemaUUID hash](self->_treatmentId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_deploymentId;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ODMSiriSchemaODMTrialExperimentIdentifiers deploymentId](self, "deploymentId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("deploymentId"));

  }
  if (self->_experimentId)
  {
    -[ODMSiriSchemaODMTrialExperimentIdentifiers experimentId](self, "experimentId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("experimentId"));

  }
  if (self->_treatmentId)
  {
    -[ODMSiriSchemaODMTrialExperimentIdentifiers treatmentId](self, "treatmentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("treatmentId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("treatmentId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODMSiriSchemaODMTrialExperimentIdentifiers dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODMSiriSchemaODMTrialExperimentIdentifiers)initWithJSON:(id)a3
{
  void *v4;
  ODMSiriSchemaODMTrialExperimentIdentifiers *v5;
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
    self = -[ODMSiriSchemaODMTrialExperimentIdentifiers initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODMSiriSchemaODMTrialExperimentIdentifiers)initWithDictionary:(id)a3
{
  id v4;
  ODMSiriSchemaODMTrialExperimentIdentifiers *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  ODMSiriSchemaODMTrialExperimentIdentifiers *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODMSiriSchemaODMTrialExperimentIdentifiers;
  v5 = -[ODMSiriSchemaODMTrialExperimentIdentifiers init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[ODMSiriSchemaODMTrialExperimentIdentifiers setExperimentId:](v5, "setExperimentId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("treatmentId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[ODMSiriSchemaODMTrialExperimentIdentifiers setTreatmentId:](v5, "setTreatmentId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deploymentId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMTrialExperimentIdentifiers setDeploymentId:](v5, "setDeploymentId:", objc_msgSend(v10, "longLongValue"));
    v11 = v5;

  }
  return v5;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SISchemaUUID)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentId, a3);
}

- (int64_t)deploymentId
{
  return self->_deploymentId;
}

- (void)setHasExperimentId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasTreatmentId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end
