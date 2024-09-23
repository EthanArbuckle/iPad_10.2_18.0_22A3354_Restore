@implementation EXPSchemaEXPTrialExperiment

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 2);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 4);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 5);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 6);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 7);
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
  v9.super_class = (Class)EXPSchemaEXPTrialExperiment;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXPSchemaEXPTrialExperiment treatmentId](self, "treatmentId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[EXPSchemaEXPTrialExperiment deleteTreatmentId](self, "deleteTreatmentId");
  return v5;
}

- (BOOL)hasExperimentNamespace
{
  return self->_experimentNamespace != 0;
}

- (void)deleteExperimentNamespace
{
  -[EXPSchemaEXPTrialExperiment setExperimentNamespace:](self, "setExperimentNamespace:", 0);
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (void)deleteExperimentId
{
  -[EXPSchemaEXPTrialExperiment setExperimentId:](self, "setExperimentId:", 0);
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (void)deleteTreatmentId
{
  -[EXPSchemaEXPTrialExperiment setTreatmentId:](self, "setTreatmentId:", 0);
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
  -[EXPSchemaEXPTrialExperiment setDeploymentId:](self, "setDeploymentId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAllocationStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_allocationStatus = a3;
}

- (BOOL)hasAllocationStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAllocationStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAllocationStatus
{
  -[EXPSchemaEXPTrialExperiment setAllocationStatus:](self, "setAllocationStatus:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setLastUpdatedAtInMs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_lastUpdatedAtInMs = a3;
}

- (BOOL)hasLastUpdatedAtInMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasLastUpdatedAtInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteLastUpdatedAtInMs
{
  -[EXPSchemaEXPTrialExperiment setLastUpdatedAtInMs:](self, "setLastUpdatedAtInMs:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setCompatibilityVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_compatibilityVersion = a3;
}

- (BOOL)hasCompatibilityVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasCompatibilityVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteCompatibilityVersion
{
  -[EXPSchemaEXPTrialExperiment setCompatibilityVersion:](self, "setCompatibilityVersion:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return EXPSchemaEXPTrialExperimentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  id v10;

  v10 = a3;
  -[EXPSchemaEXPTrialExperiment experimentNamespace](self, "experimentNamespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[EXPSchemaEXPTrialExperiment experimentId](self, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[EXPSchemaEXPTrialExperiment treatmentId](self, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EXPSchemaEXPTrialExperiment treatmentId](self, "treatmentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  v9 = v10;
  if ((has & 2) == 0)
  {
    if ((has & 4) == 0)
      goto LABEL_11;
LABEL_15:
    PBDataWriterWriteUint64Field();
    v9 = v10;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  PBDataWriterWriteInt32Field();
  v9 = v10;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_11:
  if ((has & 8) != 0)
  {
LABEL_12:
    PBDataWriterWriteUint32Field();
    v9 = v10;
  }
LABEL_13:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
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
  BOOL v22;
  $4AC247BD89C7D8007CA6E214AE01963F has;
  unsigned int v25;
  int64_t deploymentId;
  int v27;
  int allocationStatus;
  int v29;
  unint64_t lastUpdatedAtInMs;
  int v31;
  unsigned int compatibilityVersion;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[EXPSchemaEXPTrialExperiment experimentNamespace](self, "experimentNamespace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[EXPSchemaEXPTrialExperiment experimentNamespace](self, "experimentNamespace");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[EXPSchemaEXPTrialExperiment experimentNamespace](self, "experimentNamespace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentNamespace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[EXPSchemaEXPTrialExperiment experimentId](self, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[EXPSchemaEXPTrialExperiment experimentId](self, "experimentId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[EXPSchemaEXPTrialExperiment experimentId](self, "experimentId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[EXPSchemaEXPTrialExperiment treatmentId](self, "treatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[EXPSchemaEXPTrialExperiment treatmentId](self, "treatmentId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[EXPSchemaEXPTrialExperiment treatmentId](self, "treatmentId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "treatmentId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  has = self->_has;
  v25 = v4[60];
  if ((*(_BYTE *)&has & 1) == (v25 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      deploymentId = self->_deploymentId;
      if (deploymentId != objc_msgSend(v4, "deploymentId"))
        goto LABEL_17;
      has = self->_has;
      v25 = v4[60];
    }
    v27 = (*(unsigned int *)&has >> 1) & 1;
    if (v27 == ((v25 >> 1) & 1))
    {
      if (v27)
      {
        allocationStatus = self->_allocationStatus;
        if (allocationStatus != objc_msgSend(v4, "allocationStatus"))
          goto LABEL_17;
        has = self->_has;
        v25 = v4[60];
      }
      v29 = (*(unsigned int *)&has >> 2) & 1;
      if (v29 == ((v25 >> 2) & 1))
      {
        if (v29)
        {
          lastUpdatedAtInMs = self->_lastUpdatedAtInMs;
          if (lastUpdatedAtInMs != objc_msgSend(v4, "lastUpdatedAtInMs"))
            goto LABEL_17;
          has = self->_has;
          v25 = v4[60];
        }
        v31 = (*(unsigned int *)&has >> 3) & 1;
        if (v31 == ((v25 >> 3) & 1))
        {
          if (!v31
            || (compatibilityVersion = self->_compatibilityVersion,
                compatibilityVersion == objc_msgSend(v4, "compatibilityVersion")))
          {
            v22 = 1;
            goto LABEL_18;
          }
        }
      }
    }
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
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_experimentNamespace, "hash");
  v4 = -[NSString hash](self->_experimentId, "hash");
  v5 = -[SISchemaUUID hash](self->_treatmentId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_deploymentId;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_allocationStatus;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v8 = 2654435761u * self->_lastUpdatedAtInMs;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v9 = 2654435761 * self->_compatibilityVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[EXPSchemaEXPTrialExperiment allocationStatus](self, "allocationStatus") - 1;
    if (v5 > 2)
      v6 = CFSTR("EXPTREATMENTALLOCATIONSTATUS_UNKNOWN");
    else
      v6 = off_1E562D430[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("allocationStatus"));
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[EXPSchemaEXPTrialExperiment compatibilityVersion](self, "compatibilityVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("compatibilityVersion"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[EXPSchemaEXPTrialExperiment deploymentId](self, "deploymentId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deploymentId"));

  }
  if (self->_experimentId)
  {
    -[EXPSchemaEXPTrialExperiment experimentId](self, "experimentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("experimentId"));

  }
  if (self->_experimentNamespace)
  {
    -[EXPSchemaEXPTrialExperiment experimentNamespace](self, "experimentNamespace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("experimentNamespace"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[EXPSchemaEXPTrialExperiment lastUpdatedAtInMs](self, "lastUpdatedAtInMs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("lastUpdatedAtInMs"));

  }
  if (self->_treatmentId)
  {
    -[EXPSchemaEXPTrialExperiment treatmentId](self, "treatmentId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("treatmentId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("treatmentId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[EXPSchemaEXPTrialExperiment dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (EXPSchemaEXPTrialExperiment)initWithJSON:(id)a3
{
  void *v4;
  EXPSchemaEXPTrialExperiment *v5;
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
    self = -[EXPSchemaEXPTrialExperiment initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (EXPSchemaEXPTrialExperiment)initWithDictionary:(id)a3
{
  id v4;
  EXPSchemaEXPTrialExperiment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaUUID *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  EXPSchemaEXPTrialExperiment *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EXPSchemaEXPTrialExperiment;
  v5 = -[EXPSchemaEXPTrialExperiment init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentNamespace"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[EXPSchemaEXPTrialExperiment setExperimentNamespace:](v5, "setExperimentNamespace:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[EXPSchemaEXPTrialExperiment setExperimentId:](v5, "setExperimentId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("treatmentId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[EXPSchemaEXPTrialExperiment setTreatmentId:](v5, "setTreatmentId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deploymentId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EXPSchemaEXPTrialExperiment setDeploymentId:](v5, "setDeploymentId:", objc_msgSend(v12, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allocationStatus"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EXPSchemaEXPTrialExperiment setAllocationStatus:](v5, "setAllocationStatus:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastUpdatedAtInMs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EXPSchemaEXPTrialExperiment setLastUpdatedAtInMs:](v5, "setLastUpdatedAtInMs:", objc_msgSend(v14, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compatibilityVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EXPSchemaEXPTrialExperiment setCompatibilityVersion:](v5, "setCompatibilityVersion:", objc_msgSend(v15, "unsignedIntValue"));
    v16 = v5;

  }
  return v5;
}

- (NSString)experimentNamespace
{
  return self->_experimentNamespace;
}

- (void)setExperimentNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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

- (int)allocationStatus
{
  return self->_allocationStatus;
}

- (unint64_t)lastUpdatedAtInMs
{
  return self->_lastUpdatedAtInMs;
}

- (unsigned)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setHasExperimentNamespace:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasExperimentId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasTreatmentId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_experimentNamespace, 0);
}

@end
