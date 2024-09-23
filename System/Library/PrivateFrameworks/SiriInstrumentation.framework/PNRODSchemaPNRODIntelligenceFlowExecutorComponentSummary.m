@implementation PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary

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
  v22.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary actionId](self, "actionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary deleteActionId](self, "deleteActionId");
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary planId](self, "planId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary deletePlanId](self, "deletePlanId");
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary clientRequestId](self, "clientRequestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary deleteClientRequestId](self, "deleteClientRequestId");
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary executionTime](self, "executionTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary deleteExecutionTime](self, "deleteExecutionTime");
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary failureInfo](self, "failureInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary deleteFailureInfo](self, "deleteFailureInfo");

  return v5;
}

- (BOOL)hasActionId
{
  return self->_actionId != 0;
}

- (void)deleteActionId
{
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setActionId:](self, "setActionId:", 0);
}

- (BOOL)hasPlanId
{
  return self->_planId != 0;
}

- (void)deletePlanId
{
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setPlanId:](self, "setPlanId:", 0);
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
}

- (void)deleteClientRequestId
{
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setClientRequestId:](self, "setClientRequestId:", 0);
}

- (void)setIsAppForeground:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isAppForeground = a3;
}

- (BOOL)hasIsAppForeground
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsAppForeground:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsAppForeground
{
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setIsAppForeground:](self, "setIsAppForeground:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAppState:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_appState = a3;
}

- (BOOL)hasAppState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAppState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAppState
{
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setAppState:](self, "setAppState:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasExecutionTime
{
  return self->_executionTime != 0;
}

- (void)deleteExecutionTime
{
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setExecutionTime:](self, "setExecutionTime:", 0);
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteFailureInfo
{
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setFailureInfo:](self, "setFailureInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char has;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary actionId](self, "actionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary actionId](self, "actionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary planId](self, "planId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary planId](self, "planId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary clientRequestId](self, "clientRequestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary clientRequestId](self, "clientRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt64Field();
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary executionTime](self, "executionTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary executionTime](self, "executionTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary failureInfo](self, "failureInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v16;
  if (v13)
  {
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary failureInfo](self, "failureInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v14 = v16;
  }

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
  $A41C79A17919520033C13DBDEFD0BD61 has;
  unsigned int v23;
  int isAppForeground;
  int v25;
  int64_t appState;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary actionId](self, "actionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary actionId](self, "actionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary actionId](self, "actionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_34;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary planId](self, "planId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary planId](self, "planId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary planId](self, "planId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_34;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary clientRequestId](self, "clientRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary clientRequestId](self, "clientRequestId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary clientRequestId](self, "clientRequestId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientRequestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_34;
  }
  else
  {

  }
  has = self->_has;
  v23 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v23 & 1))
    goto LABEL_34;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isAppForeground = self->_isAppForeground;
    if (isAppForeground != objc_msgSend(v4, "isAppForeground"))
      goto LABEL_34;
    has = self->_has;
    v23 = v4[64];
  }
  v25 = (*(unsigned int *)&has >> 1) & 1;
  if (v25 != ((v23 >> 1) & 1))
    goto LABEL_34;
  if (v25)
  {
    appState = self->_appState;
    if (appState != objc_msgSend(v4, "appState"))
      goto LABEL_34;
  }
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary executionTime](self, "executionTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executionTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary executionTime](self, "executionTime");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary executionTime](self, "executionTime");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executionTime");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_34;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary failureInfo](self, "failureInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary failureInfo](self, "failureInfo");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {

LABEL_37:
    v37 = 1;
    goto LABEL_35;
  }
  v33 = (void *)v32;
  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary failureInfo](self, "failureInfo");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isEqual:", v35);

  if ((v36 & 1) != 0)
    goto LABEL_37;
LABEL_34:
  v37 = 0;
LABEL_35:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[SISchemaUUID hash](self->_actionId, "hash");
  v4 = -[SISchemaUUID hash](self->_planId, "hash");
  v5 = -[SISchemaUUID hash](self->_clientRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_isAppForeground;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761 * self->_appState;
LABEL_6:
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_executionTime, "hash");
  return v8 ^ v9 ^ -[PNRODSchemaPNRODFailureInfo hash](self->_failureInfo, "hash");
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
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary actionId](self, "actionId");
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary appState](self, "appState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appState"));

  }
  if (self->_clientRequestId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary clientRequestId](self, "clientRequestId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("clientRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("clientRequestId"));

    }
  }
  if (self->_executionTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary executionTime](self, "executionTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("executionTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("executionTime"));

    }
  }
  if (self->_failureInfo)
  {
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary failureInfo](self, "failureInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("failureInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("failureInfo"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary isAppForeground](self, "isAppForeground"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isAppForeground"));

  }
  if (self->_planId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary planId](self, "planId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("planId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("planId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary)initWithJSON:(id)a3
{
  void *v4;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *v5;
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
    self = -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary)initWithDictionary:(id)a3
{
  id v4;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  SISchemaUUID *v11;
  void *v12;
  void *v13;
  void *v14;
  PNRODSchemaPNRODMetricDuration *v15;
  void *v16;
  PNRODSchemaPNRODFailureInfo *v17;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary;
  v5 = -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setActionId:](v5, "setActionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setPlanId:](v5, "setPlanId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientRequestId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setClientRequestId:](v5, "setClientRequestId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppForeground"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setIsAppForeground:](v5, "setIsAppForeground:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setAppState:](v5, "setAppState:", objc_msgSend(v13, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v14);
      -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setExecutionTime:](v5, "setExecutionTime:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PNRODSchemaPNRODFailureInfo initWithDictionary:]([PNRODSchemaPNRODFailureInfo alloc], "initWithDictionary:", v16);
      -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setFailureInfo:](v5, "setFailureInfo:", v17);

    }
    v18 = v5;

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

- (BOOL)isAppForeground
{
  return self->_isAppForeground;
}

- (int64_t)appState
{
  return self->_appState;
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
