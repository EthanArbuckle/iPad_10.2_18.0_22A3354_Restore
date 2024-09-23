@implementation CNVSchemaCNVClientEvent

- (id)getComponentId
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;

  -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cnvId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "value");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
        goto LABEL_11;
    }
  }
  -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "value");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v10, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        v4 = v10;
LABEL_11:
        v16 = v4;
        v4 = v16;
        goto LABEL_13;
      }
    }
  }
  -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "value");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v4, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
      goto LABEL_11;
    goto LABEL_12;
  }
LABEL_13:

  return v16;
}

- (int)componentName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cnvId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_5;
  objc_msgSend(v4, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v6 = (void *)v5;
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    LODWORD(v9) = 14;
  }
  else
  {
LABEL_5:
    -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_9;
    objc_msgSend(v11, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_9;
    v13 = (void *)v12;
    objc_msgSend(v11, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      LODWORD(v9) = 1;
      v4 = v11;
    }
    else
    {
LABEL_9:
      -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subRequestId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v4, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v4, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "length");

          if (v18)
            LODWORD(v9) = 43;
          else
            LODWORD(v9) = 0;
        }
      }
      else
      {
        LODWORD(v9) = 0;
      }
    }
  }

  return (int)v9;
}

+ (int)joinability
{
  return 2;
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
  objc_super v64;

  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)CNVSchemaCNVClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v64, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[CNVSchemaCNVClientEvent deleteCnvUsoGraphTier1](self, "deleteCnvUsoGraphTier1");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[CNVSchemaCNVClientEvent deleteCnvUsoGraphTier1](self, "deleteCnvUsoGraphTier1");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[CNVSchemaCNVClientEvent deleteCnvUsoGraphTier1](self, "deleteCnvUsoGraphTier1");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[CNVSchemaCNVClientEvent deleteCnvUsoGraphTier1](self, "deleteCnvUsoGraphTier1");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[CNVSchemaCNVClientEvent deleteCnvUsoGraphTier1](self, "deleteCnvUsoGraphTier1");
  -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CNVSchemaCNVClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[CNVSchemaCNVClientEvent intentReformationContext](self, "intentReformationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CNVSchemaCNVClientEvent deleteIntentReformationContext](self, "deleteIntentReformationContext");
  -[CNVSchemaCNVClientEvent cnvUsoGraphTier1](self, "cnvUsoGraphTier1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CNVSchemaCNVClientEvent deleteCnvUsoGraphTier1](self, "deleteCnvUsoGraphTier1");
  -[CNVSchemaCNVClientEvent intentEagerExecutionContext](self, "intentEagerExecutionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[CNVSchemaCNVClientEvent deleteIntentEagerExecutionContext](self, "deleteIntentEagerExecutionContext");
  -[CNVSchemaCNVClientEvent intentFinalExecutionContext](self, "intentFinalExecutionContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[CNVSchemaCNVClientEvent deleteIntentFinalExecutionContext](self, "deleteIntentFinalExecutionContext");
  -[CNVSchemaCNVClientEvent actionCandidatesGenerated](self, "actionCandidatesGenerated");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[CNVSchemaCNVClientEvent deleteActionCandidatesGenerated](self, "deleteActionCandidatesGenerated");
  -[CNVSchemaCNVClientEvent actionCandidatesGeneratedTier1](self, "actionCandidatesGeneratedTier1");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[CNVSchemaCNVClientEvent deleteActionCandidatesGeneratedTier1](self, "deleteActionCandidatesGeneratedTier1");
  -[CNVSchemaCNVClientEvent actionCandidatesCollated](self, "actionCandidatesCollated");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[CNVSchemaCNVClientEvent deleteActionCandidatesCollated](self, "deleteActionCandidatesCollated");
  -[CNVSchemaCNVClientEvent disambiguationContext](self, "disambiguationContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[CNVSchemaCNVClientEvent deleteDisambiguationContext](self, "deleteDisambiguationContext");
  -[CNVSchemaCNVClientEvent executionOverridesEvaluated](self, "executionOverridesEvaluated");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[CNVSchemaCNVClientEvent deleteExecutionOverridesEvaluated](self, "deleteExecutionOverridesEvaluated");
  -[CNVSchemaCNVClientEvent executionPrepareContext](self, "executionPrepareContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[CNVSchemaCNVClientEvent deleteExecutionPrepareContext](self, "deleteExecutionPrepareContext");
  -[CNVSchemaCNVClientEvent flowPluginLoadContext](self, "flowPluginLoadContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[CNVSchemaCNVClientEvent deleteFlowPluginLoadContext](self, "deleteFlowPluginLoadContext");
  -[CNVSchemaCNVClientEvent findFlowContext](self, "findFlowContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[CNVSchemaCNVClientEvent deleteFindFlowContext](self, "deleteFindFlowContext");
  -[CNVSchemaCNVClientEvent flowPluginInputContext](self, "flowPluginInputContext");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[CNVSchemaCNVClientEvent deleteFlowPluginInputContext](self, "deleteFlowPluginInputContext");
  -[CNVSchemaCNVClientEvent flowPluginExecutionContext](self, "flowPluginExecutionContext");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[CNVSchemaCNVClientEvent deleteFlowPluginExecutionContext](self, "deleteFlowPluginExecutionContext");
  -[CNVSchemaCNVClientEvent preFlowPrepareContext](self, "preFlowPrepareContext");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[CNVSchemaCNVClientEvent deletePreFlowPrepareContext](self, "deletePreFlowPrepareContext");
  -[CNVSchemaCNVClientEvent postFlowPrepareContext](self, "postFlowPrepareContext");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[CNVSchemaCNVClientEvent deletePostFlowPrepareContext](self, "deletePostFlowPrepareContext");
  -[CNVSchemaCNVClientEvent executionCommitContext](self, "executionCommitContext");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applySensitiveConditionsPolicy:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "suppressMessage");

  if (v59)
    -[CNVSchemaCNVClientEvent deleteExecutionCommitContext](self, "deleteExecutionCommitContext");
  -[CNVSchemaCNVClientEvent decisionEngineResponseReported](self, "decisionEngineResponseReported");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "applySensitiveConditionsPolicy:", v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "suppressMessage");

  if (v62)
    -[CNVSchemaCNVClientEvent deleteDecisionEngineResponseReported](self, "deleteDecisionEngineResponseReported");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[CNVSchemaCNVClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 2 > 0x11)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629080[v3 - 2]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 0x11)
    return 0;
  else
    return off_1E5629110[a3 - 2];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[CNVSchemaCNVClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 2 > 0x11)
    return CFSTR("com.apple.aiml.siri.cnv.CNVClientEvent");
  else
    return off_1E562C1C0[v2 - 2];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[CNVSchemaCNVClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setIntentReformationContext:(id)a3
{
  CNVSchemaCNVIntentReformationContext *v4;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;

  v4 = (CNVSchemaCNVIntentReformationContext *)a3;
  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  self->_whichEvent_Type = 2 * (v4 != 0);
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = v4;

}

- (CNVSchemaCNVIntentReformationContext)intentReformationContext
{
  if (self->_whichEvent_Type == 2)
    return self->_intentReformationContext;
  else
    return (CNVSchemaCNVIntentReformationContext *)0;
}

- (void)deleteIntentReformationContext
{
  CNVSchemaCNVIntentReformationContext *intentReformationContext;

  if (self->_whichEvent_Type == 2)
  {
    self->_whichEvent_Type = 0;
    intentReformationContext = self->_intentReformationContext;
    self->_intentReformationContext = 0;

  }
}

- (void)setCnvUsoGraphTier1:(id)a3
{
  CNVSchemaCNVUsoGraphTier1 *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;

  v4 = (CNVSchemaCNVUsoGraphTier1 *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 3;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = v4;

}

- (CNVSchemaCNVUsoGraphTier1)cnvUsoGraphTier1
{
  if (self->_whichEvent_Type == 3)
    return self->_cnvUsoGraphTier1;
  else
    return (CNVSchemaCNVUsoGraphTier1 *)0;
}

- (void)deleteCnvUsoGraphTier1
{
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;

  if (self->_whichEvent_Type == 3)
  {
    self->_whichEvent_Type = 0;
    cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
    self->_cnvUsoGraphTier1 = 0;

  }
}

- (void)setIntentEagerExecutionContext:(id)a3
{
  CNVSchemaCNVIntentEagerExecutionContext *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;

  v4 = (CNVSchemaCNVIntentEagerExecutionContext *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  self->_whichEvent_Type = 4 * (v4 != 0);
  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = v4;

}

- (CNVSchemaCNVIntentEagerExecutionContext)intentEagerExecutionContext
{
  if (self->_whichEvent_Type == 4)
    return self->_intentEagerExecutionContext;
  else
    return (CNVSchemaCNVIntentEagerExecutionContext *)0;
}

- (void)deleteIntentEagerExecutionContext
{
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;

  if (self->_whichEvent_Type == 4)
  {
    self->_whichEvent_Type = 0;
    intentEagerExecutionContext = self->_intentEagerExecutionContext;
    self->_intentEagerExecutionContext = 0;

  }
}

- (void)setIntentFinalExecutionContext:(id)a3
{
  CNVSchemaCNVIntentFinalExecutionContext *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;

  v4 = (CNVSchemaCNVIntentFinalExecutionContext *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 5;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = v4;

}

- (CNVSchemaCNVIntentFinalExecutionContext)intentFinalExecutionContext
{
  if (self->_whichEvent_Type == 5)
    return self->_intentFinalExecutionContext;
  else
    return (CNVSchemaCNVIntentFinalExecutionContext *)0;
}

- (void)deleteIntentFinalExecutionContext
{
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;

  if (self->_whichEvent_Type == 5)
  {
    self->_whichEvent_Type = 0;
    intentFinalExecutionContext = self->_intentFinalExecutionContext;
    self->_intentFinalExecutionContext = 0;

  }
}

- (void)setActionCandidatesGenerated:(id)a3
{
  CNVSchemaCNVActionCandidatesGenerated *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;

  v4 = (CNVSchemaCNVActionCandidatesGenerated *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 6;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = v4;

}

- (CNVSchemaCNVActionCandidatesGenerated)actionCandidatesGenerated
{
  if (self->_whichEvent_Type == 6)
    return self->_actionCandidatesGenerated;
  else
    return (CNVSchemaCNVActionCandidatesGenerated *)0;
}

- (void)deleteActionCandidatesGenerated
{
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;

  if (self->_whichEvent_Type == 6)
  {
    self->_whichEvent_Type = 0;
    actionCandidatesGenerated = self->_actionCandidatesGenerated;
    self->_actionCandidatesGenerated = 0;

  }
}

- (void)setActionCandidatesGeneratedTier1:(id)a3
{
  CNVSchemaCNVActionCandidatesGeneratedTier1 *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;

  v4 = (CNVSchemaCNVActionCandidatesGeneratedTier1 *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 7;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = v4;

}

- (CNVSchemaCNVActionCandidatesGeneratedTier1)actionCandidatesGeneratedTier1
{
  if (self->_whichEvent_Type == 7)
    return self->_actionCandidatesGeneratedTier1;
  else
    return (CNVSchemaCNVActionCandidatesGeneratedTier1 *)0;
}

- (void)deleteActionCandidatesGeneratedTier1
{
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;

  if (self->_whichEvent_Type == 7)
  {
    self->_whichEvent_Type = 0;
    actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
    self->_actionCandidatesGeneratedTier1 = 0;

  }
}

- (void)setActionCandidatesCollated:(id)a3
{
  CNVSchemaCNVActionCandidatesCollated *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;

  v4 = (CNVSchemaCNVActionCandidatesCollated *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  self->_whichEvent_Type = 8 * (v4 != 0);
  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = v4;

}

- (CNVSchemaCNVActionCandidatesCollated)actionCandidatesCollated
{
  if (self->_whichEvent_Type == 8)
    return self->_actionCandidatesCollated;
  else
    return (CNVSchemaCNVActionCandidatesCollated *)0;
}

- (void)deleteActionCandidatesCollated
{
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;

  if (self->_whichEvent_Type == 8)
  {
    self->_whichEvent_Type = 0;
    actionCandidatesCollated = self->_actionCandidatesCollated;
    self->_actionCandidatesCollated = 0;

  }
}

- (void)setDisambiguationContext:(id)a3
{
  CNVSchemaCNVDisambiguationContext *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;

  v4 = (CNVSchemaCNVDisambiguationContext *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 9;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = v4;

}

- (CNVSchemaCNVDisambiguationContext)disambiguationContext
{
  if (self->_whichEvent_Type == 9)
    return self->_disambiguationContext;
  else
    return (CNVSchemaCNVDisambiguationContext *)0;
}

- (void)deleteDisambiguationContext
{
  CNVSchemaCNVDisambiguationContext *disambiguationContext;

  if (self->_whichEvent_Type == 9)
  {
    self->_whichEvent_Type = 0;
    disambiguationContext = self->_disambiguationContext;
    self->_disambiguationContext = 0;

  }
}

- (void)setExecutionOverridesEvaluated:(id)a3
{
  CNVSchemaCNVExecutionOverridesEvaluated *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;

  v4 = (CNVSchemaCNVExecutionOverridesEvaluated *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 10;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = v4;

}

- (CNVSchemaCNVExecutionOverridesEvaluated)executionOverridesEvaluated
{
  if (self->_whichEvent_Type == 10)
    return self->_executionOverridesEvaluated;
  else
    return (CNVSchemaCNVExecutionOverridesEvaluated *)0;
}

- (void)deleteExecutionOverridesEvaluated
{
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;

  if (self->_whichEvent_Type == 10)
  {
    self->_whichEvent_Type = 0;
    executionOverridesEvaluated = self->_executionOverridesEvaluated;
    self->_executionOverridesEvaluated = 0;

  }
}

- (void)setExecutionPrepareContext:(id)a3
{
  CNVSchemaCNVExecutionPrepareContext *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;

  v4 = (CNVSchemaCNVExecutionPrepareContext *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 11;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = v4;

}

- (CNVSchemaCNVExecutionPrepareContext)executionPrepareContext
{
  if (self->_whichEvent_Type == 11)
    return self->_executionPrepareContext;
  else
    return (CNVSchemaCNVExecutionPrepareContext *)0;
}

- (void)deleteExecutionPrepareContext
{
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;

  if (self->_whichEvent_Type == 11)
  {
    self->_whichEvent_Type = 0;
    executionPrepareContext = self->_executionPrepareContext;
    self->_executionPrepareContext = 0;

  }
}

- (void)setFlowPluginLoadContext:(id)a3
{
  CNVSchemaCNVFlowPluginLoadContext *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;

  v4 = (CNVSchemaCNVFlowPluginLoadContext *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 12;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = v4;

}

- (CNVSchemaCNVFlowPluginLoadContext)flowPluginLoadContext
{
  if (self->_whichEvent_Type == 12)
    return self->_flowPluginLoadContext;
  else
    return (CNVSchemaCNVFlowPluginLoadContext *)0;
}

- (void)deleteFlowPluginLoadContext
{
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;

  if (self->_whichEvent_Type == 12)
  {
    self->_whichEvent_Type = 0;
    flowPluginLoadContext = self->_flowPluginLoadContext;
    self->_flowPluginLoadContext = 0;

  }
}

- (void)setFindFlowContext:(id)a3
{
  CNVSchemaCNVFindFlowContext *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVFindFlowContext *findFlowContext;

  v4 = (CNVSchemaCNVFindFlowContext *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 13;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = v4;

}

- (CNVSchemaCNVFindFlowContext)findFlowContext
{
  if (self->_whichEvent_Type == 13)
    return self->_findFlowContext;
  else
    return (CNVSchemaCNVFindFlowContext *)0;
}

- (void)deleteFindFlowContext
{
  CNVSchemaCNVFindFlowContext *findFlowContext;

  if (self->_whichEvent_Type == 13)
  {
    self->_whichEvent_Type = 0;
    findFlowContext = self->_findFlowContext;
    self->_findFlowContext = 0;

  }
}

- (void)setFlowPluginInputContext:(id)a3
{
  CNVSchemaCNVFlowPluginInputContext *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;

  v4 = (CNVSchemaCNVFlowPluginInputContext *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 14;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = v4;

}

- (CNVSchemaCNVFlowPluginInputContext)flowPluginInputContext
{
  if (self->_whichEvent_Type == 14)
    return self->_flowPluginInputContext;
  else
    return (CNVSchemaCNVFlowPluginInputContext *)0;
}

- (void)deleteFlowPluginInputContext
{
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;

  if (self->_whichEvent_Type == 14)
  {
    self->_whichEvent_Type = 0;
    flowPluginInputContext = self->_flowPluginInputContext;
    self->_flowPluginInputContext = 0;

  }
}

- (void)setFlowPluginExecutionContext:(id)a3
{
  CNVSchemaCNVFlowPluginExecutionContext *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;

  v4 = (CNVSchemaCNVFlowPluginExecutionContext *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 15;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = v4;

}

- (CNVSchemaCNVFlowPluginExecutionContext)flowPluginExecutionContext
{
  if (self->_whichEvent_Type == 15)
    return self->_flowPluginExecutionContext;
  else
    return (CNVSchemaCNVFlowPluginExecutionContext *)0;
}

- (void)deleteFlowPluginExecutionContext
{
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;

  if (self->_whichEvent_Type == 15)
  {
    self->_whichEvent_Type = 0;
    flowPluginExecutionContext = self->_flowPluginExecutionContext;
    self->_flowPluginExecutionContext = 0;

  }
}

- (void)setPreFlowPrepareContext:(id)a3
{
  CNVSchemaCNVPreFlowPrepareContext *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;

  v4 = (CNVSchemaCNVPreFlowPrepareContext *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  self->_whichEvent_Type = 16 * (v4 != 0);
  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = v4;

}

- (CNVSchemaCNVPreFlowPrepareContext)preFlowPrepareContext
{
  if (self->_whichEvent_Type == 16)
    return self->_preFlowPrepareContext;
  else
    return (CNVSchemaCNVPreFlowPrepareContext *)0;
}

- (void)deletePreFlowPrepareContext
{
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;

  if (self->_whichEvent_Type == 16)
  {
    self->_whichEvent_Type = 0;
    preFlowPrepareContext = self->_preFlowPrepareContext;
    self->_preFlowPrepareContext = 0;

  }
}

- (void)setPostFlowPrepareContext:(id)a3
{
  CNVSchemaCNVPostFlowPrepareContext *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;

  v4 = (CNVSchemaCNVPostFlowPrepareContext *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 17;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = v4;

}

- (CNVSchemaCNVPostFlowPrepareContext)postFlowPrepareContext
{
  if (self->_whichEvent_Type == 17)
    return self->_postFlowPrepareContext;
  else
    return (CNVSchemaCNVPostFlowPrepareContext *)0;
}

- (void)deletePostFlowPrepareContext
{
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;

  if (self->_whichEvent_Type == 17)
  {
    self->_whichEvent_Type = 0;
    postFlowPrepareContext = self->_postFlowPrepareContext;
    self->_postFlowPrepareContext = 0;

  }
}

- (void)setExecutionCommitContext:(id)a3
{
  CNVSchemaCNVExecutionCommitContext *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;
  unint64_t v22;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;

  v4 = (CNVSchemaCNVExecutionCommitContext *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = 0;

  v22 = 18;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = v4;

}

- (CNVSchemaCNVExecutionCommitContext)executionCommitContext
{
  if (self->_whichEvent_Type == 18)
    return self->_executionCommitContext;
  else
    return (CNVSchemaCNVExecutionCommitContext *)0;
}

- (void)deleteExecutionCommitContext
{
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;

  if (self->_whichEvent_Type == 18)
  {
    self->_whichEvent_Type = 0;
    executionCommitContext = self->_executionCommitContext;
    self->_executionCommitContext = 0;

  }
}

- (void)setDecisionEngineResponseReported:(id)a3
{
  CNVSchemaCNVDecisionEngineResponseReported *v4;
  CNVSchemaCNVIntentReformationContext *intentReformationContext;
  CNVSchemaCNVUsoGraphTier1 *cnvUsoGraphTier1;
  CNVSchemaCNVIntentEagerExecutionContext *intentEagerExecutionContext;
  CNVSchemaCNVIntentFinalExecutionContext *intentFinalExecutionContext;
  CNVSchemaCNVActionCandidatesGenerated *actionCandidatesGenerated;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *actionCandidatesGeneratedTier1;
  CNVSchemaCNVActionCandidatesCollated *actionCandidatesCollated;
  CNVSchemaCNVDisambiguationContext *disambiguationContext;
  CNVSchemaCNVExecutionOverridesEvaluated *executionOverridesEvaluated;
  CNVSchemaCNVExecutionPrepareContext *executionPrepareContext;
  CNVSchemaCNVFlowPluginLoadContext *flowPluginLoadContext;
  CNVSchemaCNVFindFlowContext *findFlowContext;
  CNVSchemaCNVFlowPluginInputContext *flowPluginInputContext;
  CNVSchemaCNVFlowPluginExecutionContext *flowPluginExecutionContext;
  CNVSchemaCNVPreFlowPrepareContext *preFlowPrepareContext;
  CNVSchemaCNVPostFlowPrepareContext *postFlowPrepareContext;
  CNVSchemaCNVExecutionCommitContext *executionCommitContext;
  unint64_t v22;
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;

  v4 = (CNVSchemaCNVDecisionEngineResponseReported *)a3;
  intentReformationContext = self->_intentReformationContext;
  self->_intentReformationContext = 0;

  cnvUsoGraphTier1 = self->_cnvUsoGraphTier1;
  self->_cnvUsoGraphTier1 = 0;

  intentEagerExecutionContext = self->_intentEagerExecutionContext;
  self->_intentEagerExecutionContext = 0;

  intentFinalExecutionContext = self->_intentFinalExecutionContext;
  self->_intentFinalExecutionContext = 0;

  actionCandidatesGenerated = self->_actionCandidatesGenerated;
  self->_actionCandidatesGenerated = 0;

  actionCandidatesGeneratedTier1 = self->_actionCandidatesGeneratedTier1;
  self->_actionCandidatesGeneratedTier1 = 0;

  actionCandidatesCollated = self->_actionCandidatesCollated;
  self->_actionCandidatesCollated = 0;

  disambiguationContext = self->_disambiguationContext;
  self->_disambiguationContext = 0;

  executionOverridesEvaluated = self->_executionOverridesEvaluated;
  self->_executionOverridesEvaluated = 0;

  executionPrepareContext = self->_executionPrepareContext;
  self->_executionPrepareContext = 0;

  flowPluginLoadContext = self->_flowPluginLoadContext;
  self->_flowPluginLoadContext = 0;

  findFlowContext = self->_findFlowContext;
  self->_findFlowContext = 0;

  flowPluginInputContext = self->_flowPluginInputContext;
  self->_flowPluginInputContext = 0;

  flowPluginExecutionContext = self->_flowPluginExecutionContext;
  self->_flowPluginExecutionContext = 0;

  preFlowPrepareContext = self->_preFlowPrepareContext;
  self->_preFlowPrepareContext = 0;

  postFlowPrepareContext = self->_postFlowPrepareContext;
  self->_postFlowPrepareContext = 0;

  executionCommitContext = self->_executionCommitContext;
  self->_executionCommitContext = 0;

  v22 = 19;
  if (!v4)
    v22 = 0;
  self->_whichEvent_Type = v22;
  decisionEngineResponseReported = self->_decisionEngineResponseReported;
  self->_decisionEngineResponseReported = v4;

}

- (CNVSchemaCNVDecisionEngineResponseReported)decisionEngineResponseReported
{
  if (self->_whichEvent_Type == 19)
    return self->_decisionEngineResponseReported;
  else
    return (CNVSchemaCNVDecisionEngineResponseReported *)0;
}

- (void)deleteDecisionEngineResponseReported
{
  CNVSchemaCNVDecisionEngineResponseReported *decisionEngineResponseReported;

  if (self->_whichEvent_Type == 19)
  {
    self->_whichEvent_Type = 0;
    decisionEngineResponseReported = self->_decisionEngineResponseReported;
    self->_decisionEngineResponseReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVClientEventReadFrom(self, (uint64_t)a3);
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
  id v42;

  v42 = a3;
  -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent intentReformationContext](self, "intentReformationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNVSchemaCNVClientEvent intentReformationContext](self, "intentReformationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent cnvUsoGraphTier1](self, "cnvUsoGraphTier1");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNVSchemaCNVClientEvent cnvUsoGraphTier1](self, "cnvUsoGraphTier1");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent intentEagerExecutionContext](self, "intentEagerExecutionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CNVSchemaCNVClientEvent intentEagerExecutionContext](self, "intentEagerExecutionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent intentFinalExecutionContext](self, "intentFinalExecutionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CNVSchemaCNVClientEvent intentFinalExecutionContext](self, "intentFinalExecutionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent actionCandidatesGenerated](self, "actionCandidatesGenerated");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CNVSchemaCNVClientEvent actionCandidatesGenerated](self, "actionCandidatesGenerated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent actionCandidatesGeneratedTier1](self, "actionCandidatesGeneratedTier1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CNVSchemaCNVClientEvent actionCandidatesGeneratedTier1](self, "actionCandidatesGeneratedTier1");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent actionCandidatesCollated](self, "actionCandidatesCollated");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CNVSchemaCNVClientEvent actionCandidatesCollated](self, "actionCandidatesCollated");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent disambiguationContext](self, "disambiguationContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CNVSchemaCNVClientEvent disambiguationContext](self, "disambiguationContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent executionOverridesEvaluated](self, "executionOverridesEvaluated");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[CNVSchemaCNVClientEvent executionOverridesEvaluated](self, "executionOverridesEvaluated");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent executionPrepareContext](self, "executionPrepareContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[CNVSchemaCNVClientEvent executionPrepareContext](self, "executionPrepareContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent flowPluginLoadContext](self, "flowPluginLoadContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[CNVSchemaCNVClientEvent flowPluginLoadContext](self, "flowPluginLoadContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent findFlowContext](self, "findFlowContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[CNVSchemaCNVClientEvent findFlowContext](self, "findFlowContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent flowPluginInputContext](self, "flowPluginInputContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[CNVSchemaCNVClientEvent flowPluginInputContext](self, "flowPluginInputContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent flowPluginExecutionContext](self, "flowPluginExecutionContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[CNVSchemaCNVClientEvent flowPluginExecutionContext](self, "flowPluginExecutionContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent preFlowPrepareContext](self, "preFlowPrepareContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[CNVSchemaCNVClientEvent preFlowPrepareContext](self, "preFlowPrepareContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent postFlowPrepareContext](self, "postFlowPrepareContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[CNVSchemaCNVClientEvent postFlowPrepareContext](self, "postFlowPrepareContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent executionCommitContext](self, "executionCommitContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[CNVSchemaCNVClientEvent executionCommitContext](self, "executionCommitContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVClientEvent decisionEngineResponseReported](self, "decisionEngineResponseReported");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[CNVSchemaCNVClientEvent decisionEngineResponseReported](self, "decisionEngineResponseReported");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v102;
  BOOL v103;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_98;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_98;
  -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent intentReformationContext](self, "intentReformationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentReformationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent intentReformationContext](self, "intentReformationContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CNVSchemaCNVClientEvent intentReformationContext](self, "intentReformationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentReformationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent cnvUsoGraphTier1](self, "cnvUsoGraphTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cnvUsoGraphTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent cnvUsoGraphTier1](self, "cnvUsoGraphTier1");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[CNVSchemaCNVClientEvent cnvUsoGraphTier1](self, "cnvUsoGraphTier1");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cnvUsoGraphTier1");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent intentEagerExecutionContext](self, "intentEagerExecutionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentEagerExecutionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent intentEagerExecutionContext](self, "intentEagerExecutionContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[CNVSchemaCNVClientEvent intentEagerExecutionContext](self, "intentEagerExecutionContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentEagerExecutionContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent intentFinalExecutionContext](self, "intentFinalExecutionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentFinalExecutionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent intentFinalExecutionContext](self, "intentFinalExecutionContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[CNVSchemaCNVClientEvent intentFinalExecutionContext](self, "intentFinalExecutionContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentFinalExecutionContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent actionCandidatesGenerated](self, "actionCandidatesGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionCandidatesGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent actionCandidatesGenerated](self, "actionCandidatesGenerated");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[CNVSchemaCNVClientEvent actionCandidatesGenerated](self, "actionCandidatesGenerated");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionCandidatesGenerated");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent actionCandidatesGeneratedTier1](self, "actionCandidatesGeneratedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionCandidatesGeneratedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent actionCandidatesGeneratedTier1](self, "actionCandidatesGeneratedTier1");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[CNVSchemaCNVClientEvent actionCandidatesGeneratedTier1](self, "actionCandidatesGeneratedTier1");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionCandidatesGeneratedTier1");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent actionCandidatesCollated](self, "actionCandidatesCollated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionCandidatesCollated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent actionCandidatesCollated](self, "actionCandidatesCollated");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[CNVSchemaCNVClientEvent actionCandidatesCollated](self, "actionCandidatesCollated");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionCandidatesCollated");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent disambiguationContext](self, "disambiguationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disambiguationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent disambiguationContext](self, "disambiguationContext");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[CNVSchemaCNVClientEvent disambiguationContext](self, "disambiguationContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disambiguationContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent executionOverridesEvaluated](self, "executionOverridesEvaluated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executionOverridesEvaluated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent executionOverridesEvaluated](self, "executionOverridesEvaluated");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[CNVSchemaCNVClientEvent executionOverridesEvaluated](self, "executionOverridesEvaluated");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executionOverridesEvaluated");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent executionPrepareContext](self, "executionPrepareContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executionPrepareContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent executionPrepareContext](self, "executionPrepareContext");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[CNVSchemaCNVClientEvent executionPrepareContext](self, "executionPrepareContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executionPrepareContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent flowPluginLoadContext](self, "flowPluginLoadContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowPluginLoadContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent flowPluginLoadContext](self, "flowPluginLoadContext");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[CNVSchemaCNVClientEvent flowPluginLoadContext](self, "flowPluginLoadContext");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowPluginLoadContext");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent findFlowContext](self, "findFlowContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findFlowContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent findFlowContext](self, "findFlowContext");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[CNVSchemaCNVClientEvent findFlowContext](self, "findFlowContext");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "findFlowContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent flowPluginInputContext](self, "flowPluginInputContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowPluginInputContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent flowPluginInputContext](self, "flowPluginInputContext");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[CNVSchemaCNVClientEvent flowPluginInputContext](self, "flowPluginInputContext");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowPluginInputContext");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent flowPluginExecutionContext](self, "flowPluginExecutionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowPluginExecutionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent flowPluginExecutionContext](self, "flowPluginExecutionContext");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[CNVSchemaCNVClientEvent flowPluginExecutionContext](self, "flowPluginExecutionContext");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowPluginExecutionContext");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent preFlowPrepareContext](self, "preFlowPrepareContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preFlowPrepareContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent preFlowPrepareContext](self, "preFlowPrepareContext");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[CNVSchemaCNVClientEvent preFlowPrepareContext](self, "preFlowPrepareContext");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preFlowPrepareContext");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent postFlowPrepareContext](self, "postFlowPrepareContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postFlowPrepareContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent postFlowPrepareContext](self, "postFlowPrepareContext");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[CNVSchemaCNVClientEvent postFlowPrepareContext](self, "postFlowPrepareContext");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postFlowPrepareContext");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent executionCommitContext](self, "executionCommitContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executionCommitContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_97;
  -[CNVSchemaCNVClientEvent executionCommitContext](self, "executionCommitContext");
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)v93;
    -[CNVSchemaCNVClientEvent executionCommitContext](self, "executionCommitContext");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executionCommitContext");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v95, "isEqual:", v96);

    if (!v97)
      goto LABEL_98;
  }
  else
  {

  }
  -[CNVSchemaCNVClientEvent decisionEngineResponseReported](self, "decisionEngineResponseReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decisionEngineResponseReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[CNVSchemaCNVClientEvent decisionEngineResponseReported](self, "decisionEngineResponseReported");
    v98 = objc_claimAutoreleasedReturnValue();
    if (!v98)
    {

LABEL_101:
      v103 = 1;
      goto LABEL_99;
    }
    v99 = (void *)v98;
    -[CNVSchemaCNVClientEvent decisionEngineResponseReported](self, "decisionEngineResponseReported");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decisionEngineResponseReported");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "isEqual:", v101);

    if ((v102 & 1) != 0)
      goto LABEL_101;
  }
  else
  {
LABEL_97:

  }
LABEL_98:
  v103 = 0;
LABEL_99:

  return v103;
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

  v3 = -[CNVSchemaCNVClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[CNVSchemaCNVIntentReformationContext hash](self->_intentReformationContext, "hash") ^ v3;
  v5 = -[CNVSchemaCNVUsoGraphTier1 hash](self->_cnvUsoGraphTier1, "hash");
  v6 = v4 ^ v5 ^ -[CNVSchemaCNVIntentEagerExecutionContext hash](self->_intentEagerExecutionContext, "hash");
  v7 = -[CNVSchemaCNVIntentFinalExecutionContext hash](self->_intentFinalExecutionContext, "hash");
  v8 = v7 ^ -[CNVSchemaCNVActionCandidatesGenerated hash](self->_actionCandidatesGenerated, "hash");
  v9 = v6 ^ v8 ^ -[CNVSchemaCNVActionCandidatesGeneratedTier1 hash](self->_actionCandidatesGeneratedTier1, "hash");
  v10 = -[CNVSchemaCNVActionCandidatesCollated hash](self->_actionCandidatesCollated, "hash");
  v11 = v10 ^ -[CNVSchemaCNVDisambiguationContext hash](self->_disambiguationContext, "hash");
  v12 = v11 ^ -[CNVSchemaCNVExecutionOverridesEvaluated hash](self->_executionOverridesEvaluated, "hash");
  v13 = v9 ^ v12 ^ -[CNVSchemaCNVExecutionPrepareContext hash](self->_executionPrepareContext, "hash");
  v14 = -[CNVSchemaCNVFlowPluginLoadContext hash](self->_flowPluginLoadContext, "hash");
  v15 = v14 ^ -[CNVSchemaCNVFindFlowContext hash](self->_findFlowContext, "hash");
  v16 = v15 ^ -[CNVSchemaCNVFlowPluginInputContext hash](self->_flowPluginInputContext, "hash");
  v17 = v16 ^ -[CNVSchemaCNVFlowPluginExecutionContext hash](self->_flowPluginExecutionContext, "hash");
  v18 = v13 ^ v17 ^ -[CNVSchemaCNVPreFlowPrepareContext hash](self->_preFlowPrepareContext, "hash");
  v19 = -[CNVSchemaCNVPostFlowPrepareContext hash](self->_postFlowPrepareContext, "hash");
  v20 = v19 ^ -[CNVSchemaCNVExecutionCommitContext hash](self->_executionCommitContext, "hash");
  return v18 ^ v20 ^ -[CNVSchemaCNVDecisionEngineResponseReported hash](self->_decisionEngineResponseReported, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionCandidatesCollated)
  {
    -[CNVSchemaCNVClientEvent actionCandidatesCollated](self, "actionCandidatesCollated");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionCandidatesCollated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionCandidatesCollated"));

    }
  }
  if (self->_actionCandidatesGenerated)
  {
    -[CNVSchemaCNVClientEvent actionCandidatesGenerated](self, "actionCandidatesGenerated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("actionCandidatesGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("actionCandidatesGenerated"));

    }
  }
  if (self->_actionCandidatesGeneratedTier1)
  {
    -[CNVSchemaCNVClientEvent actionCandidatesGeneratedTier1](self, "actionCandidatesGeneratedTier1");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("actionCandidatesGeneratedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("actionCandidatesGeneratedTier1"));

    }
  }
  if (self->_cnvUsoGraphTier1)
  {
    -[CNVSchemaCNVClientEvent cnvUsoGraphTier1](self, "cnvUsoGraphTier1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("cnvUsoGraphTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("cnvUsoGraphTier1"));

    }
  }
  if (self->_decisionEngineResponseReported)
  {
    -[CNVSchemaCNVClientEvent decisionEngineResponseReported](self, "decisionEngineResponseReported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("decisionEngineResponseReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("decisionEngineResponseReported"));

    }
  }
  if (self->_disambiguationContext)
  {
    -[CNVSchemaCNVClientEvent disambiguationContext](self, "disambiguationContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("disambiguationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("disambiguationContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[CNVSchemaCNVClientEvent eventMetadata](self, "eventMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("eventMetadata"));

    }
  }
  if (self->_executionCommitContext)
  {
    -[CNVSchemaCNVClientEvent executionCommitContext](self, "executionCommitContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("executionCommitContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("executionCommitContext"));

    }
  }
  if (self->_executionOverridesEvaluated)
  {
    -[CNVSchemaCNVClientEvent executionOverridesEvaluated](self, "executionOverridesEvaluated");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("executionOverridesEvaluated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("executionOverridesEvaluated"));

    }
  }
  if (self->_executionPrepareContext)
  {
    -[CNVSchemaCNVClientEvent executionPrepareContext](self, "executionPrepareContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("executionPrepareContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("executionPrepareContext"));

    }
  }
  if (self->_findFlowContext)
  {
    -[CNVSchemaCNVClientEvent findFlowContext](self, "findFlowContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("findFlowContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("findFlowContext"));

    }
  }
  if (self->_flowPluginExecutionContext)
  {
    -[CNVSchemaCNVClientEvent flowPluginExecutionContext](self, "flowPluginExecutionContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("flowPluginExecutionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("flowPluginExecutionContext"));

    }
  }
  if (self->_flowPluginInputContext)
  {
    -[CNVSchemaCNVClientEvent flowPluginInputContext](self, "flowPluginInputContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("flowPluginInputContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("flowPluginInputContext"));

    }
  }
  if (self->_flowPluginLoadContext)
  {
    -[CNVSchemaCNVClientEvent flowPluginLoadContext](self, "flowPluginLoadContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("flowPluginLoadContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("flowPluginLoadContext"));

    }
  }
  if (self->_intentEagerExecutionContext)
  {
    -[CNVSchemaCNVClientEvent intentEagerExecutionContext](self, "intentEagerExecutionContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("intentEagerExecutionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("intentEagerExecutionContext"));

    }
  }
  if (self->_intentFinalExecutionContext)
  {
    -[CNVSchemaCNVClientEvent intentFinalExecutionContext](self, "intentFinalExecutionContext");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("intentFinalExecutionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("intentFinalExecutionContext"));

    }
  }
  if (self->_intentReformationContext)
  {
    -[CNVSchemaCNVClientEvent intentReformationContext](self, "intentReformationContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("intentReformationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("intentReformationContext"));

    }
  }
  if (self->_postFlowPrepareContext)
  {
    -[CNVSchemaCNVClientEvent postFlowPrepareContext](self, "postFlowPrepareContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("postFlowPrepareContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("postFlowPrepareContext"));

    }
  }
  if (self->_preFlowPrepareContext)
  {
    -[CNVSchemaCNVClientEvent preFlowPrepareContext](self, "preFlowPrepareContext");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("preFlowPrepareContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("preFlowPrepareContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CNVSchemaCNVClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CNVSchemaCNVClientEvent)initWithJSON:(id)a3
{
  void *v4;
  CNVSchemaCNVClientEvent *v5;
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
    self = -[CNVSchemaCNVClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CNVSchemaCNVClientEvent)initWithDictionary:(id)a3
{
  id v4;
  CNVSchemaCNVClientEvent *v5;
  uint64_t v6;
  CNVSchemaCNVClientEventMetadata *v7;
  uint64_t v8;
  CNVSchemaCNVIntentReformationContext *v9;
  uint64_t v10;
  CNVSchemaCNVUsoGraphTier1 *v11;
  uint64_t v12;
  CNVSchemaCNVIntentEagerExecutionContext *v13;
  uint64_t v14;
  CNVSchemaCNVIntentFinalExecutionContext *v15;
  uint64_t v16;
  CNVSchemaCNVActionCandidatesGenerated *v17;
  uint64_t v18;
  CNVSchemaCNVActionCandidatesGeneratedTier1 *v19;
  uint64_t v20;
  CNVSchemaCNVActionCandidatesCollated *v21;
  uint64_t v22;
  CNVSchemaCNVDisambiguationContext *v23;
  uint64_t v24;
  CNVSchemaCNVExecutionOverridesEvaluated *v25;
  uint64_t v26;
  CNVSchemaCNVExecutionPrepareContext *v27;
  uint64_t v28;
  CNVSchemaCNVFlowPluginLoadContext *v29;
  void *v30;
  CNVSchemaCNVFindFlowContext *v31;
  void *v32;
  CNVSchemaCNVFlowPluginInputContext *v33;
  void *v34;
  CNVSchemaCNVFlowPluginExecutionContext *v35;
  void *v36;
  CNVSchemaCNVPreFlowPrepareContext *v37;
  void *v38;
  CNVSchemaCNVPostFlowPrepareContext *v39;
  void *v40;
  CNVSchemaCNVExecutionCommitContext *v41;
  void *v42;
  CNVSchemaCNVDecisionEngineResponseReported *v43;
  CNVSchemaCNVClientEvent *v44;
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
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)CNVSchemaCNVClientEvent;
  v5 = -[CNVSchemaCNVClientEvent init](&v58, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[CNVSchemaCNVClientEventMetadata initWithDictionary:]([CNVSchemaCNVClientEventMetadata alloc], "initWithDictionary:", v6);
      -[CNVSchemaCNVClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentReformationContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[CNVSchemaCNVIntentReformationContext initWithDictionary:]([CNVSchemaCNVIntentReformationContext alloc], "initWithDictionary:", v8);
      -[CNVSchemaCNVClientEvent setIntentReformationContext:](v5, "setIntentReformationContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cnvUsoGraphTier1"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[CNVSchemaCNVUsoGraphTier1 initWithDictionary:]([CNVSchemaCNVUsoGraphTier1 alloc], "initWithDictionary:", v10);
      -[CNVSchemaCNVClientEvent setCnvUsoGraphTier1:](v5, "setCnvUsoGraphTier1:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentEagerExecutionContext"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[CNVSchemaCNVIntentEagerExecutionContext initWithDictionary:]([CNVSchemaCNVIntentEagerExecutionContext alloc], "initWithDictionary:", v12);
      -[CNVSchemaCNVClientEvent setIntentEagerExecutionContext:](v5, "setIntentEagerExecutionContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intentFinalExecutionContext"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[CNVSchemaCNVIntentFinalExecutionContext initWithDictionary:]([CNVSchemaCNVIntentFinalExecutionContext alloc], "initWithDictionary:", v14);
      -[CNVSchemaCNVClientEvent setIntentFinalExecutionContext:](v5, "setIntentFinalExecutionContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionCandidatesGenerated"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[CNVSchemaCNVActionCandidatesGenerated initWithDictionary:]([CNVSchemaCNVActionCandidatesGenerated alloc], "initWithDictionary:", v16);
      -[CNVSchemaCNVClientEvent setActionCandidatesGenerated:](v5, "setActionCandidatesGenerated:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionCandidatesGeneratedTier1"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[CNVSchemaCNVActionCandidatesGeneratedTier1 initWithDictionary:]([CNVSchemaCNVActionCandidatesGeneratedTier1 alloc], "initWithDictionary:", v18);
      -[CNVSchemaCNVClientEvent setActionCandidatesGeneratedTier1:](v5, "setActionCandidatesGeneratedTier1:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionCandidatesCollated"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v56 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[CNVSchemaCNVActionCandidatesCollated initWithDictionary:]([CNVSchemaCNVActionCandidatesCollated alloc], "initWithDictionary:", v20);
      -[CNVSchemaCNVClientEvent setActionCandidatesCollated:](v5, "setActionCandidatesCollated:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationContext"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[CNVSchemaCNVDisambiguationContext initWithDictionary:]([CNVSchemaCNVDisambiguationContext alloc], "initWithDictionary:", v22);
      -[CNVSchemaCNVClientEvent setDisambiguationContext:](v5, "setDisambiguationContext:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionOverridesEvaluated"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[CNVSchemaCNVExecutionOverridesEvaluated initWithDictionary:]([CNVSchemaCNVExecutionOverridesEvaluated alloc], "initWithDictionary:", v24);
      -[CNVSchemaCNVClientEvent setExecutionOverridesEvaluated:](v5, "setExecutionOverridesEvaluated:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionPrepareContext"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[CNVSchemaCNVExecutionPrepareContext initWithDictionary:]([CNVSchemaCNVExecutionPrepareContext alloc], "initWithDictionary:", v26);
      -[CNVSchemaCNVClientEvent setExecutionPrepareContext:](v5, "setExecutionPrepareContext:", v27);

    }
    v50 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowPluginLoadContext"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[CNVSchemaCNVFlowPluginLoadContext initWithDictionary:]([CNVSchemaCNVFlowPluginLoadContext alloc], "initWithDictionary:", v28);
      -[CNVSchemaCNVClientEvent setFlowPluginLoadContext:](v5, "setFlowPluginLoadContext:", v29);

    }
    v49 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("findFlowContext"), v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[CNVSchemaCNVFindFlowContext initWithDictionary:]([CNVSchemaCNVFindFlowContext alloc], "initWithDictionary:", v30);
      -[CNVSchemaCNVClientEvent setFindFlowContext:](v5, "setFindFlowContext:", v31);

    }
    v48 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowPluginInputContext"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[CNVSchemaCNVFlowPluginInputContext initWithDictionary:]([CNVSchemaCNVFlowPluginInputContext alloc], "initWithDictionary:", v32);
      -[CNVSchemaCNVClientEvent setFlowPluginInputContext:](v5, "setFlowPluginInputContext:", v33);

    }
    v47 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowPluginExecutionContext"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[CNVSchemaCNVFlowPluginExecutionContext initWithDictionary:]([CNVSchemaCNVFlowPluginExecutionContext alloc], "initWithDictionary:", v34);
      -[CNVSchemaCNVClientEvent setFlowPluginExecutionContext:](v5, "setFlowPluginExecutionContext:", v35);

    }
    v52 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preFlowPrepareContext"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[CNVSchemaCNVPreFlowPrepareContext initWithDictionary:]([CNVSchemaCNVPreFlowPrepareContext alloc], "initWithDictionary:", v36);
      -[CNVSchemaCNVClientEvent setPreFlowPrepareContext:](v5, "setPreFlowPrepareContext:", v37);

    }
    v51 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postFlowPrepareContext"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[CNVSchemaCNVPostFlowPrepareContext initWithDictionary:]([CNVSchemaCNVPostFlowPrepareContext alloc], "initWithDictionary:", v38);
      -[CNVSchemaCNVClientEvent setPostFlowPrepareContext:](v5, "setPostFlowPrepareContext:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionCommitContext"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[CNVSchemaCNVExecutionCommitContext initWithDictionary:]([CNVSchemaCNVExecutionCommitContext alloc], "initWithDictionary:", v40);
      -[CNVSchemaCNVClientEvent setExecutionCommitContext:](v5, "setExecutionCommitContext:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("decisionEngineResponseReported"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[CNVSchemaCNVDecisionEngineResponseReported initWithDictionary:]([CNVSchemaCNVDecisionEngineResponseReported alloc], "initWithDictionary:", v42);
      -[CNVSchemaCNVClientEvent setDecisionEngineResponseReported:](v5, "setDecisionEngineResponseReported:", v43);

    }
    v44 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (CNVSchemaCNVClientEventMetadata)eventMetadata
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

- (BOOL)hasIntentReformationContext
{
  return self->_hasIntentReformationContext;
}

- (void)setHasIntentReformationContext:(BOOL)a3
{
  self->_hasIntentReformationContext = a3;
}

- (BOOL)hasCnvUsoGraphTier1
{
  return self->_hasCnvUsoGraphTier1;
}

- (void)setHasCnvUsoGraphTier1:(BOOL)a3
{
  self->_hasCnvUsoGraphTier1 = a3;
}

- (BOOL)hasIntentEagerExecutionContext
{
  return self->_hasIntentEagerExecutionContext;
}

- (void)setHasIntentEagerExecutionContext:(BOOL)a3
{
  self->_hasIntentEagerExecutionContext = a3;
}

- (BOOL)hasIntentFinalExecutionContext
{
  return self->_hasIntentFinalExecutionContext;
}

- (void)setHasIntentFinalExecutionContext:(BOOL)a3
{
  self->_hasIntentFinalExecutionContext = a3;
}

- (BOOL)hasActionCandidatesGenerated
{
  return self->_hasActionCandidatesGenerated;
}

- (void)setHasActionCandidatesGenerated:(BOOL)a3
{
  self->_hasActionCandidatesGenerated = a3;
}

- (BOOL)hasActionCandidatesGeneratedTier1
{
  return self->_hasActionCandidatesGeneratedTier1;
}

- (void)setHasActionCandidatesGeneratedTier1:(BOOL)a3
{
  self->_hasActionCandidatesGeneratedTier1 = a3;
}

- (BOOL)hasActionCandidatesCollated
{
  return self->_hasActionCandidatesCollated;
}

- (void)setHasActionCandidatesCollated:(BOOL)a3
{
  self->_hasActionCandidatesCollated = a3;
}

- (BOOL)hasDisambiguationContext
{
  return self->_hasDisambiguationContext;
}

- (void)setHasDisambiguationContext:(BOOL)a3
{
  self->_hasDisambiguationContext = a3;
}

- (BOOL)hasExecutionOverridesEvaluated
{
  return self->_hasExecutionOverridesEvaluated;
}

- (void)setHasExecutionOverridesEvaluated:(BOOL)a3
{
  self->_hasExecutionOverridesEvaluated = a3;
}

- (BOOL)hasExecutionPrepareContext
{
  return self->_hasExecutionPrepareContext;
}

- (void)setHasExecutionPrepareContext:(BOOL)a3
{
  self->_hasExecutionPrepareContext = a3;
}

- (BOOL)hasFlowPluginLoadContext
{
  return self->_hasFlowPluginLoadContext;
}

- (void)setHasFlowPluginLoadContext:(BOOL)a3
{
  self->_hasFlowPluginLoadContext = a3;
}

- (BOOL)hasFindFlowContext
{
  return self->_hasFindFlowContext;
}

- (void)setHasFindFlowContext:(BOOL)a3
{
  self->_hasFindFlowContext = a3;
}

- (BOOL)hasFlowPluginInputContext
{
  return self->_hasFlowPluginInputContext;
}

- (void)setHasFlowPluginInputContext:(BOOL)a3
{
  self->_hasFlowPluginInputContext = a3;
}

- (BOOL)hasFlowPluginExecutionContext
{
  return self->_hasFlowPluginExecutionContext;
}

- (void)setHasFlowPluginExecutionContext:(BOOL)a3
{
  self->_hasFlowPluginExecutionContext = a3;
}

- (BOOL)hasPreFlowPrepareContext
{
  return self->_hasPreFlowPrepareContext;
}

- (void)setHasPreFlowPrepareContext:(BOOL)a3
{
  self->_hasPreFlowPrepareContext = a3;
}

- (BOOL)hasPostFlowPrepareContext
{
  return self->_hasPostFlowPrepareContext;
}

- (void)setHasPostFlowPrepareContext:(BOOL)a3
{
  self->_hasPostFlowPrepareContext = a3;
}

- (BOOL)hasExecutionCommitContext
{
  return self->_hasExecutionCommitContext;
}

- (void)setHasExecutionCommitContext:(BOOL)a3
{
  self->_hasExecutionCommitContext = a3;
}

- (BOOL)hasDecisionEngineResponseReported
{
  return self->_hasDecisionEngineResponseReported;
}

- (void)setHasDecisionEngineResponseReported:(BOOL)a3
{
  self->_hasDecisionEngineResponseReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decisionEngineResponseReported, 0);
  objc_storeStrong((id *)&self->_executionCommitContext, 0);
  objc_storeStrong((id *)&self->_postFlowPrepareContext, 0);
  objc_storeStrong((id *)&self->_preFlowPrepareContext, 0);
  objc_storeStrong((id *)&self->_flowPluginExecutionContext, 0);
  objc_storeStrong((id *)&self->_flowPluginInputContext, 0);
  objc_storeStrong((id *)&self->_findFlowContext, 0);
  objc_storeStrong((id *)&self->_flowPluginLoadContext, 0);
  objc_storeStrong((id *)&self->_executionPrepareContext, 0);
  objc_storeStrong((id *)&self->_executionOverridesEvaluated, 0);
  objc_storeStrong((id *)&self->_disambiguationContext, 0);
  objc_storeStrong((id *)&self->_actionCandidatesCollated, 0);
  objc_storeStrong((id *)&self->_actionCandidatesGeneratedTier1, 0);
  objc_storeStrong((id *)&self->_actionCandidatesGenerated, 0);
  objc_storeStrong((id *)&self->_intentFinalExecutionContext, 0);
  objc_storeStrong((id *)&self->_intentEagerExecutionContext, 0);
  objc_storeStrong((id *)&self->_cnvUsoGraphTier1, 0);
  objc_storeStrong((id *)&self->_intentReformationContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 27;
}

@end
