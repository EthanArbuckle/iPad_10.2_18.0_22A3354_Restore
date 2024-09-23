@implementation PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary

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
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v43, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary planId](self, "planId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary deletePlanId](self, "deletePlanId");
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary clientRequestId](self, "clientRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary deleteClientRequestId](self, "deleteClientRequestId");
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responsePreparationTime](self, "responsePreparationTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary deleteResponsePreparationTime](self, "deleteResponsePreparationTime");
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseInputValidationTime](self, "responseInputValidationTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary deleteResponseInputValidationTime](self, "deleteResponseInputValidationTime");
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseOverridesTime](self, "responseOverridesTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary deleteResponseOverridesTime](self, "deleteResponseOverridesTime");
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCatalogueRetrievalTime](self, "responseCatalogueRetrievalTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary deleteResponseCatalogueRetrievalTime](self, "deleteResponseCatalogueRetrievalTime");
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCATHydrationTime](self, "responseCATHydrationTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary deleteResponseCATHydrationTime](self, "deleteResponseCATHydrationTime");
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseModelInferenceTime](self, "responseModelInferenceTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary deleteResponseModelInferenceTime](self, "deleteResponseModelInferenceTime");
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseHallucinationInferenceTime](self, "responseHallucinationInferenceTime");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary deleteResponseHallucinationInferenceTime](self, "deleteResponseHallucinationInferenceTime");
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseSafetyInferenceTime](self, "responseSafetyInferenceTime");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary deleteResponseSafetyInferenceTime](self, "deleteResponseSafetyInferenceTime");
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseGenerationTime](self, "responseGenerationTime");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary deleteResponseGenerationTime](self, "deleteResponseGenerationTime");
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary failureInfo](self, "failureInfo");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary deleteFailureInfo](self, "deleteFailureInfo");

  return v5;
}

- (BOOL)hasPlanId
{
  return self->_planId != 0;
}

- (void)deletePlanId
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setPlanId:](self, "setPlanId:", 0);
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
}

- (void)deleteClientRequestId
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setClientRequestId:](self, "setClientRequestId:", 0);
}

- (void)setResponseIsValidInput:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_responseIsValidInput = a3;
}

- (BOOL)hasResponseIsValidInput
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasResponseIsValidInput:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteResponseIsValidInput
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseIsValidInput:](self, "setResponseIsValidInput:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setResponseIsStaticDialogueProvided:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_responseIsStaticDialogueProvided = a3;
}

- (BOOL)hasResponseIsStaticDialogueProvided
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasResponseIsStaticDialogueProvided:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteResponseIsStaticDialogueProvided
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseIsStaticDialogueProvided:](self, "setResponseIsStaticDialogueProvided:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasResponseMobileAssetVersion
{
  return self->_responseMobileAssetVersion != 0;
}

- (void)deleteResponseMobileAssetVersion
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseMobileAssetVersion:](self, "setResponseMobileAssetVersion:", 0);
}

- (void)setResponseInferenceLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_responseInferenceLocation = a3;
}

- (BOOL)hasResponseInferenceLocation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasResponseInferenceLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteResponseInferenceLocation
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseInferenceLocation:](self, "setResponseInferenceLocation:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setResponseIsFallback:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_responseIsFallback = a3;
}

- (BOOL)hasResponseIsFallback
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasResponseIsFallback:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteResponseIsFallback
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseIsFallback:](self, "setResponseIsFallback:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasResponsePreparationTime
{
  return self->_responsePreparationTime != 0;
}

- (void)deleteResponsePreparationTime
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponsePreparationTime:](self, "setResponsePreparationTime:", 0);
}

- (BOOL)hasResponseInputValidationTime
{
  return self->_responseInputValidationTime != 0;
}

- (void)deleteResponseInputValidationTime
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseInputValidationTime:](self, "setResponseInputValidationTime:", 0);
}

- (BOOL)hasResponseOverridesTime
{
  return self->_responseOverridesTime != 0;
}

- (void)deleteResponseOverridesTime
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseOverridesTime:](self, "setResponseOverridesTime:", 0);
}

- (BOOL)hasResponseCatalogueRetrievalTime
{
  return self->_responseCatalogueRetrievalTime != 0;
}

- (void)deleteResponseCatalogueRetrievalTime
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseCatalogueRetrievalTime:](self, "setResponseCatalogueRetrievalTime:", 0);
}

- (BOOL)hasResponseCATHydrationTime
{
  return self->_responseCATHydrationTime != 0;
}

- (void)deleteResponseCATHydrationTime
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseCATHydrationTime:](self, "setResponseCATHydrationTime:", 0);
}

- (BOOL)hasResponseModelInferenceTime
{
  return self->_responseModelInferenceTime != 0;
}

- (void)deleteResponseModelInferenceTime
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseModelInferenceTime:](self, "setResponseModelInferenceTime:", 0);
}

- (BOOL)hasResponseHallucinationInferenceTime
{
  return self->_responseHallucinationInferenceTime != 0;
}

- (void)deleteResponseHallucinationInferenceTime
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseHallucinationInferenceTime:](self, "setResponseHallucinationInferenceTime:", 0);
}

- (BOOL)hasResponseSafetyInferenceTime
{
  return self->_responseSafetyInferenceTime != 0;
}

- (void)deleteResponseSafetyInferenceTime
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseSafetyInferenceTime:](self, "setResponseSafetyInferenceTime:", 0);
}

- (BOOL)hasResponseGenerationTime
{
  return self->_responseGenerationTime != 0;
}

- (void)deleteResponseGenerationTime
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseGenerationTime:](self, "setResponseGenerationTime:", 0);
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteFailureInfo
{
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setFailureInfo:](self, "setFailureInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  char v10;
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
  id v32;

  v32 = a3;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary planId](self, "planId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary planId](self, "planId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary clientRequestId](self, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary clientRequestId](self, "clientRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseMobileAssetVersion](self, "responseMobileAssetVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v10 = (char)self->_has;
  }
  if ((v10 & 8) != 0)
    PBDataWriterWriteBOOLField();
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responsePreparationTime](self, "responsePreparationTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responsePreparationTime](self, "responsePreparationTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseInputValidationTime](self, "responseInputValidationTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseInputValidationTime](self, "responseInputValidationTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseOverridesTime](self, "responseOverridesTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseOverridesTime](self, "responseOverridesTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCatalogueRetrievalTime](self, "responseCatalogueRetrievalTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCatalogueRetrievalTime](self, "responseCatalogueRetrievalTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCATHydrationTime](self, "responseCATHydrationTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCATHydrationTime](self, "responseCATHydrationTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseModelInferenceTime](self, "responseModelInferenceTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseModelInferenceTime](self, "responseModelInferenceTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseHallucinationInferenceTime](self, "responseHallucinationInferenceTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseHallucinationInferenceTime](self, "responseHallucinationInferenceTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseSafetyInferenceTime](self, "responseSafetyInferenceTime");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseSafetyInferenceTime](self, "responseSafetyInferenceTime");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseGenerationTime](self, "responseGenerationTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseGenerationTime](self, "responseGenerationTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary failureInfo](self, "failureInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v32;
  if (v29)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary failureInfo](self, "failureInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v30 = v32;
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
  $86BB7101E4381D961DA263370D03E249 has;
  unsigned int v18;
  int responseIsValidInput;
  int v20;
  int responseIsStaticDialogueProvided;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  $86BB7101E4381D961DA263370D03E249 v27;
  int v28;
  unsigned int v29;
  int responseInferenceLocation;
  int v31;
  int responseIsFallback;
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
  char v82;
  BOOL v83;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_81;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary planId](self, "planId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_80;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary planId](self, "planId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary planId](self, "planId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_81;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary clientRequestId](self, "clientRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_80;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary clientRequestId](self, "clientRequestId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary clientRequestId](self, "clientRequestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientRequestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_81;
  }
  else
  {

  }
  has = self->_has;
  v18 = v4[128];
  if ((*(_BYTE *)&has & 1) != (v18 & 1))
    goto LABEL_81;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    responseIsValidInput = self->_responseIsValidInput;
    if (responseIsValidInput != objc_msgSend(v4, "responseIsValidInput"))
      goto LABEL_81;
    has = self->_has;
    v18 = v4[128];
  }
  v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1))
    goto LABEL_81;
  if (v20)
  {
    responseIsStaticDialogueProvided = self->_responseIsStaticDialogueProvided;
    if (responseIsStaticDialogueProvided != objc_msgSend(v4, "responseIsStaticDialogueProvided"))
      goto LABEL_81;
  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseMobileAssetVersion](self, "responseMobileAssetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseMobileAssetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_80;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseMobileAssetVersion](self, "responseMobileAssetVersion");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseMobileAssetVersion](self, "responseMobileAssetVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseMobileAssetVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_81;
  }
  else
  {

  }
  v27 = self->_has;
  v28 = (*(unsigned int *)&v27 >> 2) & 1;
  v29 = v4[128];
  if (v28 != ((v29 >> 2) & 1))
    goto LABEL_81;
  if (v28)
  {
    responseInferenceLocation = self->_responseInferenceLocation;
    if (responseInferenceLocation != objc_msgSend(v4, "responseInferenceLocation"))
      goto LABEL_81;
    v27 = self->_has;
    v29 = v4[128];
  }
  v31 = (*(unsigned int *)&v27 >> 3) & 1;
  if (v31 != ((v29 >> 3) & 1))
    goto LABEL_81;
  if (v31)
  {
    responseIsFallback = self->_responseIsFallback;
    if (responseIsFallback != objc_msgSend(v4, "responseIsFallback"))
      goto LABEL_81;
  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responsePreparationTime](self, "responsePreparationTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responsePreparationTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_80;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responsePreparationTime](self, "responsePreparationTime");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responsePreparationTime](self, "responsePreparationTime");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responsePreparationTime");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_81;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseInputValidationTime](self, "responseInputValidationTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseInputValidationTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_80;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseInputValidationTime](self, "responseInputValidationTime");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseInputValidationTime](self, "responseInputValidationTime");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseInputValidationTime");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_81;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseOverridesTime](self, "responseOverridesTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseOverridesTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_80;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseOverridesTime](self, "responseOverridesTime");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseOverridesTime](self, "responseOverridesTime");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseOverridesTime");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_81;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCatalogueRetrievalTime](self, "responseCatalogueRetrievalTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseCatalogueRetrievalTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_80;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCatalogueRetrievalTime](self, "responseCatalogueRetrievalTime");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCatalogueRetrievalTime](self, "responseCatalogueRetrievalTime");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseCatalogueRetrievalTime");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_81;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCATHydrationTime](self, "responseCATHydrationTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseCATHydrationTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_80;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCATHydrationTime](self, "responseCATHydrationTime");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCATHydrationTime](self, "responseCATHydrationTime");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseCATHydrationTime");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_81;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseModelInferenceTime](self, "responseModelInferenceTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseModelInferenceTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_80;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseModelInferenceTime](self, "responseModelInferenceTime");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseModelInferenceTime](self, "responseModelInferenceTime");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseModelInferenceTime");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_81;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseHallucinationInferenceTime](self, "responseHallucinationInferenceTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseHallucinationInferenceTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_80;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseHallucinationInferenceTime](self, "responseHallucinationInferenceTime");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseHallucinationInferenceTime](self, "responseHallucinationInferenceTime");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseHallucinationInferenceTime");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_81;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseSafetyInferenceTime](self, "responseSafetyInferenceTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseSafetyInferenceTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_80;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseSafetyInferenceTime](self, "responseSafetyInferenceTime");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseSafetyInferenceTime](self, "responseSafetyInferenceTime");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseSafetyInferenceTime");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_81;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseGenerationTime](self, "responseGenerationTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseGenerationTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_80;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseGenerationTime](self, "responseGenerationTime");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseGenerationTime](self, "responseGenerationTime");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseGenerationTime");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_81;
  }
  else
  {

  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary failureInfo](self, "failureInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_80:

    goto LABEL_81;
  }
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary failureInfo](self, "failureInfo");
  v78 = objc_claimAutoreleasedReturnValue();
  if (!v78)
  {

LABEL_84:
    v83 = 1;
    goto LABEL_82;
  }
  v79 = (void *)v78;
  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary failureInfo](self, "failureInfo");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v80, "isEqual:", v81);

  if ((v82 & 1) != 0)
    goto LABEL_84;
LABEL_81:
  v83 = 0;
LABEL_82:

  return v83;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
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

  v3 = -[SISchemaUUID hash](self->_planId, "hash");
  v4 = -[SISchemaUUID hash](self->_clientRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_responseIsValidInput;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_responseIsStaticDialogueProvided;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = -[NSString hash](self->_responseMobileAssetVersion, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v8 = 2654435761 * self->_responseInferenceLocation;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_8:
  v9 = 2654435761 * self->_responseIsFallback;
LABEL_11:
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  v11 = v8 ^ v9 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_responsePreparationTime, "hash");
  v12 = v10 ^ v11 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_responseInputValidationTime, "hash");
  v13 = -[PNRODSchemaPNRODMetricDuration hash](self->_responseOverridesTime, "hash");
  v14 = v13 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_responseCatalogueRetrievalTime, "hash");
  v15 = v14 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_responseCATHydrationTime, "hash");
  v16 = v12 ^ v15 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_responseModelInferenceTime, "hash");
  v17 = -[PNRODSchemaPNRODMetricDuration hash](self->_responseHallucinationInferenceTime, "hash");
  v18 = v17 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_responseSafetyInferenceTime, "hash");
  v19 = v18 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_responseGenerationTime, "hash");
  return v16 ^ v19 ^ -[PNRODSchemaPNRODFailureInfo hash](self->_failureInfo, "hash");
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
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  char has;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clientRequestId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary clientRequestId](self, "clientRequestId");
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
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary failureInfo](self, "failureInfo");
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
  if (self->_planId)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary planId](self, "planId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("planId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("planId"));

    }
  }
  if (self->_responseCATHydrationTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCATHydrationTime](self, "responseCATHydrationTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("responseCATHydrationTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("responseCATHydrationTime"));

    }
  }
  if (self->_responseCatalogueRetrievalTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseCatalogueRetrievalTime](self, "responseCatalogueRetrievalTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("responseCatalogueRetrievalTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("responseCatalogueRetrievalTime"));

    }
  }
  if (self->_responseGenerationTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseGenerationTime](self, "responseGenerationTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("responseGenerationTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("responseGenerationTime"));

    }
  }
  if (self->_responseHallucinationInferenceTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseHallucinationInferenceTime](self, "responseHallucinationInferenceTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("responseHallucinationInferenceTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("responseHallucinationInferenceTime"));

    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v25 = -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseInferenceLocation](self, "responseInferenceLocation");
    v26 = CFSTR("RESPONSEINFERENCELOCTION_UNKNOWN");
    if (v25 == 1)
      v26 = CFSTR("RESPONSEINFERENCELOCTION_ON_DEVICE");
    if (v25 == 2)
      v27 = CFSTR("RESPONSEINFERENCELOCTION_SERVER");
    else
      v27 = v26;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("responseInferenceLocation"));
  }
  if (self->_responseInputValidationTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseInputValidationTime](self, "responseInputValidationTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("responseInputValidationTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("responseInputValidationTime"));

    }
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseIsFallback](self, "responseIsFallback"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("responseIsFallback"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_50:
      if ((has & 1) == 0)
        goto LABEL_52;
      goto LABEL_51;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseIsStaticDialogueProvided](self, "responseIsStaticDialogueProvided"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("responseIsStaticDialogueProvided"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_51:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseIsValidInput](self, "responseIsValidInput"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("responseIsValidInput"));

  }
LABEL_52:
  if (self->_responseMobileAssetVersion)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseMobileAssetVersion](self, "responseMobileAssetVersion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("responseMobileAssetVersion"));

  }
  if (self->_responseModelInferenceTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseModelInferenceTime](self, "responseModelInferenceTime");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("responseModelInferenceTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("responseModelInferenceTime"));

    }
  }
  if (self->_responseOverridesTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseOverridesTime](self, "responseOverridesTime");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("responseOverridesTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("responseOverridesTime"));

    }
  }
  if (self->_responsePreparationTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responsePreparationTime](self, "responsePreparationTime");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("responsePreparationTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("responsePreparationTime"));

    }
  }
  if (self->_responseSafetyInferenceTime)
  {
    -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary responseSafetyInferenceTime](self, "responseSafetyInferenceTime");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("responseSafetyInferenceTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("responseSafetyInferenceTime"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary)initWithJSON:(id)a3
{
  void *v4;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *v5;
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
    self = -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary)initWithDictionary:(id)a3
{
  id v4;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *v5;
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
  uint64_t v16;
  PNRODSchemaPNRODMetricDuration *v17;
  uint64_t v18;
  PNRODSchemaPNRODMetricDuration *v19;
  uint64_t v20;
  PNRODSchemaPNRODMetricDuration *v21;
  void *v22;
  PNRODSchemaPNRODMetricDuration *v23;
  void *v24;
  PNRODSchemaPNRODMetricDuration *v25;
  void *v26;
  PNRODSchemaPNRODMetricDuration *v27;
  void *v28;
  PNRODSchemaPNRODMetricDuration *v29;
  void *v30;
  PNRODSchemaPNRODMetricDuration *v31;
  void *v32;
  PNRODSchemaPNRODMetricDuration *v33;
  void *v34;
  PNRODSchemaPNRODFailureInfo *v35;
  PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *v36;
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
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary;
  v5 = -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary init](&v48, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setPlanId:](v5, "setPlanId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientRequestId"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setClientRequestId:](v5, "setClientRequestId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseIsValidInput"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseIsValidInput:](v5, "setResponseIsValidInput:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseIsStaticDialogueProvided"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseIsStaticDialogueProvided:](v5, "setResponseIsStaticDialogueProvided:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseMobileAssetVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseMobileAssetVersion:](v5, "setResponseMobileAssetVersion:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseInferenceLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseInferenceLocation:](v5, "setResponseInferenceLocation:", objc_msgSend(v14, "intValue"));
    v41 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseIsFallback"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseIsFallback:](v5, "setResponseIsFallback:", objc_msgSend(v15, "BOOLValue"));
    v40 = v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responsePreparationTime"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v16);
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponsePreparationTime:](v5, "setResponsePreparationTime:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseInputValidationTime"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v18);
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseInputValidationTime:](v5, "setResponseInputValidationTime:", v19);

    }
    v39 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseOverridesTime"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v20);
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseOverridesTime:](v5, "setResponseOverridesTime:", v21);

    }
    v46 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseCatalogueRetrievalTime"), v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v22);
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseCatalogueRetrievalTime:](v5, "setResponseCatalogueRetrievalTime:", v23);

    }
    v45 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseCATHydrationTime"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v24);
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseCATHydrationTime:](v5, "setResponseCATHydrationTime:", v25);

    }
    v44 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseModelInferenceTime"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v26);
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseModelInferenceTime:](v5, "setResponseModelInferenceTime:", v27);

    }
    v43 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseHallucinationInferenceTime"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v28);
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseHallucinationInferenceTime:](v5, "setResponseHallucinationInferenceTime:", v29);

    }
    v42 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseSafetyInferenceTime"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v30);
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseSafetyInferenceTime:](v5, "setResponseSafetyInferenceTime:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseGenerationTime"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v32);
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setResponseGenerationTime:](v5, "setResponseGenerationTime:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureInfo"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[PNRODSchemaPNRODFailureInfo initWithDictionary:]([PNRODSchemaPNRODFailureInfo alloc], "initWithDictionary:", v34);
      -[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary setFailureInfo:](v5, "setFailureInfo:", v35);

    }
    v36 = v5;

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

- (BOOL)responseIsValidInput
{
  return self->_responseIsValidInput;
}

- (BOOL)responseIsStaticDialogueProvided
{
  return self->_responseIsStaticDialogueProvided;
}

- (NSString)responseMobileAssetVersion
{
  return self->_responseMobileAssetVersion;
}

- (void)setResponseMobileAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)responseInferenceLocation
{
  return self->_responseInferenceLocation;
}

- (BOOL)responseIsFallback
{
  return self->_responseIsFallback;
}

- (PNRODSchemaPNRODMetricDuration)responsePreparationTime
{
  return self->_responsePreparationTime;
}

- (void)setResponsePreparationTime:(id)a3
{
  objc_storeStrong((id *)&self->_responsePreparationTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)responseInputValidationTime
{
  return self->_responseInputValidationTime;
}

- (void)setResponseInputValidationTime:(id)a3
{
  objc_storeStrong((id *)&self->_responseInputValidationTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)responseOverridesTime
{
  return self->_responseOverridesTime;
}

- (void)setResponseOverridesTime:(id)a3
{
  objc_storeStrong((id *)&self->_responseOverridesTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)responseCatalogueRetrievalTime
{
  return self->_responseCatalogueRetrievalTime;
}

- (void)setResponseCatalogueRetrievalTime:(id)a3
{
  objc_storeStrong((id *)&self->_responseCatalogueRetrievalTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)responseCATHydrationTime
{
  return self->_responseCATHydrationTime;
}

- (void)setResponseCATHydrationTime:(id)a3
{
  objc_storeStrong((id *)&self->_responseCATHydrationTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)responseModelInferenceTime
{
  return self->_responseModelInferenceTime;
}

- (void)setResponseModelInferenceTime:(id)a3
{
  objc_storeStrong((id *)&self->_responseModelInferenceTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)responseHallucinationInferenceTime
{
  return self->_responseHallucinationInferenceTime;
}

- (void)setResponseHallucinationInferenceTime:(id)a3
{
  objc_storeStrong((id *)&self->_responseHallucinationInferenceTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)responseSafetyInferenceTime
{
  return self->_responseSafetyInferenceTime;
}

- (void)setResponseSafetyInferenceTime:(id)a3
{
  objc_storeStrong((id *)&self->_responseSafetyInferenceTime, a3);
}

- (PNRODSchemaPNRODMetricDuration)responseGenerationTime
{
  return self->_responseGenerationTime;
}

- (void)setResponseGenerationTime:(id)a3
{
  objc_storeStrong((id *)&self->_responseGenerationTime, a3);
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

- (void)setHasResponseMobileAssetVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasResponsePreparationTime:(BOOL)a3
{
  self->_hasPlanId = a3;
}

- (void)setHasResponseInputValidationTime:(BOOL)a3
{
  self->_hasClientRequestId = a3;
}

- (void)setHasResponseOverridesTime:(BOOL)a3
{
  self->_hasResponseMobileAssetVersion = a3;
}

- (void)setHasResponseCatalogueRetrievalTime:(BOOL)a3
{
  self->_hasResponsePreparationTime = a3;
}

- (void)setHasResponseCATHydrationTime:(BOOL)a3
{
  self->_hasResponseInputValidationTime = a3;
}

- (void)setHasResponseModelInferenceTime:(BOOL)a3
{
  self->_hasResponseOverridesTime = a3;
}

- (void)setHasResponseHallucinationInferenceTime:(BOOL)a3
{
  self->_hasResponseCatalogueRetrievalTime = a3;
}

- (void)setHasResponseSafetyInferenceTime:(BOOL)a3
{
  self->_hasResponseCATHydrationTime = a3;
}

- (void)setHasResponseGenerationTime:(BOOL)a3
{
  self->_hasResponseModelInferenceTime = a3;
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasResponseHallucinationInferenceTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_responseGenerationTime, 0);
  objc_storeStrong((id *)&self->_responseSafetyInferenceTime, 0);
  objc_storeStrong((id *)&self->_responseHallucinationInferenceTime, 0);
  objc_storeStrong((id *)&self->_responseModelInferenceTime, 0);
  objc_storeStrong((id *)&self->_responseCATHydrationTime, 0);
  objc_storeStrong((id *)&self->_responseCatalogueRetrievalTime, 0);
  objc_storeStrong((id *)&self->_responseOverridesTime, 0);
  objc_storeStrong((id *)&self->_responseInputValidationTime, 0);
  objc_storeStrong((id *)&self->_responsePreparationTime, 0);
  objc_storeStrong((id *)&self->_responseMobileAssetVersion, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

@end
