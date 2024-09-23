@implementation GRPSchemaTrialExperimentIdentifiers

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (void)deleteExperimentId
{
  -[GRPSchemaTrialExperimentIdentifiers setExperimentId:](self, "setExperimentId:", 0);
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (void)deleteTreatmentId
{
  -[GRPSchemaTrialExperimentIdentifiers setTreatmentId:](self, "setTreatmentId:", 0);
}

- (BOOL)hasDeploymentId
{
  return self->_deploymentId != 0;
}

- (void)deleteDeploymentId
{
  -[GRPSchemaTrialExperimentIdentifiers setDeploymentId:](self, "setDeploymentId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return GRPSchemaTrialExperimentIdentifiersReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[GRPSchemaTrialExperimentIdentifiers experimentId](self, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[GRPSchemaTrialExperimentIdentifiers treatmentId](self, "treatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[GRPSchemaTrialExperimentIdentifiers deploymentId](self, "deploymentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
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
  -[GRPSchemaTrialExperimentIdentifiers experimentId](self, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[GRPSchemaTrialExperimentIdentifiers experimentId](self, "experimentId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[GRPSchemaTrialExperimentIdentifiers experimentId](self, "experimentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[GRPSchemaTrialExperimentIdentifiers treatmentId](self, "treatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[GRPSchemaTrialExperimentIdentifiers treatmentId](self, "treatmentId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[GRPSchemaTrialExperimentIdentifiers treatmentId](self, "treatmentId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "treatmentId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[GRPSchemaTrialExperimentIdentifiers deploymentId](self, "deploymentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deploymentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[GRPSchemaTrialExperimentIdentifiers deploymentId](self, "deploymentId");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[GRPSchemaTrialExperimentIdentifiers deploymentId](self, "deploymentId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deploymentId");
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
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_experimentId, "hash");
  v4 = -[NSString hash](self->_treatmentId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_deploymentId, "hash");
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
  if (self->_deploymentId)
  {
    -[GRPSchemaTrialExperimentIdentifiers deploymentId](self, "deploymentId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deploymentId"));

  }
  if (self->_experimentId)
  {
    -[GRPSchemaTrialExperimentIdentifiers experimentId](self, "experimentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("experimentId"));

  }
  if (self->_treatmentId)
  {
    -[GRPSchemaTrialExperimentIdentifiers treatmentId](self, "treatmentId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("treatmentId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[GRPSchemaTrialExperimentIdentifiers dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (GRPSchemaTrialExperimentIdentifiers)initWithJSON:(id)a3
{
  void *v4;
  GRPSchemaTrialExperimentIdentifiers *v5;
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
    self = -[GRPSchemaTrialExperimentIdentifiers initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (GRPSchemaTrialExperimentIdentifiers)initWithDictionary:(id)a3
{
  id v4;
  GRPSchemaTrialExperimentIdentifiers *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GRPSchemaTrialExperimentIdentifiers *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GRPSchemaTrialExperimentIdentifiers;
  v5 = -[GRPSchemaTrialExperimentIdentifiers init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[GRPSchemaTrialExperimentIdentifiers setExperimentId:](v5, "setExperimentId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("treatmentId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[GRPSchemaTrialExperimentIdentifiers setTreatmentId:](v5, "setTreatmentId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deploymentId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[GRPSchemaTrialExperimentIdentifiers setDeploymentId:](v5, "setDeploymentId:", v11);

    }
    v12 = v5;

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

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deploymentId
{
  return self->_deploymentId;
}

- (void)setDeploymentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasExperimentId:(BOOL)a3
{
  self->_hasExperimentId = a3;
}

- (void)setHasTreatmentId:(BOOL)a3
{
  self->_hasTreatmentId = a3;
}

- (void)setHasDeploymentId:(BOOL)a3
{
  self->_hasDeploymentId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end
