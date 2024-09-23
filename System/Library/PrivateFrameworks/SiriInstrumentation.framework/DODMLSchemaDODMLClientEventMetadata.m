@implementation DODMLSchemaDODMLClientEventMetadata

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
  v13.super_class = (Class)DODMLSchemaDODMLClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DODMLSchemaDODMLClientEventMetadata dodMlId](self, "dodMlId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[DODMLSchemaDODMLClientEventMetadata deleteDodMlId](self, "deleteDodMlId");
  -[DODMLSchemaDODMLClientEventMetadata trialTreatmentId](self, "trialTreatmentId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[DODMLSchemaDODMLClientEventMetadata deleteTrialTreatmentId](self, "deleteTrialTreatmentId");

  return v5;
}

- (BOOL)hasDodMlId
{
  return self->_dodMlId != 0;
}

- (void)deleteDodMlId
{
  -[DODMLSchemaDODMLClientEventMetadata setDodMlId:](self, "setDodMlId:", 0);
}

- (BOOL)hasExperimentName
{
  return self->_experimentName != 0;
}

- (void)deleteExperimentName
{
  -[DODMLSchemaDODMLClientEventMetadata setExperimentName:](self, "setExperimentName:", 0);
}

- (BOOL)hasTrialExperimentId
{
  return self->_trialExperimentId != 0;
}

- (void)deleteTrialExperimentId
{
  -[DODMLSchemaDODMLClientEventMetadata setTrialExperimentId:](self, "setTrialExperimentId:", 0);
}

- (BOOL)hasTrialTreatmentId
{
  return self->_trialTreatmentId != 0;
}

- (void)deleteTrialTreatmentId
{
  -[DODMLSchemaDODMLClientEventMetadata setTrialTreatmentId:](self, "setTrialTreatmentId:", 0);
}

- (void)setTrialDeploymentId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_trialDeploymentId = a3;
}

- (BOOL)hasTrialDeploymentId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTrialDeploymentId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTrialDeploymentId
{
  -[DODMLSchemaDODMLClientEventMetadata setTrialDeploymentId:](self, "setTrialDeploymentId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return DODMLSchemaDODMLClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[DODMLSchemaDODMLClientEventMetadata dodMlId](self, "dodMlId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DODMLSchemaDODMLClientEventMetadata dodMlId](self, "dodMlId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DODMLSchemaDODMLClientEventMetadata experimentName](self, "experimentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[DODMLSchemaDODMLClientEventMetadata trialExperimentId](self, "trialExperimentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[DODMLSchemaDODMLClientEventMetadata trialTreatmentId](self, "trialTreatmentId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DODMLSchemaDODMLClientEventMetadata trialTreatmentId](self, "trialTreatmentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  BOOL v27;
  int64_t trialDeploymentId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[DODMLSchemaDODMLClientEventMetadata dodMlId](self, "dodMlId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dodMlId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[DODMLSchemaDODMLClientEventMetadata dodMlId](self, "dodMlId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DODMLSchemaDODMLClientEventMetadata dodMlId](self, "dodMlId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dodMlId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[DODMLSchemaDODMLClientEventMetadata experimentName](self, "experimentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[DODMLSchemaDODMLClientEventMetadata experimentName](self, "experimentName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[DODMLSchemaDODMLClientEventMetadata experimentName](self, "experimentName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[DODMLSchemaDODMLClientEventMetadata trialExperimentId](self, "trialExperimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trialExperimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[DODMLSchemaDODMLClientEventMetadata trialExperimentId](self, "trialExperimentId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[DODMLSchemaDODMLClientEventMetadata trialExperimentId](self, "trialExperimentId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trialExperimentId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[DODMLSchemaDODMLClientEventMetadata trialTreatmentId](self, "trialTreatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trialTreatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  -[DODMLSchemaDODMLClientEventMetadata trialTreatmentId](self, "trialTreatmentId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[DODMLSchemaDODMLClientEventMetadata trialTreatmentId](self, "trialTreatmentId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trialTreatmentId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_22;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[48] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (trialDeploymentId = self->_trialDeploymentId, trialDeploymentId == objc_msgSend(v4, "trialDeploymentId")))
    {
      v27 = 1;
      goto LABEL_23;
    }
  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_dodMlId, "hash");
  v4 = -[NSString hash](self->_experimentName, "hash");
  v5 = -[NSString hash](self->_trialExperimentId, "hash");
  v6 = -[SISchemaUUID hash](self->_trialTreatmentId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_trialDeploymentId;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dodMlId)
  {
    -[DODMLSchemaDODMLClientEventMetadata dodMlId](self, "dodMlId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dodMlId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("dodMlId"));

    }
  }
  if (self->_experimentName)
  {
    -[DODMLSchemaDODMLClientEventMetadata experimentName](self, "experimentName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("experimentName"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[DODMLSchemaDODMLClientEventMetadata trialDeploymentId](self, "trialDeploymentId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("trialDeploymentId"));

  }
  if (self->_trialExperimentId)
  {
    -[DODMLSchemaDODMLClientEventMetadata trialExperimentId](self, "trialExperimentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("trialExperimentId"));

  }
  if (self->_trialTreatmentId)
  {
    -[DODMLSchemaDODMLClientEventMetadata trialTreatmentId](self, "trialTreatmentId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("trialTreatmentId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("trialTreatmentId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DODMLSchemaDODMLClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DODMLSchemaDODMLClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  DODMLSchemaDODMLClientEventMetadata *v5;
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
    self = -[DODMLSchemaDODMLClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DODMLSchemaDODMLClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  DODMLSchemaDODMLClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SISchemaUUID *v13;
  void *v14;
  DODMLSchemaDODMLClientEventMetadata *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DODMLSchemaDODMLClientEventMetadata;
  v5 = -[DODMLSchemaDODMLClientEventMetadata init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dodMlId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[DODMLSchemaDODMLClientEventMetadata setDodMlId:](v5, "setDodMlId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[DODMLSchemaDODMLClientEventMetadata setExperimentName:](v5, "setExperimentName:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialExperimentId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[DODMLSchemaDODMLClientEventMetadata setTrialExperimentId:](v5, "setTrialExperimentId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialTreatmentId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[DODMLSchemaDODMLClientEventMetadata setTrialTreatmentId:](v5, "setTrialTreatmentId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialDeploymentId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DODMLSchemaDODMLClientEventMetadata setTrialDeploymentId:](v5, "setTrialDeploymentId:", objc_msgSend(v14, "longLongValue"));
    v15 = v5;

  }
  return v5;
}

- (SISchemaUUID)dodMlId
{
  return self->_dodMlId;
}

- (void)setDodMlId:(id)a3
{
  objc_storeStrong((id *)&self->_dodMlId, a3);
}

- (NSString)experimentName
{
  return self->_experimentName;
}

- (void)setExperimentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SISchemaUUID)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialTreatmentId, a3);
}

- (int64_t)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setHasDodMlId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasExperimentName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasTrialExperimentId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasTrialTreatmentId:(BOOL)a3
{
  self->_hasDodMlId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_experimentName, 0);
  objc_storeStrong((id *)&self->_dodMlId, 0);
}

@end
