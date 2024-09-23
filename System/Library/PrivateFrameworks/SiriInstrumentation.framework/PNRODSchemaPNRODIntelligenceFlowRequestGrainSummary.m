@implementation PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary

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
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v34, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientRequestId](self, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary deleteClientRequestId](self, "deleteClientRequestId");
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientSessionId](self, "clientSessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary deleteClientSessionId](self, "deleteClientSessionId");
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary rawSessionId](self, "rawSessionId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary deleteRawSessionId](self, "deleteRawSessionId");
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary requestResponseTime](self, "requestResponseTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary deleteRequestResponseTime](self, "deleteRequestResponseTime");
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary planningTime](self, "planningTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary deletePlanningTime](self, "deletePlanningTime");
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary queryTime](self, "queryTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary deleteQueryTime](self, "deleteQueryTime");
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary executionTime](self, "executionTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary deleteExecutionTime](self, "deleteExecutionTime");
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary responsePreparationTime](self, "responsePreparationTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary deleteResponsePreparationTime](self, "deleteResponsePreparationTime");
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary failureInfo](self, "failureInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary deleteFailureInfo](self, "deleteFailureInfo");

  return v5;
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
}

- (void)deleteClientRequestId
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setClientRequestId:](self, "setClientRequestId:", 0);
}

- (BOOL)hasClientSessionId
{
  return self->_clientSessionId != 0;
}

- (void)deleteClientSessionId
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setClientSessionId:](self, "setClientSessionId:", 0);
}

- (BOOL)hasRawSessionId
{
  return self->_rawSessionId != 0;
}

- (void)deleteRawSessionId
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setRawSessionId:](self, "setRawSessionId:", 0);
}

- (void)setStatus:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_status = a3;
}

- (BOOL)hasStatus
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteStatus
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setStatus:](self, "setStatus:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setNumPlansCreated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_numPlansCreated = a3;
}

- (BOOL)hasNumPlansCreated
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasNumPlansCreated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteNumPlansCreated
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumPlansCreated:](self, "setNumPlansCreated:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setNumPlansCreatedForResponse:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numPlansCreatedForResponse = a3;
}

- (BOOL)hasNumPlansCreatedForResponse
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasNumPlansCreatedForResponse:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteNumPlansCreatedForResponse
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumPlansCreatedForResponse:](self, "setNumPlansCreatedForResponse:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setNumQueriesCreated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numQueriesCreated = a3;
}

- (BOOL)hasNumQueriesCreated
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasNumQueriesCreated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteNumQueriesCreated
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumQueriesCreated:](self, "setNumQueriesCreated:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setNumActionsCreated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numActionsCreated = a3;
}

- (BOOL)hasNumActionsCreated
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasNumActionsCreated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteNumActionsCreated
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumActionsCreated:](self, "setNumActionsCreated:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setNumStatementsEvaluated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numStatementsEvaluated = a3;
}

- (BOOL)hasNumStatementsEvaluated
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasNumStatementsEvaluated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteNumStatementsEvaluated
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumStatementsEvaluated:](self, "setNumStatementsEvaluated:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setNumStatementsEvaluatedFromPlanner:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numStatementsEvaluatedFromPlanner = a3;
}

- (BOOL)hasNumStatementsEvaluatedFromPlanner
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasNumStatementsEvaluatedFromPlanner:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteNumStatementsEvaluatedFromPlanner
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumStatementsEvaluatedFromPlanner:](self, "setNumStatementsEvaluatedFromPlanner:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setNumResponseGenerationRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numResponseGenerationRequests = a3;
}

- (BOOL)hasNumResponseGenerationRequests
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasNumResponseGenerationRequests:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteNumResponseGenerationRequests
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumResponseGenerationRequests:](self, "setNumResponseGenerationRequests:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setNumSystemResponsesGenerated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numSystemResponsesGenerated = a3;
}

- (BOOL)hasNumSystemResponsesGenerated
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasNumSystemResponsesGenerated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteNumSystemResponsesGenerated
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumSystemResponsesGenerated:](self, "setNumSystemResponsesGenerated:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setNumSystemPromptsResolved:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_numSystemPromptsResolved = a3;
}

- (BOOL)hasNumSystemPromptsResolved
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasNumSystemPromptsResolved:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteNumSystemPromptsResolved
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumSystemPromptsResolved:](self, "setNumSystemPromptsResolved:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (BOOL)hasRequestResponseTime
{
  return self->_requestResponseTime != 0;
}

- (void)deleteRequestResponseTime
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setRequestResponseTime:](self, "setRequestResponseTime:", 0);
}

- (BOOL)hasPlanningTime
{
  return self->_planningTime != 0;
}

- (void)deletePlanningTime
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setPlanningTime:](self, "setPlanningTime:", 0);
}

- (BOOL)hasQueryTime
{
  return self->_queryTime != 0;
}

- (void)deleteQueryTime
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setQueryTime:](self, "setQueryTime:", 0);
}

- (BOOL)hasExecutionTime
{
  return self->_executionTime != 0;
}

- (void)deleteExecutionTime
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setExecutionTime:](self, "setExecutionTime:", 0);
}

- (BOOL)hasResponsePreparationTime
{
  return self->_responsePreparationTime != 0;
}

- (void)deleteResponsePreparationTime
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setResponsePreparationTime:](self, "setResponsePreparationTime:", 0);
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteFailureInfo
{
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setFailureInfo:](self, "setFailureInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowRequestGrainSummaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int16 has;
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
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientRequestId](self, "clientRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientRequestId](self, "clientRequestId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientSessionId](self, "clientSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientSessionId](self, "clientSessionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary rawSessionId](self, "rawSessionId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary rawSessionId](self, "rawSessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 4) == 0)
        goto LABEL_10;
      goto LABEL_33;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_16:
    if ((has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field();
LABEL_18:
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary requestResponseTime](self, "requestResponseTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary requestResponseTime](self, "requestResponseTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary planningTime](self, "planningTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary planningTime](self, "planningTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary queryTime](self, "queryTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary queryTime](self, "queryTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary executionTime](self, "executionTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary executionTime](self, "executionTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary responsePreparationTime](self, "responsePreparationTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary responsePreparationTime](self, "responsePreparationTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary failureInfo](self, "failureInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v24;
  if (v21)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary failureInfo](self, "failureInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v22 = v24;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
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
  $C769C4E5C1433512966D06E91CCE9505 has;
  unsigned int v23;
  int64_t status;
  int v25;
  unsigned int numPlansCreated;
  int v27;
  unsigned int numPlansCreatedForResponse;
  int v29;
  unsigned int numQueriesCreated;
  int v31;
  unsigned int numActionsCreated;
  int v33;
  unsigned int numStatementsEvaluated;
  int v35;
  unsigned int numStatementsEvaluatedFromPlanner;
  int v37;
  unsigned int numResponseGenerationRequests;
  int v39;
  unsigned int numSystemResponsesGenerated;
  int v41;
  unsigned int numSystemPromptsResolved;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  BOOL v73;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_86;
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientRequestId](self, "clientRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_85;
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientRequestId](self, "clientRequestId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientRequestId](self, "clientRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_86;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientSessionId](self, "clientSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_85;
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientSessionId](self, "clientSessionId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientSessionId](self, "clientSessionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientSessionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_86;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary rawSessionId](self, "rawSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_85;
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary rawSessionId](self, "rawSessionId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary rawSessionId](self, "rawSessionId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rawSessionId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_86;
  }
  else
  {

  }
  has = self->_has;
  v23 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v23 & 1))
    goto LABEL_86;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    status = self->_status;
    if (status != objc_msgSend(v4, "status"))
      goto LABEL_86;
    has = self->_has;
    v23 = v4[64];
  }
  v25 = (*(unsigned int *)&has >> 1) & 1;
  if (v25 != ((v23 >> 1) & 1))
    goto LABEL_86;
  if (v25)
  {
    numPlansCreated = self->_numPlansCreated;
    if (numPlansCreated != objc_msgSend(v4, "numPlansCreated"))
      goto LABEL_86;
    has = self->_has;
    v23 = v4[64];
  }
  v27 = (*(unsigned int *)&has >> 2) & 1;
  if (v27 != ((v23 >> 2) & 1))
    goto LABEL_86;
  if (v27)
  {
    numPlansCreatedForResponse = self->_numPlansCreatedForResponse;
    if (numPlansCreatedForResponse != objc_msgSend(v4, "numPlansCreatedForResponse"))
      goto LABEL_86;
    has = self->_has;
    v23 = v4[64];
  }
  v29 = (*(unsigned int *)&has >> 3) & 1;
  if (v29 != ((v23 >> 3) & 1))
    goto LABEL_86;
  if (v29)
  {
    numQueriesCreated = self->_numQueriesCreated;
    if (numQueriesCreated != objc_msgSend(v4, "numQueriesCreated"))
      goto LABEL_86;
    has = self->_has;
    v23 = v4[64];
  }
  v31 = (*(unsigned int *)&has >> 4) & 1;
  if (v31 != ((v23 >> 4) & 1))
    goto LABEL_86;
  if (v31)
  {
    numActionsCreated = self->_numActionsCreated;
    if (numActionsCreated != objc_msgSend(v4, "numActionsCreated"))
      goto LABEL_86;
    has = self->_has;
    v23 = v4[64];
  }
  v33 = (*(unsigned int *)&has >> 5) & 1;
  if (v33 != ((v23 >> 5) & 1))
    goto LABEL_86;
  if (v33)
  {
    numStatementsEvaluated = self->_numStatementsEvaluated;
    if (numStatementsEvaluated != objc_msgSend(v4, "numStatementsEvaluated"))
      goto LABEL_86;
    has = self->_has;
    v23 = v4[64];
  }
  v35 = (*(unsigned int *)&has >> 6) & 1;
  if (v35 != ((v23 >> 6) & 1))
    goto LABEL_86;
  if (v35)
  {
    numStatementsEvaluatedFromPlanner = self->_numStatementsEvaluatedFromPlanner;
    if (numStatementsEvaluatedFromPlanner != objc_msgSend(v4, "numStatementsEvaluatedFromPlanner"))
      goto LABEL_86;
    has = self->_has;
    v23 = v4[64];
  }
  v37 = (*(unsigned int *)&has >> 7) & 1;
  if (v37 != ((v23 >> 7) & 1))
    goto LABEL_86;
  if (v37)
  {
    numResponseGenerationRequests = self->_numResponseGenerationRequests;
    if (numResponseGenerationRequests != objc_msgSend(v4, "numResponseGenerationRequests"))
      goto LABEL_86;
    has = self->_has;
    v23 = v4[64];
  }
  v39 = (*(unsigned int *)&has >> 8) & 1;
  if (v39 != ((v23 >> 8) & 1))
    goto LABEL_86;
  if (v39)
  {
    numSystemResponsesGenerated = self->_numSystemResponsesGenerated;
    if (numSystemResponsesGenerated != objc_msgSend(v4, "numSystemResponsesGenerated"))
      goto LABEL_86;
    has = self->_has;
    v23 = v4[64];
  }
  v41 = (*(unsigned int *)&has >> 9) & 1;
  if (v41 != ((v23 >> 9) & 1))
    goto LABEL_86;
  if (v41)
  {
    numSystemPromptsResolved = self->_numSystemPromptsResolved;
    if (numSystemPromptsResolved != objc_msgSend(v4, "numSystemPromptsResolved"))
      goto LABEL_86;
  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary requestResponseTime](self, "requestResponseTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestResponseTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_85;
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary requestResponseTime](self, "requestResponseTime");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary requestResponseTime](self, "requestResponseTime");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestResponseTime");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_86;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary planningTime](self, "planningTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planningTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_85;
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary planningTime](self, "planningTime");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary planningTime](self, "planningTime");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planningTime");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_86;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary queryTime](self, "queryTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_85;
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary queryTime](self, "queryTime");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary queryTime](self, "queryTime");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryTime");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_86;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary executionTime](self, "executionTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executionTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_85;
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary executionTime](self, "executionTime");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary executionTime](self, "executionTime");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executionTime");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_86;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary responsePreparationTime](self, "responsePreparationTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responsePreparationTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_85;
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary responsePreparationTime](self, "responsePreparationTime");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary responsePreparationTime](self, "responsePreparationTime");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responsePreparationTime");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_86;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary failureInfo](self, "failureInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_85:

    goto LABEL_86;
  }
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary failureInfo](self, "failureInfo");
  v68 = objc_claimAutoreleasedReturnValue();
  if (!v68)
  {

LABEL_89:
    v73 = 1;
    goto LABEL_87;
  }
  v69 = (void *)v68;
  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary failureInfo](self, "failureInfo");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v70, "isEqual:", v71);

  if ((v72 & 1) != 0)
    goto LABEL_89;
LABEL_86:
  v73 = 0;
LABEL_87:

  return v73;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  __int16 has;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  v3 = -[SISchemaUUID hash](self->_clientRequestId, "hash");
  v4 = -[SISchemaUUID hash](self->_clientSessionId, "hash");
  v5 = -[SISchemaUUID hash](self->_rawSessionId, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v7 = 2654435761 * self->_status;
    if ((has & 2) != 0)
    {
LABEL_3:
      v8 = 2654435761 * self->_numPlansCreated;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v7 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v9 = 2654435761 * self->_numPlansCreatedForResponse;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v10 = 2654435761 * self->_numQueriesCreated;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v11 = 2654435761 * self->_numActionsCreated;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v11 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v12 = 2654435761 * self->_numStatementsEvaluated;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v12 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v13 = 2654435761 * self->_numStatementsEvaluatedFromPlanner;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v13 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v14 = 2654435761 * self->_numResponseGenerationRequests;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
LABEL_20:
    v15 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
LABEL_21:
    v16 = 0;
    goto LABEL_22;
  }
LABEL_19:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_20;
LABEL_10:
  v15 = 2654435761 * self->_numSystemResponsesGenerated;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_21;
LABEL_11:
  v16 = 2654435761 * self->_numSystemPromptsResolved;
LABEL_22:
  v17 = v4 ^ v3 ^ v5 ^ v7;
  v18 = v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_requestResponseTime, "hash");
  v19 = v17 ^ v18 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_planningTime, "hash");
  v20 = -[PNRODSchemaPNRODMetricDuration hash](self->_queryTime, "hash");
  v21 = v20 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_executionTime, "hash");
  v22 = v21 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_responsePreparationTime, "hash");
  return v19 ^ v22 ^ -[PNRODSchemaPNRODFailureInfo hash](self->_failureInfo, "hash");
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
  __int16 has;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clientRequestId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientRequestId](self, "clientRequestId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clientRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientRequestId"));

    }
  }
  if (self->_clientSessionId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary clientSessionId](self, "clientSessionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("clientSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("clientSessionId"));

    }
  }
  if (self->_executionTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary executionTime](self, "executionTime");
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
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary failureInfo](self, "failureInfo");
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
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numActionsCreated](self, "numActionsCreated"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("numActionsCreated"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_23:
      if ((has & 4) == 0)
        goto LABEL_24;
      goto LABEL_36;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numPlansCreated](self, "numPlansCreated"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("numPlansCreated"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_24:
    if ((has & 8) == 0)
      goto LABEL_25;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numPlansCreatedForResponse](self, "numPlansCreatedForResponse"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("numPlansCreatedForResponse"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_25:
    if ((has & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numQueriesCreated](self, "numQueriesCreated"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("numQueriesCreated"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_26:
    if ((has & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numResponseGenerationRequests](self, "numResponseGenerationRequests"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("numResponseGenerationRequests"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_27:
    if ((has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numStatementsEvaluated](self, "numStatementsEvaluated"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("numStatementsEvaluated"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_28:
    if ((has & 0x200) == 0)
      goto LABEL_29;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numStatementsEvaluatedFromPlanner](self, "numStatementsEvaluatedFromPlanner"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("numStatementsEvaluatedFromPlanner"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_29:
    if ((has & 0x100) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numSystemPromptsResolved](self, "numSystemPromptsResolved"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("numSystemPromptsResolved"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numSystemResponsesGenerated](self, "numSystemResponsesGenerated"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("numSystemResponsesGenerated"));

  }
LABEL_31:
  if (self->_planningTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary planningTime](self, "planningTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("planningTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("planningTime"));

    }
  }
  if (self->_queryTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary queryTime](self, "queryTime");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("queryTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("queryTime"));

    }
  }
  if (self->_rawSessionId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary rawSessionId](self, "rawSessionId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("rawSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("rawSessionId"));

    }
  }
  if (self->_requestResponseTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary requestResponseTime](self, "requestResponseTime");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("requestResponseTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("requestResponseTime"));

    }
  }
  if (self->_responsePreparationTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary responsePreparationTime](self, "responsePreparationTime");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("responsePreparationTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("responsePreparationTime"));

    }
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary status](self, "status"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("status"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary)initWithJSON:(id)a3
{
  void *v4;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *v5;
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
    self = -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary)initWithDictionary:(id)a3
{
  id v4;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  uint64_t v8;
  SISchemaUUID *v9;
  uint64_t v10;
  SISchemaUUID *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PNRODSchemaPNRODMetricDuration *v24;
  void *v25;
  PNRODSchemaPNRODMetricDuration *v26;
  void *v27;
  PNRODSchemaPNRODMetricDuration *v28;
  void *v29;
  PNRODSchemaPNRODMetricDuration *v30;
  void *v31;
  PNRODSchemaPNRODMetricDuration *v32;
  void *v33;
  PNRODSchemaPNRODFailureInfo *v34;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary;
  v5 = -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary init](&v49, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientRequestId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setClientRequestId:](v5, "setClientRequestId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientSessionId"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setClientSessionId:](v5, "setClientSessionId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawSessionId"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setRawSessionId:](v5, "setRawSessionId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setStatus:](v5, "setStatus:", objc_msgSend(v12, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numPlansCreated"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumPlansCreated:](v5, "setNumPlansCreated:", objc_msgSend(v13, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numPlansCreatedForResponse"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumPlansCreatedForResponse:](v5, "setNumPlansCreatedForResponse:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numQueriesCreated"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumQueriesCreated:](v5, "setNumQueriesCreated:", objc_msgSend(v15, "unsignedIntValue"));
    v42 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionsCreated"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumActionsCreated:](v5, "setNumActionsCreated:", objc_msgSend(v16, "unsignedIntValue"));
    v17 = (void *)v6;
    v39 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numStatementsEvaluated"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumStatementsEvaluated:](v5, "setNumStatementsEvaluated:", objc_msgSend(v18, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numStatementsEvaluatedFromPlanner"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v46 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumStatementsEvaluatedFromPlanner:](v5, "setNumStatementsEvaluatedFromPlanner:", objc_msgSend(v19, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numResponseGenerationRequests"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumResponseGenerationRequests:](v5, "setNumResponseGenerationRequests:", objc_msgSend(v20, "unsignedIntValue"));
    v44 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSystemResponsesGenerated"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumSystemResponsesGenerated:](v5, "setNumSystemResponsesGenerated:", objc_msgSend(v21, "unsignedIntValue"));
    v38 = v20;
    v43 = (void *)v10;
    v45 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSystemPromptsResolved"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumSystemPromptsResolved:](v5, "setNumSystemPromptsResolved:", objc_msgSend(v22, "unsignedIntValue"));
    v41 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestResponseTime"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v23);
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setRequestResponseTime:](v5, "setRequestResponseTime:", v24);

    }
    v40 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planningTime"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v25);
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setPlanningTime:](v5, "setPlanningTime:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryTime"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v27);
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setQueryTime:](v5, "setQueryTime:", v28);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionTime"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v29);
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setExecutionTime:](v5, "setExecutionTime:", v30);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responsePreparationTime"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v31);
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setResponsePreparationTime:](v5, "setResponsePreparationTime:", v32);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureInfo"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[PNRODSchemaPNRODFailureInfo initWithDictionary:]([PNRODSchemaPNRODFailureInfo alloc], "initWithDictionary:", v33);
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setFailureInfo:](v5, "setFailureInfo:", v34);

    }
    v35 = v5;

  }
  return v5;
}

- (SISchemaUUID)clientRequestId
{
  return self->_clientRequestId;
}

- (void)setClientRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_clientRequestId, a3);
}

- (SISchemaUUID)clientSessionId
{
  return self->_clientSessionId;
}

- (void)setClientSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_clientSessionId, a3);
}

- (SISchemaUUID)rawSessionId
{
  return self->_rawSessionId;
}

- (void)setRawSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_rawSessionId, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (unsigned)numPlansCreated
{
  return self->_numPlansCreated;
}

- (unsigned)numPlansCreatedForResponse
{
  return self->_numPlansCreatedForResponse;
}

- (unsigned)numQueriesCreated
{
  return self->_numQueriesCreated;
}

- (unsigned)numActionsCreated
{
  return self->_numActionsCreated;
}

- (unsigned)numStatementsEvaluated
{
  return self->_numStatementsEvaluated;
}

- (unsigned)numStatementsEvaluatedFromPlanner
{
  return self->_numStatementsEvaluatedFromPlanner;
}

- (unsigned)numResponseGenerationRequests
{
  return self->_numResponseGenerationRequests;
}

- (unsigned)numSystemResponsesGenerated
{
  return self->_numSystemResponsesGenerated;
}

- (unsigned)numSystemPromptsResolved
{
  return self->_numSystemPromptsResolved;
}

- (PNRODSchemaPNRODMetricDuration)requestResponseTime
{
  return self->_requestResponseTime;
}

- (void)setRequestResponseTime:(id)a3
{
  objc_storeStrong((id *)&self->_requestResponseTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)planningTime
{
  return self->_planningTime;
}

- (void)setPlanningTime:(id)a3
{
  objc_storeStrong((id *)&self->_planningTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)queryTime
{
  return self->_queryTime;
}

- (void)setQueryTime:(id)a3
{
  objc_storeStrong((id *)&self->_queryTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)executionTime
{
  return self->_executionTime;
}

- (void)setExecutionTime:(id)a3
{
  objc_storeStrong((id *)&self->_executionTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)responsePreparationTime
{
  return self->_responsePreparationTime;
}

- (void)setResponsePreparationTime:(id)a3
{
  objc_storeStrong((id *)&self->_responsePreparationTime, a3);
}

- (PNRODSchemaPNRODFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setFailureInfo:(id)a3
{
  objc_storeStrong((id *)&self->_failureInfo, a3);
}

- (void)setHasClientRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasClientSessionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasRawSessionId:(BOOL)a3
{
  self->_hasClientRequestId = a3;
}

- (void)setHasRequestResponseTime:(BOOL)a3
{
  self->_hasClientSessionId = a3;
}

- (void)setHasPlanningTime:(BOOL)a3
{
  self->_hasRawSessionId = a3;
}

- (void)setHasQueryTime:(BOOL)a3
{
  self->_hasRequestResponseTime = a3;
}

- (void)setHasExecutionTime:(BOOL)a3
{
  self->_hasPlanningTime = a3;
}

- (void)setHasResponsePreparationTime:(BOOL)a3
{
  self->_hasQueryTime = a3;
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasExecutionTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_responsePreparationTime, 0);
  objc_storeStrong((id *)&self->_executionTime, 0);
  objc_storeStrong((id *)&self->_queryTime, 0);
  objc_storeStrong((id *)&self->_planningTime, 0);
  objc_storeStrong((id *)&self->_requestResponseTime, 0);
  objc_storeStrong((id *)&self->_rawSessionId, 0);
  objc_storeStrong((id *)&self->_clientSessionId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
}

@end
