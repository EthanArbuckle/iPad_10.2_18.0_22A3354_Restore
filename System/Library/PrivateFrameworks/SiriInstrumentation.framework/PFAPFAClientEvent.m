@implementation PFAPFAClientEvent

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
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PFAPFAClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v25, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAPFAClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PFAPFAClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[PFAPFAClientEvent repackagingExecution](self, "repackagingExecution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PFAPFAClientEvent deleteRepackagingExecution](self, "deleteRepackagingExecution");
  -[PFAPFAClientEvent preprocessorExecutionContext](self, "preprocessorExecutionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PFAPFAClientEvent deletePreprocessorExecutionContext](self, "deletePreprocessorExecutionContext");
  -[PFAPFAClientEvent preprocessorSessionStartStatsReported](self, "preprocessorSessionStartStatsReported");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PFAPFAClientEvent deletePreprocessorSessionStartStatsReported](self, "deletePreprocessorSessionStartStatsReported");
  -[PFAPFAClientEvent preprocessorSessionEndStatsReported](self, "preprocessorSessionEndStatsReported");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PFAPFAClientEvent deletePreprocessorSessionEndStatsReported](self, "deletePreprocessorSessionEndStatsReported");
  -[PFAPFAClientEvent orchestratorResultsStatsReported](self, "orchestratorResultsStatsReported");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PFAPFAClientEvent deleteOrchestratorResultsStatsReported](self, "deleteOrchestratorResultsStatsReported");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[PFAPFAClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 4)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562A6C8[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 4)
    return 0;
  else
    return off_1E562A6F0[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[PFAPFAClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 4)
    return CFSTR("com.apple.aiml.lighthouse.pfa.PFAClientEvent");
  else
    return off_1E563C2C8[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[PFAPFAClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setRepackagingExecution:(id)a3
{
  PFARepackagingExecution *v4;
  PFAPreprocessorExecutionContext *preprocessorExecutionContext;
  PFAPreprocessorSessionStartStatsReported *preprocessorSessionStartStatsReported;
  PFAPreprocessorSessionEndStatsReported *preprocessorSessionEndStatsReported;
  PFAPreprocessorOrchestratorResultsStatsReported *orchestratorResultsStatsReported;
  unint64_t v9;
  PFARepackagingExecution *repackagingExecution;

  v4 = (PFARepackagingExecution *)a3;
  preprocessorExecutionContext = self->_preprocessorExecutionContext;
  self->_preprocessorExecutionContext = 0;

  preprocessorSessionStartStatsReported = self->_preprocessorSessionStartStatsReported;
  self->_preprocessorSessionStartStatsReported = 0;

  preprocessorSessionEndStatsReported = self->_preprocessorSessionEndStatsReported;
  self->_preprocessorSessionEndStatsReported = 0;

  orchestratorResultsStatsReported = self->_orchestratorResultsStatsReported;
  self->_orchestratorResultsStatsReported = 0;

  v9 = 101;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  repackagingExecution = self->_repackagingExecution;
  self->_repackagingExecution = v4;

}

- (PFARepackagingExecution)repackagingExecution
{
  if (self->_whichEvent_Type == 101)
    return self->_repackagingExecution;
  else
    return (PFARepackagingExecution *)0;
}

- (void)deleteRepackagingExecution
{
  PFARepackagingExecution *repackagingExecution;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    repackagingExecution = self->_repackagingExecution;
    self->_repackagingExecution = 0;

  }
}

- (void)setPreprocessorExecutionContext:(id)a3
{
  PFAPreprocessorExecutionContext *v4;
  PFARepackagingExecution *repackagingExecution;
  PFAPreprocessorSessionStartStatsReported *preprocessorSessionStartStatsReported;
  PFAPreprocessorSessionEndStatsReported *preprocessorSessionEndStatsReported;
  PFAPreprocessorOrchestratorResultsStatsReported *orchestratorResultsStatsReported;
  unint64_t v9;
  PFAPreprocessorExecutionContext *preprocessorExecutionContext;

  v4 = (PFAPreprocessorExecutionContext *)a3;
  repackagingExecution = self->_repackagingExecution;
  self->_repackagingExecution = 0;

  preprocessorSessionStartStatsReported = self->_preprocessorSessionStartStatsReported;
  self->_preprocessorSessionStartStatsReported = 0;

  preprocessorSessionEndStatsReported = self->_preprocessorSessionEndStatsReported;
  self->_preprocessorSessionEndStatsReported = 0;

  orchestratorResultsStatsReported = self->_orchestratorResultsStatsReported;
  self->_orchestratorResultsStatsReported = 0;

  v9 = 102;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  preprocessorExecutionContext = self->_preprocessorExecutionContext;
  self->_preprocessorExecutionContext = v4;

}

- (PFAPreprocessorExecutionContext)preprocessorExecutionContext
{
  if (self->_whichEvent_Type == 102)
    return self->_preprocessorExecutionContext;
  else
    return (PFAPreprocessorExecutionContext *)0;
}

- (void)deletePreprocessorExecutionContext
{
  PFAPreprocessorExecutionContext *preprocessorExecutionContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    preprocessorExecutionContext = self->_preprocessorExecutionContext;
    self->_preprocessorExecutionContext = 0;

  }
}

- (void)setPreprocessorSessionStartStatsReported:(id)a3
{
  PFAPreprocessorSessionStartStatsReported *v4;
  PFARepackagingExecution *repackagingExecution;
  PFAPreprocessorExecutionContext *preprocessorExecutionContext;
  PFAPreprocessorSessionEndStatsReported *preprocessorSessionEndStatsReported;
  PFAPreprocessorOrchestratorResultsStatsReported *orchestratorResultsStatsReported;
  unint64_t v9;
  PFAPreprocessorSessionStartStatsReported *preprocessorSessionStartStatsReported;

  v4 = (PFAPreprocessorSessionStartStatsReported *)a3;
  repackagingExecution = self->_repackagingExecution;
  self->_repackagingExecution = 0;

  preprocessorExecutionContext = self->_preprocessorExecutionContext;
  self->_preprocessorExecutionContext = 0;

  preprocessorSessionEndStatsReported = self->_preprocessorSessionEndStatsReported;
  self->_preprocessorSessionEndStatsReported = 0;

  orchestratorResultsStatsReported = self->_orchestratorResultsStatsReported;
  self->_orchestratorResultsStatsReported = 0;

  v9 = 103;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  preprocessorSessionStartStatsReported = self->_preprocessorSessionStartStatsReported;
  self->_preprocessorSessionStartStatsReported = v4;

}

- (PFAPreprocessorSessionStartStatsReported)preprocessorSessionStartStatsReported
{
  if (self->_whichEvent_Type == 103)
    return self->_preprocessorSessionStartStatsReported;
  else
    return (PFAPreprocessorSessionStartStatsReported *)0;
}

- (void)deletePreprocessorSessionStartStatsReported
{
  PFAPreprocessorSessionStartStatsReported *preprocessorSessionStartStatsReported;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    preprocessorSessionStartStatsReported = self->_preprocessorSessionStartStatsReported;
    self->_preprocessorSessionStartStatsReported = 0;

  }
}

- (void)setPreprocessorSessionEndStatsReported:(id)a3
{
  PFAPreprocessorSessionEndStatsReported *v4;
  PFARepackagingExecution *repackagingExecution;
  PFAPreprocessorExecutionContext *preprocessorExecutionContext;
  PFAPreprocessorSessionStartStatsReported *preprocessorSessionStartStatsReported;
  PFAPreprocessorOrchestratorResultsStatsReported *orchestratorResultsStatsReported;
  unint64_t v9;
  PFAPreprocessorSessionEndStatsReported *preprocessorSessionEndStatsReported;

  v4 = (PFAPreprocessorSessionEndStatsReported *)a3;
  repackagingExecution = self->_repackagingExecution;
  self->_repackagingExecution = 0;

  preprocessorExecutionContext = self->_preprocessorExecutionContext;
  self->_preprocessorExecutionContext = 0;

  preprocessorSessionStartStatsReported = self->_preprocessorSessionStartStatsReported;
  self->_preprocessorSessionStartStatsReported = 0;

  orchestratorResultsStatsReported = self->_orchestratorResultsStatsReported;
  self->_orchestratorResultsStatsReported = 0;

  v9 = 104;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  preprocessorSessionEndStatsReported = self->_preprocessorSessionEndStatsReported;
  self->_preprocessorSessionEndStatsReported = v4;

}

- (PFAPreprocessorSessionEndStatsReported)preprocessorSessionEndStatsReported
{
  if (self->_whichEvent_Type == 104)
    return self->_preprocessorSessionEndStatsReported;
  else
    return (PFAPreprocessorSessionEndStatsReported *)0;
}

- (void)deletePreprocessorSessionEndStatsReported
{
  PFAPreprocessorSessionEndStatsReported *preprocessorSessionEndStatsReported;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    preprocessorSessionEndStatsReported = self->_preprocessorSessionEndStatsReported;
    self->_preprocessorSessionEndStatsReported = 0;

  }
}

- (void)setOrchestratorResultsStatsReported:(id)a3
{
  PFAPreprocessorOrchestratorResultsStatsReported *v4;
  PFARepackagingExecution *repackagingExecution;
  PFAPreprocessorExecutionContext *preprocessorExecutionContext;
  PFAPreprocessorSessionStartStatsReported *preprocessorSessionStartStatsReported;
  PFAPreprocessorSessionEndStatsReported *preprocessorSessionEndStatsReported;
  unint64_t v9;
  PFAPreprocessorOrchestratorResultsStatsReported *orchestratorResultsStatsReported;

  v4 = (PFAPreprocessorOrchestratorResultsStatsReported *)a3;
  repackagingExecution = self->_repackagingExecution;
  self->_repackagingExecution = 0;

  preprocessorExecutionContext = self->_preprocessorExecutionContext;
  self->_preprocessorExecutionContext = 0;

  preprocessorSessionStartStatsReported = self->_preprocessorSessionStartStatsReported;
  self->_preprocessorSessionStartStatsReported = 0;

  preprocessorSessionEndStatsReported = self->_preprocessorSessionEndStatsReported;
  self->_preprocessorSessionEndStatsReported = 0;

  v9 = 105;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  orchestratorResultsStatsReported = self->_orchestratorResultsStatsReported;
  self->_orchestratorResultsStatsReported = v4;

}

- (PFAPreprocessorOrchestratorResultsStatsReported)orchestratorResultsStatsReported
{
  if (self->_whichEvent_Type == 105)
    return self->_orchestratorResultsStatsReported;
  else
    return (PFAPreprocessorOrchestratorResultsStatsReported *)0;
}

- (void)deleteOrchestratorResultsStatsReported
{
  PFAPreprocessorOrchestratorResultsStatsReported *orchestratorResultsStatsReported;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    orchestratorResultsStatsReported = self->_orchestratorResultsStatsReported;
    self->_orchestratorResultsStatsReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PFAPFAClientEventReadFrom(self, (uint64_t)a3);
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
  id v16;

  v16 = a3;
  -[PFAPFAClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PFAPFAClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PFAPFAClientEvent repackagingExecution](self, "repackagingExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PFAPFAClientEvent repackagingExecution](self, "repackagingExecution");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PFAPFAClientEvent preprocessorExecutionContext](self, "preprocessorExecutionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PFAPFAClientEvent preprocessorExecutionContext](self, "preprocessorExecutionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PFAPFAClientEvent preprocessorSessionStartStatsReported](self, "preprocessorSessionStartStatsReported");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PFAPFAClientEvent preprocessorSessionStartStatsReported](self, "preprocessorSessionStartStatsReported");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PFAPFAClientEvent preprocessorSessionEndStatsReported](self, "preprocessorSessionEndStatsReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PFAPFAClientEvent preprocessorSessionEndStatsReported](self, "preprocessorSessionEndStatsReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PFAPFAClientEvent orchestratorResultsStatsReported](self, "orchestratorResultsStatsReported");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PFAPFAClientEvent orchestratorResultsStatsReported](self, "orchestratorResultsStatsReported");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v37;
  BOOL v38;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_33;
  -[PFAPFAClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[PFAPFAClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PFAPFAClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_33;
  }
  else
  {

  }
  -[PFAPFAClientEvent repackagingExecution](self, "repackagingExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "repackagingExecution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[PFAPFAClientEvent repackagingExecution](self, "repackagingExecution");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PFAPFAClientEvent repackagingExecution](self, "repackagingExecution");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "repackagingExecution");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_33;
  }
  else
  {

  }
  -[PFAPFAClientEvent preprocessorExecutionContext](self, "preprocessorExecutionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preprocessorExecutionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[PFAPFAClientEvent preprocessorExecutionContext](self, "preprocessorExecutionContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PFAPFAClientEvent preprocessorExecutionContext](self, "preprocessorExecutionContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preprocessorExecutionContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_33;
  }
  else
  {

  }
  -[PFAPFAClientEvent preprocessorSessionStartStatsReported](self, "preprocessorSessionStartStatsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preprocessorSessionStartStatsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[PFAPFAClientEvent preprocessorSessionStartStatsReported](self, "preprocessorSessionStartStatsReported");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[PFAPFAClientEvent preprocessorSessionStartStatsReported](self, "preprocessorSessionStartStatsReported");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preprocessorSessionStartStatsReported");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_33;
  }
  else
  {

  }
  -[PFAPFAClientEvent preprocessorSessionEndStatsReported](self, "preprocessorSessionEndStatsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preprocessorSessionEndStatsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[PFAPFAClientEvent preprocessorSessionEndStatsReported](self, "preprocessorSessionEndStatsReported");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[PFAPFAClientEvent preprocessorSessionEndStatsReported](self, "preprocessorSessionEndStatsReported");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preprocessorSessionEndStatsReported");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_33;
  }
  else
  {

  }
  -[PFAPFAClientEvent orchestratorResultsStatsReported](self, "orchestratorResultsStatsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orchestratorResultsStatsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[PFAPFAClientEvent orchestratorResultsStatsReported](self, "orchestratorResultsStatsReported");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

LABEL_36:
      v38 = 1;
      goto LABEL_34;
    }
    v34 = (void *)v33;
    -[PFAPFAClientEvent orchestratorResultsStatsReported](self, "orchestratorResultsStatsReported");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orchestratorResultsStatsReported");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) != 0)
      goto LABEL_36;
  }
  else
  {
LABEL_32:

  }
LABEL_33:
  v38 = 0;
LABEL_34:

  return v38;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[PFAPFAEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[PFARepackagingExecution hash](self->_repackagingExecution, "hash") ^ v3;
  v5 = -[PFAPreprocessorExecutionContext hash](self->_preprocessorExecutionContext, "hash");
  v6 = v4 ^ v5 ^ -[PFAPreprocessorSessionStartStatsReported hash](self->_preprocessorSessionStartStatsReported, "hash");
  v7 = -[PFAPreprocessorSessionEndStatsReported hash](self->_preprocessorSessionEndStatsReported, "hash");
  return v6 ^ v7 ^ -[PFAPreprocessorOrchestratorResultsStatsReported hash](self->_orchestratorResultsStatsReported, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[PFAPFAClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_orchestratorResultsStatsReported)
  {
    -[PFAPFAClientEvent orchestratorResultsStatsReported](self, "orchestratorResultsStatsReported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("orchestratorResultsStatsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("orchestratorResultsStatsReported"));

    }
  }
  if (self->_preprocessorExecutionContext)
  {
    -[PFAPFAClientEvent preprocessorExecutionContext](self, "preprocessorExecutionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("preprocessorExecutionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("preprocessorExecutionContext"));

    }
  }
  if (self->_preprocessorSessionEndStatsReported)
  {
    -[PFAPFAClientEvent preprocessorSessionEndStatsReported](self, "preprocessorSessionEndStatsReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("preprocessorSessionEndStatsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("preprocessorSessionEndStatsReported"));

    }
  }
  if (self->_preprocessorSessionStartStatsReported)
  {
    -[PFAPFAClientEvent preprocessorSessionStartStatsReported](self, "preprocessorSessionStartStatsReported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("preprocessorSessionStartStatsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("preprocessorSessionStartStatsReported"));

    }
  }
  if (self->_repackagingExecution)
  {
    -[PFAPFAClientEvent repackagingExecution](self, "repackagingExecution");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("repackagingExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("repackagingExecution"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PFAPFAClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PFAPFAClientEvent)initWithJSON:(id)a3
{
  void *v4;
  PFAPFAClientEvent *v5;
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
    self = -[PFAPFAClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PFAPFAClientEvent)initWithDictionary:(id)a3
{
  id v4;
  PFAPFAClientEvent *v5;
  void *v6;
  PFAPFAEventMetadata *v7;
  void *v8;
  PFARepackagingExecution *v9;
  void *v10;
  PFAPreprocessorExecutionContext *v11;
  void *v12;
  PFAPreprocessorSessionStartStatsReported *v13;
  void *v14;
  PFAPreprocessorSessionEndStatsReported *v15;
  void *v16;
  PFAPreprocessorOrchestratorResultsStatsReported *v17;
  PFAPFAClientEvent *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PFAPFAClientEvent;
  v5 = -[PFAPFAClientEvent init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PFAPFAEventMetadata initWithDictionary:]([PFAPFAEventMetadata alloc], "initWithDictionary:", v6);
      -[PFAPFAClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("repackagingExecution"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PFARepackagingExecution initWithDictionary:]([PFARepackagingExecution alloc], "initWithDictionary:", v8);
      -[PFAPFAClientEvent setRepackagingExecution:](v5, "setRepackagingExecution:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preprocessorExecutionContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PFAPreprocessorExecutionContext initWithDictionary:]([PFAPreprocessorExecutionContext alloc], "initWithDictionary:", v10);
      -[PFAPFAClientEvent setPreprocessorExecutionContext:](v5, "setPreprocessorExecutionContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preprocessorSessionStartStatsReported"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[PFAPreprocessorSessionStartStatsReported initWithDictionary:]([PFAPreprocessorSessionStartStatsReported alloc], "initWithDictionary:", v12);
      -[PFAPFAClientEvent setPreprocessorSessionStartStatsReported:](v5, "setPreprocessorSessionStartStatsReported:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preprocessorSessionEndStatsReported"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PFAPreprocessorSessionEndStatsReported initWithDictionary:]([PFAPreprocessorSessionEndStatsReported alloc], "initWithDictionary:", v14);
      -[PFAPFAClientEvent setPreprocessorSessionEndStatsReported:](v5, "setPreprocessorSessionEndStatsReported:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orchestratorResultsStatsReported"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PFAPreprocessorOrchestratorResultsStatsReported initWithDictionary:]([PFAPreprocessorOrchestratorResultsStatsReported alloc], "initWithDictionary:", v16);
      -[PFAPFAClientEvent setOrchestratorResultsStatsReported:](v5, "setOrchestratorResultsStatsReported:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PFAPFAEventMetadata)eventMetadata
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

- (BOOL)hasRepackagingExecution
{
  return self->_hasRepackagingExecution;
}

- (void)setHasRepackagingExecution:(BOOL)a3
{
  self->_hasRepackagingExecution = a3;
}

- (BOOL)hasPreprocessorExecutionContext
{
  return self->_hasPreprocessorExecutionContext;
}

- (void)setHasPreprocessorExecutionContext:(BOOL)a3
{
  self->_hasPreprocessorExecutionContext = a3;
}

- (BOOL)hasPreprocessorSessionStartStatsReported
{
  return self->_hasPreprocessorSessionStartStatsReported;
}

- (void)setHasPreprocessorSessionStartStatsReported:(BOOL)a3
{
  self->_hasPreprocessorSessionStartStatsReported = a3;
}

- (BOOL)hasPreprocessorSessionEndStatsReported
{
  return self->_hasPreprocessorSessionEndStatsReported;
}

- (void)setHasPreprocessorSessionEndStatsReported:(BOOL)a3
{
  self->_hasPreprocessorSessionEndStatsReported = a3;
}

- (BOOL)hasOrchestratorResultsStatsReported
{
  return self->_hasOrchestratorResultsStatsReported;
}

- (void)setHasOrchestratorResultsStatsReported:(BOOL)a3
{
  self->_hasOrchestratorResultsStatsReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orchestratorResultsStatsReported, 0);
  objc_storeStrong((id *)&self->_preprocessorSessionEndStatsReported, 0);
  objc_storeStrong((id *)&self->_preprocessorSessionStartStatsReported, 0);
  objc_storeStrong((id *)&self->_preprocessorExecutionContext, 0);
  objc_storeStrong((id *)&self->_repackagingExecution, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 86;
}

@end
