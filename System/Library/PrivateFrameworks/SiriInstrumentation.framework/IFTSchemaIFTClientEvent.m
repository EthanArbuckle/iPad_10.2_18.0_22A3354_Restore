@implementation IFTSchemaIFTClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[IFTSchemaIFTClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ifRequestId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v4 = v3;
      goto LABEL_6;
    }
LABEL_5:
    v4 = 0;
  }
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 1;
}

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
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  int v83;
  objc_super v85;

  v4 = a3;
  v85.receiver = self;
  v85.super_class = (Class)IFTSchemaIFTClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v85, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[IFTSchemaIFTClientEvent deleteRequestContextTextContentTier1](self, "deleteRequestContextTextContentTier1");
    -[IFTSchemaIFTClientEvent deleteAstFlatExprSearchVariantTier1](self, "deleteAstFlatExprSearchVariantTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[IFTSchemaIFTClientEvent deleteRequestContextTextContentTier1](self, "deleteRequestContextTextContentTier1");
    -[IFTSchemaIFTClientEvent deleteAstFlatExprSearchVariantTier1](self, "deleteAstFlatExprSearchVariantTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[IFTSchemaIFTClientEvent deleteRequestContextTextContentTier1](self, "deleteRequestContextTextContentTier1");
    -[IFTSchemaIFTClientEvent deleteAstFlatExprSearchVariantTier1](self, "deleteAstFlatExprSearchVariantTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[IFTSchemaIFTClientEvent deleteRequestContextTextContentTier1](self, "deleteRequestContextTextContentTier1");
    -[IFTSchemaIFTClientEvent deleteAstFlatExprSearchVariantTier1](self, "deleteAstFlatExprSearchVariantTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[IFTSchemaIFTClientEvent deleteRequestContextTextContentTier1](self, "deleteRequestContextTextContentTier1");
    -[IFTSchemaIFTClientEvent deleteAstFlatExprSearchVariantTier1](self, "deleteAstFlatExprSearchVariantTier1");
  }
  -[IFTSchemaIFTClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[IFTSchemaIFTClientEvent contextPrewarmRequest](self, "contextPrewarmRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTClientEvent deleteContextPrewarmRequest](self, "deleteContextPrewarmRequest");
  -[IFTSchemaIFTClientEvent contextPrewarmCompleted](self, "contextPrewarmCompleted");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFTSchemaIFTClientEvent deleteContextPrewarmCompleted](self, "deleteContextPrewarmCompleted");
  -[IFTSchemaIFTClientEvent terminate](self, "terminate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[IFTSchemaIFTClientEvent deleteTerminate](self, "deleteTerminate");
  -[IFTSchemaIFTClientEvent request](self, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[IFTSchemaIFTClientEvent deleteRequest](self, "deleteRequest");
  -[IFTSchemaIFTClientEvent requestContextTextContentTier1](self, "requestContextTextContentTier1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[IFTSchemaIFTClientEvent deleteRequestContextTextContentTier1](self, "deleteRequestContextTextContentTier1");
  -[IFTSchemaIFTClientEvent entitySpanMatched](self, "entitySpanMatched");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[IFTSchemaIFTClientEvent deleteEntitySpanMatched](self, "deleteEntitySpanMatched");
  -[IFTSchemaIFTClientEvent contextRetrieved](self, "contextRetrieved");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[IFTSchemaIFTClientEvent deleteContextRetrieved](self, "deleteContextRetrieved");
  -[IFTSchemaIFTClientEvent toolsRetrieved](self, "toolsRetrieved");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[IFTSchemaIFTClientEvent deleteToolsRetrieved](self, "deleteToolsRetrieved");
  -[IFTSchemaIFTClientEvent planCreated](self, "planCreated");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[IFTSchemaIFTClientEvent deletePlanCreated](self, "deletePlanCreated");
  -[IFTSchemaIFTClientEvent astFlatExprSearchVariantTier1](self, "astFlatExprSearchVariantTier1");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[IFTSchemaIFTClientEvent deleteAstFlatExprSearchVariantTier1](self, "deleteAstFlatExprSearchVariantTier1");
  -[IFTSchemaIFTClientEvent variablesSet](self, "variablesSet");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[IFTSchemaIFTClientEvent deleteVariablesSet](self, "deleteVariablesSet");
  -[IFTSchemaIFTClientEvent toolResolution](self, "toolResolution");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[IFTSchemaIFTClientEvent deleteToolResolution](self, "deleteToolResolution");
  -[IFTSchemaIFTClientEvent queriesCreated](self, "queriesCreated");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[IFTSchemaIFTClientEvent deleteQueriesCreated](self, "deleteQueriesCreated");
  -[IFTSchemaIFTClientEvent actionResolverRequestCreated](self, "actionResolverRequestCreated");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[IFTSchemaIFTClientEvent deleteActionResolverRequestCreated](self, "deleteActionResolverRequestCreated");
  -[IFTSchemaIFTClientEvent responseGenerationRequest](self, "responseGenerationRequest");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[IFTSchemaIFTClientEvent deleteResponseGenerationRequest](self, "deleteResponseGenerationRequest");
  -[IFTSchemaIFTClientEvent actionCancelled](self, "actionCancelled");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[IFTSchemaIFTClientEvent deleteActionCancelled](self, "deleteActionCancelled");
  -[IFTSchemaIFTClientEvent continuePlanning](self, "continuePlanning");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applySensitiveConditionsPolicy:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "suppressMessage");

  if (v59)
    -[IFTSchemaIFTClientEvent deleteContinuePlanning](self, "deleteContinuePlanning");
  -[IFTSchemaIFTClientEvent actionCreated](self, "actionCreated");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "applySensitiveConditionsPolicy:", v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "suppressMessage");

  if (v62)
    -[IFTSchemaIFTClientEvent deleteActionCreated](self, "deleteActionCreated");
  -[IFTSchemaIFTClientEvent clientActionCreated](self, "clientActionCreated");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "applySensitiveConditionsPolicy:", v4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "suppressMessage");

  if (v65)
    -[IFTSchemaIFTClientEvent deleteClientActionCreated](self, "deleteClientActionCreated");
  -[IFTSchemaIFTClientEvent queriesExecuted](self, "queriesExecuted");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "applySensitiveConditionsPolicy:", v4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "suppressMessage");

  if (v68)
    -[IFTSchemaIFTClientEvent deleteQueriesExecuted](self, "deleteQueriesExecuted");
  -[IFTSchemaIFTClientEvent statementEvaluated](self, "statementEvaluated");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "applySensitiveConditionsPolicy:", v4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "suppressMessage");

  if (v71)
    -[IFTSchemaIFTClientEvent deleteStatementEvaluated](self, "deleteStatementEvaluated");
  -[IFTSchemaIFTClientEvent systemResponseGenerated](self, "systemResponseGenerated");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "applySensitiveConditionsPolicy:", v4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "suppressMessage");

  if (v74)
    -[IFTSchemaIFTClientEvent deleteSystemResponseGenerated](self, "deleteSystemResponseGenerated");
  -[IFTSchemaIFTClientEvent criticalError](self, "criticalError");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "applySensitiveConditionsPolicy:", v4);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "suppressMessage");

  if (v77)
    -[IFTSchemaIFTClientEvent deleteCriticalError](self, "deleteCriticalError");
  -[IFTSchemaIFTClientEvent recoverableError](self, "recoverableError");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "applySensitiveConditionsPolicy:", v4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "suppressMessage");

  if (v80)
    -[IFTSchemaIFTClientEvent deleteRecoverableError](self, "deleteRecoverableError");
  -[IFTSchemaIFTClientEvent queryDecorationResult](self, "queryDecorationResult");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "applySensitiveConditionsPolicy:", v4);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "suppressMessage");

  if (v83)
    -[IFTSchemaIFTClientEvent deleteQueryDecorationResult](self, "deleteQueryDecorationResult");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[IFTSchemaIFTClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 0x18)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629768[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0x18)
    return 0;
  else
    return off_1E5629830[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[IFTSchemaIFTClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 0x18)
    return CFSTR("com.apple.aiml.siri.ift.IFTClientEvent");
  else
    return off_1E563D030[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[IFTSchemaIFTClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setContextPrewarmRequest:(id)a3
{
  IFTSchemaIFTContextPrewarmRequest *v4;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;

  v4 = (IFTSchemaIFTContextPrewarmRequest *)a3;
  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 101;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = v4;

}

- (IFTSchemaIFTContextPrewarmRequest)contextPrewarmRequest
{
  if (self->_whichEvent_Type == 101)
    return self->_contextPrewarmRequest;
  else
    return (IFTSchemaIFTContextPrewarmRequest *)0;
}

- (void)deleteContextPrewarmRequest
{
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    contextPrewarmRequest = self->_contextPrewarmRequest;
    self->_contextPrewarmRequest = 0;

  }
}

- (void)setContextPrewarmCompleted:(id)a3
{
  IFTSchemaIFTContextPrewarmCompleted *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;

  v4 = (IFTSchemaIFTContextPrewarmCompleted *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 102;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = v4;

}

- (IFTSchemaIFTContextPrewarmCompleted)contextPrewarmCompleted
{
  if (self->_whichEvent_Type == 102)
    return self->_contextPrewarmCompleted;
  else
    return (IFTSchemaIFTContextPrewarmCompleted *)0;
}

- (void)deleteContextPrewarmCompleted
{
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    contextPrewarmCompleted = self->_contextPrewarmCompleted;
    self->_contextPrewarmCompleted = 0;

  }
}

- (void)setTerminate:(id)a3
{
  IFTSchemaIFTTerminate *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTTerminate *terminate;

  v4 = (IFTSchemaIFTTerminate *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 103;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  terminate = self->_terminate;
  self->_terminate = v4;

}

- (IFTSchemaIFTTerminate)terminate
{
  if (self->_whichEvent_Type == 103)
    return self->_terminate;
  else
    return (IFTSchemaIFTTerminate *)0;
}

- (void)deleteTerminate
{
  IFTSchemaIFTTerminate *terminate;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    terminate = self->_terminate;
    self->_terminate = 0;

  }
}

- (void)setRequest:(id)a3
{
  IFTSchemaIFTRequest *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTRequest *request;

  v4 = (IFTSchemaIFTRequest *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 104;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  request = self->_request;
  self->_request = v4;

}

- (IFTSchemaIFTRequest)request
{
  if (self->_whichEvent_Type == 104)
    return self->_request;
  else
    return (IFTSchemaIFTRequest *)0;
}

- (void)deleteRequest
{
  IFTSchemaIFTRequest *request;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    request = self->_request;
    self->_request = 0;

  }
}

- (void)setRequestContextTextContentTier1:(id)a3
{
  IFTSchemaIFTRequestContentTextContentTier1 *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;

  v4 = (IFTSchemaIFTRequestContentTextContentTier1 *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 122;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = v4;

}

- (IFTSchemaIFTRequestContentTextContentTier1)requestContextTextContentTier1
{
  if (self->_whichEvent_Type == 122)
    return self->_requestContextTextContentTier1;
  else
    return (IFTSchemaIFTRequestContentTextContentTier1 *)0;
}

- (void)deleteRequestContextTextContentTier1
{
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;

  if (self->_whichEvent_Type == 122)
  {
    self->_whichEvent_Type = 0;
    requestContextTextContentTier1 = self->_requestContextTextContentTier1;
    self->_requestContextTextContentTier1 = 0;

  }
}

- (void)setEntitySpanMatched:(id)a3
{
  IFTSchemaIFTEntitySpanMatchResult *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;

  v4 = (IFTSchemaIFTEntitySpanMatchResult *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 105;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = v4;

}

- (IFTSchemaIFTEntitySpanMatchResult)entitySpanMatched
{
  if (self->_whichEvent_Type == 105)
    return self->_entitySpanMatched;
  else
    return (IFTSchemaIFTEntitySpanMatchResult *)0;
}

- (void)deleteEntitySpanMatched
{
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    entitySpanMatched = self->_entitySpanMatched;
    self->_entitySpanMatched = 0;

  }
}

- (void)setContextRetrieved:(id)a3
{
  IFTSchemaIFTContextRetrieved *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTContextRetrieved *contextRetrieved;

  v4 = (IFTSchemaIFTContextRetrieved *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 106;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = v4;

}

- (IFTSchemaIFTContextRetrieved)contextRetrieved
{
  if (self->_whichEvent_Type == 106)
    return self->_contextRetrieved;
  else
    return (IFTSchemaIFTContextRetrieved *)0;
}

- (void)deleteContextRetrieved
{
  IFTSchemaIFTContextRetrieved *contextRetrieved;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    contextRetrieved = self->_contextRetrieved;
    self->_contextRetrieved = 0;

  }
}

- (void)setToolsRetrieved:(id)a3
{
  IFTSchemaIFTToolRetrievalResponse *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;

  v4 = (IFTSchemaIFTToolRetrievalResponse *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 107;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = v4;

}

- (IFTSchemaIFTToolRetrievalResponse)toolsRetrieved
{
  if (self->_whichEvent_Type == 107)
    return self->_toolsRetrieved;
  else
    return (IFTSchemaIFTToolRetrievalResponse *)0;
}

- (void)deleteToolsRetrieved
{
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    toolsRetrieved = self->_toolsRetrieved;
    self->_toolsRetrieved = 0;

  }
}

- (void)setPlanCreated:(id)a3
{
  IFTSchemaIFTPlan *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTPlan *planCreated;

  v4 = (IFTSchemaIFTPlan *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 108;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  planCreated = self->_planCreated;
  self->_planCreated = v4;

}

- (IFTSchemaIFTPlan)planCreated
{
  if (self->_whichEvent_Type == 108)
    return self->_planCreated;
  else
    return (IFTSchemaIFTPlan *)0;
}

- (void)deletePlanCreated
{
  IFTSchemaIFTPlan *planCreated;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    planCreated = self->_planCreated;
    self->_planCreated = 0;

  }
}

- (void)setAstFlatExprSearchVariantTier1:(id)a3
{
  IFTSchemaASTFlatExprSearchVariantTier1 *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;

  v4 = (IFTSchemaASTFlatExprSearchVariantTier1 *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 123;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = v4;

}

- (IFTSchemaASTFlatExprSearchVariantTier1)astFlatExprSearchVariantTier1
{
  if (self->_whichEvent_Type == 123)
    return self->_astFlatExprSearchVariantTier1;
  else
    return (IFTSchemaASTFlatExprSearchVariantTier1 *)0;
}

- (void)deleteAstFlatExprSearchVariantTier1
{
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;

  if (self->_whichEvent_Type == 123)
  {
    self->_whichEvent_Type = 0;
    astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
    self->_astFlatExprSearchVariantTier1 = 0;

  }
}

- (void)setVariablesSet:(id)a3
{
  IFTSchemaIFTVariableStep *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTVariableStep *variablesSet;

  v4 = (IFTSchemaIFTVariableStep *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 109;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  variablesSet = self->_variablesSet;
  self->_variablesSet = v4;

}

- (IFTSchemaIFTVariableStep)variablesSet
{
  if (self->_whichEvent_Type == 109)
    return self->_variablesSet;
  else
    return (IFTSchemaIFTVariableStep *)0;
}

- (void)deleteVariablesSet
{
  IFTSchemaIFTVariableStep *variablesSet;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    variablesSet = self->_variablesSet;
    self->_variablesSet = 0;

  }
}

- (void)setToolResolution:(id)a3
{
  IFTSchemaIFTToolResolution *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTToolResolution *toolResolution;

  v4 = (IFTSchemaIFTToolResolution *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 110;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  toolResolution = self->_toolResolution;
  self->_toolResolution = v4;

}

- (IFTSchemaIFTToolResolution)toolResolution
{
  if (self->_whichEvent_Type == 110)
    return self->_toolResolution;
  else
    return (IFTSchemaIFTToolResolution *)0;
}

- (void)deleteToolResolution
{
  IFTSchemaIFTToolResolution *toolResolution;

  if (self->_whichEvent_Type == 110)
  {
    self->_whichEvent_Type = 0;
    toolResolution = self->_toolResolution;
    self->_toolResolution = 0;

  }
}

- (void)setQueriesCreated:(id)a3
{
  IFTSchemaIFTQueryStep *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTQueryStep *queriesCreated;

  v4 = (IFTSchemaIFTQueryStep *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 111;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = v4;

}

- (IFTSchemaIFTQueryStep)queriesCreated
{
  if (self->_whichEvent_Type == 111)
    return self->_queriesCreated;
  else
    return (IFTSchemaIFTQueryStep *)0;
}

- (void)deleteQueriesCreated
{
  IFTSchemaIFTQueryStep *queriesCreated;

  if (self->_whichEvent_Type == 111)
  {
    self->_whichEvent_Type = 0;
    queriesCreated = self->_queriesCreated;
    self->_queriesCreated = 0;

  }
}

- (void)setActionResolverRequestCreated:(id)a3
{
  IFTSchemaIFTActionResolverRequest *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;

  v4 = (IFTSchemaIFTActionResolverRequest *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 112;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = v4;

}

- (IFTSchemaIFTActionResolverRequest)actionResolverRequestCreated
{
  if (self->_whichEvent_Type == 112)
    return self->_actionResolverRequestCreated;
  else
    return (IFTSchemaIFTActionResolverRequest *)0;
}

- (void)deleteActionResolverRequestCreated
{
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;

  if (self->_whichEvent_Type == 112)
  {
    self->_whichEvent_Type = 0;
    actionResolverRequestCreated = self->_actionResolverRequestCreated;
    self->_actionResolverRequestCreated = 0;

  }
}

- (void)setResponseGenerationRequest:(id)a3
{
  IFTSchemaIFTResponseGenerationRequest *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;

  v4 = (IFTSchemaIFTResponseGenerationRequest *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 113;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = v4;

}

- (IFTSchemaIFTResponseGenerationRequest)responseGenerationRequest
{
  if (self->_whichEvent_Type == 113)
    return self->_responseGenerationRequest;
  else
    return (IFTSchemaIFTResponseGenerationRequest *)0;
}

- (void)deleteResponseGenerationRequest
{
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;

  if (self->_whichEvent_Type == 113)
  {
    self->_whichEvent_Type = 0;
    responseGenerationRequest = self->_responseGenerationRequest;
    self->_responseGenerationRequest = 0;

  }
}

- (void)setActionCancelled:(id)a3
{
  IFTSchemaIFTActionCancellation *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTActionCancellation *actionCancelled;

  v4 = (IFTSchemaIFTActionCancellation *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 114;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = v4;

}

- (IFTSchemaIFTActionCancellation)actionCancelled
{
  if (self->_whichEvent_Type == 114)
    return self->_actionCancelled;
  else
    return (IFTSchemaIFTActionCancellation *)0;
}

- (void)deleteActionCancelled
{
  IFTSchemaIFTActionCancellation *actionCancelled;

  if (self->_whichEvent_Type == 114)
  {
    self->_whichEvent_Type = 0;
    actionCancelled = self->_actionCancelled;
    self->_actionCancelled = 0;

  }
}

- (void)setContinuePlanning:(id)a3
{
  IFTSchemaIFTContinuePlanning *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTContinuePlanning *continuePlanning;

  v4 = (IFTSchemaIFTContinuePlanning *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 124;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = v4;

}

- (IFTSchemaIFTContinuePlanning)continuePlanning
{
  if (self->_whichEvent_Type == 124)
    return self->_continuePlanning;
  else
    return (IFTSchemaIFTContinuePlanning *)0;
}

- (void)deleteContinuePlanning
{
  IFTSchemaIFTContinuePlanning *continuePlanning;

  if (self->_whichEvent_Type == 124)
  {
    self->_whichEvent_Type = 0;
    continuePlanning = self->_continuePlanning;
    self->_continuePlanning = 0;

  }
}

- (void)setActionCreated:(id)a3
{
  IFTSchemaIFTAction *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTAction *actionCreated;

  v4 = (IFTSchemaIFTAction *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 115;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  actionCreated = self->_actionCreated;
  self->_actionCreated = v4;

}

- (IFTSchemaIFTAction)actionCreated
{
  if (self->_whichEvent_Type == 115)
    return self->_actionCreated;
  else
    return (IFTSchemaIFTAction *)0;
}

- (void)deleteActionCreated
{
  IFTSchemaIFTAction *actionCreated;

  if (self->_whichEvent_Type == 115)
  {
    self->_whichEvent_Type = 0;
    actionCreated = self->_actionCreated;
    self->_actionCreated = 0;

  }
}

- (void)setClientActionCreated:(id)a3
{
  IFTSchemaIFTClientAction *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTClientAction *clientActionCreated;

  v4 = (IFTSchemaIFTClientAction *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 116;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = v4;

}

- (IFTSchemaIFTClientAction)clientActionCreated
{
  if (self->_whichEvent_Type == 116)
    return self->_clientActionCreated;
  else
    return (IFTSchemaIFTClientAction *)0;
}

- (void)deleteClientActionCreated
{
  IFTSchemaIFTClientAction *clientActionCreated;

  if (self->_whichEvent_Type == 116)
  {
    self->_whichEvent_Type = 0;
    clientActionCreated = self->_clientActionCreated;
    self->_clientActionCreated = 0;

  }
}

- (void)setQueriesExecuted:(id)a3
{
  IFTSchemaIFTQueryStepResults *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTQueryStepResults *queriesExecuted;

  v4 = (IFTSchemaIFTQueryStepResults *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 117;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = v4;

}

- (IFTSchemaIFTQueryStepResults)queriesExecuted
{
  if (self->_whichEvent_Type == 117)
    return self->_queriesExecuted;
  else
    return (IFTSchemaIFTQueryStepResults *)0;
}

- (void)deleteQueriesExecuted
{
  IFTSchemaIFTQueryStepResults *queriesExecuted;

  if (self->_whichEvent_Type == 117)
  {
    self->_whichEvent_Type = 0;
    queriesExecuted = self->_queriesExecuted;
    self->_queriesExecuted = 0;

  }
}

- (void)setStatementEvaluated:(id)a3
{
  IFTSchemaIFTStatementResult *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTStatementResult *statementEvaluated;

  v4 = (IFTSchemaIFTStatementResult *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 118;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = v4;

}

- (IFTSchemaIFTStatementResult)statementEvaluated
{
  if (self->_whichEvent_Type == 118)
    return self->_statementEvaluated;
  else
    return (IFTSchemaIFTStatementResult *)0;
}

- (void)deleteStatementEvaluated
{
  IFTSchemaIFTStatementResult *statementEvaluated;

  if (self->_whichEvent_Type == 118)
  {
    self->_whichEvent_Type = 0;
    statementEvaluated = self->_statementEvaluated;
    self->_statementEvaluated = 0;

  }
}

- (void)setSystemResponseGenerated:(id)a3
{
  IFTSchemaIFTSystemResponse *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;

  v4 = (IFTSchemaIFTSystemResponse *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 119;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = v4;

}

- (IFTSchemaIFTSystemResponse)systemResponseGenerated
{
  if (self->_whichEvent_Type == 119)
    return self->_systemResponseGenerated;
  else
    return (IFTSchemaIFTSystemResponse *)0;
}

- (void)deleteSystemResponseGenerated
{
  IFTSchemaIFTSystemResponse *systemResponseGenerated;

  if (self->_whichEvent_Type == 119)
  {
    self->_whichEvent_Type = 0;
    systemResponseGenerated = self->_systemResponseGenerated;
    self->_systemResponseGenerated = 0;

  }
}

- (void)setCriticalError:(id)a3
{
  IFTSchemaIFTSessionError *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTRecoverableError *recoverableError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTSessionError *criticalError;

  v4 = (IFTSchemaIFTSessionError *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 120;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  criticalError = self->_criticalError;
  self->_criticalError = v4;

}

- (IFTSchemaIFTSessionError)criticalError
{
  if (self->_whichEvent_Type == 120)
    return self->_criticalError;
  else
    return (IFTSchemaIFTSessionError *)0;
}

- (void)deleteCriticalError
{
  IFTSchemaIFTSessionError *criticalError;

  if (self->_whichEvent_Type == 120)
  {
    self->_whichEvent_Type = 0;
    criticalError = self->_criticalError;
    self->_criticalError = 0;

  }
}

- (void)setRecoverableError:(id)a3
{
  IFTSchemaIFTRecoverableError *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;
  unint64_t v29;
  IFTSchemaIFTRecoverableError *recoverableError;

  v4 = (IFTSchemaIFTRecoverableError *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  v29 = 125;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  recoverableError = self->_recoverableError;
  self->_recoverableError = v4;

}

- (IFTSchemaIFTRecoverableError)recoverableError
{
  if (self->_whichEvent_Type == 125)
    return self->_recoverableError;
  else
    return (IFTSchemaIFTRecoverableError *)0;
}

- (void)deleteRecoverableError
{
  IFTSchemaIFTRecoverableError *recoverableError;

  if (self->_whichEvent_Type == 125)
  {
    self->_whichEvent_Type = 0;
    recoverableError = self->_recoverableError;
    self->_recoverableError = 0;

  }
}

- (void)setQueryDecorationResult:(id)a3
{
  IFTSchemaIFTQueryDecorationResult *v4;
  IFTSchemaIFTContextPrewarmRequest *contextPrewarmRequest;
  IFTSchemaIFTContextPrewarmCompleted *contextPrewarmCompleted;
  IFTSchemaIFTTerminate *terminate;
  IFTSchemaIFTRequest *request;
  IFTSchemaIFTRequestContentTextContentTier1 *requestContextTextContentTier1;
  IFTSchemaIFTEntitySpanMatchResult *entitySpanMatched;
  IFTSchemaIFTContextRetrieved *contextRetrieved;
  IFTSchemaIFTToolRetrievalResponse *toolsRetrieved;
  IFTSchemaIFTPlan *planCreated;
  IFTSchemaASTFlatExprSearchVariantTier1 *astFlatExprSearchVariantTier1;
  IFTSchemaIFTVariableStep *variablesSet;
  IFTSchemaIFTToolResolution *toolResolution;
  IFTSchemaIFTQueryStep *queriesCreated;
  IFTSchemaIFTActionResolverRequest *actionResolverRequestCreated;
  IFTSchemaIFTResponseGenerationRequest *responseGenerationRequest;
  IFTSchemaIFTActionCancellation *actionCancelled;
  IFTSchemaIFTContinuePlanning *continuePlanning;
  IFTSchemaIFTAction *actionCreated;
  IFTSchemaIFTClientAction *clientActionCreated;
  IFTSchemaIFTQueryStepResults *queriesExecuted;
  IFTSchemaIFTStatementResult *statementEvaluated;
  IFTSchemaIFTSystemResponse *systemResponseGenerated;
  IFTSchemaIFTSessionError *criticalError;
  IFTSchemaIFTRecoverableError *recoverableError;
  unint64_t v29;
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;

  v4 = (IFTSchemaIFTQueryDecorationResult *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  v29 = 121;
  if (!v4)
    v29 = 0;
  self->_whichEvent_Type = v29;
  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = v4;

}

- (IFTSchemaIFTQueryDecorationResult)queryDecorationResult
{
  if (self->_whichEvent_Type == 121)
    return self->_queryDecorationResult;
  else
    return (IFTSchemaIFTQueryDecorationResult *)0;
}

- (void)deleteQueryDecorationResult
{
  IFTSchemaIFTQueryDecorationResult *queryDecorationResult;

  if (self->_whichEvent_Type == 121)
  {
    self->_whichEvent_Type = 0;
    queryDecorationResult = self->_queryDecorationResult;
    self->_queryDecorationResult = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTClientEventReadFrom(self, (uint64_t)a3);
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
  id v56;

  v56 = a3;
  -[IFTSchemaIFTClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent contextPrewarmRequest](self, "contextPrewarmRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTClientEvent contextPrewarmRequest](self, "contextPrewarmRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent contextPrewarmCompleted](self, "contextPrewarmCompleted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IFTSchemaIFTClientEvent contextPrewarmCompleted](self, "contextPrewarmCompleted");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent terminate](self, "terminate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IFTSchemaIFTClientEvent terminate](self, "terminate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent request](self, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[IFTSchemaIFTClientEvent request](self, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent requestContextTextContentTier1](self, "requestContextTextContentTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[IFTSchemaIFTClientEvent requestContextTextContentTier1](self, "requestContextTextContentTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent entitySpanMatched](self, "entitySpanMatched");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[IFTSchemaIFTClientEvent entitySpanMatched](self, "entitySpanMatched");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent contextRetrieved](self, "contextRetrieved");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[IFTSchemaIFTClientEvent contextRetrieved](self, "contextRetrieved");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent toolsRetrieved](self, "toolsRetrieved");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[IFTSchemaIFTClientEvent toolsRetrieved](self, "toolsRetrieved");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent planCreated](self, "planCreated");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[IFTSchemaIFTClientEvent planCreated](self, "planCreated");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent astFlatExprSearchVariantTier1](self, "astFlatExprSearchVariantTier1");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[IFTSchemaIFTClientEvent astFlatExprSearchVariantTier1](self, "astFlatExprSearchVariantTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent variablesSet](self, "variablesSet");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[IFTSchemaIFTClientEvent variablesSet](self, "variablesSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent toolResolution](self, "toolResolution");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[IFTSchemaIFTClientEvent toolResolution](self, "toolResolution");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent queriesCreated](self, "queriesCreated");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[IFTSchemaIFTClientEvent queriesCreated](self, "queriesCreated");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent actionResolverRequestCreated](self, "actionResolverRequestCreated");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[IFTSchemaIFTClientEvent actionResolverRequestCreated](self, "actionResolverRequestCreated");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent responseGenerationRequest](self, "responseGenerationRequest");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[IFTSchemaIFTClientEvent responseGenerationRequest](self, "responseGenerationRequest");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent actionCancelled](self, "actionCancelled");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[IFTSchemaIFTClientEvent actionCancelled](self, "actionCancelled");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent continuePlanning](self, "continuePlanning");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[IFTSchemaIFTClientEvent continuePlanning](self, "continuePlanning");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent actionCreated](self, "actionCreated");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[IFTSchemaIFTClientEvent actionCreated](self, "actionCreated");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent clientActionCreated](self, "clientActionCreated");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[IFTSchemaIFTClientEvent clientActionCreated](self, "clientActionCreated");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent queriesExecuted](self, "queriesExecuted");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[IFTSchemaIFTClientEvent queriesExecuted](self, "queriesExecuted");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent statementEvaluated](self, "statementEvaluated");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[IFTSchemaIFTClientEvent statementEvaluated](self, "statementEvaluated");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent systemResponseGenerated](self, "systemResponseGenerated");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[IFTSchemaIFTClientEvent systemResponseGenerated](self, "systemResponseGenerated");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent criticalError](self, "criticalError");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[IFTSchemaIFTClientEvent criticalError](self, "criticalError");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent recoverableError](self, "recoverableError");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[IFTSchemaIFTClientEvent recoverableError](self, "recoverableError");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTClientEvent queryDecorationResult](self, "queryDecorationResult");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[IFTSchemaIFTClientEvent queryDecorationResult](self, "queryDecorationResult");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  int v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  int v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  int v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  int v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  char v137;
  BOOL v138;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_133;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_133;
  -[IFTSchemaIFTClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent contextPrewarmRequest](self, "contextPrewarmRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextPrewarmRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent contextPrewarmRequest](self, "contextPrewarmRequest");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[IFTSchemaIFTClientEvent contextPrewarmRequest](self, "contextPrewarmRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextPrewarmRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent contextPrewarmCompleted](self, "contextPrewarmCompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextPrewarmCompleted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent contextPrewarmCompleted](self, "contextPrewarmCompleted");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[IFTSchemaIFTClientEvent contextPrewarmCompleted](self, "contextPrewarmCompleted");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextPrewarmCompleted");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent terminate](self, "terminate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "terminate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent terminate](self, "terminate");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[IFTSchemaIFTClientEvent terminate](self, "terminate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "terminate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent request](self, "request");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[IFTSchemaIFTClientEvent request](self, "request");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent requestContextTextContentTier1](self, "requestContextTextContentTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestContextTextContentTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent requestContextTextContentTier1](self, "requestContextTextContentTier1");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[IFTSchemaIFTClientEvent requestContextTextContentTier1](self, "requestContextTextContentTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestContextTextContentTier1");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent entitySpanMatched](self, "entitySpanMatched");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitySpanMatched");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent entitySpanMatched](self, "entitySpanMatched");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[IFTSchemaIFTClientEvent entitySpanMatched](self, "entitySpanMatched");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitySpanMatched");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent contextRetrieved](self, "contextRetrieved");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextRetrieved");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent contextRetrieved](self, "contextRetrieved");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[IFTSchemaIFTClientEvent contextRetrieved](self, "contextRetrieved");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextRetrieved");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent toolsRetrieved](self, "toolsRetrieved");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolsRetrieved");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent toolsRetrieved](self, "toolsRetrieved");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[IFTSchemaIFTClientEvent toolsRetrieved](self, "toolsRetrieved");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolsRetrieved");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent planCreated](self, "planCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent planCreated](self, "planCreated");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[IFTSchemaIFTClientEvent planCreated](self, "planCreated");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planCreated");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent astFlatExprSearchVariantTier1](self, "astFlatExprSearchVariantTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "astFlatExprSearchVariantTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent astFlatExprSearchVariantTier1](self, "astFlatExprSearchVariantTier1");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[IFTSchemaIFTClientEvent astFlatExprSearchVariantTier1](self, "astFlatExprSearchVariantTier1");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "astFlatExprSearchVariantTier1");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent variablesSet](self, "variablesSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "variablesSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent variablesSet](self, "variablesSet");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[IFTSchemaIFTClientEvent variablesSet](self, "variablesSet");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "variablesSet");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent toolResolution](self, "toolResolution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolResolution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent toolResolution](self, "toolResolution");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[IFTSchemaIFTClientEvent toolResolution](self, "toolResolution");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolResolution");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent queriesCreated](self, "queriesCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queriesCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent queriesCreated](self, "queriesCreated");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[IFTSchemaIFTClientEvent queriesCreated](self, "queriesCreated");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queriesCreated");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent actionResolverRequestCreated](self, "actionResolverRequestCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionResolverRequestCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent actionResolverRequestCreated](self, "actionResolverRequestCreated");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[IFTSchemaIFTClientEvent actionResolverRequestCreated](self, "actionResolverRequestCreated");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionResolverRequestCreated");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent responseGenerationRequest](self, "responseGenerationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseGenerationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent responseGenerationRequest](self, "responseGenerationRequest");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[IFTSchemaIFTClientEvent responseGenerationRequest](self, "responseGenerationRequest");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseGenerationRequest");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent actionCancelled](self, "actionCancelled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionCancelled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent actionCancelled](self, "actionCancelled");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[IFTSchemaIFTClientEvent actionCancelled](self, "actionCancelled");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionCancelled");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent continuePlanning](self, "continuePlanning");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "continuePlanning");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent continuePlanning](self, "continuePlanning");
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)v93;
    -[IFTSchemaIFTClientEvent continuePlanning](self, "continuePlanning");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "continuePlanning");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v95, "isEqual:", v96);

    if (!v97)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent actionCreated](self, "actionCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent actionCreated](self, "actionCreated");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    -[IFTSchemaIFTClientEvent actionCreated](self, "actionCreated");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionCreated");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "isEqual:", v101);

    if (!v102)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent clientActionCreated](self, "clientActionCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientActionCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent clientActionCreated](self, "clientActionCreated");
  v103 = objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    v104 = (void *)v103;
    -[IFTSchemaIFTClientEvent clientActionCreated](self, "clientActionCreated");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientActionCreated");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v105, "isEqual:", v106);

    if (!v107)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent queriesExecuted](self, "queriesExecuted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queriesExecuted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent queriesExecuted](self, "queriesExecuted");
  v108 = objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    v109 = (void *)v108;
    -[IFTSchemaIFTClientEvent queriesExecuted](self, "queriesExecuted");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queriesExecuted");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v110, "isEqual:", v111);

    if (!v112)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent statementEvaluated](self, "statementEvaluated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statementEvaluated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent statementEvaluated](self, "statementEvaluated");
  v113 = objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    v114 = (void *)v113;
    -[IFTSchemaIFTClientEvent statementEvaluated](self, "statementEvaluated");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statementEvaluated");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v115, "isEqual:", v116);

    if (!v117)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent systemResponseGenerated](self, "systemResponseGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemResponseGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent systemResponseGenerated](self, "systemResponseGenerated");
  v118 = objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = (void *)v118;
    -[IFTSchemaIFTClientEvent systemResponseGenerated](self, "systemResponseGenerated");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemResponseGenerated");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v120, "isEqual:", v121);

    if (!v122)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent criticalError](self, "criticalError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "criticalError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent criticalError](self, "criticalError");
  v123 = objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    v124 = (void *)v123;
    -[IFTSchemaIFTClientEvent criticalError](self, "criticalError");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "criticalError");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v125, "isEqual:", v126);

    if (!v127)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent recoverableError](self, "recoverableError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recoverableError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_132;
  -[IFTSchemaIFTClientEvent recoverableError](self, "recoverableError");
  v128 = objc_claimAutoreleasedReturnValue();
  if (v128)
  {
    v129 = (void *)v128;
    -[IFTSchemaIFTClientEvent recoverableError](self, "recoverableError");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recoverableError");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v130, "isEqual:", v131);

    if (!v132)
      goto LABEL_133;
  }
  else
  {

  }
  -[IFTSchemaIFTClientEvent queryDecorationResult](self, "queryDecorationResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryDecorationResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IFTSchemaIFTClientEvent queryDecorationResult](self, "queryDecorationResult");
    v133 = objc_claimAutoreleasedReturnValue();
    if (!v133)
    {

LABEL_136:
      v138 = 1;
      goto LABEL_134;
    }
    v134 = (void *)v133;
    -[IFTSchemaIFTClientEvent queryDecorationResult](self, "queryDecorationResult");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryDecorationResult");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v135, "isEqual:", v136);

    if ((v137 & 1) != 0)
      goto LABEL_136;
  }
  else
  {
LABEL_132:

  }
LABEL_133:
  v138 = 0;
LABEL_134:

  return v138;
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
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
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

  v3 = -[IFTSchemaIFTClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[IFTSchemaIFTContextPrewarmRequest hash](self->_contextPrewarmRequest, "hash") ^ v3;
  v5 = -[IFTSchemaIFTContextPrewarmCompleted hash](self->_contextPrewarmCompleted, "hash");
  v6 = v4 ^ v5 ^ -[IFTSchemaIFTTerminate hash](self->_terminate, "hash");
  v7 = -[IFTSchemaIFTRequest hash](self->_request, "hash");
  v8 = v7 ^ -[IFTSchemaIFTRequestContentTextContentTier1 hash](self->_requestContextTextContentTier1, "hash");
  v9 = v6 ^ v8 ^ -[IFTSchemaIFTEntitySpanMatchResult hash](self->_entitySpanMatched, "hash");
  v10 = -[IFTSchemaIFTContextRetrieved hash](self->_contextRetrieved, "hash");
  v11 = v10 ^ -[IFTSchemaIFTToolRetrievalResponse hash](self->_toolsRetrieved, "hash");
  v12 = v11 ^ -[IFTSchemaIFTPlan hash](self->_planCreated, "hash");
  v13 = v9 ^ v12 ^ -[IFTSchemaASTFlatExprSearchVariantTier1 hash](self->_astFlatExprSearchVariantTier1, "hash");
  v14 = -[IFTSchemaIFTVariableStep hash](self->_variablesSet, "hash");
  v15 = v14 ^ -[IFTSchemaIFTToolResolution hash](self->_toolResolution, "hash");
  v16 = v15 ^ -[IFTSchemaIFTQueryStep hash](self->_queriesCreated, "hash");
  v17 = v16 ^ -[IFTSchemaIFTActionResolverRequest hash](self->_actionResolverRequestCreated, "hash");
  v18 = v13 ^ v17 ^ -[IFTSchemaIFTResponseGenerationRequest hash](self->_responseGenerationRequest, "hash");
  v19 = -[IFTSchemaIFTActionCancellation hash](self->_actionCancelled, "hash");
  v20 = v19 ^ -[IFTSchemaIFTContinuePlanning hash](self->_continuePlanning, "hash");
  v21 = v20 ^ -[IFTSchemaIFTAction hash](self->_actionCreated, "hash");
  v22 = v21 ^ -[IFTSchemaIFTClientAction hash](self->_clientActionCreated, "hash");
  v23 = v22 ^ -[IFTSchemaIFTQueryStepResults hash](self->_queriesExecuted, "hash");
  v24 = v18 ^ v23 ^ -[IFTSchemaIFTStatementResult hash](self->_statementEvaluated, "hash");
  v25 = -[IFTSchemaIFTSystemResponse hash](self->_systemResponseGenerated, "hash");
  v26 = v25 ^ -[IFTSchemaIFTSessionError hash](self->_criticalError, "hash");
  v27 = v26 ^ -[IFTSchemaIFTRecoverableError hash](self->_recoverableError, "hash");
  return v24 ^ v27 ^ -[IFTSchemaIFTQueryDecorationResult hash](self->_queryDecorationResult, "hash");
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
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionCancelled)
  {
    -[IFTSchemaIFTClientEvent actionCancelled](self, "actionCancelled");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionCancelled"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionCancelled"));

    }
  }
  if (self->_actionCreated)
  {
    -[IFTSchemaIFTClientEvent actionCreated](self, "actionCreated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("actionCreated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("actionCreated"));

    }
  }
  if (self->_actionResolverRequestCreated)
  {
    -[IFTSchemaIFTClientEvent actionResolverRequestCreated](self, "actionResolverRequestCreated");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("actionResolverRequestCreated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("actionResolverRequestCreated"));

    }
  }
  if (self->_astFlatExprSearchVariantTier1)
  {
    -[IFTSchemaIFTClientEvent astFlatExprSearchVariantTier1](self, "astFlatExprSearchVariantTier1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("astFlatExprSearchVariantTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("astFlatExprSearchVariantTier1"));

    }
  }
  if (self->_clientActionCreated)
  {
    -[IFTSchemaIFTClientEvent clientActionCreated](self, "clientActionCreated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("clientActionCreated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("clientActionCreated"));

    }
  }
  if (self->_contextPrewarmCompleted)
  {
    -[IFTSchemaIFTClientEvent contextPrewarmCompleted](self, "contextPrewarmCompleted");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("contextPrewarmCompleted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("contextPrewarmCompleted"));

    }
  }
  if (self->_contextPrewarmRequest)
  {
    -[IFTSchemaIFTClientEvent contextPrewarmRequest](self, "contextPrewarmRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("contextPrewarmRequest"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("contextPrewarmRequest"));

    }
  }
  if (self->_contextRetrieved)
  {
    -[IFTSchemaIFTClientEvent contextRetrieved](self, "contextRetrieved");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("contextRetrieved"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("contextRetrieved"));

    }
  }
  if (self->_continuePlanning)
  {
    -[IFTSchemaIFTClientEvent continuePlanning](self, "continuePlanning");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("continuePlanning"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("continuePlanning"));

    }
  }
  if (self->_criticalError)
  {
    -[IFTSchemaIFTClientEvent criticalError](self, "criticalError");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("criticalError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("criticalError"));

    }
  }
  if (self->_entitySpanMatched)
  {
    -[IFTSchemaIFTClientEvent entitySpanMatched](self, "entitySpanMatched");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("entitySpanMatched"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("entitySpanMatched"));

    }
  }
  if (self->_eventMetadata)
  {
    -[IFTSchemaIFTClientEvent eventMetadata](self, "eventMetadata");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("eventMetadata"));

    }
  }
  if (self->_planCreated)
  {
    -[IFTSchemaIFTClientEvent planCreated](self, "planCreated");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("planCreated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("planCreated"));

    }
  }
  if (self->_queriesCreated)
  {
    -[IFTSchemaIFTClientEvent queriesCreated](self, "queriesCreated");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("queriesCreated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("queriesCreated"));

    }
  }
  if (self->_queriesExecuted)
  {
    -[IFTSchemaIFTClientEvent queriesExecuted](self, "queriesExecuted");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("queriesExecuted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("queriesExecuted"));

    }
  }
  if (self->_queryDecorationResult)
  {
    -[IFTSchemaIFTClientEvent queryDecorationResult](self, "queryDecorationResult");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("queryDecorationResult"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("queryDecorationResult"));

    }
  }
  if (self->_recoverableError)
  {
    -[IFTSchemaIFTClientEvent recoverableError](self, "recoverableError");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("recoverableError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("recoverableError"));

    }
  }
  if (self->_request)
  {
    -[IFTSchemaIFTClientEvent request](self, "request");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("request"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("request"));

    }
  }
  if (self->_requestContextTextContentTier1)
  {
    -[IFTSchemaIFTClientEvent requestContextTextContentTier1](self, "requestContextTextContentTier1");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("requestContextTextContentTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("requestContextTextContentTier1"));

    }
  }
  if (self->_responseGenerationRequest)
  {
    -[IFTSchemaIFTClientEvent responseGenerationRequest](self, "responseGenerationRequest");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dictionaryRepresentation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("responseGenerationRequest"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("responseGenerationRequest"));

    }
  }
  if (self->_statementEvaluated)
  {
    -[IFTSchemaIFTClientEvent statementEvaluated](self, "statementEvaluated");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dictionaryRepresentation");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("statementEvaluated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("statementEvaluated"));

    }
  }
  if (self->_systemResponseGenerated)
  {
    -[IFTSchemaIFTClientEvent systemResponseGenerated](self, "systemResponseGenerated");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("systemResponseGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("systemResponseGenerated"));

    }
  }
  if (self->_terminate)
  {
    -[IFTSchemaIFTClientEvent terminate](self, "terminate");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "dictionaryRepresentation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("terminate"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("terminate"));

    }
  }
  if (self->_toolResolution)
  {
    -[IFTSchemaIFTClientEvent toolResolution](self, "toolResolution");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("toolResolution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("toolResolution"));

    }
  }
  if (self->_toolsRetrieved)
  {
    -[IFTSchemaIFTClientEvent toolsRetrieved](self, "toolsRetrieved");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "dictionaryRepresentation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("toolsRetrieved"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("toolsRetrieved"));

    }
  }
  if (self->_variablesSet)
  {
    -[IFTSchemaIFTClientEvent variablesSet](self, "variablesSet");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "dictionaryRepresentation");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("variablesSet"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("variablesSet"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v82 = v3;

  return v82;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTClientEvent)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTClientEvent *v5;
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
    self = -[IFTSchemaIFTClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTClientEvent)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTClientEvent *v5;
  uint64_t v6;
  IFTSchemaIFTClientEventMetadata *v7;
  uint64_t v8;
  IFTSchemaIFTContextPrewarmRequest *v9;
  uint64_t v10;
  IFTSchemaIFTContextPrewarmCompleted *v11;
  uint64_t v12;
  IFTSchemaIFTTerminate *v13;
  uint64_t v14;
  IFTSchemaIFTRequest *v15;
  uint64_t v16;
  IFTSchemaIFTRequestContentTextContentTier1 *v17;
  uint64_t v18;
  IFTSchemaIFTEntitySpanMatchResult *v19;
  uint64_t v20;
  IFTSchemaIFTContextRetrieved *v21;
  uint64_t v22;
  IFTSchemaIFTToolRetrievalResponse *v23;
  uint64_t v24;
  IFTSchemaIFTPlan *v25;
  uint64_t v26;
  IFTSchemaASTFlatExprSearchVariantTier1 *v27;
  uint64_t v28;
  IFTSchemaIFTVariableStep *v29;
  uint64_t v30;
  IFTSchemaIFTToolResolution *v31;
  uint64_t v32;
  IFTSchemaIFTQueryStep *v33;
  uint64_t v34;
  IFTSchemaIFTActionResolverRequest *v35;
  uint64_t v36;
  IFTSchemaIFTResponseGenerationRequest *v37;
  uint64_t v38;
  IFTSchemaIFTActionCancellation *v39;
  uint64_t v40;
  IFTSchemaIFTContinuePlanning *v41;
  uint64_t v42;
  IFTSchemaIFTAction *v43;
  void *v44;
  IFTSchemaIFTClientAction *v45;
  void *v46;
  IFTSchemaIFTQueryStepResults *v47;
  void *v48;
  IFTSchemaIFTStatementResult *v49;
  void *v50;
  IFTSchemaIFTSystemResponse *v51;
  void *v52;
  IFTSchemaIFTSessionError *v53;
  void *v54;
  IFTSchemaIFTRecoverableError *v55;
  void *v56;
  IFTSchemaIFTQueryDecorationResult *v57;
  IFTSchemaIFTClientEvent *v58;
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
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  objc_super v79;

  v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)IFTSchemaIFTClientEvent;
  v5 = -[IFTSchemaIFTClientEvent init](&v79, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTClientEventMetadata initWithDictionary:]([IFTSchemaIFTClientEventMetadata alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextPrewarmRequest"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaIFTContextPrewarmRequest initWithDictionary:]([IFTSchemaIFTContextPrewarmRequest alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTClientEvent setContextPrewarmRequest:](v5, "setContextPrewarmRequest:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextPrewarmCompleted"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[IFTSchemaIFTContextPrewarmCompleted initWithDictionary:]([IFTSchemaIFTContextPrewarmCompleted alloc], "initWithDictionary:", v10);
      -[IFTSchemaIFTClientEvent setContextPrewarmCompleted:](v5, "setContextPrewarmCompleted:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("terminate"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[IFTSchemaIFTTerminate initWithDictionary:]([IFTSchemaIFTTerminate alloc], "initWithDictionary:", v12);
      -[IFTSchemaIFTClientEvent setTerminate:](v5, "setTerminate:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("request"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[IFTSchemaIFTRequest initWithDictionary:]([IFTSchemaIFTRequest alloc], "initWithDictionary:", v14);
      -[IFTSchemaIFTClientEvent setRequest:](v5, "setRequest:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestContextTextContentTier1"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[IFTSchemaIFTRequestContentTextContentTier1 initWithDictionary:]([IFTSchemaIFTRequestContentTextContentTier1 alloc], "initWithDictionary:", v16);
      -[IFTSchemaIFTClientEvent setRequestContextTextContentTier1:](v5, "setRequestContextTextContentTier1:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitySpanMatched"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[IFTSchemaIFTEntitySpanMatchResult initWithDictionary:]([IFTSchemaIFTEntitySpanMatchResult alloc], "initWithDictionary:", v18);
      -[IFTSchemaIFTClientEvent setEntitySpanMatched:](v5, "setEntitySpanMatched:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextRetrieved"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v77 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[IFTSchemaIFTContextRetrieved initWithDictionary:]([IFTSchemaIFTContextRetrieved alloc], "initWithDictionary:", v20);
      -[IFTSchemaIFTClientEvent setContextRetrieved:](v5, "setContextRetrieved:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toolsRetrieved"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v76 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[IFTSchemaIFTToolRetrievalResponse initWithDictionary:]([IFTSchemaIFTToolRetrievalResponse alloc], "initWithDictionary:", v22);
      -[IFTSchemaIFTClientEvent setToolsRetrieved:](v5, "setToolsRetrieved:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planCreated"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v75 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[IFTSchemaIFTPlan initWithDictionary:]([IFTSchemaIFTPlan alloc], "initWithDictionary:", v24);
      -[IFTSchemaIFTClientEvent setPlanCreated:](v5, "setPlanCreated:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("astFlatExprSearchVariantTier1"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v74 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[IFTSchemaASTFlatExprSearchVariantTier1 initWithDictionary:]([IFTSchemaASTFlatExprSearchVariantTier1 alloc], "initWithDictionary:", v26);
      -[IFTSchemaIFTClientEvent setAstFlatExprSearchVariantTier1:](v5, "setAstFlatExprSearchVariantTier1:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("variablesSet"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v73 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[IFTSchemaIFTVariableStep initWithDictionary:]([IFTSchemaIFTVariableStep alloc], "initWithDictionary:", v28);
      -[IFTSchemaIFTClientEvent setVariablesSet:](v5, "setVariablesSet:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toolResolution"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v72 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[IFTSchemaIFTToolResolution initWithDictionary:]([IFTSchemaIFTToolResolution alloc], "initWithDictionary:", v30);
      -[IFTSchemaIFTClientEvent setToolResolution:](v5, "setToolResolution:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queriesCreated"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[IFTSchemaIFTQueryStep initWithDictionary:]([IFTSchemaIFTQueryStep alloc], "initWithDictionary:", v32);
      -[IFTSchemaIFTClientEvent setQueriesCreated:](v5, "setQueriesCreated:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionResolverRequestCreated"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v70 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[IFTSchemaIFTActionResolverRequest initWithDictionary:]([IFTSchemaIFTActionResolverRequest alloc], "initWithDictionary:", v34);
      -[IFTSchemaIFTClientEvent setActionResolverRequestCreated:](v5, "setActionResolverRequestCreated:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseGenerationRequest"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v69 = (void *)v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[IFTSchemaIFTResponseGenerationRequest initWithDictionary:]([IFTSchemaIFTResponseGenerationRequest alloc], "initWithDictionary:", v36);
      -[IFTSchemaIFTClientEvent setResponseGenerationRequest:](v5, "setResponseGenerationRequest:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionCancelled"));
    v38 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v68 = (void *)v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[IFTSchemaIFTActionCancellation initWithDictionary:]([IFTSchemaIFTActionCancellation alloc], "initWithDictionary:", v38);
      -[IFTSchemaIFTClientEvent setActionCancelled:](v5, "setActionCancelled:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("continuePlanning"));
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v67 = (void *)v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[IFTSchemaIFTContinuePlanning initWithDictionary:]([IFTSchemaIFTContinuePlanning alloc], "initWithDictionary:", v40);
      -[IFTSchemaIFTClientEvent setContinuePlanning:](v5, "setContinuePlanning:", v41);

    }
    v65 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionCreated"));
    v42 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[IFTSchemaIFTAction initWithDictionary:]([IFTSchemaIFTAction alloc], "initWithDictionary:", v42);
      -[IFTSchemaIFTClientEvent setActionCreated:](v5, "setActionCreated:", v43);

    }
    v64 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientActionCreated"), v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[IFTSchemaIFTClientAction initWithDictionary:]([IFTSchemaIFTClientAction alloc], "initWithDictionary:", v44);
      -[IFTSchemaIFTClientEvent setClientActionCreated:](v5, "setClientActionCreated:", v45);

    }
    v63 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queriesExecuted"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[IFTSchemaIFTQueryStepResults initWithDictionary:]([IFTSchemaIFTQueryStepResults alloc], "initWithDictionary:", v46);
      -[IFTSchemaIFTClientEvent setQueriesExecuted:](v5, "setQueriesExecuted:", v47);

    }
    v62 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("statementEvaluated"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[IFTSchemaIFTStatementResult initWithDictionary:]([IFTSchemaIFTStatementResult alloc], "initWithDictionary:", v48);
      -[IFTSchemaIFTClientEvent setStatementEvaluated:](v5, "setStatementEvaluated:", v49);

    }
    v61 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemResponseGenerated"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = -[IFTSchemaIFTSystemResponse initWithDictionary:]([IFTSchemaIFTSystemResponse alloc], "initWithDictionary:", v50);
      -[IFTSchemaIFTClientEvent setSystemResponseGenerated:](v5, "setSystemResponseGenerated:", v51);

    }
    v66 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("criticalError"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = -[IFTSchemaIFTSessionError initWithDictionary:]([IFTSchemaIFTSessionError alloc], "initWithDictionary:", v52);
      -[IFTSchemaIFTClientEvent setCriticalError:](v5, "setCriticalError:", v53);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recoverableError"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = -[IFTSchemaIFTRecoverableError initWithDictionary:]([IFTSchemaIFTRecoverableError alloc], "initWithDictionary:", v54);
      -[IFTSchemaIFTClientEvent setRecoverableError:](v5, "setRecoverableError:", v55);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryDecorationResult"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = -[IFTSchemaIFTQueryDecorationResult initWithDictionary:]([IFTSchemaIFTQueryDecorationResult alloc], "initWithDictionary:", v56);
      -[IFTSchemaIFTClientEvent setQueryDecorationResult:](v5, "setQueryDecorationResult:", v57);

    }
    v58 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (IFTSchemaIFTClientEventMetadata)eventMetadata
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

- (BOOL)hasContextPrewarmRequest
{
  return self->_hasContextPrewarmRequest;
}

- (void)setHasContextPrewarmRequest:(BOOL)a3
{
  self->_hasContextPrewarmRequest = a3;
}

- (BOOL)hasContextPrewarmCompleted
{
  return self->_hasContextPrewarmCompleted;
}

- (void)setHasContextPrewarmCompleted:(BOOL)a3
{
  self->_hasContextPrewarmCompleted = a3;
}

- (BOOL)hasTerminate
{
  return self->_hasTerminate;
}

- (void)setHasTerminate:(BOOL)a3
{
  self->_hasTerminate = a3;
}

- (BOOL)hasRequest
{
  return self->_hasRequest;
}

- (void)setHasRequest:(BOOL)a3
{
  self->_hasRequest = a3;
}

- (BOOL)hasRequestContextTextContentTier1
{
  return self->_hasRequestContextTextContentTier1;
}

- (void)setHasRequestContextTextContentTier1:(BOOL)a3
{
  self->_hasRequestContextTextContentTier1 = a3;
}

- (BOOL)hasEntitySpanMatched
{
  return self->_hasEntitySpanMatched;
}

- (void)setHasEntitySpanMatched:(BOOL)a3
{
  self->_hasEntitySpanMatched = a3;
}

- (BOOL)hasContextRetrieved
{
  return self->_hasContextRetrieved;
}

- (void)setHasContextRetrieved:(BOOL)a3
{
  self->_hasContextRetrieved = a3;
}

- (BOOL)hasToolsRetrieved
{
  return self->_hasToolsRetrieved;
}

- (void)setHasToolsRetrieved:(BOOL)a3
{
  self->_hasToolsRetrieved = a3;
}

- (BOOL)hasPlanCreated
{
  return self->_hasPlanCreated;
}

- (void)setHasPlanCreated:(BOOL)a3
{
  self->_hasPlanCreated = a3;
}

- (BOOL)hasAstFlatExprSearchVariantTier1
{
  return self->_hasAstFlatExprSearchVariantTier1;
}

- (void)setHasAstFlatExprSearchVariantTier1:(BOOL)a3
{
  self->_hasAstFlatExprSearchVariantTier1 = a3;
}

- (BOOL)hasVariablesSet
{
  return self->_hasVariablesSet;
}

- (void)setHasVariablesSet:(BOOL)a3
{
  self->_hasVariablesSet = a3;
}

- (BOOL)hasToolResolution
{
  return self->_hasToolResolution;
}

- (void)setHasToolResolution:(BOOL)a3
{
  self->_hasToolResolution = a3;
}

- (BOOL)hasQueriesCreated
{
  return self->_hasQueriesCreated;
}

- (void)setHasQueriesCreated:(BOOL)a3
{
  self->_hasQueriesCreated = a3;
}

- (BOOL)hasActionResolverRequestCreated
{
  return self->_hasActionResolverRequestCreated;
}

- (void)setHasActionResolverRequestCreated:(BOOL)a3
{
  self->_hasActionResolverRequestCreated = a3;
}

- (BOOL)hasResponseGenerationRequest
{
  return self->_hasResponseGenerationRequest;
}

- (void)setHasResponseGenerationRequest:(BOOL)a3
{
  self->_hasResponseGenerationRequest = a3;
}

- (BOOL)hasActionCancelled
{
  return self->_hasActionCancelled;
}

- (void)setHasActionCancelled:(BOOL)a3
{
  self->_hasActionCancelled = a3;
}

- (BOOL)hasContinuePlanning
{
  return self->_hasContinuePlanning;
}

- (void)setHasContinuePlanning:(BOOL)a3
{
  self->_hasContinuePlanning = a3;
}

- (BOOL)hasActionCreated
{
  return self->_hasActionCreated;
}

- (void)setHasActionCreated:(BOOL)a3
{
  self->_hasActionCreated = a3;
}

- (BOOL)hasClientActionCreated
{
  return self->_hasClientActionCreated;
}

- (void)setHasClientActionCreated:(BOOL)a3
{
  self->_hasClientActionCreated = a3;
}

- (BOOL)hasQueriesExecuted
{
  return self->_hasQueriesExecuted;
}

- (void)setHasQueriesExecuted:(BOOL)a3
{
  self->_hasQueriesExecuted = a3;
}

- (BOOL)hasStatementEvaluated
{
  return self->_hasStatementEvaluated;
}

- (void)setHasStatementEvaluated:(BOOL)a3
{
  self->_hasStatementEvaluated = a3;
}

- (BOOL)hasSystemResponseGenerated
{
  return self->_hasSystemResponseGenerated;
}

- (void)setHasSystemResponseGenerated:(BOOL)a3
{
  self->_hasSystemResponseGenerated = a3;
}

- (BOOL)hasCriticalError
{
  return self->_hasCriticalError;
}

- (void)setHasCriticalError:(BOOL)a3
{
  self->_hasCriticalError = a3;
}

- (BOOL)hasRecoverableError
{
  return self->_hasRecoverableError;
}

- (void)setHasRecoverableError:(BOOL)a3
{
  self->_hasRecoverableError = a3;
}

- (BOOL)hasQueryDecorationResult
{
  return self->_hasQueryDecorationResult;
}

- (void)setHasQueryDecorationResult:(BOOL)a3
{
  self->_hasQueryDecorationResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDecorationResult, 0);
  objc_storeStrong((id *)&self->_recoverableError, 0);
  objc_storeStrong((id *)&self->_criticalError, 0);
  objc_storeStrong((id *)&self->_systemResponseGenerated, 0);
  objc_storeStrong((id *)&self->_statementEvaluated, 0);
  objc_storeStrong((id *)&self->_queriesExecuted, 0);
  objc_storeStrong((id *)&self->_clientActionCreated, 0);
  objc_storeStrong((id *)&self->_actionCreated, 0);
  objc_storeStrong((id *)&self->_continuePlanning, 0);
  objc_storeStrong((id *)&self->_actionCancelled, 0);
  objc_storeStrong((id *)&self->_responseGenerationRequest, 0);
  objc_storeStrong((id *)&self->_actionResolverRequestCreated, 0);
  objc_storeStrong((id *)&self->_queriesCreated, 0);
  objc_storeStrong((id *)&self->_toolResolution, 0);
  objc_storeStrong((id *)&self->_variablesSet, 0);
  objc_storeStrong((id *)&self->_astFlatExprSearchVariantTier1, 0);
  objc_storeStrong((id *)&self->_planCreated, 0);
  objc_storeStrong((id *)&self->_toolsRetrieved, 0);
  objc_storeStrong((id *)&self->_contextRetrieved, 0);
  objc_storeStrong((id *)&self->_entitySpanMatched, 0);
  objc_storeStrong((id *)&self->_requestContextTextContentTier1, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_terminate, 0);
  objc_storeStrong((id *)&self->_contextPrewarmCompleted, 0);
  objc_storeStrong((id *)&self->_contextPrewarmRequest, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 89;
}

@end
