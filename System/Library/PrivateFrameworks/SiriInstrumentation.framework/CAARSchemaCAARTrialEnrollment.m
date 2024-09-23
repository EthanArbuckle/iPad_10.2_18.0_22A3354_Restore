@implementation CAARSchemaCAARTrialEnrollment

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
  -[CAARSchemaCAARTrialEnrollment setExperimentId:](self, "setExperimentId:", 0);
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (void)deleteTreatmentId
{
  -[CAARSchemaCAARTrialEnrollment setTreatmentId:](self, "setTreatmentId:", 0);
}

- (BOOL)hasDeploymentId
{
  return self->_deploymentId != 0;
}

- (void)deleteDeploymentId
{
  -[CAARSchemaCAARTrialEnrollment setDeploymentId:](self, "setDeploymentId:", 0);
}

- (BOOL)hasRolloutId
{
  return self->_rolloutId != 0;
}

- (void)deleteRolloutId
{
  -[CAARSchemaCAARTrialEnrollment setRolloutId:](self, "setRolloutId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARTrialEnrollmentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CAARSchemaCAARTrialEnrollment experimentId](self, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[CAARSchemaCAARTrialEnrollment treatmentId](self, "treatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[CAARSchemaCAARTrialEnrollment deploymentId](self, "deploymentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[CAARSchemaCAARTrialEnrollment rolloutId](self, "rolloutId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[CAARSchemaCAARTrialEnrollment experimentId](self, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[CAARSchemaCAARTrialEnrollment experimentId](self, "experimentId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CAARSchemaCAARTrialEnrollment experimentId](self, "experimentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[CAARSchemaCAARTrialEnrollment treatmentId](self, "treatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[CAARSchemaCAARTrialEnrollment treatmentId](self, "treatmentId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[CAARSchemaCAARTrialEnrollment treatmentId](self, "treatmentId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "treatmentId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[CAARSchemaCAARTrialEnrollment deploymentId](self, "deploymentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deploymentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[CAARSchemaCAARTrialEnrollment deploymentId](self, "deploymentId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[CAARSchemaCAARTrialEnrollment deploymentId](self, "deploymentId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deploymentId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[CAARSchemaCAARTrialEnrollment rolloutId](self, "rolloutId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rolloutId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[CAARSchemaCAARTrialEnrollment rolloutId](self, "rolloutId");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[CAARSchemaCAARTrialEnrollment rolloutId](self, "rolloutId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rolloutId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_experimentId, "hash");
  v4 = -[NSString hash](self->_treatmentId, "hash") ^ v3;
  v5 = -[NSString hash](self->_deploymentId, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_rolloutId, "hash");
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
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_deploymentId)
  {
    -[CAARSchemaCAARTrialEnrollment deploymentId](self, "deploymentId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deploymentId"));

  }
  if (self->_experimentId)
  {
    -[CAARSchemaCAARTrialEnrollment experimentId](self, "experimentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("experimentId"));

  }
  if (self->_rolloutId)
  {
    -[CAARSchemaCAARTrialEnrollment rolloutId](self, "rolloutId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("rolloutId"));

  }
  if (self->_treatmentId)
  {
    -[CAARSchemaCAARTrialEnrollment treatmentId](self, "treatmentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("treatmentId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAARSchemaCAARTrialEnrollment dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAARSchemaCAARTrialEnrollment)initWithJSON:(id)a3
{
  void *v4;
  CAARSchemaCAARTrialEnrollment *v5;
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
    self = -[CAARSchemaCAARTrialEnrollment initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAARSchemaCAARTrialEnrollment)initWithDictionary:(id)a3
{
  id v4;
  CAARSchemaCAARTrialEnrollment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CAARSchemaCAARTrialEnrollment *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAARSchemaCAARTrialEnrollment;
  v5 = -[CAARSchemaCAARTrialEnrollment init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[CAARSchemaCAARTrialEnrollment setExperimentId:](v5, "setExperimentId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("treatmentId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[CAARSchemaCAARTrialEnrollment setTreatmentId:](v5, "setTreatmentId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deploymentId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[CAARSchemaCAARTrialEnrollment setDeploymentId:](v5, "setDeploymentId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rolloutId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[CAARSchemaCAARTrialEnrollment setRolloutId:](v5, "setRolloutId:", v13);

    }
    v14 = v5;

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

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (void)setRolloutId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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

- (void)setHasRolloutId:(BOOL)a3
{
  self->_hasRolloutId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutId, 0);
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end
