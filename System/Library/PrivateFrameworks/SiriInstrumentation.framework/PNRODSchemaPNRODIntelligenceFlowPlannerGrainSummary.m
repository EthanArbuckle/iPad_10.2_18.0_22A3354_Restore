@implementation PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary

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
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  int v56;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v58, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planId](self, "planId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deletePlanId](self, "deletePlanId");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary clientRequestId](self, "clientRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteClientRequestId](self, "deleteClientRequestId");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary plannerResponseTime](self, "plannerResponseTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deletePlannerResponseTime](self, "deletePlannerResponseTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastResolverEventTime](self, "startToLastResolverEventTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteStartToLastResolverEventTime](self, "deleteStartToLastResolverEventTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteStartToActionResolverRequestTime](self, "deleteStartToActionResolverRequestTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToPlanCreatedTime](self, "startToPlanCreatedTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteStartToPlanCreatedTime](self, "deleteStartToPlanCreatedTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteStartToLastQueryDecorationEventTime](self, "deleteStartToLastQueryDecorationEventTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteLastResolverEventToResponseGeneratedTime](self, "deleteLastResolverEventToResponseGeneratedTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteActionResolverRequestToLastResolverEventTime](self, "deleteActionResolverRequestToLastResolverEventTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deletePlanCreatedToLastResolverEventTime](self, "deletePlanCreatedToLastResolverEventTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deletePlanCreatedToActionResolverRequestTime](self, "deletePlanCreatedToActionResolverRequestTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteLastQueryDecorationEventToPlanCreatedTime](self, "deleteLastQueryDecorationEventToPlanCreatedTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToContextRetrievedTime](self, "startToContextRetrievedTime");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteStartToContextRetrievedTime](self, "deleteStartToContextRetrievedTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteStartToToolsRetrievedTime](self, "deleteStartToToolsRetrievedTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteStartToEntitySpanMatchedTime](self, "deleteStartToEntitySpanMatchedTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary resolverTotalQueryTime](self, "resolverTotalQueryTime");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteResolverTotalQueryTime](self, "deleteResolverTotalQueryTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary failureInfo](self, "failureInfo");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary deleteFailureInfo](self, "deleteFailureInfo");

  return v5;
}

- (BOOL)hasPlanId
{
  return self->_planId != 0;
}

- (void)deletePlanId
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setPlanId:](self, "setPlanId:", 0);
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
}

- (void)deleteClientRequestId
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setClientRequestId:](self, "setClientRequestId:", 0);
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
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStatus:](self, "setStatus:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setPlannerGrainStage:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_plannerGrainStage = a3;
}

- (BOOL)hasPlannerGrainStage
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasPlannerGrainStage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deletePlannerGrainStage
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setPlannerGrainStage:](self, "setPlannerGrainStage:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setNumPlansCreated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numPlansCreated = a3;
}

- (BOOL)hasNumPlansCreated
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasNumPlansCreated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteNumPlansCreated
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumPlansCreated:](self, "setNumPlansCreated:", 0);
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
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumQueriesCreated:](self, "setNumQueriesCreated:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setNumQueriesExecuted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numQueriesExecuted = a3;
}

- (BOOL)hasNumQueriesExecuted
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasNumQueriesExecuted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteNumQueriesExecuted
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumQueriesExecuted:](self, "setNumQueriesExecuted:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setNumClientActionsCreated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numClientActionsCreated = a3;
}

- (BOOL)hasNumClientActionsCreated
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasNumClientActionsCreated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteNumClientActionsCreated
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumClientActionsCreated:](self, "setNumClientActionsCreated:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setNumActionResolverRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numActionResolverRequests = a3;
}

- (BOOL)hasNumActionResolverRequests
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasNumActionResolverRequests:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteNumActionResolverRequests
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumActionResolverRequests:](self, "setNumActionResolverRequests:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setNumStatementsEvaluated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numStatementsEvaluated = a3;
}

- (BOOL)hasNumStatementsEvaluated
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasNumStatementsEvaluated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteNumStatementsEvaluated
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumStatementsEvaluated:](self, "setNumStatementsEvaluated:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setNumStatementsEvaluatedFromPlanner:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numStatementsEvaluatedFromPlanner = a3;
}

- (BOOL)hasNumStatementsEvaluatedFromPlanner
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasNumStatementsEvaluatedFromPlanner:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteNumStatementsEvaluatedFromPlanner
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumStatementsEvaluatedFromPlanner:](self, "setNumStatementsEvaluatedFromPlanner:", 0);
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
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumSystemPromptsResolved:](self, "setNumSystemPromptsResolved:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (BOOL)hasPlannerResponseTime
{
  return self->_plannerResponseTime != 0;
}

- (void)deletePlannerResponseTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setPlannerResponseTime:](self, "setPlannerResponseTime:", 0);
}

- (BOOL)hasStartToLastResolverEventTime
{
  return self->_startToLastResolverEventTime != 0;
}

- (void)deleteStartToLastResolverEventTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToLastResolverEventTime:](self, "setStartToLastResolverEventTime:", 0);
}

- (BOOL)hasStartToActionResolverRequestTime
{
  return self->_startToActionResolverRequestTime != 0;
}

- (void)deleteStartToActionResolverRequestTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToActionResolverRequestTime:](self, "setStartToActionResolverRequestTime:", 0);
}

- (BOOL)hasStartToPlanCreatedTime
{
  return self->_startToPlanCreatedTime != 0;
}

- (void)deleteStartToPlanCreatedTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToPlanCreatedTime:](self, "setStartToPlanCreatedTime:", 0);
}

- (BOOL)hasStartToLastQueryDecorationEventTime
{
  return self->_startToLastQueryDecorationEventTime != 0;
}

- (void)deleteStartToLastQueryDecorationEventTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToLastQueryDecorationEventTime:](self, "setStartToLastQueryDecorationEventTime:", 0);
}

- (BOOL)hasLastResolverEventToResponseGeneratedTime
{
  return self->_lastResolverEventToResponseGeneratedTime != 0;
}

- (void)deleteLastResolverEventToResponseGeneratedTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setLastResolverEventToResponseGeneratedTime:](self, "setLastResolverEventToResponseGeneratedTime:", 0);
}

- (BOOL)hasActionResolverRequestToLastResolverEventTime
{
  return self->_actionResolverRequestToLastResolverEventTime != 0;
}

- (void)deleteActionResolverRequestToLastResolverEventTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setActionResolverRequestToLastResolverEventTime:](self, "setActionResolverRequestToLastResolverEventTime:", 0);
}

- (BOOL)hasPlanCreatedToLastResolverEventTime
{
  return self->_planCreatedToLastResolverEventTime != 0;
}

- (void)deletePlanCreatedToLastResolverEventTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setPlanCreatedToLastResolverEventTime:](self, "setPlanCreatedToLastResolverEventTime:", 0);
}

- (BOOL)hasPlanCreatedToActionResolverRequestTime
{
  return self->_planCreatedToActionResolverRequestTime != 0;
}

- (void)deletePlanCreatedToActionResolverRequestTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setPlanCreatedToActionResolverRequestTime:](self, "setPlanCreatedToActionResolverRequestTime:", 0);
}

- (BOOL)hasLastQueryDecorationEventToPlanCreatedTime
{
  return self->_lastQueryDecorationEventToPlanCreatedTime != 0;
}

- (void)deleteLastQueryDecorationEventToPlanCreatedTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setLastQueryDecorationEventToPlanCreatedTime:](self, "setLastQueryDecorationEventToPlanCreatedTime:", 0);
}

- (BOOL)hasStartToContextRetrievedTime
{
  return self->_startToContextRetrievedTime != 0;
}

- (void)deleteStartToContextRetrievedTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToContextRetrievedTime:](self, "setStartToContextRetrievedTime:", 0);
}

- (BOOL)hasStartToToolsRetrievedTime
{
  return self->_startToToolsRetrievedTime != 0;
}

- (void)deleteStartToToolsRetrievedTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToToolsRetrievedTime:](self, "setStartToToolsRetrievedTime:", 0);
}

- (BOOL)hasStartToEntitySpanMatchedTime
{
  return self->_startToEntitySpanMatchedTime != 0;
}

- (void)deleteStartToEntitySpanMatchedTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToEntitySpanMatchedTime:](self, "setStartToEntitySpanMatchedTime:", 0);
}

- (BOOL)hasResolverTotalQueryTime
{
  return self->_resolverTotalQueryTime != 0;
}

- (void)deleteResolverTotalQueryTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setResolverTotalQueryTime:](self, "setResolverTotalQueryTime:", 0);
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteFailureInfo
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setFailureInfo:](self, "setFailureInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int16 has;
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
  id v40;

  v40 = a3;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planId](self, "planId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planId](self, "planId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary clientRequestId](self, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary clientRequestId](self, "clientRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_49;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_15:
    PBDataWriterWriteUint32Field();
LABEL_16:
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary plannerResponseTime](self, "plannerResponseTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary plannerResponseTime](self, "plannerResponseTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastResolverEventTime](self, "startToLastResolverEventTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastResolverEventTime](self, "startToLastResolverEventTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToPlanCreatedTime](self, "startToPlanCreatedTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToPlanCreatedTime](self, "startToPlanCreatedTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToContextRetrievedTime](self, "startToContextRetrievedTime");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToContextRetrievedTime](self, "startToContextRetrievedTime");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary resolverTotalQueryTime](self, "resolverTotalQueryTime");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary resolverTotalQueryTime](self, "resolverTotalQueryTime");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary failureInfo](self, "failureInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v40;
  if (v37)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary failureInfo](self, "failureInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v38 = v40;
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
  $8430FF52068553F0F90F8ECDB9A62020 has;
  unsigned int v18;
  int64_t status;
  int v20;
  int64_t plannerGrainStage;
  int v22;
  unsigned int numPlansCreated;
  int v24;
  unsigned int numQueriesCreated;
  int v26;
  unsigned int numQueriesExecuted;
  int v28;
  unsigned int numClientActionsCreated;
  int v30;
  unsigned int numActionResolverRequests;
  int v32;
  unsigned int numStatementsEvaluated;
  int v34;
  unsigned int numStatementsEvaluatedFromPlanner;
  int v36;
  unsigned int numSystemPromptsResolved;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
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
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  char v112;
  BOOL v113;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_126;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planId](self, "planId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planId](self, "planId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planId](self, "planId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary clientRequestId](self, "clientRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary clientRequestId](self, "clientRequestId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary clientRequestId](self, "clientRequestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientRequestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_126;
  }
  else
  {

  }
  has = self->_has;
  v18 = v4[96];
  if ((*(_BYTE *)&has & 1) != (v18 & 1))
    goto LABEL_126;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    status = self->_status;
    if (status != objc_msgSend(v4, "status"))
      goto LABEL_126;
    has = self->_has;
    v18 = v4[96];
  }
  v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1))
    goto LABEL_126;
  if (v20)
  {
    plannerGrainStage = self->_plannerGrainStage;
    if (plannerGrainStage != objc_msgSend(v4, "plannerGrainStage"))
      goto LABEL_126;
    has = self->_has;
    v18 = v4[96];
  }
  v22 = (*(unsigned int *)&has >> 2) & 1;
  if (v22 != ((v18 >> 2) & 1))
    goto LABEL_126;
  if (v22)
  {
    numPlansCreated = self->_numPlansCreated;
    if (numPlansCreated != objc_msgSend(v4, "numPlansCreated"))
      goto LABEL_126;
    has = self->_has;
    v18 = v4[96];
  }
  v24 = (*(unsigned int *)&has >> 3) & 1;
  if (v24 != ((v18 >> 3) & 1))
    goto LABEL_126;
  if (v24)
  {
    numQueriesCreated = self->_numQueriesCreated;
    if (numQueriesCreated != objc_msgSend(v4, "numQueriesCreated"))
      goto LABEL_126;
    has = self->_has;
    v18 = v4[96];
  }
  v26 = (*(unsigned int *)&has >> 4) & 1;
  if (v26 != ((v18 >> 4) & 1))
    goto LABEL_126;
  if (v26)
  {
    numQueriesExecuted = self->_numQueriesExecuted;
    if (numQueriesExecuted != objc_msgSend(v4, "numQueriesExecuted"))
      goto LABEL_126;
    has = self->_has;
    v18 = v4[96];
  }
  v28 = (*(unsigned int *)&has >> 5) & 1;
  if (v28 != ((v18 >> 5) & 1))
    goto LABEL_126;
  if (v28)
  {
    numClientActionsCreated = self->_numClientActionsCreated;
    if (numClientActionsCreated != objc_msgSend(v4, "numClientActionsCreated"))
      goto LABEL_126;
    has = self->_has;
    v18 = v4[96];
  }
  v30 = (*(unsigned int *)&has >> 6) & 1;
  if (v30 != ((v18 >> 6) & 1))
    goto LABEL_126;
  if (v30)
  {
    numActionResolverRequests = self->_numActionResolverRequests;
    if (numActionResolverRequests != objc_msgSend(v4, "numActionResolverRequests"))
      goto LABEL_126;
    has = self->_has;
    v18 = v4[96];
  }
  v32 = (*(unsigned int *)&has >> 7) & 1;
  if (v32 != ((v18 >> 7) & 1))
    goto LABEL_126;
  if (v32)
  {
    numStatementsEvaluated = self->_numStatementsEvaluated;
    if (numStatementsEvaluated != objc_msgSend(v4, "numStatementsEvaluated"))
      goto LABEL_126;
    has = self->_has;
    v18 = v4[96];
  }
  v34 = (*(unsigned int *)&has >> 8) & 1;
  if (v34 != ((v18 >> 8) & 1))
    goto LABEL_126;
  if (v34)
  {
    numStatementsEvaluatedFromPlanner = self->_numStatementsEvaluatedFromPlanner;
    if (numStatementsEvaluatedFromPlanner != objc_msgSend(v4, "numStatementsEvaluatedFromPlanner"))
      goto LABEL_126;
    has = self->_has;
    v18 = v4[96];
  }
  v36 = (*(unsigned int *)&has >> 9) & 1;
  if (v36 != ((v18 >> 9) & 1))
    goto LABEL_126;
  if (v36)
  {
    numSystemPromptsResolved = self->_numSystemPromptsResolved;
    if (numSystemPromptsResolved != objc_msgSend(v4, "numSystemPromptsResolved"))
      goto LABEL_126;
  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary plannerResponseTime](self, "plannerResponseTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plannerResponseTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary plannerResponseTime](self, "plannerResponseTime");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary plannerResponseTime](self, "plannerResponseTime");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plannerResponseTime");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastResolverEventTime](self, "startToLastResolverEventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToLastResolverEventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastResolverEventTime](self, "startToLastResolverEventTime");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastResolverEventTime](self, "startToLastResolverEventTime");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToLastResolverEventTime");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToActionResolverRequestTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToActionResolverRequestTime");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToPlanCreatedTime](self, "startToPlanCreatedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToPlanCreatedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToPlanCreatedTime](self, "startToPlanCreatedTime");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToPlanCreatedTime](self, "startToPlanCreatedTime");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToPlanCreatedTime");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToLastQueryDecorationEventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToLastQueryDecorationEventTime");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastResolverEventToResponseGeneratedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastResolverEventToResponseGeneratedTime");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionResolverRequestToLastResolverEventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionResolverRequestToLastResolverEventTime");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planCreatedToLastResolverEventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planCreatedToLastResolverEventTime");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planCreatedToActionResolverRequestTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planCreatedToActionResolverRequestTime");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastQueryDecorationEventToPlanCreatedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastQueryDecorationEventToPlanCreatedTime");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToContextRetrievedTime](self, "startToContextRetrievedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToContextRetrievedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToContextRetrievedTime](self, "startToContextRetrievedTime");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToContextRetrievedTime](self, "startToContextRetrievedTime");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToContextRetrievedTime");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToToolsRetrievedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)v93;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToToolsRetrievedTime");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v95, "isEqual:", v96);

    if (!v97)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToEntitySpanMatchedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToEntitySpanMatchedTime");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "isEqual:", v101);

    if (!v102)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary resolverTotalQueryTime](self, "resolverTotalQueryTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolverTotalQueryTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_125;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary resolverTotalQueryTime](self, "resolverTotalQueryTime");
  v103 = objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    v104 = (void *)v103;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary resolverTotalQueryTime](self, "resolverTotalQueryTime");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolverTotalQueryTime");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v105, "isEqual:", v106);

    if (!v107)
      goto LABEL_126;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary failureInfo](self, "failureInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_125:

    goto LABEL_126;
  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary failureInfo](self, "failureInfo");
  v108 = objc_claimAutoreleasedReturnValue();
  if (!v108)
  {

LABEL_129:
    v113 = 1;
    goto LABEL_127;
  }
  v109 = (void *)v108;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary failureInfo](self, "failureInfo");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v110, "isEqual:", v111);

  if ((v112 & 1) != 0)
    goto LABEL_129;
LABEL_126:
  v113 = 0;
LABEL_127:

  return v113;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  __int16 has;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v3 = -[SISchemaUUID hash](self->_planId, "hash");
  v4 = -[SISchemaUUID hash](self->_clientRequestId, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v6 = 2654435761 * self->_status;
    if ((has & 2) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_plannerGrainStage;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v6 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v8 = 2654435761 * self->_numPlansCreated;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v9 = 2654435761 * self->_numQueriesCreated;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v9 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v10 = 2654435761 * self->_numQueriesExecuted;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v10 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v11 = 2654435761 * self->_numClientActionsCreated;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v11 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v12 = 2654435761 * self->_numActionResolverRequests;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v12 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v13 = 2654435761 * self->_numStatementsEvaluated;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
LABEL_20:
    v14 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
LABEL_19:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_20;
LABEL_10:
  v14 = 2654435761 * self->_numStatementsEvaluatedFromPlanner;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_21;
LABEL_11:
  v15 = 2654435761 * self->_numSystemPromptsResolved;
LABEL_22:
  v16 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_plannerResponseTime, "hash");
  v17 = -[PNRODSchemaPNRODMetricDuration hash](self->_startToLastResolverEventTime, "hash");
  v18 = v17 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_startToActionResolverRequestTime, "hash");
  v19 = v16 ^ v18 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_startToPlanCreatedTime, "hash");
  v20 = -[PNRODSchemaPNRODMetricDuration hash](self->_startToLastQueryDecorationEventTime, "hash");
  v21 = v20 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_lastResolverEventToResponseGeneratedTime, "hash");
  v22 = v21 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_actionResolverRequestToLastResolverEventTime, "hash");
  v23 = v19 ^ v22 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_planCreatedToLastResolverEventTime, "hash");
  v24 = -[PNRODSchemaPNRODMetricDuration hash](self->_planCreatedToActionResolverRequestTime, "hash");
  v25 = v24 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_lastQueryDecorationEventToPlanCreatedTime, "hash");
  v26 = v25 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_startToContextRetrievedTime, "hash");
  v27 = v26 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_startToToolsRetrievedTime, "hash");
  v28 = v23 ^ v27 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_startToEntitySpanMatchedTime, "hash");
  v29 = -[PNRODSchemaPNRODMetricDuration hash](self->_resolverTotalQueryTime, "hash");
  return v28 ^ v29 ^ -[PNRODSchemaPNRODFailureInfo hash](self->_failureInfo, "hash");
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
  __int16 has;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionResolverRequestToLastResolverEventTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionResolverRequestToLastResolverEventTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionResolverRequestToLastResolverEventTime"));

    }
  }
  if (self->_clientRequestId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary clientRequestId](self, "clientRequestId");
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
  if (self->_failureInfo)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary failureInfo](self, "failureInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("failureInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("failureInfo"));

    }
  }
  if (self->_lastQueryDecorationEventToPlanCreatedTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("lastQueryDecorationEventToPlanCreatedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("lastQueryDecorationEventToPlanCreatedTime"));

    }
  }
  if (self->_lastResolverEventToResponseGeneratedTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("lastResolverEventToResponseGeneratedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("lastResolverEventToResponseGeneratedTime"));

    }
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numActionResolverRequests](self, "numActionResolverRequests"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("numActionResolverRequests"));

    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_28:
      if ((has & 4) == 0)
        goto LABEL_29;
      goto LABEL_40;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numClientActionsCreated](self, "numClientActionsCreated"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("numClientActionsCreated"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_29:
    if ((has & 8) == 0)
      goto LABEL_30;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numPlansCreated](self, "numPlansCreated"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("numPlansCreated"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_30:
    if ((has & 0x10) == 0)
      goto LABEL_31;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numQueriesCreated](self, "numQueriesCreated"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("numQueriesCreated"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_31:
    if ((has & 0x80) == 0)
      goto LABEL_32;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numQueriesExecuted](self, "numQueriesExecuted"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("numQueriesExecuted"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_32:
    if ((has & 0x100) == 0)
      goto LABEL_33;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numStatementsEvaluated](self, "numStatementsEvaluated"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("numStatementsEvaluated"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_33:
    if ((has & 0x200) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numStatementsEvaluatedFromPlanner](self, "numStatementsEvaluatedFromPlanner"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("numStatementsEvaluatedFromPlanner"));

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_34:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numSystemPromptsResolved](self, "numSystemPromptsResolved"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("numSystemPromptsResolved"));

  }
LABEL_35:
  if (self->_planCreatedToActionResolverRequestTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("planCreatedToActionResolverRequestTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("planCreatedToActionResolverRequestTime"));

    }
  }
  if (self->_planCreatedToLastResolverEventTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("planCreatedToLastResolverEventTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("planCreatedToLastResolverEventTime"));

    }
  }
  if (self->_planId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary planId](self, "planId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("planId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("planId"));

    }
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary plannerGrainStage](self, "plannerGrainStage"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("plannerGrainStage"));

  }
  if (self->_plannerResponseTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary plannerResponseTime](self, "plannerResponseTime");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("plannerResponseTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("plannerResponseTime"));

    }
  }
  if (self->_resolverTotalQueryTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary resolverTotalQueryTime](self, "resolverTotalQueryTime");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("resolverTotalQueryTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("resolverTotalQueryTime"));

    }
  }
  if (self->_startToActionResolverRequestTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "dictionaryRepresentation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("startToActionResolverRequestTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("startToActionResolverRequestTime"));

    }
  }
  if (self->_startToContextRetrievedTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToContextRetrievedTime](self, "startToContextRetrievedTime");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("startToContextRetrievedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("startToContextRetrievedTime"));

    }
  }
  if (self->_startToEntitySpanMatchedTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "dictionaryRepresentation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("startToEntitySpanMatchedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("startToEntitySpanMatchedTime"));

    }
  }
  if (self->_startToLastQueryDecorationEventTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "dictionaryRepresentation");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("startToLastQueryDecorationEventTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("startToLastQueryDecorationEventTime"));

    }
  }
  if (self->_startToLastResolverEventTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToLastResolverEventTime](self, "startToLastResolverEventTime");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "dictionaryRepresentation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("startToLastResolverEventTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("startToLastResolverEventTime"));

    }
  }
  if (self->_startToPlanCreatedTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToPlanCreatedTime](self, "startToPlanCreatedTime");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "dictionaryRepresentation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("startToPlanCreatedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("startToPlanCreatedTime"));

    }
  }
  if (self->_startToToolsRetrievedTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "dictionaryRepresentation");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("startToToolsRetrievedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("startToToolsRetrievedTime"));

    }
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary status](self, "status"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("status"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v66 = v3;

  return v66;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary)initWithJSON:(id)a3
{
  void *v4;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *v5;
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
    self = -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary)initWithDictionary:(id)a3
{
  id v4;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  uint64_t v8;
  SISchemaUUID *v9;
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
  uint64_t v20;
  PNRODSchemaPNRODMetricDuration *v21;
  uint64_t v22;
  PNRODSchemaPNRODMetricDuration *v23;
  uint64_t v24;
  PNRODSchemaPNRODMetricDuration *v25;
  uint64_t v26;
  PNRODSchemaPNRODMetricDuration *v27;
  uint64_t v28;
  PNRODSchemaPNRODMetricDuration *v29;
  uint64_t v30;
  PNRODSchemaPNRODMetricDuration *v31;
  uint64_t v32;
  PNRODSchemaPNRODMetricDuration *v33;
  uint64_t v34;
  PNRODSchemaPNRODMetricDuration *v35;
  void *v36;
  PNRODSchemaPNRODMetricDuration *v37;
  void *v38;
  PNRODSchemaPNRODMetricDuration *v39;
  void *v40;
  PNRODSchemaPNRODMetricDuration *v41;
  void *v42;
  PNRODSchemaPNRODMetricDuration *v43;
  void *v44;
  PNRODSchemaPNRODMetricDuration *v45;
  void *v46;
  PNRODSchemaPNRODMetricDuration *v47;
  void *v48;
  PNRODSchemaPNRODFailureInfo *v49;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  objc_super v72;

  v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary;
  v5 = -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary init](&v72, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setPlanId:](v5, "setPlanId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientRequestId"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setClientRequestId:](v5, "setClientRequestId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStatus:](v5, "setStatus:", objc_msgSend(v10, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plannerGrainStage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setPlannerGrainStage:](v5, "setPlannerGrainStage:", objc_msgSend(v11, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numPlansCreated"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumPlansCreated:](v5, "setNumPlansCreated:", objc_msgSend(v12, "unsignedIntValue"));
    v60 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numQueriesCreated"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumQueriesCreated:](v5, "setNumQueriesCreated:", objc_msgSend(v13, "unsignedIntValue"));
    v57 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numQueriesExecuted"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumQueriesExecuted:](v5, "setNumQueriesExecuted:", objc_msgSend(v14, "unsignedIntValue"));
    v61 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numClientActionsCreated"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumClientActionsCreated:](v5, "setNumClientActionsCreated:", objc_msgSend(v15, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionResolverRequests"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v70 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumActionResolverRequests:](v5, "setNumActionResolverRequests:", objc_msgSend(v16, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numStatementsEvaluated"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumStatementsEvaluated:](v5, "setNumStatementsEvaluated:", objc_msgSend(v17, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numStatementsEvaluatedFromPlanner"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v69 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumStatementsEvaluatedFromPlanner:](v5, "setNumStatementsEvaluatedFromPlanner:", objc_msgSend(v18, "unsignedIntValue"));
    v62 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSystemPromptsResolved"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumSystemPromptsResolved:](v5, "setNumSystemPromptsResolved:", objc_msgSend(v19, "unsignedIntValue"));
    v54 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plannerResponseTime"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v20);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setPlannerResponseTime:](v5, "setPlannerResponseTime:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToLastResolverEventTime"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v68 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v22);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToLastResolverEventTime:](v5, "setStartToLastResolverEventTime:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToActionResolverRequestTime"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v67 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v24);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToActionResolverRequestTime:](v5, "setStartToActionResolverRequestTime:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToPlanCreatedTime"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v66 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v26);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToPlanCreatedTime:](v5, "setStartToPlanCreatedTime:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToLastQueryDecorationEventTime"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v28);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToLastQueryDecorationEventTime:](v5, "setStartToLastQueryDecorationEventTime:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastResolverEventToResponseGeneratedTime"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v30);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setLastResolverEventToResponseGeneratedTime:](v5, "setLastResolverEventToResponseGeneratedTime:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionResolverRequestToLastResolverEventTime"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v63 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v32);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setActionResolverRequestToLastResolverEventTime:](v5, "setActionResolverRequestToLastResolverEventTime:", v33);

    }
    v55 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planCreatedToLastResolverEventTime"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v34);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setPlanCreatedToLastResolverEventTime:](v5, "setPlanCreatedToLastResolverEventTime:", v35);

    }
    v52 = (void *)v34;
    v59 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planCreatedToActionResolverRequestTime"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v36);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setPlanCreatedToActionResolverRequestTime:](v5, "setPlanCreatedToActionResolverRequestTime:", v37);

    }
    v58 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastQueryDecorationEventToPlanCreatedTime"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v38);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setLastQueryDecorationEventToPlanCreatedTime:](v5, "setLastQueryDecorationEventToPlanCreatedTime:", v39);

    }
    v53 = (void *)v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToContextRetrievedTime"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v40);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToContextRetrievedTime:](v5, "setStartToContextRetrievedTime:", v41);

    }
    v56 = v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToToolsRetrievedTime"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v42);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToToolsRetrievedTime:](v5, "setStartToToolsRetrievedTime:", v43);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToEntitySpanMatchedTime"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v44);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStartToEntitySpanMatchedTime:](v5, "setStartToEntitySpanMatchedTime:", v45);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolverTotalQueryTime"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v46);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setResolverTotalQueryTime:](v5, "setResolverTotalQueryTime:", v47);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureInfo"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[PNRODSchemaPNRODFailureInfo initWithDictionary:]([PNRODSchemaPNRODFailureInfo alloc], "initWithDictionary:", v48);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setFailureInfo:](v5, "setFailureInfo:", v49);

    }
    v50 = v5;

  }
  return v5;
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

- (int64_t)plannerGrainStage
{
  return self->_plannerGrainStage;
}

- (unsigned)numPlansCreated
{
  return self->_numPlansCreated;
}

- (unsigned)numQueriesCreated
{
  return self->_numQueriesCreated;
}

- (unsigned)numQueriesExecuted
{
  return self->_numQueriesExecuted;
}

- (unsigned)numClientActionsCreated
{
  return self->_numClientActionsCreated;
}

- (unsigned)numActionResolverRequests
{
  return self->_numActionResolverRequests;
}

- (unsigned)numStatementsEvaluated
{
  return self->_numStatementsEvaluated;
}

- (unsigned)numStatementsEvaluatedFromPlanner
{
  return self->_numStatementsEvaluatedFromPlanner;
}

- (unsigned)numSystemPromptsResolved
{
  return self->_numSystemPromptsResolved;
}

- (PNRODSchemaPNRODMetricDuration)plannerResponseTime
{
  return self->_plannerResponseTime;
}

- (void)setPlannerResponseTime:(id)a3
{
  objc_storeStrong((id *)&self->_plannerResponseTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)startToLastResolverEventTime
{
  return self->_startToLastResolverEventTime;
}

- (void)setStartToLastResolverEventTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToLastResolverEventTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)startToActionResolverRequestTime
{
  return self->_startToActionResolverRequestTime;
}

- (void)setStartToActionResolverRequestTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToActionResolverRequestTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)startToPlanCreatedTime
{
  return self->_startToPlanCreatedTime;
}

- (void)setStartToPlanCreatedTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToPlanCreatedTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)startToLastQueryDecorationEventTime
{
  return self->_startToLastQueryDecorationEventTime;
}

- (void)setStartToLastQueryDecorationEventTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToLastQueryDecorationEventTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)lastResolverEventToResponseGeneratedTime
{
  return self->_lastResolverEventToResponseGeneratedTime;
}

- (void)setLastResolverEventToResponseGeneratedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastResolverEventToResponseGeneratedTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)actionResolverRequestToLastResolverEventTime
{
  return self->_actionResolverRequestToLastResolverEventTime;
}

- (void)setActionResolverRequestToLastResolverEventTime:(id)a3
{
  objc_storeStrong((id *)&self->_actionResolverRequestToLastResolverEventTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)planCreatedToLastResolverEventTime
{
  return self->_planCreatedToLastResolverEventTime;
}

- (void)setPlanCreatedToLastResolverEventTime:(id)a3
{
  objc_storeStrong((id *)&self->_planCreatedToLastResolverEventTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)planCreatedToActionResolverRequestTime
{
  return self->_planCreatedToActionResolverRequestTime;
}

- (void)setPlanCreatedToActionResolverRequestTime:(id)a3
{
  objc_storeStrong((id *)&self->_planCreatedToActionResolverRequestTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)lastQueryDecorationEventToPlanCreatedTime
{
  return self->_lastQueryDecorationEventToPlanCreatedTime;
}

- (void)setLastQueryDecorationEventToPlanCreatedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastQueryDecorationEventToPlanCreatedTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)startToContextRetrievedTime
{
  return self->_startToContextRetrievedTime;
}

- (void)setStartToContextRetrievedTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToContextRetrievedTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)startToToolsRetrievedTime
{
  return self->_startToToolsRetrievedTime;
}

- (void)setStartToToolsRetrievedTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToToolsRetrievedTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)startToEntitySpanMatchedTime
{
  return self->_startToEntitySpanMatchedTime;
}

- (void)setStartToEntitySpanMatchedTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToEntitySpanMatchedTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)resolverTotalQueryTime
{
  return self->_resolverTotalQueryTime;
}

- (void)setResolverTotalQueryTime:(id)a3
{
  objc_storeStrong((id *)&self->_resolverTotalQueryTime, a3);
}

- (PNRODSchemaPNRODFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setFailureInfo:(id)a3
{
  objc_storeStrong((id *)&self->_failureInfo, a3);
}

- (void)setHasPlanId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasClientRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasPlannerResponseTime:(BOOL)a3
{
  self->_hasPlanId = a3;
}

- (void)setHasStartToLastResolverEventTime:(BOOL)a3
{
  self->_hasClientRequestId = a3;
}

- (void)setHasStartToActionResolverRequestTime:(BOOL)a3
{
  self->_hasPlannerResponseTime = a3;
}

- (void)setHasStartToPlanCreatedTime:(BOOL)a3
{
  self->_hasStartToLastResolverEventTime = a3;
}

- (void)setHasStartToLastQueryDecorationEventTime:(BOOL)a3
{
  self->_hasStartToActionResolverRequestTime = a3;
}

- (void)setHasLastResolverEventToResponseGeneratedTime:(BOOL)a3
{
  self->_hasStartToPlanCreatedTime = a3;
}

- (void)setHasActionResolverRequestToLastResolverEventTime:(BOOL)a3
{
  self->_hasStartToLastQueryDecorationEventTime = a3;
}

- (void)setHasPlanCreatedToLastResolverEventTime:(BOOL)a3
{
  self->_hasLastResolverEventToResponseGeneratedTime = a3;
}

- (void)setHasPlanCreatedToActionResolverRequestTime:(BOOL)a3
{
  self->_hasActionResolverRequestToLastResolverEventTime = a3;
}

- (void)setHasLastQueryDecorationEventToPlanCreatedTime:(BOOL)a3
{
  self->_hasPlanCreatedToLastResolverEventTime = a3;
}

- (void)setHasStartToContextRetrievedTime:(BOOL)a3
{
  self->_hasPlanCreatedToActionResolverRequestTime = a3;
}

- (void)setHasStartToToolsRetrievedTime:(BOOL)a3
{
  self->_hasLastQueryDecorationEventToPlanCreatedTime = a3;
}

- (void)setHasStartToEntitySpanMatchedTime:(BOOL)a3
{
  self->_hasStartToContextRetrievedTime = a3;
}

- (void)setHasResolverTotalQueryTime:(BOOL)a3
{
  self->_hasStartToToolsRetrievedTime = a3;
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasStartToEntitySpanMatchedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_resolverTotalQueryTime, 0);
  objc_storeStrong((id *)&self->_startToEntitySpanMatchedTime, 0);
  objc_storeStrong((id *)&self->_startToToolsRetrievedTime, 0);
  objc_storeStrong((id *)&self->_startToContextRetrievedTime, 0);
  objc_storeStrong((id *)&self->_lastQueryDecorationEventToPlanCreatedTime, 0);
  objc_storeStrong((id *)&self->_planCreatedToActionResolverRequestTime, 0);
  objc_storeStrong((id *)&self->_planCreatedToLastResolverEventTime, 0);
  objc_storeStrong((id *)&self->_actionResolverRequestToLastResolverEventTime, 0);
  objc_storeStrong((id *)&self->_lastResolverEventToResponseGeneratedTime, 0);
  objc_storeStrong((id *)&self->_startToLastQueryDecorationEventTime, 0);
  objc_storeStrong((id *)&self->_startToPlanCreatedTime, 0);
  objc_storeStrong((id *)&self->_startToActionResolverRequestTime, 0);
  objc_storeStrong((id *)&self->_startToLastResolverEventTime, 0);
  objc_storeStrong((id *)&self->_plannerResponseTime, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

@end
