@implementation PNRODSchemaPNRODClientEvent

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
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PNRODSchemaPNRODClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v37, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNRODSchemaPNRODClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PNRODSchemaPNRODClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[PNRODSchemaPNRODClientEvent pnrodSiriTurnGrainSummary](self, "pnrodSiriTurnGrainSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PNRODSchemaPNRODClientEvent deletePnrodSiriTurnGrainSummary](self, "deletePnrodSiriTurnGrainSummary");
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowRequestGrainSummary](self, "pnrodIntelligenceFlowRequestGrainSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PNRODSchemaPNRODClientEvent deletePnrodIntelligenceFlowRequestGrainSummary](self, "deletePnrodIntelligenceFlowRequestGrainSummary");
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowPlannerGrainSummary](self, "pnrodIntelligenceFlowPlannerGrainSummary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PNRODSchemaPNRODClientEvent deletePnrodIntelligenceFlowPlannerGrainSummary](self, "deletePnrodIntelligenceFlowPlannerGrainSummary");
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowActionGrainSummary](self, "pnrodIntelligenceFlowActionGrainSummary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PNRODSchemaPNRODClientEvent deletePnrodIntelligenceFlowActionGrainSummary](self, "deletePnrodIntelligenceFlowActionGrainSummary");
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowSessionSummary](self, "pnrodIntelligenceFlowSessionSummary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PNRODSchemaPNRODClientEvent deletePnrodIntelligenceFlowSessionSummary](self, "deletePnrodIntelligenceFlowSessionSummary");
  -[PNRODSchemaPNRODClientEvent pnrodPNRODIntelligenceFlowPlannerComponentSummary](self, "pnrodPNRODIntelligenceFlowPlannerComponentSummary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[PNRODSchemaPNRODClientEvent deletePnrodPNRODIntelligenceFlowPlannerComponentSummary](self, "deletePnrodPNRODIntelligenceFlowPlannerComponentSummary");
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowResponseGenerationComponentSummary](self, "pnrodIntelligenceFlowResponseGenerationComponentSummary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[PNRODSchemaPNRODClientEvent deletePnrodIntelligenceFlowResponseGenerationComponentSummary](self, "deletePnrodIntelligenceFlowResponseGenerationComponentSummary");
  -[PNRODSchemaPNRODClientEvent pnronIntelligenceFlowExecutorComponentSummary](self, "pnronIntelligenceFlowExecutorComponentSummary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[PNRODSchemaPNRODClientEvent deletePnronIntelligenceFlowExecutorComponentSummary](self, "deletePnronIntelligenceFlowExecutorComponentSummary");
  -[PNRODSchemaPNRODClientEvent pnronScheduleDebugSummary](self, "pnronScheduleDebugSummary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[PNRODSchemaPNRODClientEvent deletePnronScheduleDebugSummary](self, "deletePnronScheduleDebugSummary");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[PNRODSchemaPNRODClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 8)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562A8B8[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 8)
    return 0;
  else
    return off_1E562A900[a3 - 101];
}

- (int)clockIsolationLevel
{
  if (-[PNRODSchemaPNRODClientEvent whichEvent_Type](self, "whichEvent_Type") - 101 >= 9)
    return 1;
  else
    return 2;
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[PNRODSchemaPNRODClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 8)
    return CFSTR("com.apple.aiml.siri.pnrod.PNRODClientEvent");
  else
    return off_1E563D640[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[PNRODSchemaPNRODClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setPnrodSiriTurnGrainSummary:(id)a3
{
  PNRODSchemaPNRODSiriTurnGrainSummary *v4;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *pnrodIntelligenceFlowRequestGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *pnrodIntelligenceFlowPlannerGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *pnrodIntelligenceFlowActionGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *pnrodIntelligenceFlowSessionSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *pnrodIntelligenceFlowResponseGenerationComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *pnronIntelligenceFlowExecutorComponentSummary;
  PNRODSchemaPNRODScheduleDebugSummary *pnronScheduleDebugSummary;
  unint64_t v13;
  PNRODSchemaPNRODSiriTurnGrainSummary *pnrodSiriTurnGrainSummary;

  v4 = (PNRODSchemaPNRODSiriTurnGrainSummary *)a3;
  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  v13 = 101;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = v4;

}

- (PNRODSchemaPNRODSiriTurnGrainSummary)pnrodSiriTurnGrainSummary
{
  if (self->_whichEvent_Type == 101)
    return self->_pnrodSiriTurnGrainSummary;
  else
    return (PNRODSchemaPNRODSiriTurnGrainSummary *)0;
}

- (void)deletePnrodSiriTurnGrainSummary
{
  PNRODSchemaPNRODSiriTurnGrainSummary *pnrodSiriTurnGrainSummary;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
    self->_pnrodSiriTurnGrainSummary = 0;

  }
}

- (void)setPnrodIntelligenceFlowRequestGrainSummary:(id)a3
{
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *v4;
  PNRODSchemaPNRODSiriTurnGrainSummary *pnrodSiriTurnGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *pnrodIntelligenceFlowPlannerGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *pnrodIntelligenceFlowActionGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *pnrodIntelligenceFlowSessionSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *pnrodIntelligenceFlowResponseGenerationComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *pnronIntelligenceFlowExecutorComponentSummary;
  PNRODSchemaPNRODScheduleDebugSummary *pnronScheduleDebugSummary;
  unint64_t v13;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *pnrodIntelligenceFlowRequestGrainSummary;

  v4 = (PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  v13 = 102;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = v4;

}

- (PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary)pnrodIntelligenceFlowRequestGrainSummary
{
  if (self->_whichEvent_Type == 102)
    return self->_pnrodIntelligenceFlowRequestGrainSummary;
  else
    return (PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)0;
}

- (void)deletePnrodIntelligenceFlowRequestGrainSummary
{
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *pnrodIntelligenceFlowRequestGrainSummary;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
    self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  }
}

- (void)setPnrodIntelligenceFlowPlannerGrainSummary:(id)a3
{
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *v4;
  PNRODSchemaPNRODSiriTurnGrainSummary *pnrodSiriTurnGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *pnrodIntelligenceFlowRequestGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *pnrodIntelligenceFlowActionGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *pnrodIntelligenceFlowSessionSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *pnrodIntelligenceFlowResponseGenerationComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *pnronIntelligenceFlowExecutorComponentSummary;
  PNRODSchemaPNRODScheduleDebugSummary *pnronScheduleDebugSummary;
  unint64_t v13;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *pnrodIntelligenceFlowPlannerGrainSummary;

  v4 = (PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  v13 = 103;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = v4;

}

- (PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary)pnrodIntelligenceFlowPlannerGrainSummary
{
  if (self->_whichEvent_Type == 103)
    return self->_pnrodIntelligenceFlowPlannerGrainSummary;
  else
    return (PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)0;
}

- (void)deletePnrodIntelligenceFlowPlannerGrainSummary
{
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *pnrodIntelligenceFlowPlannerGrainSummary;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
    self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  }
}

- (void)setPnrodIntelligenceFlowActionGrainSummary:(id)a3
{
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *v4;
  PNRODSchemaPNRODSiriTurnGrainSummary *pnrodSiriTurnGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *pnrodIntelligenceFlowRequestGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *pnrodIntelligenceFlowPlannerGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *pnrodIntelligenceFlowSessionSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *pnrodIntelligenceFlowResponseGenerationComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *pnronIntelligenceFlowExecutorComponentSummary;
  PNRODSchemaPNRODScheduleDebugSummary *pnronScheduleDebugSummary;
  unint64_t v13;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *pnrodIntelligenceFlowActionGrainSummary;

  v4 = (PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  v13 = 104;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = v4;

}

- (PNRODSchemaPNRODIntelligenceFlowActionGrainSummary)pnrodIntelligenceFlowActionGrainSummary
{
  if (self->_whichEvent_Type == 104)
    return self->_pnrodIntelligenceFlowActionGrainSummary;
  else
    return (PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)0;
}

- (void)deletePnrodIntelligenceFlowActionGrainSummary
{
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *pnrodIntelligenceFlowActionGrainSummary;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
    self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  }
}

- (void)setPnrodIntelligenceFlowSessionSummary:(id)a3
{
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *v4;
  PNRODSchemaPNRODSiriTurnGrainSummary *pnrodSiriTurnGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *pnrodIntelligenceFlowRequestGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *pnrodIntelligenceFlowPlannerGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *pnrodIntelligenceFlowActionGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *pnrodIntelligenceFlowResponseGenerationComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *pnronIntelligenceFlowExecutorComponentSummary;
  PNRODSchemaPNRODScheduleDebugSummary *pnronScheduleDebugSummary;
  unint64_t v13;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *pnrodIntelligenceFlowSessionSummary;

  v4 = (PNRODSchemaPNRODIntelligenceFlowSessionSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  v13 = 105;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = v4;

}

- (PNRODSchemaPNRODIntelligenceFlowSessionSummary)pnrodIntelligenceFlowSessionSummary
{
  if (self->_whichEvent_Type == 105)
    return self->_pnrodIntelligenceFlowSessionSummary;
  else
    return (PNRODSchemaPNRODIntelligenceFlowSessionSummary *)0;
}

- (void)deletePnrodIntelligenceFlowSessionSummary
{
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *pnrodIntelligenceFlowSessionSummary;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
    self->_pnrodIntelligenceFlowSessionSummary = 0;

  }
}

- (void)setPnrodPNRODIntelligenceFlowPlannerComponentSummary:(id)a3
{
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *v4;
  PNRODSchemaPNRODSiriTurnGrainSummary *pnrodSiriTurnGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *pnrodIntelligenceFlowRequestGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *pnrodIntelligenceFlowPlannerGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *pnrodIntelligenceFlowActionGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *pnrodIntelligenceFlowSessionSummary;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *pnrodIntelligenceFlowResponseGenerationComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *pnronIntelligenceFlowExecutorComponentSummary;
  PNRODSchemaPNRODScheduleDebugSummary *pnronScheduleDebugSummary;
  unint64_t v13;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *pnrodPNRODIntelligenceFlowPlannerComponentSummary;

  v4 = (PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  v13 = 106;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = v4;

}

- (PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary)pnrodPNRODIntelligenceFlowPlannerComponentSummary
{
  if (self->_whichEvent_Type == 106)
    return self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  else
    return (PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)0;
}

- (void)deletePnrodPNRODIntelligenceFlowPlannerComponentSummary
{
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *pnrodPNRODIntelligenceFlowPlannerComponentSummary;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
    self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  }
}

- (void)setPnrodIntelligenceFlowResponseGenerationComponentSummary:(id)a3
{
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *v4;
  PNRODSchemaPNRODSiriTurnGrainSummary *pnrodSiriTurnGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *pnrodIntelligenceFlowRequestGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *pnrodIntelligenceFlowPlannerGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *pnrodIntelligenceFlowActionGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *pnrodIntelligenceFlowSessionSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *pnronIntelligenceFlowExecutorComponentSummary;
  PNRODSchemaPNRODScheduleDebugSummary *pnronScheduleDebugSummary;
  unint64_t v13;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *pnrodIntelligenceFlowResponseGenerationComponentSummary;

  v4 = (PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  v13 = 107;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = v4;

}

- (PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary)pnrodIntelligenceFlowResponseGenerationComponentSummary
{
  if (self->_whichEvent_Type == 107)
    return self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  else
    return (PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)0;
}

- (void)deletePnrodIntelligenceFlowResponseGenerationComponentSummary
{
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *pnrodIntelligenceFlowResponseGenerationComponentSummary;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
    self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  }
}

- (void)setPnronIntelligenceFlowExecutorComponentSummary:(id)a3
{
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *v4;
  PNRODSchemaPNRODSiriTurnGrainSummary *pnrodSiriTurnGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *pnrodIntelligenceFlowRequestGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *pnrodIntelligenceFlowPlannerGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *pnrodIntelligenceFlowActionGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *pnrodIntelligenceFlowSessionSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *pnrodIntelligenceFlowResponseGenerationComponentSummary;
  PNRODSchemaPNRODScheduleDebugSummary *pnronScheduleDebugSummary;
  unint64_t v13;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *pnronIntelligenceFlowExecutorComponentSummary;

  v4 = (PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  v13 = 108;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = v4;

}

- (PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary)pnronIntelligenceFlowExecutorComponentSummary
{
  if (self->_whichEvent_Type == 108)
    return self->_pnronIntelligenceFlowExecutorComponentSummary;
  else
    return (PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)0;
}

- (void)deletePnronIntelligenceFlowExecutorComponentSummary
{
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *pnronIntelligenceFlowExecutorComponentSummary;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
    self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  }
}

- (void)setPnronScheduleDebugSummary:(id)a3
{
  PNRODSchemaPNRODScheduleDebugSummary *v4;
  PNRODSchemaPNRODSiriTurnGrainSummary *pnrodSiriTurnGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *pnrodIntelligenceFlowRequestGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *pnrodIntelligenceFlowPlannerGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *pnrodIntelligenceFlowActionGrainSummary;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *pnrodIntelligenceFlowSessionSummary;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *pnrodIntelligenceFlowResponseGenerationComponentSummary;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *pnronIntelligenceFlowExecutorComponentSummary;
  unint64_t v13;
  PNRODSchemaPNRODScheduleDebugSummary *pnronScheduleDebugSummary;

  v4 = (PNRODSchemaPNRODScheduleDebugSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  v13 = 109;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = v4;

}

- (PNRODSchemaPNRODScheduleDebugSummary)pnronScheduleDebugSummary
{
  if (self->_whichEvent_Type == 109)
    return self->_pnronScheduleDebugSummary;
  else
    return (PNRODSchemaPNRODScheduleDebugSummary *)0;
}

- (void)deletePnronScheduleDebugSummary
{
  PNRODSchemaPNRODScheduleDebugSummary *pnronScheduleDebugSummary;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
    self->_pnronScheduleDebugSummary = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODClientEventReadFrom(self, (uint64_t)a3);
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
  -[PNRODSchemaPNRODClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNRODSchemaPNRODClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODClientEvent pnrodSiriTurnGrainSummary](self, "pnrodSiriTurnGrainSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNRODSchemaPNRODClientEvent pnrodSiriTurnGrainSummary](self, "pnrodSiriTurnGrainSummary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowRequestGrainSummary](self, "pnrodIntelligenceFlowRequestGrainSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowRequestGrainSummary](self, "pnrodIntelligenceFlowRequestGrainSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowPlannerGrainSummary](self, "pnrodIntelligenceFlowPlannerGrainSummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowPlannerGrainSummary](self, "pnrodIntelligenceFlowPlannerGrainSummary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowActionGrainSummary](self, "pnrodIntelligenceFlowActionGrainSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowActionGrainSummary](self, "pnrodIntelligenceFlowActionGrainSummary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowSessionSummary](self, "pnrodIntelligenceFlowSessionSummary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowSessionSummary](self, "pnrodIntelligenceFlowSessionSummary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODClientEvent pnrodPNRODIntelligenceFlowPlannerComponentSummary](self, "pnrodPNRODIntelligenceFlowPlannerComponentSummary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PNRODSchemaPNRODClientEvent pnrodPNRODIntelligenceFlowPlannerComponentSummary](self, "pnrodPNRODIntelligenceFlowPlannerComponentSummary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowResponseGenerationComponentSummary](self, "pnrodIntelligenceFlowResponseGenerationComponentSummary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowResponseGenerationComponentSummary](self, "pnrodIntelligenceFlowResponseGenerationComponentSummary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODClientEvent pnronIntelligenceFlowExecutorComponentSummary](self, "pnronIntelligenceFlowExecutorComponentSummary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PNRODSchemaPNRODClientEvent pnronIntelligenceFlowExecutorComponentSummary](self, "pnronIntelligenceFlowExecutorComponentSummary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODClientEvent pnronScheduleDebugSummary](self, "pnronScheduleDebugSummary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[PNRODSchemaPNRODClientEvent pnronScheduleDebugSummary](self, "pnronScheduleDebugSummary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
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
  char v57;
  BOOL v58;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_53;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_53;
  -[PNRODSchemaPNRODClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[PNRODSchemaPNRODClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PNRODSchemaPNRODClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_53;
  }
  else
  {

  }
  -[PNRODSchemaPNRODClientEvent pnrodSiriTurnGrainSummary](self, "pnrodSiriTurnGrainSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pnrodSiriTurnGrainSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[PNRODSchemaPNRODClientEvent pnrodSiriTurnGrainSummary](self, "pnrodSiriTurnGrainSummary");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PNRODSchemaPNRODClientEvent pnrodSiriTurnGrainSummary](self, "pnrodSiriTurnGrainSummary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pnrodSiriTurnGrainSummary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_53;
  }
  else
  {

  }
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowRequestGrainSummary](self, "pnrodIntelligenceFlowRequestGrainSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pnrodIntelligenceFlowRequestGrainSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowRequestGrainSummary](self, "pnrodIntelligenceFlowRequestGrainSummary");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowRequestGrainSummary](self, "pnrodIntelligenceFlowRequestGrainSummary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pnrodIntelligenceFlowRequestGrainSummary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_53;
  }
  else
  {

  }
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowPlannerGrainSummary](self, "pnrodIntelligenceFlowPlannerGrainSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pnrodIntelligenceFlowPlannerGrainSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowPlannerGrainSummary](self, "pnrodIntelligenceFlowPlannerGrainSummary");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowPlannerGrainSummary](self, "pnrodIntelligenceFlowPlannerGrainSummary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pnrodIntelligenceFlowPlannerGrainSummary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_53;
  }
  else
  {

  }
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowActionGrainSummary](self, "pnrodIntelligenceFlowActionGrainSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pnrodIntelligenceFlowActionGrainSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowActionGrainSummary](self, "pnrodIntelligenceFlowActionGrainSummary");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowActionGrainSummary](self, "pnrodIntelligenceFlowActionGrainSummary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pnrodIntelligenceFlowActionGrainSummary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_53;
  }
  else
  {

  }
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowSessionSummary](self, "pnrodIntelligenceFlowSessionSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pnrodIntelligenceFlowSessionSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowSessionSummary](self, "pnrodIntelligenceFlowSessionSummary");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowSessionSummary](self, "pnrodIntelligenceFlowSessionSummary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pnrodIntelligenceFlowSessionSummary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_53;
  }
  else
  {

  }
  -[PNRODSchemaPNRODClientEvent pnrodPNRODIntelligenceFlowPlannerComponentSummary](self, "pnrodPNRODIntelligenceFlowPlannerComponentSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pnrodPNRODIntelligenceFlowPlannerComponentSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[PNRODSchemaPNRODClientEvent pnrodPNRODIntelligenceFlowPlannerComponentSummary](self, "pnrodPNRODIntelligenceFlowPlannerComponentSummary");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[PNRODSchemaPNRODClientEvent pnrodPNRODIntelligenceFlowPlannerComponentSummary](self, "pnrodPNRODIntelligenceFlowPlannerComponentSummary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pnrodPNRODIntelligenceFlowPlannerComponentSummary");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_53;
  }
  else
  {

  }
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowResponseGenerationComponentSummary](self, "pnrodIntelligenceFlowResponseGenerationComponentSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pnrodIntelligenceFlowResponseGenerationComponentSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowResponseGenerationComponentSummary](self, "pnrodIntelligenceFlowResponseGenerationComponentSummary");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowResponseGenerationComponentSummary](self, "pnrodIntelligenceFlowResponseGenerationComponentSummary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pnrodIntelligenceFlowResponseGenerationComponentSummary");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_53;
  }
  else
  {

  }
  -[PNRODSchemaPNRODClientEvent pnronIntelligenceFlowExecutorComponentSummary](self, "pnronIntelligenceFlowExecutorComponentSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pnronIntelligenceFlowExecutorComponentSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[PNRODSchemaPNRODClientEvent pnronIntelligenceFlowExecutorComponentSummary](self, "pnronIntelligenceFlowExecutorComponentSummary");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[PNRODSchemaPNRODClientEvent pnronIntelligenceFlowExecutorComponentSummary](self, "pnronIntelligenceFlowExecutorComponentSummary");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pnronIntelligenceFlowExecutorComponentSummary");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_53;
  }
  else
  {

  }
  -[PNRODSchemaPNRODClientEvent pnronScheduleDebugSummary](self, "pnronScheduleDebugSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pnronScheduleDebugSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[PNRODSchemaPNRODClientEvent pnronScheduleDebugSummary](self, "pnronScheduleDebugSummary");
    v53 = objc_claimAutoreleasedReturnValue();
    if (!v53)
    {

LABEL_56:
      v58 = 1;
      goto LABEL_54;
    }
    v54 = (void *)v53;
    -[PNRODSchemaPNRODClientEvent pnronScheduleDebugSummary](self, "pnronScheduleDebugSummary");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pnronScheduleDebugSummary");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if ((v57 & 1) != 0)
      goto LABEL_56;
  }
  else
  {
LABEL_52:

  }
LABEL_53:
  v58 = 0;
LABEL_54:

  return v58;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = -[PNRODSchemaPNRODClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[PNRODSchemaPNRODSiriTurnGrainSummary hash](self->_pnrodSiriTurnGrainSummary, "hash") ^ v3;
  v5 = -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary hash](self->_pnrodIntelligenceFlowRequestGrainSummary, "hash");
  v6 = v4 ^ v5 ^ -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary hash](self->_pnrodIntelligenceFlowPlannerGrainSummary, "hash");
  v7 = -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary hash](self->_pnrodIntelligenceFlowActionGrainSummary, "hash");
  v8 = v7 ^ -[PNRODSchemaPNRODIntelligenceFlowSessionSummary hash](self->_pnrodIntelligenceFlowSessionSummary, "hash");
  v9 = v6 ^ v8 ^ -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary hash](self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary, "hash");
  v10 = -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary hash](self->_pnrodIntelligenceFlowResponseGenerationComponentSummary, "hash");
  v11 = v10 ^ -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary hash](self->_pnronIntelligenceFlowExecutorComponentSummary, "hash");
  return v9 ^ v11 ^ -[PNRODSchemaPNRODScheduleDebugSummary hash](self->_pnronScheduleDebugSummary, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[PNRODSchemaPNRODClientEvent eventMetadata](self, "eventMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventMetadata"));

    }
  }
  if (self->_pnrodIntelligenceFlowActionGrainSummary)
  {
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowActionGrainSummary](self, "pnrodIntelligenceFlowActionGrainSummary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("pnrodIntelligenceFlowActionGrainSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("pnrodIntelligenceFlowActionGrainSummary"));

    }
  }
  if (self->_pnrodIntelligenceFlowPlannerGrainSummary)
  {
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowPlannerGrainSummary](self, "pnrodIntelligenceFlowPlannerGrainSummary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("pnrodIntelligenceFlowPlannerGrainSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("pnrodIntelligenceFlowPlannerGrainSummary"));

    }
  }
  if (self->_pnrodIntelligenceFlowRequestGrainSummary)
  {
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowRequestGrainSummary](self, "pnrodIntelligenceFlowRequestGrainSummary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("pnrodIntelligenceFlowRequestGrainSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("pnrodIntelligenceFlowRequestGrainSummary"));

    }
  }
  if (self->_pnrodIntelligenceFlowResponseGenerationComponentSummary)
  {
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowResponseGenerationComponentSummary](self, "pnrodIntelligenceFlowResponseGenerationComponentSummary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("pnrodIntelligenceFlowResponseGenerationComponentSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("pnrodIntelligenceFlowResponseGenerationComponentSummary"));

    }
  }
  if (self->_pnrodIntelligenceFlowSessionSummary)
  {
    -[PNRODSchemaPNRODClientEvent pnrodIntelligenceFlowSessionSummary](self, "pnrodIntelligenceFlowSessionSummary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("pnrodIntelligenceFlowSessionSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("pnrodIntelligenceFlowSessionSummary"));

    }
  }
  if (self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary)
  {
    -[PNRODSchemaPNRODClientEvent pnrodPNRODIntelligenceFlowPlannerComponentSummary](self, "pnrodPNRODIntelligenceFlowPlannerComponentSummary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("pnrodPNRODIntelligenceFlowPlannerComponentSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("pnrodPNRODIntelligenceFlowPlannerComponentSummary"));

    }
  }
  if (self->_pnrodSiriTurnGrainSummary)
  {
    -[PNRODSchemaPNRODClientEvent pnrodSiriTurnGrainSummary](self, "pnrodSiriTurnGrainSummary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("pnrodSiriTurnGrainSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("pnrodSiriTurnGrainSummary"));

    }
  }
  if (self->_pnronIntelligenceFlowExecutorComponentSummary)
  {
    -[PNRODSchemaPNRODClientEvent pnronIntelligenceFlowExecutorComponentSummary](self, "pnronIntelligenceFlowExecutorComponentSummary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("pnronIntelligenceFlowExecutorComponentSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("pnronIntelligenceFlowExecutorComponentSummary"));

    }
  }
  if (self->_pnronScheduleDebugSummary)
  {
    -[PNRODSchemaPNRODClientEvent pnronScheduleDebugSummary](self, "pnronScheduleDebugSummary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("pnronScheduleDebugSummary"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("pnronScheduleDebugSummary"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRODSchemaPNRODClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRODSchemaPNRODClientEvent)initWithJSON:(id)a3
{
  void *v4;
  PNRODSchemaPNRODClientEvent *v5;
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
    self = -[PNRODSchemaPNRODClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRODSchemaPNRODClientEvent)initWithDictionary:(id)a3
{
  id v4;
  PNRODSchemaPNRODClientEvent *v5;
  uint64_t v6;
  PNRODSchemaPNRODClientEventMetadata *v7;
  uint64_t v8;
  PNRODSchemaPNRODSiriTurnGrainSummary *v9;
  uint64_t v10;
  PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *v11;
  uint64_t v12;
  PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *v13;
  void *v14;
  PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *v15;
  void *v16;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *v17;
  void *v18;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *v19;
  void *v20;
  void *v21;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *v22;
  void *v23;
  PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *v24;
  void *v25;
  PNRODSchemaPNRODScheduleDebugSummary *v26;
  PNRODSchemaPNRODClientEvent *v27;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PNRODSchemaPNRODClientEvent;
  v5 = -[PNRODSchemaPNRODClientEvent init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PNRODSchemaPNRODClientEventMetadata initWithDictionary:]([PNRODSchemaPNRODClientEventMetadata alloc], "initWithDictionary:", v6);
      -[PNRODSchemaPNRODClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pnrodSiriTurnGrainSummary"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PNRODSchemaPNRODSiriTurnGrainSummary initWithDictionary:]([PNRODSchemaPNRODSiriTurnGrainSummary alloc], "initWithDictionary:", v8);
      -[PNRODSchemaPNRODClientEvent setPnrodSiriTurnGrainSummary:](v5, "setPnrodSiriTurnGrainSummary:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pnrodIntelligenceFlowRequestGrainSummary"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary initWithDictionary:]([PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary alloc], "initWithDictionary:", v10);
      -[PNRODSchemaPNRODClientEvent setPnrodIntelligenceFlowRequestGrainSummary:](v5, "setPnrodIntelligenceFlowRequestGrainSummary:", v11);

    }
    v30 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pnrodIntelligenceFlowPlannerGrainSummary"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary initWithDictionary:]([PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary alloc], "initWithDictionary:", v12);
      -[PNRODSchemaPNRODClientEvent setPnrodIntelligenceFlowPlannerGrainSummary:](v5, "setPnrodIntelligenceFlowPlannerGrainSummary:", v13);

    }
    v29 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pnrodIntelligenceFlowActionGrainSummary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary initWithDictionary:]([PNRODSchemaPNRODIntelligenceFlowActionGrainSummary alloc], "initWithDictionary:", v14);
      -[PNRODSchemaPNRODClientEvent setPnrodIntelligenceFlowActionGrainSummary:](v5, "setPnrodIntelligenceFlowActionGrainSummary:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pnrodIntelligenceFlowSessionSummary"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PNRODSchemaPNRODIntelligenceFlowSessionSummary initWithDictionary:]([PNRODSchemaPNRODIntelligenceFlowSessionSummary alloc], "initWithDictionary:", v16);
      -[PNRODSchemaPNRODClientEvent setPnrodIntelligenceFlowSessionSummary:](v5, "setPnrodIntelligenceFlowSessionSummary:", v17);

    }
    v31 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pnrodPNRODIntelligenceFlowPlannerComponentSummary"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary initWithDictionary:]([PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary alloc], "initWithDictionary:", v18);
      -[PNRODSchemaPNRODClientEvent setPnrodPNRODIntelligenceFlowPlannerComponentSummary:](v5, "setPnrodPNRODIntelligenceFlowPlannerComponentSummary:", v19);

    }
    v20 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pnrodIntelligenceFlowResponseGenerationComponentSummary"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary initWithDictionary:]([PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary alloc], "initWithDictionary:", v21);
      -[PNRODSchemaPNRODClientEvent setPnrodIntelligenceFlowResponseGenerationComponentSummary:](v5, "setPnrodIntelligenceFlowResponseGenerationComponentSummary:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pnronIntelligenceFlowExecutorComponentSummary"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary initWithDictionary:]([PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary alloc], "initWithDictionary:", v23);
      -[PNRODSchemaPNRODClientEvent setPnronIntelligenceFlowExecutorComponentSummary:](v5, "setPnronIntelligenceFlowExecutorComponentSummary:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pnronScheduleDebugSummary"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[PNRODSchemaPNRODScheduleDebugSummary initWithDictionary:]([PNRODSchemaPNRODScheduleDebugSummary alloc], "initWithDictionary:", v25);
      -[PNRODSchemaPNRODClientEvent setPnronScheduleDebugSummary:](v5, "setPnronScheduleDebugSummary:", v26);

    }
    v27 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PNRODSchemaPNRODClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasPnrodSiriTurnGrainSummary
{
  return self->_hasPnrodSiriTurnGrainSummary;
}

- (void)setHasPnrodSiriTurnGrainSummary:(BOOL)a3
{
  self->_hasPnrodSiriTurnGrainSummary = a3;
}

- (BOOL)hasPnrodIntelligenceFlowRequestGrainSummary
{
  return self->_hasPnrodIntelligenceFlowRequestGrainSummary;
}

- (void)setHasPnrodIntelligenceFlowRequestGrainSummary:(BOOL)a3
{
  self->_hasPnrodIntelligenceFlowRequestGrainSummary = a3;
}

- (BOOL)hasPnrodIntelligenceFlowPlannerGrainSummary
{
  return self->_hasPnrodIntelligenceFlowPlannerGrainSummary;
}

- (void)setHasPnrodIntelligenceFlowPlannerGrainSummary:(BOOL)a3
{
  self->_hasPnrodIntelligenceFlowPlannerGrainSummary = a3;
}

- (BOOL)hasPnrodIntelligenceFlowActionGrainSummary
{
  return self->_hasPnrodIntelligenceFlowActionGrainSummary;
}

- (void)setHasPnrodIntelligenceFlowActionGrainSummary:(BOOL)a3
{
  self->_hasPnrodIntelligenceFlowActionGrainSummary = a3;
}

- (BOOL)hasPnrodIntelligenceFlowSessionSummary
{
  return self->_hasPnrodIntelligenceFlowSessionSummary;
}

- (void)setHasPnrodIntelligenceFlowSessionSummary:(BOOL)a3
{
  self->_hasPnrodIntelligenceFlowSessionSummary = a3;
}

- (BOOL)hasPnrodPNRODIntelligenceFlowPlannerComponentSummary
{
  return self->_hasPnrodPNRODIntelligenceFlowPlannerComponentSummary;
}

- (void)setHasPnrodPNRODIntelligenceFlowPlannerComponentSummary:(BOOL)a3
{
  self->_hasPnrodPNRODIntelligenceFlowPlannerComponentSummary = a3;
}

- (BOOL)hasPnrodIntelligenceFlowResponseGenerationComponentSummary
{
  return self->_hasPnrodIntelligenceFlowResponseGenerationComponentSummary;
}

- (void)setHasPnrodIntelligenceFlowResponseGenerationComponentSummary:(BOOL)a3
{
  self->_hasPnrodIntelligenceFlowResponseGenerationComponentSummary = a3;
}

- (BOOL)hasPnronIntelligenceFlowExecutorComponentSummary
{
  return self->_hasPnronIntelligenceFlowExecutorComponentSummary;
}

- (void)setHasPnronIntelligenceFlowExecutorComponentSummary:(BOOL)a3
{
  self->_hasPnronIntelligenceFlowExecutorComponentSummary = a3;
}

- (BOOL)hasPnronScheduleDebugSummary
{
  return self->_hasPnronScheduleDebugSummary;
}

- (void)setHasPnronScheduleDebugSummary:(BOOL)a3
{
  self->_hasPnronScheduleDebugSummary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pnronScheduleDebugSummary, 0);
  objc_storeStrong((id *)&self->_pnronIntelligenceFlowExecutorComponentSummary, 0);
  objc_storeStrong((id *)&self->_pnrodIntelligenceFlowResponseGenerationComponentSummary, 0);
  objc_storeStrong((id *)&self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary, 0);
  objc_storeStrong((id *)&self->_pnrodIntelligenceFlowSessionSummary, 0);
  objc_storeStrong((id *)&self->_pnrodIntelligenceFlowActionGrainSummary, 0);
  objc_storeStrong((id *)&self->_pnrodIntelligenceFlowPlannerGrainSummary, 0);
  objc_storeStrong((id *)&self->_pnrodIntelligenceFlowRequestGrainSummary, 0);
  objc_storeStrong((id *)&self->_pnrodSiriTurnGrainSummary, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 91;
}

@end
