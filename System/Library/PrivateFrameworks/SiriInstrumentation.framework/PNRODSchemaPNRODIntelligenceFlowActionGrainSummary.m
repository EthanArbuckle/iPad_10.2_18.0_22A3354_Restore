@implementation PNRODSchemaPNRODIntelligenceFlowActionGrainSummary

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
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowActionGrainSummary;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary actionId](self, "actionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary deleteActionId](self, "deleteActionId");
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary planId](self, "planId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary deletePlanId](self, "deletePlanId");
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary clientRequestId](self, "clientRequestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary deleteClientRequestId](self, "deleteClientRequestId");
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary executionTime](self, "executionTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary deleteExecutionTime](self, "deleteExecutionTime");
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary failureInfo](self, "failureInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary deleteFailureInfo](self, "deleteFailureInfo");

  return v5;
}

- (BOOL)hasActionId
{
  return self->_actionId != 0;
}

- (void)deleteActionId
{
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setActionId:](self, "setActionId:", 0);
}

- (BOOL)hasPlanId
{
  return self->_planId != 0;
}

- (void)deletePlanId
{
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setPlanId:](self, "setPlanId:", 0);
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
}

- (void)deleteClientRequestId
{
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setClientRequestId:](self, "setClientRequestId:", 0);
}

- (void)setStatus:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_status = a3;
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteStatus
{
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setStatus:](self, "setStatus:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasExecutionTime
{
  return self->_executionTime != 0;
}

- (void)deleteExecutionTime
{
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setExecutionTime:](self, "setExecutionTime:", 0);
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteFailureInfo
{
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setFailureInfo:](self, "setFailureInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowActionGrainSummaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
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
  id v15;

  v15 = a3;
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary actionId](self, "actionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary actionId](self, "actionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary planId](self, "planId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary planId](self, "planId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary clientRequestId](self, "clientRequestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary clientRequestId](self, "clientRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary executionTime](self, "executionTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary executionTime](self, "executionTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary failureInfo](self, "failureInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v15;
  if (v12)
  {
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary failureInfo](self, "failureInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v13 = v15;
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
  int64_t status;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary actionId](self, "actionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary actionId](self, "actionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary actionId](self, "actionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary planId](self, "planId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary planId](self, "planId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary planId](self, "planId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_30;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary clientRequestId](self, "clientRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary clientRequestId](self, "clientRequestId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary clientRequestId](self, "clientRequestId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientRequestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_30;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    status = self->_status;
    if (status != objc_msgSend(v4, "status"))
      goto LABEL_30;
  }
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary executionTime](self, "executionTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executionTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary executionTime](self, "executionTime");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary executionTime](self, "executionTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executionTime");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_30;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary failureInfo](self, "failureInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary failureInfo](self, "failureInfo");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_33:
      v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary failureInfo](self, "failureInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failureInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_33;
  }
  else
  {
LABEL_29:

  }
LABEL_30:
  v33 = 0;
LABEL_31:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[SISchemaUUID hash](self->_actionId, "hash");
  v4 = -[SISchemaUUID hash](self->_planId, "hash");
  v5 = -[SISchemaUUID hash](self->_clientRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_status;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[PNRODSchemaPNRODMetricDuration hash](self->_executionTime, "hash");
  return v7 ^ v8 ^ -[PNRODSchemaPNRODFailureInfo hash](self->_failureInfo, "hash");
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary actionId](self, "actionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionId"));

    }
  }
  if (self->_clientRequestId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary clientRequestId](self, "clientRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("clientRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("clientRequestId"));

    }
  }
  if (self->_executionTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary executionTime](self, "executionTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("executionTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("executionTime"));

    }
  }
  if (self->_failureInfo)
  {
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary failureInfo](self, "failureInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("failureInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("failureInfo"));

    }
  }
  if (self->_planId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary planId](self, "planId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("planId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("planId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary status](self, "status"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("status"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRODSchemaPNRODIntelligenceFlowActionGrainSummary)initWithJSON:(id)a3
{
  void *v4;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *v5;
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
    self = -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowActionGrainSummary)initWithDictionary:(id)a3
{
  id v4;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaUUID *v11;
  void *v12;
  void *v13;
  PNRODSchemaPNRODMetricDuration *v14;
  void *v15;
  PNRODSchemaPNRODFailureInfo *v16;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowActionGrainSummary;
  v5 = -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setActionId:](v5, "setActionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setPlanId:](v5, "setPlanId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientRequestId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setClientRequestId:](v5, "setClientRequestId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setStatus:](v5, "setStatus:", objc_msgSend(v12, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionTime"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v13);
      -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setExecutionTime:](v5, "setExecutionTime:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[PNRODSchemaPNRODFailureInfo initWithDictionary:]([PNRODSchemaPNRODFailureInfo alloc], "initWithDictionary:", v15);
      -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setFailureInfo:](v5, "setFailureInfo:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (SISchemaUUID)actionId
{
  return self->_actionId;
}

- (void)setActionId:(id)a3
{
  objc_storeStrong((id *)&self->_actionId, a3);
}

- (SISchemaUUID)planId
{
  return self->_planId;
}

- (void)setPlanId:(id)a3
{
  objc_storeStrong((id *)&self->_planId, a3);
}

- (SISchemaUUID)clientRequestId
{
  return self->_clientRequestId;
}

- (void)setClientRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_clientRequestId, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (PNRODSchemaPNRODMetricDuration)executionTime
{
  return self->_executionTime;
}

- (void)setExecutionTime:(id)a3
{
  objc_storeStrong((id *)&self->_executionTime, a3);
}

- (PNRODSchemaPNRODFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setFailureInfo:(id)a3
{
  objc_storeStrong((id *)&self->_failureInfo, a3);
}

- (void)setHasActionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasPlanId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasClientRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasExecutionTime:(BOOL)a3
{
  self->_hasActionId = a3;
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasPlanId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_executionTime, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_planId, 0);
  objc_storeStrong((id *)&self->_actionId, 0);
}

@end
