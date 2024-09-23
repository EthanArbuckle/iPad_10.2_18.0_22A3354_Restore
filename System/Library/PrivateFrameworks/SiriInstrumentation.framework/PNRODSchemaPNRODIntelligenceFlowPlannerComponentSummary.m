@implementation PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary

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
  v64.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v64, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planId](self, "planId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deletePlanId](self, "deletePlanId");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary clientRequestId](self, "clientRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteClientRequestId](self, "deleteClientRequestId");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerMakePlanTime](self, "standardPlannerMakePlanTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteStandardPlannerMakePlanTime](self, "deleteStandardPlannerMakePlanTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerQueryDecorationTime](self, "standardPlannerQueryDecorationTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteStandardPlannerQueryDecorationTime](self, "deleteStandardPlannerQueryDecorationTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerPrescribedPlanGeneratorTime](self, "standardPlannerPrescribedPlanGeneratorTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteStandardPlannerPrescribedPlanGeneratorTime](self, "deleteStandardPlannerPrescribedPlanGeneratorTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerGeneratePlanTime](self, "standardPlannerGeneratePlanTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteStandardPlannerGeneratePlanTime](self, "deleteStandardPlannerGeneratePlanTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planResolverServiceHandleTime](self, "planResolverServiceHandleTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deletePlanResolverServiceHandleTime](self, "deletePlanResolverServiceHandleTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary responseGenerationServiceHandleTime](self, "responseGenerationServiceHandleTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteResponseGenerationServiceHandleTime](self, "deleteResponseGenerationServiceHandleTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planOverridesServiceHandleTime](self, "planOverridesServiceHandleTime");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deletePlanOverridesServiceHandleTime](self, "deletePlanOverridesServiceHandleTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerServiceHandleTime](self, "fullPlannerServiceHandleTime");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteFullPlannerServiceHandleTime](self, "deleteFullPlannerServiceHandleTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerModelInferenceCallTime](self, "fullPlannerModelInferenceCallTime");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteFullPlannerModelInferenceCallTime](self, "deleteFullPlannerModelInferenceCallTime");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalCollectInputsDuration](self, "queryDecorationTotalCollectInputsDuration");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteQueryDecorationTotalCollectInputsDuration](self, "deleteQueryDecorationTotalCollectInputsDuration");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationSpanRetrievalDuration](self, "queryDecorationSpanRetrievalDuration");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteQueryDecorationSpanRetrievalDuration](self, "deleteQueryDecorationSpanRetrievalDuration");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationContextRetrievalDuration](self, "queryDecorationContextRetrievalDuration");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteQueryDecorationContextRetrievalDuration](self, "deleteQueryDecorationContextRetrievalDuration");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationToolRetrievalDuration](self, "queryDecorationToolRetrievalDuration");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteQueryDecorationToolRetrievalDuration](self, "deleteQueryDecorationToolRetrievalDuration");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalRankingDuration](self, "queryDecorationTotalRankingDuration");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteQueryDecorationTotalRankingDuration](self, "deleteQueryDecorationTotalRankingDuration");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleBuildingDuration](self, "queryDecorationTupleBuildingDuration");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteQueryDecorationTupleBuildingDuration](self, "deleteQueryDecorationTupleBuildingDuration");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleRankingDuration](self, "queryDecorationTupleRankingDuration");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applySensitiveConditionsPolicy:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "suppressMessage");

  if (v59)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteQueryDecorationTupleRankingDuration](self, "deleteQueryDecorationTupleRankingDuration");
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary failureInfo](self, "failureInfo");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "applySensitiveConditionsPolicy:", v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "suppressMessage");

  if (v62)
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary deleteFailureInfo](self, "deleteFailureInfo");

  return v5;
}

- (BOOL)hasPlanId
{
  return self->_planId != 0;
}

- (void)deletePlanId
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setPlanId:](self, "setPlanId:", 0);
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
}

- (void)deleteClientRequestId
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setClientRequestId:](self, "setClientRequestId:", 0);
}

- (void)setWasPlanOverridden:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_wasPlanOverridden = a3;
}

- (BOOL)hasWasPlanOverridden
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasWasPlanOverridden:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteWasPlanOverridden
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setWasPlanOverridden:](self, "setWasPlanOverridden:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasModelAssetVersion
{
  return self->_modelAssetVersion != 0;
}

- (void)deleteModelAssetVersion
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setModelAssetVersion:](self, "setModelAssetVersion:", 0);
}

- (void)setFullPlannerInferenceInvocationSource:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_fullPlannerInferenceInvocationSource = a3;
}

- (BOOL)hasFullPlannerInferenceInvocationSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasFullPlannerInferenceInvocationSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteFullPlannerInferenceInvocationSource
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setFullPlannerInferenceInvocationSource:](self, "setFullPlannerInferenceInvocationSource:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasStandardPlannerMakePlanTime
{
  return self->_standardPlannerMakePlanTime != 0;
}

- (void)deleteStandardPlannerMakePlanTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setStandardPlannerMakePlanTime:](self, "setStandardPlannerMakePlanTime:", 0);
}

- (BOOL)hasStandardPlannerQueryDecorationTime
{
  return self->_standardPlannerQueryDecorationTime != 0;
}

- (void)deleteStandardPlannerQueryDecorationTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setStandardPlannerQueryDecorationTime:](self, "setStandardPlannerQueryDecorationTime:", 0);
}

- (BOOL)hasStandardPlannerPrescribedPlanGeneratorTime
{
  return self->_standardPlannerPrescribedPlanGeneratorTime != 0;
}

- (void)deleteStandardPlannerPrescribedPlanGeneratorTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setStandardPlannerPrescribedPlanGeneratorTime:](self, "setStandardPlannerPrescribedPlanGeneratorTime:", 0);
}

- (BOOL)hasStandardPlannerGeneratePlanTime
{
  return self->_standardPlannerGeneratePlanTime != 0;
}

- (void)deleteStandardPlannerGeneratePlanTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setStandardPlannerGeneratePlanTime:](self, "setStandardPlannerGeneratePlanTime:", 0);
}

- (BOOL)hasPlanResolverServiceHandleTime
{
  return self->_planResolverServiceHandleTime != 0;
}

- (void)deletePlanResolverServiceHandleTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setPlanResolverServiceHandleTime:](self, "setPlanResolverServiceHandleTime:", 0);
}

- (BOOL)hasResponseGenerationServiceHandleTime
{
  return self->_responseGenerationServiceHandleTime != 0;
}

- (void)deleteResponseGenerationServiceHandleTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setResponseGenerationServiceHandleTime:](self, "setResponseGenerationServiceHandleTime:", 0);
}

- (BOOL)hasPlanOverridesServiceHandleTime
{
  return self->_planOverridesServiceHandleTime != 0;
}

- (void)deletePlanOverridesServiceHandleTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setPlanOverridesServiceHandleTime:](self, "setPlanOverridesServiceHandleTime:", 0);
}

- (BOOL)hasFullPlannerServiceHandleTime
{
  return self->_fullPlannerServiceHandleTime != 0;
}

- (void)deleteFullPlannerServiceHandleTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setFullPlannerServiceHandleTime:](self, "setFullPlannerServiceHandleTime:", 0);
}

- (BOOL)hasFullPlannerModelInferenceCallTime
{
  return self->_fullPlannerModelInferenceCallTime != 0;
}

- (void)deleteFullPlannerModelInferenceCallTime
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setFullPlannerModelInferenceCallTime:](self, "setFullPlannerModelInferenceCallTime:", 0);
}

- (BOOL)hasQueryDecorationTotalCollectInputsDuration
{
  return self->_queryDecorationTotalCollectInputsDuration != 0;
}

- (void)deleteQueryDecorationTotalCollectInputsDuration
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationTotalCollectInputsDuration:](self, "setQueryDecorationTotalCollectInputsDuration:", 0);
}

- (BOOL)hasQueryDecorationSpanRetrievalDuration
{
  return self->_queryDecorationSpanRetrievalDuration != 0;
}

- (void)deleteQueryDecorationSpanRetrievalDuration
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationSpanRetrievalDuration:](self, "setQueryDecorationSpanRetrievalDuration:", 0);
}

- (BOOL)hasQueryDecorationContextRetrievalDuration
{
  return self->_queryDecorationContextRetrievalDuration != 0;
}

- (void)deleteQueryDecorationContextRetrievalDuration
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationContextRetrievalDuration:](self, "setQueryDecorationContextRetrievalDuration:", 0);
}

- (BOOL)hasQueryDecorationToolRetrievalDuration
{
  return self->_queryDecorationToolRetrievalDuration != 0;
}

- (void)deleteQueryDecorationToolRetrievalDuration
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationToolRetrievalDuration:](self, "setQueryDecorationToolRetrievalDuration:", 0);
}

- (BOOL)hasQueryDecorationTotalRankingDuration
{
  return self->_queryDecorationTotalRankingDuration != 0;
}

- (void)deleteQueryDecorationTotalRankingDuration
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationTotalRankingDuration:](self, "setQueryDecorationTotalRankingDuration:", 0);
}

- (BOOL)hasQueryDecorationTupleBuildingDuration
{
  return self->_queryDecorationTupleBuildingDuration != 0;
}

- (void)deleteQueryDecorationTupleBuildingDuration
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationTupleBuildingDuration:](self, "setQueryDecorationTupleBuildingDuration:", 0);
}

- (BOOL)hasQueryDecorationTupleRankingDuration
{
  return self->_queryDecorationTupleRankingDuration != 0;
}

- (void)deleteQueryDecorationTupleRankingDuration
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationTupleRankingDuration:](self, "setQueryDecorationTupleRankingDuration:", 0);
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteFailureInfo
{
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setFailureInfo:](self, "setFailureInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummaryReadFrom(self, (uint64_t)a3);
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
  id v44;

  v44 = a3;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planId](self, "planId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planId](self, "planId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary clientRequestId](self, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary clientRequestId](self, "clientRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary modelAssetVersion](self, "modelAssetVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt64Field();
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerMakePlanTime](self, "standardPlannerMakePlanTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerMakePlanTime](self, "standardPlannerMakePlanTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerQueryDecorationTime](self, "standardPlannerQueryDecorationTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerQueryDecorationTime](self, "standardPlannerQueryDecorationTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerPrescribedPlanGeneratorTime](self, "standardPlannerPrescribedPlanGeneratorTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerPrescribedPlanGeneratorTime](self, "standardPlannerPrescribedPlanGeneratorTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerGeneratePlanTime](self, "standardPlannerGeneratePlanTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerGeneratePlanTime](self, "standardPlannerGeneratePlanTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planResolverServiceHandleTime](self, "planResolverServiceHandleTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planResolverServiceHandleTime](self, "planResolverServiceHandleTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary responseGenerationServiceHandleTime](self, "responseGenerationServiceHandleTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary responseGenerationServiceHandleTime](self, "responseGenerationServiceHandleTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planOverridesServiceHandleTime](self, "planOverridesServiceHandleTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planOverridesServiceHandleTime](self, "planOverridesServiceHandleTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerServiceHandleTime](self, "fullPlannerServiceHandleTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerServiceHandleTime](self, "fullPlannerServiceHandleTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerModelInferenceCallTime](self, "fullPlannerModelInferenceCallTime");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerModelInferenceCallTime](self, "fullPlannerModelInferenceCallTime");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalCollectInputsDuration](self, "queryDecorationTotalCollectInputsDuration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalCollectInputsDuration](self, "queryDecorationTotalCollectInputsDuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationSpanRetrievalDuration](self, "queryDecorationSpanRetrievalDuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationSpanRetrievalDuration](self, "queryDecorationSpanRetrievalDuration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationContextRetrievalDuration](self, "queryDecorationContextRetrievalDuration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationContextRetrievalDuration](self, "queryDecorationContextRetrievalDuration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationToolRetrievalDuration](self, "queryDecorationToolRetrievalDuration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationToolRetrievalDuration](self, "queryDecorationToolRetrievalDuration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalRankingDuration](self, "queryDecorationTotalRankingDuration");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalRankingDuration](self, "queryDecorationTotalRankingDuration");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleBuildingDuration](self, "queryDecorationTupleBuildingDuration");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleBuildingDuration](self, "queryDecorationTupleBuildingDuration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleRankingDuration](self, "queryDecorationTupleRankingDuration");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleRankingDuration](self, "queryDecorationTupleRankingDuration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary failureInfo](self, "failureInfo");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v44;
  if (v41)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary failureInfo](self, "failureInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v42 = v44;
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
  int wasPlanOverridden;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int64_t fullPlannerInferenceInvocationSource;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  char v109;
  BOOL v110;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_108;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planId](self, "planId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planId](self, "planId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planId](self, "planId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary clientRequestId](self, "clientRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary clientRequestId](self, "clientRequestId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary clientRequestId](self, "clientRequestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientRequestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_108;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[184] & 1))
    goto LABEL_108;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    wasPlanOverridden = self->_wasPlanOverridden;
    if (wasPlanOverridden != objc_msgSend(v4, "wasPlanOverridden"))
      goto LABEL_108;
  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary modelAssetVersion](self, "modelAssetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelAssetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary modelAssetVersion](self, "modelAssetVersion");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary modelAssetVersion](self, "modelAssetVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelAssetVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_108;
  }
  else
  {

  }
  v23 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v23 != ((v4[184] >> 1) & 1))
    goto LABEL_108;
  if (v23)
  {
    fullPlannerInferenceInvocationSource = self->_fullPlannerInferenceInvocationSource;
    if (fullPlannerInferenceInvocationSource != objc_msgSend(v4, "fullPlannerInferenceInvocationSource"))
      goto LABEL_108;
  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerMakePlanTime](self, "standardPlannerMakePlanTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "standardPlannerMakePlanTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerMakePlanTime](self, "standardPlannerMakePlanTime");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerMakePlanTime](self, "standardPlannerMakePlanTime");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "standardPlannerMakePlanTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerQueryDecorationTime](self, "standardPlannerQueryDecorationTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "standardPlannerQueryDecorationTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerQueryDecorationTime](self, "standardPlannerQueryDecorationTime");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerQueryDecorationTime](self, "standardPlannerQueryDecorationTime");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "standardPlannerQueryDecorationTime");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqual:", v33);

    if (!v34)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerPrescribedPlanGeneratorTime](self, "standardPlannerPrescribedPlanGeneratorTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "standardPlannerPrescribedPlanGeneratorTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerPrescribedPlanGeneratorTime](self, "standardPlannerPrescribedPlanGeneratorTime");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerPrescribedPlanGeneratorTime](self, "standardPlannerPrescribedPlanGeneratorTime");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "standardPlannerPrescribedPlanGeneratorTime");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqual:", v38);

    if (!v39)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerGeneratePlanTime](self, "standardPlannerGeneratePlanTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "standardPlannerGeneratePlanTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerGeneratePlanTime](self, "standardPlannerGeneratePlanTime");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerGeneratePlanTime](self, "standardPlannerGeneratePlanTime");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "standardPlannerGeneratePlanTime");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "isEqual:", v43);

    if (!v44)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planResolverServiceHandleTime](self, "planResolverServiceHandleTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planResolverServiceHandleTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planResolverServiceHandleTime](self, "planResolverServiceHandleTime");
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planResolverServiceHandleTime](self, "planResolverServiceHandleTime");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planResolverServiceHandleTime");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "isEqual:", v48);

    if (!v49)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary responseGenerationServiceHandleTime](self, "responseGenerationServiceHandleTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseGenerationServiceHandleTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary responseGenerationServiceHandleTime](self, "responseGenerationServiceHandleTime");
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = (void *)v50;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary responseGenerationServiceHandleTime](self, "responseGenerationServiceHandleTime");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseGenerationServiceHandleTime");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "isEqual:", v53);

    if (!v54)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planOverridesServiceHandleTime](self, "planOverridesServiceHandleTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planOverridesServiceHandleTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planOverridesServiceHandleTime](self, "planOverridesServiceHandleTime");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v56 = (void *)v55;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planOverridesServiceHandleTime](self, "planOverridesServiceHandleTime");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planOverridesServiceHandleTime");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v57, "isEqual:", v58);

    if (!v59)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerServiceHandleTime](self, "fullPlannerServiceHandleTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullPlannerServiceHandleTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerServiceHandleTime](self, "fullPlannerServiceHandleTime");
  v60 = objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v61 = (void *)v60;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerServiceHandleTime](self, "fullPlannerServiceHandleTime");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullPlannerServiceHandleTime");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "isEqual:", v63);

    if (!v64)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerModelInferenceCallTime](self, "fullPlannerModelInferenceCallTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullPlannerModelInferenceCallTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerModelInferenceCallTime](self, "fullPlannerModelInferenceCallTime");
  v65 = objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    v66 = (void *)v65;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerModelInferenceCallTime](self, "fullPlannerModelInferenceCallTime");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullPlannerModelInferenceCallTime");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v67, "isEqual:", v68);

    if (!v69)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalCollectInputsDuration](self, "queryDecorationTotalCollectInputsDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryDecorationTotalCollectInputsDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalCollectInputsDuration](self, "queryDecorationTotalCollectInputsDuration");
  v70 = objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    v71 = (void *)v70;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalCollectInputsDuration](self, "queryDecorationTotalCollectInputsDuration");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryDecorationTotalCollectInputsDuration");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v72, "isEqual:", v73);

    if (!v74)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationSpanRetrievalDuration](self, "queryDecorationSpanRetrievalDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryDecorationSpanRetrievalDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationSpanRetrievalDuration](self, "queryDecorationSpanRetrievalDuration");
  v75 = objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    v76 = (void *)v75;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationSpanRetrievalDuration](self, "queryDecorationSpanRetrievalDuration");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryDecorationSpanRetrievalDuration");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v77, "isEqual:", v78);

    if (!v79)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationContextRetrievalDuration](self, "queryDecorationContextRetrievalDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryDecorationContextRetrievalDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationContextRetrievalDuration](self, "queryDecorationContextRetrievalDuration");
  v80 = objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    v81 = (void *)v80;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationContextRetrievalDuration](self, "queryDecorationContextRetrievalDuration");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryDecorationContextRetrievalDuration");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v82, "isEqual:", v83);

    if (!v84)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationToolRetrievalDuration](self, "queryDecorationToolRetrievalDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryDecorationToolRetrievalDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationToolRetrievalDuration](self, "queryDecorationToolRetrievalDuration");
  v85 = objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    v86 = (void *)v85;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationToolRetrievalDuration](self, "queryDecorationToolRetrievalDuration");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryDecorationToolRetrievalDuration");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v87, "isEqual:", v88);

    if (!v89)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalRankingDuration](self, "queryDecorationTotalRankingDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryDecorationTotalRankingDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalRankingDuration](self, "queryDecorationTotalRankingDuration");
  v90 = objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    v91 = (void *)v90;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalRankingDuration](self, "queryDecorationTotalRankingDuration");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryDecorationTotalRankingDuration");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v92, "isEqual:", v93);

    if (!v94)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleBuildingDuration](self, "queryDecorationTupleBuildingDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryDecorationTupleBuildingDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleBuildingDuration](self, "queryDecorationTupleBuildingDuration");
  v95 = objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    v96 = (void *)v95;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleBuildingDuration](self, "queryDecorationTupleBuildingDuration");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryDecorationTupleBuildingDuration");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v97, "isEqual:", v98);

    if (!v99)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleRankingDuration](self, "queryDecorationTupleRankingDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryDecorationTupleRankingDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_107;
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleRankingDuration](self, "queryDecorationTupleRankingDuration");
  v100 = objc_claimAutoreleasedReturnValue();
  if (v100)
  {
    v101 = (void *)v100;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleRankingDuration](self, "queryDecorationTupleRankingDuration");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryDecorationTupleRankingDuration");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v102, "isEqual:", v103);

    if (!v104)
      goto LABEL_108;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary failureInfo](self, "failureInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary failureInfo](self, "failureInfo");
    v105 = objc_claimAutoreleasedReturnValue();
    if (!v105)
    {

LABEL_111:
      v110 = 1;
      goto LABEL_109;
    }
    v106 = (void *)v105;
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary failureInfo](self, "failureInfo");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failureInfo");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v107, "isEqual:", v108);

    if ((v109 & 1) != 0)
      goto LABEL_111;
  }
  else
  {
LABEL_107:

  }
LABEL_108:
  v110 = 0;
LABEL_109:

  return v110;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
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

  v3 = -[SISchemaUUID hash](self->_planId, "hash");
  v4 = -[SISchemaUUID hash](self->_clientRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_wasPlanOverridden;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_modelAssetVersion, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_fullPlannerInferenceInvocationSource;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_standardPlannerMakePlanTime, "hash");
  v10 = v8 ^ v9 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_standardPlannerQueryDecorationTime, "hash");
  v11 = -[PNRODSchemaPNRODMetricDuration hash](self->_standardPlannerPrescribedPlanGeneratorTime, "hash");
  v12 = v11 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_standardPlannerGeneratePlanTime, "hash");
  v13 = v12 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_planResolverServiceHandleTime, "hash");
  v14 = v10 ^ v13 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_responseGenerationServiceHandleTime, "hash");
  v15 = -[PNRODSchemaPNRODMetricDuration hash](self->_planOverridesServiceHandleTime, "hash");
  v16 = v15 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_fullPlannerServiceHandleTime, "hash");
  v17 = v16 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_fullPlannerModelInferenceCallTime, "hash");
  v18 = v17 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_queryDecorationTotalCollectInputsDuration, "hash");
  v19 = v14 ^ v18 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_queryDecorationSpanRetrievalDuration, "hash");
  v20 = -[PNRODSchemaPNRODMetricDuration hash](self->_queryDecorationContextRetrievalDuration, "hash");
  v21 = v20 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_queryDecorationToolRetrievalDuration, "hash");
  v22 = v21 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_queryDecorationTotalRankingDuration, "hash");
  v23 = v22 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_queryDecorationTupleBuildingDuration, "hash");
  v24 = v23 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_queryDecorationTupleRankingDuration, "hash");
  return v19 ^ v24 ^ -[PNRODSchemaPNRODFailureInfo hash](self->_failureInfo, "hash");
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
  id v65;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clientRequestId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary clientRequestId](self, "clientRequestId");
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
  if (self->_failureInfo)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary failureInfo](self, "failureInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("failureInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("failureInfo"));

    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerInferenceInvocationSource](self, "fullPlannerInferenceInvocationSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("fullPlannerInferenceInvocationSource"));

  }
  if (self->_fullPlannerModelInferenceCallTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerModelInferenceCallTime](self, "fullPlannerModelInferenceCallTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("fullPlannerModelInferenceCallTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("fullPlannerModelInferenceCallTime"));

    }
  }
  if (self->_fullPlannerServiceHandleTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary fullPlannerServiceHandleTime](self, "fullPlannerServiceHandleTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("fullPlannerServiceHandleTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("fullPlannerServiceHandleTime"));

    }
  }
  if (self->_modelAssetVersion)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary modelAssetVersion](self, "modelAssetVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("modelAssetVersion"));

  }
  if (self->_planId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planId](self, "planId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("planId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("planId"));

    }
  }
  if (self->_planOverridesServiceHandleTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planOverridesServiceHandleTime](self, "planOverridesServiceHandleTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("planOverridesServiceHandleTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("planOverridesServiceHandleTime"));

    }
  }
  if (self->_planResolverServiceHandleTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary planResolverServiceHandleTime](self, "planResolverServiceHandleTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("planResolverServiceHandleTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("planResolverServiceHandleTime"));

    }
  }
  if (self->_queryDecorationContextRetrievalDuration)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationContextRetrievalDuration](self, "queryDecorationContextRetrievalDuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("queryDecorationContextRetrievalDuration"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("queryDecorationContextRetrievalDuration"));

    }
  }
  if (self->_queryDecorationSpanRetrievalDuration)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationSpanRetrievalDuration](self, "queryDecorationSpanRetrievalDuration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("queryDecorationSpanRetrievalDuration"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("queryDecorationSpanRetrievalDuration"));

    }
  }
  if (self->_queryDecorationToolRetrievalDuration)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationToolRetrievalDuration](self, "queryDecorationToolRetrievalDuration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("queryDecorationToolRetrievalDuration"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("queryDecorationToolRetrievalDuration"));

    }
  }
  if (self->_queryDecorationTotalCollectInputsDuration)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalCollectInputsDuration](self, "queryDecorationTotalCollectInputsDuration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("queryDecorationTotalCollectInputsDuration"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("queryDecorationTotalCollectInputsDuration"));

    }
  }
  if (self->_queryDecorationTotalRankingDuration)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTotalRankingDuration](self, "queryDecorationTotalRankingDuration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("queryDecorationTotalRankingDuration"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("queryDecorationTotalRankingDuration"));

    }
  }
  if (self->_queryDecorationTupleBuildingDuration)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleBuildingDuration](self, "queryDecorationTupleBuildingDuration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("queryDecorationTupleBuildingDuration"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("queryDecorationTupleBuildingDuration"));

    }
  }
  if (self->_queryDecorationTupleRankingDuration)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary queryDecorationTupleRankingDuration](self, "queryDecorationTupleRankingDuration");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("queryDecorationTupleRankingDuration"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("queryDecorationTupleRankingDuration"));

    }
  }
  if (self->_responseGenerationServiceHandleTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary responseGenerationServiceHandleTime](self, "responseGenerationServiceHandleTime");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("responseGenerationServiceHandleTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("responseGenerationServiceHandleTime"));

    }
  }
  if (self->_standardPlannerGeneratePlanTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerGeneratePlanTime](self, "standardPlannerGeneratePlanTime");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("standardPlannerGeneratePlanTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("standardPlannerGeneratePlanTime"));

    }
  }
  if (self->_standardPlannerMakePlanTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerMakePlanTime](self, "standardPlannerMakePlanTime");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("standardPlannerMakePlanTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("standardPlannerMakePlanTime"));

    }
  }
  if (self->_standardPlannerPrescribedPlanGeneratorTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerPrescribedPlanGeneratorTime](self, "standardPlannerPrescribedPlanGeneratorTime");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("standardPlannerPrescribedPlanGeneratorTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("standardPlannerPrescribedPlanGeneratorTime"));

    }
  }
  if (self->_standardPlannerQueryDecorationTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary standardPlannerQueryDecorationTime](self, "standardPlannerQueryDecorationTime");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dictionaryRepresentation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("standardPlannerQueryDecorationTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("standardPlannerQueryDecorationTime"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary wasPlanOverridden](self, "wasPlanOverridden"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("wasPlanOverridden"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v65 = v3;

  return v65;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary)initWithJSON:(id)a3
{
  void *v4;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *v5;
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
    self = -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary)initWithDictionary:(id)a3
{
  id v4;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  uint64_t v8;
  SISchemaUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PNRODSchemaPNRODMetricDuration *v15;
  uint64_t v16;
  PNRODSchemaPNRODMetricDuration *v17;
  uint64_t v18;
  PNRODSchemaPNRODMetricDuration *v19;
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
  void *v34;
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
  PNRODSchemaPNRODFailureInfo *v47;
  PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *v48;
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
  objc_super v65;

  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary;
  v5 = -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary init](&v65, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setPlanId:](v5, "setPlanId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientRequestId"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setClientRequestId:](v5, "setClientRequestId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasPlanOverridden"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setWasPlanOverridden:](v5, "setWasPlanOverridden:", objc_msgSend(v10, "BOOLValue"));
    v55 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelAssetVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setModelAssetVersion:](v5, "setModelAssetVersion:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullPlannerInferenceInvocationSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setFullPlannerInferenceInvocationSource:](v5, "setFullPlannerInferenceInvocationSource:", objc_msgSend(v13, "longLongValue"));
    v53 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("standardPlannerMakePlanTime"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v14);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setStandardPlannerMakePlanTime:](v5, "setStandardPlannerMakePlanTime:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("standardPlannerQueryDecorationTime"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v16);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setStandardPlannerQueryDecorationTime:](v5, "setStandardPlannerQueryDecorationTime:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("standardPlannerPrescribedPlanGeneratorTime"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v18);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setStandardPlannerPrescribedPlanGeneratorTime:](v5, "setStandardPlannerPrescribedPlanGeneratorTime:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("standardPlannerGeneratePlanTime"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v63 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v20);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setStandardPlannerGeneratePlanTime:](v5, "setStandardPlannerGeneratePlanTime:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planResolverServiceHandleTime"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v22);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setPlanResolverServiceHandleTime:](v5, "setPlanResolverServiceHandleTime:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseGenerationServiceHandleTime"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v24);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setResponseGenerationServiceHandleTime:](v5, "setResponseGenerationServiceHandleTime:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planOverridesServiceHandleTime"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v26);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setPlanOverridesServiceHandleTime:](v5, "setPlanOverridesServiceHandleTime:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullPlannerServiceHandleTime"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v28);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setFullPlannerServiceHandleTime:](v5, "setFullPlannerServiceHandleTime:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullPlannerModelInferenceCallTime"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v30);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setFullPlannerModelInferenceCallTime:](v5, "setFullPlannerModelInferenceCallTime:", v31);

    }
    v51 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryDecorationTotalCollectInputsDuration"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v32);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationTotalCollectInputsDuration:](v5, "setQueryDecorationTotalCollectInputsDuration:", v33);

    }
    v50 = (void *)v32;
    v52 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryDecorationSpanRetrievalDuration"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v34);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationSpanRetrievalDuration:](v5, "setQueryDecorationSpanRetrievalDuration:", v35);

    }
    v57 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryDecorationContextRetrievalDuration"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v36);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationContextRetrievalDuration:](v5, "setQueryDecorationContextRetrievalDuration:", v37);

    }
    v56 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryDecorationToolRetrievalDuration"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v38);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationToolRetrievalDuration:](v5, "setQueryDecorationToolRetrievalDuration:", v39);

    }
    v54 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryDecorationTotalRankingDuration"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v40);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationTotalRankingDuration:](v5, "setQueryDecorationTotalRankingDuration:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryDecorationTupleBuildingDuration"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v42);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationTupleBuildingDuration:](v5, "setQueryDecorationTupleBuildingDuration:", v43);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryDecorationTupleRankingDuration"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v44);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setQueryDecorationTupleRankingDuration:](v5, "setQueryDecorationTupleRankingDuration:", v45);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureInfo"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[PNRODSchemaPNRODFailureInfo initWithDictionary:]([PNRODSchemaPNRODFailureInfo alloc], "initWithDictionary:", v46);
      -[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary setFailureInfo:](v5, "setFailureInfo:", v47);

    }
    v48 = v5;

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

- (BOOL)wasPlanOverridden
{
  return self->_wasPlanOverridden;
}

- (NSString)modelAssetVersion
{
  return self->_modelAssetVersion;
}

- (void)setModelAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)fullPlannerInferenceInvocationSource
{
  return self->_fullPlannerInferenceInvocationSource;
}

- (PNRODSchemaPNRODMetricDuration)standardPlannerMakePlanTime
{
  return self->_standardPlannerMakePlanTime;
}

- (void)setStandardPlannerMakePlanTime:(id)a3
{
  objc_storeStrong((id *)&self->_standardPlannerMakePlanTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)standardPlannerQueryDecorationTime
{
  return self->_standardPlannerQueryDecorationTime;
}

- (void)setStandardPlannerQueryDecorationTime:(id)a3
{
  objc_storeStrong((id *)&self->_standardPlannerQueryDecorationTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)standardPlannerPrescribedPlanGeneratorTime
{
  return self->_standardPlannerPrescribedPlanGeneratorTime;
}

- (void)setStandardPlannerPrescribedPlanGeneratorTime:(id)a3
{
  objc_storeStrong((id *)&self->_standardPlannerPrescribedPlanGeneratorTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)standardPlannerGeneratePlanTime
{
  return self->_standardPlannerGeneratePlanTime;
}

- (void)setStandardPlannerGeneratePlanTime:(id)a3
{
  objc_storeStrong((id *)&self->_standardPlannerGeneratePlanTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)planResolverServiceHandleTime
{
  return self->_planResolverServiceHandleTime;
}

- (void)setPlanResolverServiceHandleTime:(id)a3
{
  objc_storeStrong((id *)&self->_planResolverServiceHandleTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)responseGenerationServiceHandleTime
{
  return self->_responseGenerationServiceHandleTime;
}

- (void)setResponseGenerationServiceHandleTime:(id)a3
{
  objc_storeStrong((id *)&self->_responseGenerationServiceHandleTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)planOverridesServiceHandleTime
{
  return self->_planOverridesServiceHandleTime;
}

- (void)setPlanOverridesServiceHandleTime:(id)a3
{
  objc_storeStrong((id *)&self->_planOverridesServiceHandleTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)fullPlannerServiceHandleTime
{
  return self->_fullPlannerServiceHandleTime;
}

- (void)setFullPlannerServiceHandleTime:(id)a3
{
  objc_storeStrong((id *)&self->_fullPlannerServiceHandleTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)fullPlannerModelInferenceCallTime
{
  return self->_fullPlannerModelInferenceCallTime;
}

- (void)setFullPlannerModelInferenceCallTime:(id)a3
{
  objc_storeStrong((id *)&self->_fullPlannerModelInferenceCallTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationTotalCollectInputsDuration
{
  return self->_queryDecorationTotalCollectInputsDuration;
}

- (void)setQueryDecorationTotalCollectInputsDuration:(id)a3
{
  objc_storeStrong((id *)&self->_queryDecorationTotalCollectInputsDuration, a3);
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationSpanRetrievalDuration
{
  return self->_queryDecorationSpanRetrievalDuration;
}

- (void)setQueryDecorationSpanRetrievalDuration:(id)a3
{
  objc_storeStrong((id *)&self->_queryDecorationSpanRetrievalDuration, a3);
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationContextRetrievalDuration
{
  return self->_queryDecorationContextRetrievalDuration;
}

- (void)setQueryDecorationContextRetrievalDuration:(id)a3
{
  objc_storeStrong((id *)&self->_queryDecorationContextRetrievalDuration, a3);
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationToolRetrievalDuration
{
  return self->_queryDecorationToolRetrievalDuration;
}

- (void)setQueryDecorationToolRetrievalDuration:(id)a3
{
  objc_storeStrong((id *)&self->_queryDecorationToolRetrievalDuration, a3);
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationTotalRankingDuration
{
  return self->_queryDecorationTotalRankingDuration;
}

- (void)setQueryDecorationTotalRankingDuration:(id)a3
{
  objc_storeStrong((id *)&self->_queryDecorationTotalRankingDuration, a3);
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationTupleBuildingDuration
{
  return self->_queryDecorationTupleBuildingDuration;
}

- (void)setQueryDecorationTupleBuildingDuration:(id)a3
{
  objc_storeStrong((id *)&self->_queryDecorationTupleBuildingDuration, a3);
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationTupleRankingDuration
{
  return self->_queryDecorationTupleRankingDuration;
}

- (void)setQueryDecorationTupleRankingDuration:(id)a3
{
  objc_storeStrong((id *)&self->_queryDecorationTupleRankingDuration, a3);
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
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasClientRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasModelAssetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasStandardPlannerMakePlanTime:(BOOL)a3
{
  self->_hasPlanId = a3;
}

- (void)setHasStandardPlannerQueryDecorationTime:(BOOL)a3
{
  self->_hasClientRequestId = a3;
}

- (void)setHasStandardPlannerPrescribedPlanGeneratorTime:(BOOL)a3
{
  self->_hasModelAssetVersion = a3;
}

- (void)setHasStandardPlannerGeneratePlanTime:(BOOL)a3
{
  self->_hasStandardPlannerMakePlanTime = a3;
}

- (void)setHasPlanResolverServiceHandleTime:(BOOL)a3
{
  self->_hasStandardPlannerQueryDecorationTime = a3;
}

- (void)setHasResponseGenerationServiceHandleTime:(BOOL)a3
{
  self->_hasStandardPlannerPrescribedPlanGeneratorTime = a3;
}

- (void)setHasPlanOverridesServiceHandleTime:(BOOL)a3
{
  self->_hasStandardPlannerGeneratePlanTime = a3;
}

- (void)setHasFullPlannerServiceHandleTime:(BOOL)a3
{
  self->_hasPlanResolverServiceHandleTime = a3;
}

- (void)setHasFullPlannerModelInferenceCallTime:(BOOL)a3
{
  self->_hasResponseGenerationServiceHandleTime = a3;
}

- (void)setHasQueryDecorationTotalCollectInputsDuration:(BOOL)a3
{
  self->_hasPlanOverridesServiceHandleTime = a3;
}

- (void)setHasQueryDecorationSpanRetrievalDuration:(BOOL)a3
{
  self->_hasFullPlannerServiceHandleTime = a3;
}

- (void)setHasQueryDecorationContextRetrievalDuration:(BOOL)a3
{
  self->_hasFullPlannerModelInferenceCallTime = a3;
}

- (void)setHasQueryDecorationToolRetrievalDuration:(BOOL)a3
{
  self->_hasQueryDecorationTotalCollectInputsDuration = a3;
}

- (void)setHasQueryDecorationTotalRankingDuration:(BOOL)a3
{
  self->_hasQueryDecorationSpanRetrievalDuration = a3;
}

- (void)setHasQueryDecorationTupleBuildingDuration:(BOOL)a3
{
  self->_hasQueryDecorationContextRetrievalDuration = a3;
}

- (void)setHasQueryDecorationTupleRankingDuration:(BOOL)a3
{
  self->_hasQueryDecorationToolRetrievalDuration = a3;
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasQueryDecorationTotalRankingDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_queryDecorationTupleRankingDuration, 0);
  objc_storeStrong((id *)&self->_queryDecorationTupleBuildingDuration, 0);
  objc_storeStrong((id *)&self->_queryDecorationTotalRankingDuration, 0);
  objc_storeStrong((id *)&self->_queryDecorationToolRetrievalDuration, 0);
  objc_storeStrong((id *)&self->_queryDecorationContextRetrievalDuration, 0);
  objc_storeStrong((id *)&self->_queryDecorationSpanRetrievalDuration, 0);
  objc_storeStrong((id *)&self->_queryDecorationTotalCollectInputsDuration, 0);
  objc_storeStrong((id *)&self->_fullPlannerModelInferenceCallTime, 0);
  objc_storeStrong((id *)&self->_fullPlannerServiceHandleTime, 0);
  objc_storeStrong((id *)&self->_planOverridesServiceHandleTime, 0);
  objc_storeStrong((id *)&self->_responseGenerationServiceHandleTime, 0);
  objc_storeStrong((id *)&self->_planResolverServiceHandleTime, 0);
  objc_storeStrong((id *)&self->_standardPlannerGeneratePlanTime, 0);
  objc_storeStrong((id *)&self->_standardPlannerPrescribedPlanGeneratorTime, 0);
  objc_storeStrong((id *)&self->_standardPlannerQueryDecorationTime, 0);
  objc_storeStrong((id *)&self->_standardPlannerMakePlanTime, 0);
  objc_storeStrong((id *)&self->_modelAssetVersion, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

@end
