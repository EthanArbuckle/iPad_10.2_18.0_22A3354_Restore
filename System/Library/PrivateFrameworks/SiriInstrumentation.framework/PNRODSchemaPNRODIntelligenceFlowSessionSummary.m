@implementation PNRODSchemaPNRODIntelligenceFlowSessionSummary

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
  v34.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowSessionSummary;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v34, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary clientSessionId](self, "clientSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary deleteClientSessionId](self, "deleteClientSessionId");
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary rawSessionId](self, "rawSessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary deleteRawSessionId](self, "deleteRawSessionId");
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary standardPlannerSetupTime](self, "standardPlannerSetupTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary deleteStandardPlannerSetupTime](self, "deleteStandardPlannerSetupTime");
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary queryDecorationServiceSetupTime](self, "queryDecorationServiceSetupTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary deleteQueryDecorationServiceSetupTime](self, "deleteQueryDecorationServiceSetupTime");
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary fullPlannerServiceSetupTime](self, "fullPlannerServiceSetupTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary deleteFullPlannerServiceSetupTime](self, "deleteFullPlannerServiceSetupTime");
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planOverridesServiceSetupTime](self, "planOverridesServiceSetupTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary deletePlanOverridesServiceSetupTime](self, "deletePlanOverridesServiceSetupTime");
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planResolverServiceSetupTime](self, "planResolverServiceSetupTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary deletePlanResolverServiceSetupTime](self, "deletePlanResolverServiceSetupTime");
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary responseGenerationServiceSetupTime](self, "responseGenerationServiceSetupTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary deleteResponseGenerationServiceSetupTime](self, "deleteResponseGenerationServiceSetupTime");
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary failureInfo](self, "failureInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary deleteFailureInfo](self, "deleteFailureInfo");

  return v5;
}

- (BOOL)hasClientSessionId
{
  return self->_clientSessionId != 0;
}

- (void)deleteClientSessionId
{
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setClientSessionId:](self, "setClientSessionId:", 0);
}

- (BOOL)hasRawSessionId
{
  return self->_rawSessionId != 0;
}

- (void)deleteRawSessionId
{
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setRawSessionId:](self, "setRawSessionId:", 0);
}

- (BOOL)hasStandardPlannerSetupTime
{
  return self->_standardPlannerSetupTime != 0;
}

- (void)deleteStandardPlannerSetupTime
{
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setStandardPlannerSetupTime:](self, "setStandardPlannerSetupTime:", 0);
}

- (BOOL)hasQueryDecorationServiceSetupTime
{
  return self->_queryDecorationServiceSetupTime != 0;
}

- (void)deleteQueryDecorationServiceSetupTime
{
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setQueryDecorationServiceSetupTime:](self, "setQueryDecorationServiceSetupTime:", 0);
}

- (BOOL)hasFullPlannerServiceSetupTime
{
  return self->_fullPlannerServiceSetupTime != 0;
}

- (void)deleteFullPlannerServiceSetupTime
{
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setFullPlannerServiceSetupTime:](self, "setFullPlannerServiceSetupTime:", 0);
}

- (BOOL)hasPlanOverridesServiceSetupTime
{
  return self->_planOverridesServiceSetupTime != 0;
}

- (void)deletePlanOverridesServiceSetupTime
{
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setPlanOverridesServiceSetupTime:](self, "setPlanOverridesServiceSetupTime:", 0);
}

- (BOOL)hasPlanResolverServiceSetupTime
{
  return self->_planResolverServiceSetupTime != 0;
}

- (void)deletePlanResolverServiceSetupTime
{
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setPlanResolverServiceSetupTime:](self, "setPlanResolverServiceSetupTime:", 0);
}

- (BOOL)hasResponseGenerationServiceSetupTime
{
  return self->_responseGenerationServiceSetupTime != 0;
}

- (void)deleteResponseGenerationServiceSetupTime
{
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setResponseGenerationServiceSetupTime:](self, "setResponseGenerationServiceSetupTime:", 0);
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteFailureInfo
{
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setFailureInfo:](self, "setFailureInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowSessionSummaryReadFrom(self, (uint64_t)a3);
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
  id v22;

  v22 = a3;
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary clientSessionId](self, "clientSessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary clientSessionId](self, "clientSessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary rawSessionId](self, "rawSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary rawSessionId](self, "rawSessionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary standardPlannerSetupTime](self, "standardPlannerSetupTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary standardPlannerSetupTime](self, "standardPlannerSetupTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary queryDecorationServiceSetupTime](self, "queryDecorationServiceSetupTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary queryDecorationServiceSetupTime](self, "queryDecorationServiceSetupTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary fullPlannerServiceSetupTime](self, "fullPlannerServiceSetupTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary fullPlannerServiceSetupTime](self, "fullPlannerServiceSetupTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planOverridesServiceSetupTime](self, "planOverridesServiceSetupTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planOverridesServiceSetupTime](self, "planOverridesServiceSetupTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planResolverServiceSetupTime](self, "planResolverServiceSetupTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planResolverServiceSetupTime](self, "planResolverServiceSetupTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary responseGenerationServiceSetupTime](self, "responseGenerationServiceSetupTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary responseGenerationServiceSetupTime](self, "responseGenerationServiceSetupTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary failureInfo](self, "failureInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary failureInfo](self, "failureInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  BOOL v52;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary clientSessionId](self, "clientSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary clientSessionId](self, "clientSessionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary clientSessionId](self, "clientSessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientSessionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_47;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary rawSessionId](self, "rawSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary rawSessionId](self, "rawSessionId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary rawSessionId](self, "rawSessionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rawSessionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_47;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary standardPlannerSetupTime](self, "standardPlannerSetupTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "standardPlannerSetupTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary standardPlannerSetupTime](self, "standardPlannerSetupTime");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary standardPlannerSetupTime](self, "standardPlannerSetupTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "standardPlannerSetupTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_47;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary queryDecorationServiceSetupTime](self, "queryDecorationServiceSetupTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryDecorationServiceSetupTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary queryDecorationServiceSetupTime](self, "queryDecorationServiceSetupTime");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary queryDecorationServiceSetupTime](self, "queryDecorationServiceSetupTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryDecorationServiceSetupTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_47;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary fullPlannerServiceSetupTime](self, "fullPlannerServiceSetupTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullPlannerServiceSetupTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary fullPlannerServiceSetupTime](self, "fullPlannerServiceSetupTime");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary fullPlannerServiceSetupTime](self, "fullPlannerServiceSetupTime");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullPlannerServiceSetupTime");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_47;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planOverridesServiceSetupTime](self, "planOverridesServiceSetupTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planOverridesServiceSetupTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planOverridesServiceSetupTime](self, "planOverridesServiceSetupTime");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planOverridesServiceSetupTime](self, "planOverridesServiceSetupTime");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planOverridesServiceSetupTime");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_47;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planResolverServiceSetupTime](self, "planResolverServiceSetupTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planResolverServiceSetupTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planResolverServiceSetupTime](self, "planResolverServiceSetupTime");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planResolverServiceSetupTime](self, "planResolverServiceSetupTime");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planResolverServiceSetupTime");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_47;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary responseGenerationServiceSetupTime](self, "responseGenerationServiceSetupTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseGenerationServiceSetupTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary responseGenerationServiceSetupTime](self, "responseGenerationServiceSetupTime");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary responseGenerationServiceSetupTime](self, "responseGenerationServiceSetupTime");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseGenerationServiceSetupTime");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_47;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary failureInfo](self, "failureInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary failureInfo](self, "failureInfo");
    v47 = objc_claimAutoreleasedReturnValue();
    if (!v47)
    {

LABEL_50:
      v52 = 1;
      goto LABEL_48;
    }
    v48 = (void *)v47;
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary failureInfo](self, "failureInfo");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failureInfo");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if ((v51 & 1) != 0)
      goto LABEL_50;
  }
  else
  {
LABEL_46:

  }
LABEL_47:
  v52 = 0;
LABEL_48:

  return v52;
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

  v3 = -[SISchemaUUID hash](self->_clientSessionId, "hash");
  v4 = -[SISchemaUUID hash](self->_rawSessionId, "hash") ^ v3;
  v5 = -[PNRODSchemaPNRODMetricDuration hash](self->_standardPlannerSetupTime, "hash");
  v6 = v4 ^ v5 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_queryDecorationServiceSetupTime, "hash");
  v7 = -[PNRODSchemaPNRODMetricDuration hash](self->_fullPlannerServiceSetupTime, "hash");
  v8 = v7 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_planOverridesServiceSetupTime, "hash");
  v9 = v6 ^ v8 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_planResolverServiceSetupTime, "hash");
  v10 = -[PNRODSchemaPNRODMetricDuration hash](self->_responseGenerationServiceSetupTime, "hash");
  return v9 ^ v10 ^ -[PNRODSchemaPNRODFailureInfo hash](self->_failureInfo, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clientSessionId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary clientSessionId](self, "clientSessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clientSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientSessionId"));

    }
  }
  if (self->_failureInfo)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary failureInfo](self, "failureInfo");
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
  if (self->_fullPlannerServiceSetupTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary fullPlannerServiceSetupTime](self, "fullPlannerServiceSetupTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("fullPlannerServiceSetupTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("fullPlannerServiceSetupTime"));

    }
  }
  if (self->_planOverridesServiceSetupTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planOverridesServiceSetupTime](self, "planOverridesServiceSetupTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("planOverridesServiceSetupTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("planOverridesServiceSetupTime"));

    }
  }
  if (self->_planResolverServiceSetupTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary planResolverServiceSetupTime](self, "planResolverServiceSetupTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("planResolverServiceSetupTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("planResolverServiceSetupTime"));

    }
  }
  if (self->_queryDecorationServiceSetupTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary queryDecorationServiceSetupTime](self, "queryDecorationServiceSetupTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("queryDecorationServiceSetupTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("queryDecorationServiceSetupTime"));

    }
  }
  if (self->_rawSessionId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary rawSessionId](self, "rawSessionId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("rawSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("rawSessionId"));

    }
  }
  if (self->_responseGenerationServiceSetupTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary responseGenerationServiceSetupTime](self, "responseGenerationServiceSetupTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("responseGenerationServiceSetupTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("responseGenerationServiceSetupTime"));

    }
  }
  if (self->_standardPlannerSetupTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowSessionSummary standardPlannerSetupTime](self, "standardPlannerSetupTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("standardPlannerSetupTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("standardPlannerSetupTime"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRODSchemaPNRODIntelligenceFlowSessionSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRODSchemaPNRODIntelligenceFlowSessionSummary)initWithJSON:(id)a3
{
  void *v4;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *v5;
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
    self = -[PNRODSchemaPNRODIntelligenceFlowSessionSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowSessionSummary)initWithDictionary:(id)a3
{
  id v4;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  uint64_t v8;
  SISchemaUUID *v9;
  void *v10;
  PNRODSchemaPNRODMetricDuration *v11;
  void *v12;
  PNRODSchemaPNRODMetricDuration *v13;
  void *v14;
  PNRODSchemaPNRODMetricDuration *v15;
  void *v16;
  PNRODSchemaPNRODMetricDuration *v17;
  void *v18;
  PNRODSchemaPNRODMetricDuration *v19;
  void *v20;
  PNRODSchemaPNRODMetricDuration *v21;
  void *v22;
  PNRODSchemaPNRODFailureInfo *v23;
  PNRODSchemaPNRODIntelligenceFlowSessionSummary *v24;
  void *v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowSessionSummary;
  v5 = -[PNRODSchemaPNRODIntelligenceFlowSessionSummary init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientSessionId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setClientSessionId:](v5, "setClientSessionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawSessionId"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setRawSessionId:](v5, "setRawSessionId:", v9);

    }
    v27 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("standardPlannerSetupTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v10);
      -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setStandardPlannerSetupTime:](v5, "setStandardPlannerSetupTime:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryDecorationServiceSetupTime"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v12);
      -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setQueryDecorationServiceSetupTime:](v5, "setQueryDecorationServiceSetupTime:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullPlannerServiceSetupTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v14);
      -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setFullPlannerServiceSetupTime:](v5, "setFullPlannerServiceSetupTime:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planOverridesServiceSetupTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v16);
      -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setPlanOverridesServiceSetupTime:](v5, "setPlanOverridesServiceSetupTime:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planResolverServiceSetupTime"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v18);
      -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setPlanResolverServiceSetupTime:](v5, "setPlanResolverServiceSetupTime:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseGenerationServiceSetupTime"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v20);
      -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setResponseGenerationServiceSetupTime:](v5, "setResponseGenerationServiceSetupTime:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[PNRODSchemaPNRODFailureInfo initWithDictionary:]([PNRODSchemaPNRODFailureInfo alloc], "initWithDictionary:", v22);
      -[PNRODSchemaPNRODIntelligenceFlowSessionSummary setFailureInfo:](v5, "setFailureInfo:", v23);

    }
    v24 = v5;

  }
  return v5;
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

- (PNRODSchemaPNRODMetricDuration)standardPlannerSetupTime
{
  return self->_standardPlannerSetupTime;
}

- (void)setStandardPlannerSetupTime:(id)a3
{
  objc_storeStrong((id *)&self->_standardPlannerSetupTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationServiceSetupTime
{
  return self->_queryDecorationServiceSetupTime;
}

- (void)setQueryDecorationServiceSetupTime:(id)a3
{
  objc_storeStrong((id *)&self->_queryDecorationServiceSetupTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)fullPlannerServiceSetupTime
{
  return self->_fullPlannerServiceSetupTime;
}

- (void)setFullPlannerServiceSetupTime:(id)a3
{
  objc_storeStrong((id *)&self->_fullPlannerServiceSetupTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)planOverridesServiceSetupTime
{
  return self->_planOverridesServiceSetupTime;
}

- (void)setPlanOverridesServiceSetupTime:(id)a3
{
  objc_storeStrong((id *)&self->_planOverridesServiceSetupTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)planResolverServiceSetupTime
{
  return self->_planResolverServiceSetupTime;
}

- (void)setPlanResolverServiceSetupTime:(id)a3
{
  objc_storeStrong((id *)&self->_planResolverServiceSetupTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)responseGenerationServiceSetupTime
{
  return self->_responseGenerationServiceSetupTime;
}

- (void)setResponseGenerationServiceSetupTime:(id)a3
{
  objc_storeStrong((id *)&self->_responseGenerationServiceSetupTime, a3);
}

- (PNRODSchemaPNRODFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setFailureInfo:(id)a3
{
  objc_storeStrong((id *)&self->_failureInfo, a3);
}

- (void)setHasClientSessionId:(BOOL)a3
{
  self->_hasClientSessionId = a3;
}

- (void)setHasRawSessionId:(BOOL)a3
{
  self->_hasRawSessionId = a3;
}

- (void)setHasStandardPlannerSetupTime:(BOOL)a3
{
  self->_hasStandardPlannerSetupTime = a3;
}

- (void)setHasQueryDecorationServiceSetupTime:(BOOL)a3
{
  self->_hasQueryDecorationServiceSetupTime = a3;
}

- (void)setHasFullPlannerServiceSetupTime:(BOOL)a3
{
  self->_hasFullPlannerServiceSetupTime = a3;
}

- (void)setHasPlanOverridesServiceSetupTime:(BOOL)a3
{
  self->_hasPlanOverridesServiceSetupTime = a3;
}

- (void)setHasPlanResolverServiceSetupTime:(BOOL)a3
{
  self->_hasPlanResolverServiceSetupTime = a3;
}

- (void)setHasResponseGenerationServiceSetupTime:(BOOL)a3
{
  self->_hasResponseGenerationServiceSetupTime = a3;
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasFailureInfo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_responseGenerationServiceSetupTime, 0);
  objc_storeStrong((id *)&self->_planResolverServiceSetupTime, 0);
  objc_storeStrong((id *)&self->_planOverridesServiceSetupTime, 0);
  objc_storeStrong((id *)&self->_fullPlannerServiceSetupTime, 0);
  objc_storeStrong((id *)&self->_queryDecorationServiceSetupTime, 0);
  objc_storeStrong((id *)&self->_standardPlannerSetupTime, 0);
  objc_storeStrong((id *)&self->_rawSessionId, 0);
  objc_storeStrong((id *)&self->_clientSessionId, 0);
}

@end
