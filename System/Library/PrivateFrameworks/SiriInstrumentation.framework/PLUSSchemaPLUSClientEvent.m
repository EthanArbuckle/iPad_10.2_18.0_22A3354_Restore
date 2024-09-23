@implementation PLUSSchemaPLUSClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[PLUSSchemaPLUSClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "plusId");
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

- (int)componentName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[PLUSSchemaPLUSClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "plusId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (v6)
        LODWORD(v4) = 19;
      else
        LODWORD(v4) = 0;
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
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
  objc_super v79;

  v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)PLUSSchemaPLUSClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v79, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PLUSSchemaPLUSClientEvent deleteUsoGraphTier1](self, "deleteUsoGraphTier1");
    -[PLUSSchemaPLUSClientEvent deleteMediaGroundTruthGenerated](self, "deleteMediaGroundTruthGenerated");
    -[PLUSSchemaPLUSClientEvent deleteMediaEvaluationSummaryReported](self, "deleteMediaEvaluationSummaryReported");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PLUSSchemaPLUSClientEvent deleteUsoGraphTier1](self, "deleteUsoGraphTier1");
    -[PLUSSchemaPLUSClientEvent deleteMediaGroundTruthGenerated](self, "deleteMediaGroundTruthGenerated");
    -[PLUSSchemaPLUSClientEvent deleteMediaEvaluationSummaryReported](self, "deleteMediaEvaluationSummaryReported");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PLUSSchemaPLUSClientEvent deleteUsoGraphTier1](self, "deleteUsoGraphTier1");
    -[PLUSSchemaPLUSClientEvent deleteMediaGroundTruthGenerated](self, "deleteMediaGroundTruthGenerated");
    -[PLUSSchemaPLUSClientEvent deleteMediaEvaluationSummaryReported](self, "deleteMediaEvaluationSummaryReported");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PLUSSchemaPLUSClientEvent deleteUsoGraphTier1](self, "deleteUsoGraphTier1");
    -[PLUSSchemaPLUSClientEvent deleteMediaGroundTruthGenerated](self, "deleteMediaGroundTruthGenerated");
    -[PLUSSchemaPLUSClientEvent deleteMediaEvaluationSummaryReported](self, "deleteMediaEvaluationSummaryReported");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PLUSSchemaPLUSClientEvent deleteUsoGraphTier1](self, "deleteUsoGraphTier1");
    -[PLUSSchemaPLUSClientEvent deleteMediaGroundTruthGenerated](self, "deleteMediaGroundTruthGenerated");
    -[PLUSSchemaPLUSClientEvent deleteMediaEvaluationSummaryReported](self, "deleteMediaEvaluationSummaryReported");
  }
  -[PLUSSchemaPLUSClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[PLUSSchemaPLUSClientEvent contactSuggesterQueryContext](self, "contactSuggesterQueryContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSClientEvent deleteContactSuggesterQueryContext](self, "deleteContactSuggesterQueryContext");
  -[PLUSSchemaPLUSClientEvent contactSuggestionOutcomeReported](self, "contactSuggestionOutcomeReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PLUSSchemaPLUSClientEvent deleteContactSuggestionOutcomeReported](self, "deleteContactSuggestionOutcomeReported");
  -[PLUSSchemaPLUSClientEvent contactSuggesterRequestMetadataReported](self, "contactSuggesterRequestMetadataReported");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PLUSSchemaPLUSClientEvent deleteContactSuggesterRequestMetadataReported](self, "deleteContactSuggesterRequestMetadataReported");
  -[PLUSSchemaPLUSClientEvent contactSuggesterSuggestionMetadataReported](self, "contactSuggesterSuggestionMetadataReported");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PLUSSchemaPLUSClientEvent deleteContactSuggesterSuggestionMetadataReported](self, "deleteContactSuggesterSuggestionMetadataReported");
  -[PLUSSchemaPLUSClientEvent usoGraphTier1](self, "usoGraphTier1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PLUSSchemaPLUSClientEvent deleteUsoGraphTier1](self, "deleteUsoGraphTier1");
  -[PLUSSchemaPLUSClientEvent inferencePluginInvocationContext](self, "inferencePluginInvocationContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[PLUSSchemaPLUSClientEvent deleteInferencePluginInvocationContext](self, "deleteInferencePluginInvocationContext");
  -[PLUSSchemaPLUSClientEvent contactGroundTruthGenerated](self, "contactGroundTruthGenerated");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[PLUSSchemaPLUSClientEvent deleteContactGroundTruthGenerated](self, "deleteContactGroundTruthGenerated");
  -[PLUSSchemaPLUSClientEvent contactSuggestionGenerated](self, "contactSuggestionGenerated");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[PLUSSchemaPLUSClientEvent deleteContactSuggestionGenerated](self, "deleteContactSuggestionGenerated");
  -[PLUSSchemaPLUSClientEvent phoneCallMetadataExtracted](self, "phoneCallMetadataExtracted");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[PLUSSchemaPLUSClientEvent deletePhoneCallMetadataExtracted](self, "deletePhoneCallMetadataExtracted");
  -[PLUSSchemaPLUSClientEvent tmdcGroundTruthGenerated](self, "tmdcGroundTruthGenerated");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[PLUSSchemaPLUSClientEvent deleteTmdcGroundTruthGenerated](self, "deleteTmdcGroundTruthGenerated");
  -[PLUSSchemaPLUSClientEvent patternSequenceGenerated](self, "patternSequenceGenerated");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[PLUSSchemaPLUSClientEvent deletePatternSequenceGenerated](self, "deletePatternSequenceGenerated");
  -[PLUSSchemaPLUSClientEvent sendMessageMetadataExtracted](self, "sendMessageMetadataExtracted");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[PLUSSchemaPLUSClientEvent deleteSendMessageMetadataExtracted](self, "deleteSendMessageMetadataExtracted");
  -[PLUSSchemaPLUSClientEvent contactSuggestionHeartbeatReported](self, "contactSuggestionHeartbeatReported");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[PLUSSchemaPLUSClientEvent deleteContactSuggestionHeartbeatReported](self, "deleteContactSuggestionHeartbeatReported");
  -[PLUSSchemaPLUSClientEvent contactSuggestionRemoved](self, "contactSuggestionRemoved");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[PLUSSchemaPLUSClientEvent deleteContactSuggestionRemoved](self, "deleteContactSuggestionRemoved");
  -[PLUSSchemaPLUSClientEvent contactSuggestionAccuracySignalReported](self, "contactSuggestionAccuracySignalReported");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[PLUSSchemaPLUSClientEvent deleteContactSuggestionAccuracySignalReported](self, "deleteContactSuggestionAccuracySignalReported");
  -[PLUSSchemaPLUSClientEvent mediaGroundTruthGenerated](self, "mediaGroundTruthGenerated");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[PLUSSchemaPLUSClientEvent deleteMediaGroundTruthGenerated](self, "deleteMediaGroundTruthGenerated");
  -[PLUSSchemaPLUSClientEvent mediaEvaluationSummaryReported](self, "mediaEvaluationSummaryReported");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applySensitiveConditionsPolicy:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "suppressMessage");

  if (v59)
    -[PLUSSchemaPLUSClientEvent deleteMediaEvaluationSummaryReported](self, "deleteMediaEvaluationSummaryReported");
  -[PLUSSchemaPLUSClientEvent plusSuggesterQueried](self, "plusSuggesterQueried");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "applySensitiveConditionsPolicy:", v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "suppressMessage");

  if (v62)
    -[PLUSSchemaPLUSClientEvent deletePlusSuggesterQueried](self, "deletePlusSuggesterQueried");
  -[PLUSSchemaPLUSClientEvent plusSuggesterMetadataReported](self, "plusSuggesterMetadataReported");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "applySensitiveConditionsPolicy:", v4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "suppressMessage");

  if (v65)
    -[PLUSSchemaPLUSClientEvent deletePlusSuggesterMetadataReported](self, "deletePlusSuggesterMetadataReported");
  -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionMetadataReported](self, "plusSuggesterSuggestionMetadataReported");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "applySensitiveConditionsPolicy:", v4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "suppressMessage");

  if (v68)
    -[PLUSSchemaPLUSClientEvent deletePlusSuggesterSuggestionMetadataReported](self, "deletePlusSuggesterSuggestionMetadataReported");
  -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionRedundancyReported](self, "plusSuggesterSuggestionRedundancyReported");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "applySensitiveConditionsPolicy:", v4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "suppressMessage");

  if (v71)
    -[PLUSSchemaPLUSClientEvent deletePlusSuggesterSuggestionRedundancyReported](self, "deletePlusSuggesterSuggestionRedundancyReported");
  -[PLUSSchemaPLUSClientEvent suggestionGenerated](self, "suggestionGenerated");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "applySensitiveConditionsPolicy:", v4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "suppressMessage");

  if (v74)
    -[PLUSSchemaPLUSClientEvent deleteSuggestionGenerated](self, "deleteSuggestionGenerated");
  -[PLUSSchemaPLUSClientEvent suggestionOutcomeReported](self, "suggestionOutcomeReported");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "applySensitiveConditionsPolicy:", v4);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "suppressMessage");

  if (v77)
    -[PLUSSchemaPLUSClientEvent deleteSuggestionOutcomeReported](self, "deleteSuggestionOutcomeReported");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[PLUSSchemaPLUSClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 0x16)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562A748[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0x16)
    return 0;
  else
    return off_1E562A800[a3 - 101];
}

- (int)clockIsolationLevel
{
  unint64_t v2;

  v2 = -[PLUSSchemaPLUSClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 106 > 0x11)
    return 1;
  else
    return dword_1AA65D1F4[v2 - 106];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[PLUSSchemaPLUSClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 0x16)
    return CFSTR("com.apple.aiml.siri.plus.PLUSClientEvent");
  else
    return off_1E5632B80[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[PLUSSchemaPLUSClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setContactSuggesterQueryContext:(id)a3
{
  PLUSSchemaPLUSContactSuggesterQueryContext *v4;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;

  v4 = (PLUSSchemaPLUSContactSuggesterQueryContext *)a3;
  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 101;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = v4;

}

- (PLUSSchemaPLUSContactSuggesterQueryContext)contactSuggesterQueryContext
{
  if (self->_whichEvent_Type == 101)
    return self->_contactSuggesterQueryContext;
  else
    return (PLUSSchemaPLUSContactSuggesterQueryContext *)0;
}

- (void)deleteContactSuggesterQueryContext
{
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
    self->_contactSuggesterQueryContext = 0;

  }
}

- (void)setContactSuggestionOutcomeReported:(id)a3
{
  PLUSSchemaPLUSContactSuggestionOutcomeReported *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;

  v4 = (PLUSSchemaPLUSContactSuggestionOutcomeReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 102;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = v4;

}

- (PLUSSchemaPLUSContactSuggestionOutcomeReported)contactSuggestionOutcomeReported
{
  if (self->_whichEvent_Type == 102)
    return self->_contactSuggestionOutcomeReported;
  else
    return (PLUSSchemaPLUSContactSuggestionOutcomeReported *)0;
}

- (void)deleteContactSuggestionOutcomeReported
{
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
    self->_contactSuggestionOutcomeReported = 0;

  }
}

- (void)setContactSuggesterRequestMetadataReported:(id)a3
{
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;

  v4 = (PLUSSchemaPLUSContactSuggesterRequestMetadataReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 103;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = v4;

}

- (PLUSSchemaPLUSContactSuggesterRequestMetadataReported)contactSuggesterRequestMetadataReported
{
  if (self->_whichEvent_Type == 103)
    return self->_contactSuggesterRequestMetadataReported;
  else
    return (PLUSSchemaPLUSContactSuggesterRequestMetadataReported *)0;
}

- (void)deleteContactSuggesterRequestMetadataReported
{
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
    self->_contactSuggesterRequestMetadataReported = 0;

  }
}

- (void)setContactSuggesterSuggestionMetadataReported:(id)a3
{
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;

  v4 = (PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 104;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = v4;

}

- (PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported)contactSuggesterSuggestionMetadataReported
{
  if (self->_whichEvent_Type == 104)
    return self->_contactSuggesterSuggestionMetadataReported;
  else
    return (PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *)0;
}

- (void)deleteContactSuggesterSuggestionMetadataReported
{
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
    self->_contactSuggesterSuggestionMetadataReported = 0;

  }
}

- (void)setUsoGraphTier1:(id)a3
{
  PLUSSchemaPLUSUSOGraphTier1 *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;

  v4 = (PLUSSchemaPLUSUSOGraphTier1 *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 105;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = v4;

}

- (PLUSSchemaPLUSUSOGraphTier1)usoGraphTier1
{
  if (self->_whichEvent_Type == 105)
    return self->_usoGraphTier1;
  else
    return (PLUSSchemaPLUSUSOGraphTier1 *)0;
}

- (void)deleteUsoGraphTier1
{
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    usoGraphTier1 = self->_usoGraphTier1;
    self->_usoGraphTier1 = 0;

  }
}

- (void)setInferencePluginInvocationContext:(id)a3
{
  PLUSSchemaPLUSInferencePluginInvocationContext *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;

  v4 = (PLUSSchemaPLUSInferencePluginInvocationContext *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 106;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = v4;

}

- (PLUSSchemaPLUSInferencePluginInvocationContext)inferencePluginInvocationContext
{
  if (self->_whichEvent_Type == 106)
    return self->_inferencePluginInvocationContext;
  else
    return (PLUSSchemaPLUSInferencePluginInvocationContext *)0;
}

- (void)deleteInferencePluginInvocationContext
{
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
    self->_inferencePluginInvocationContext = 0;

  }
}

- (void)setContactGroundTruthGenerated:(id)a3
{
  PLUSSchemaPLUSContactGroundTruthGenerated *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;

  v4 = (PLUSSchemaPLUSContactGroundTruthGenerated *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 107;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = v4;

}

- (PLUSSchemaPLUSContactGroundTruthGenerated)contactGroundTruthGenerated
{
  if (self->_whichEvent_Type == 107)
    return self->_contactGroundTruthGenerated;
  else
    return (PLUSSchemaPLUSContactGroundTruthGenerated *)0;
}

- (void)deleteContactGroundTruthGenerated
{
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
    self->_contactGroundTruthGenerated = 0;

  }
}

- (void)setContactSuggestionGenerated:(id)a3
{
  PLUSSchemaPLUSContactSuggestionGenerated *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;

  v4 = (PLUSSchemaPLUSContactSuggestionGenerated *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 108;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = v4;

}

- (PLUSSchemaPLUSContactSuggestionGenerated)contactSuggestionGenerated
{
  if (self->_whichEvent_Type == 108)
    return self->_contactSuggestionGenerated;
  else
    return (PLUSSchemaPLUSContactSuggestionGenerated *)0;
}

- (void)deleteContactSuggestionGenerated
{
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    contactSuggestionGenerated = self->_contactSuggestionGenerated;
    self->_contactSuggestionGenerated = 0;

  }
}

- (void)setPhoneCallMetadataExtracted:(id)a3
{
  PLUSSchemaPLUSPhoneCallMetadataExtracted *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;

  v4 = (PLUSSchemaPLUSPhoneCallMetadataExtracted *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 109;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = v4;

}

- (PLUSSchemaPLUSPhoneCallMetadataExtracted)phoneCallMetadataExtracted
{
  if (self->_whichEvent_Type == 109)
    return self->_phoneCallMetadataExtracted;
  else
    return (PLUSSchemaPLUSPhoneCallMetadataExtracted *)0;
}

- (void)deletePhoneCallMetadataExtracted
{
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
    self->_phoneCallMetadataExtracted = 0;

  }
}

- (void)setTmdcGroundTruthGenerated:(id)a3
{
  PLUSSchemaPLUSTMDCGroundTruthGenerated *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;

  v4 = (PLUSSchemaPLUSTMDCGroundTruthGenerated *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 110;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = v4;

}

- (PLUSSchemaPLUSTMDCGroundTruthGenerated)tmdcGroundTruthGenerated
{
  if (self->_whichEvent_Type == 110)
    return self->_tmdcGroundTruthGenerated;
  else
    return (PLUSSchemaPLUSTMDCGroundTruthGenerated *)0;
}

- (void)deleteTmdcGroundTruthGenerated
{
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;

  if (self->_whichEvent_Type == 110)
  {
    self->_whichEvent_Type = 0;
    tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
    self->_tmdcGroundTruthGenerated = 0;

  }
}

- (void)setPatternSequenceGenerated:(id)a3
{
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;

  v4 = (PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 111;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = v4;

}

- (PLUSSchemaPLUSRECTIFIPatternSequenceGenerated)patternSequenceGenerated
{
  if (self->_whichEvent_Type == 111)
    return self->_patternSequenceGenerated;
  else
    return (PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *)0;
}

- (void)deletePatternSequenceGenerated
{
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;

  if (self->_whichEvent_Type == 111)
  {
    self->_whichEvent_Type = 0;
    patternSequenceGenerated = self->_patternSequenceGenerated;
    self->_patternSequenceGenerated = 0;

  }
}

- (void)setSendMessageMetadataExtracted:(id)a3
{
  PLUSSchemaPLUSSendMessageMetadataExtracted *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;

  v4 = (PLUSSchemaPLUSSendMessageMetadataExtracted *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 112;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = v4;

}

- (PLUSSchemaPLUSSendMessageMetadataExtracted)sendMessageMetadataExtracted
{
  if (self->_whichEvent_Type == 112)
    return self->_sendMessageMetadataExtracted;
  else
    return (PLUSSchemaPLUSSendMessageMetadataExtracted *)0;
}

- (void)deleteSendMessageMetadataExtracted
{
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;

  if (self->_whichEvent_Type == 112)
  {
    self->_whichEvent_Type = 0;
    sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
    self->_sendMessageMetadataExtracted = 0;

  }
}

- (void)setContactSuggestionHeartbeatReported:(id)a3
{
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;

  v4 = (PLUSSchemaPLUSContactSuggestionHeartbeatReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 113;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = v4;

}

- (PLUSSchemaPLUSContactSuggestionHeartbeatReported)contactSuggestionHeartbeatReported
{
  if (self->_whichEvent_Type == 113)
    return self->_contactSuggestionHeartbeatReported;
  else
    return (PLUSSchemaPLUSContactSuggestionHeartbeatReported *)0;
}

- (void)deleteContactSuggestionHeartbeatReported
{
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;

  if (self->_whichEvent_Type == 113)
  {
    self->_whichEvent_Type = 0;
    contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
    self->_contactSuggestionHeartbeatReported = 0;

  }
}

- (void)setContactSuggestionRemoved:(id)a3
{
  PLUSSchemaPLUSContactSuggestionRemoved *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;

  v4 = (PLUSSchemaPLUSContactSuggestionRemoved *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 114;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = v4;

}

- (PLUSSchemaPLUSContactSuggestionRemoved)contactSuggestionRemoved
{
  if (self->_whichEvent_Type == 114)
    return self->_contactSuggestionRemoved;
  else
    return (PLUSSchemaPLUSContactSuggestionRemoved *)0;
}

- (void)deleteContactSuggestionRemoved
{
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;

  if (self->_whichEvent_Type == 114)
  {
    self->_whichEvent_Type = 0;
    contactSuggestionRemoved = self->_contactSuggestionRemoved;
    self->_contactSuggestionRemoved = 0;

  }
}

- (void)setContactSuggestionAccuracySignalReported:(id)a3
{
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;

  v4 = (PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 115;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = v4;

}

- (PLUSSchemaPLUSContactSuggestionAccuracySignalReported)contactSuggestionAccuracySignalReported
{
  if (self->_whichEvent_Type == 115)
    return self->_contactSuggestionAccuracySignalReported;
  else
    return (PLUSSchemaPLUSContactSuggestionAccuracySignalReported *)0;
}

- (void)deleteContactSuggestionAccuracySignalReported
{
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;

  if (self->_whichEvent_Type == 115)
  {
    self->_whichEvent_Type = 0;
    contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
    self->_contactSuggestionAccuracySignalReported = 0;

  }
}

- (void)setMediaGroundTruthGenerated:(id)a3
{
  PLUSSchemaPLUSMediaGroundTruthGenerated *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;

  v4 = (PLUSSchemaPLUSMediaGroundTruthGenerated *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 116;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = v4;

}

- (PLUSSchemaPLUSMediaGroundTruthGenerated)mediaGroundTruthGenerated
{
  if (self->_whichEvent_Type == 116)
    return self->_mediaGroundTruthGenerated;
  else
    return (PLUSSchemaPLUSMediaGroundTruthGenerated *)0;
}

- (void)deleteMediaGroundTruthGenerated
{
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;

  if (self->_whichEvent_Type == 116)
  {
    self->_whichEvent_Type = 0;
    mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
    self->_mediaGroundTruthGenerated = 0;

  }
}

- (void)setMediaEvaluationSummaryReported:(id)a3
{
  PLUSSchemaPLUSMediaEvaluationSummaryReported *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;

  v4 = (PLUSSchemaPLUSMediaEvaluationSummaryReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 117;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = v4;

}

- (PLUSSchemaPLUSMediaEvaluationSummaryReported)mediaEvaluationSummaryReported
{
  if (self->_whichEvent_Type == 117)
    return self->_mediaEvaluationSummaryReported;
  else
    return (PLUSSchemaPLUSMediaEvaluationSummaryReported *)0;
}

- (void)deleteMediaEvaluationSummaryReported
{
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;

  if (self->_whichEvent_Type == 117)
  {
    self->_whichEvent_Type = 0;
    mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
    self->_mediaEvaluationSummaryReported = 0;

  }
}

- (void)setPlusSuggesterQueried:(id)a3
{
  PLUSSchemaPLUSSuggesterQueried *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;

  v4 = (PLUSSchemaPLUSSuggesterQueried *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 118;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = v4;

}

- (PLUSSchemaPLUSSuggesterQueried)plusSuggesterQueried
{
  if (self->_whichEvent_Type == 118)
    return self->_plusSuggesterQueried;
  else
    return (PLUSSchemaPLUSSuggesterQueried *)0;
}

- (void)deletePlusSuggesterQueried
{
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;

  if (self->_whichEvent_Type == 118)
  {
    self->_whichEvent_Type = 0;
    plusSuggesterQueried = self->_plusSuggesterQueried;
    self->_plusSuggesterQueried = 0;

  }
}

- (void)setPlusSuggesterMetadataReported:(id)a3
{
  PLUSSchemaPLUSSuggesterMetadataReported *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;

  v4 = (PLUSSchemaPLUSSuggesterMetadataReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 119;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = v4;

}

- (PLUSSchemaPLUSSuggesterMetadataReported)plusSuggesterMetadataReported
{
  if (self->_whichEvent_Type == 119)
    return self->_plusSuggesterMetadataReported;
  else
    return (PLUSSchemaPLUSSuggesterMetadataReported *)0;
}

- (void)deletePlusSuggesterMetadataReported
{
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;

  if (self->_whichEvent_Type == 119)
  {
    self->_whichEvent_Type = 0;
    plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
    self->_plusSuggesterMetadataReported = 0;

  }
}

- (void)setPlusSuggesterSuggestionMetadataReported:(id)a3
{
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;

  v4 = (PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 120;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = v4;

}

- (PLUSSchemaPLUSSuggesterSuggestionMetadataReported)plusSuggesterSuggestionMetadataReported
{
  if (self->_whichEvent_Type == 120)
    return self->_plusSuggesterSuggestionMetadataReported;
  else
    return (PLUSSchemaPLUSSuggesterSuggestionMetadataReported *)0;
}

- (void)deletePlusSuggesterSuggestionMetadataReported
{
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;

  if (self->_whichEvent_Type == 120)
  {
    self->_whichEvent_Type = 0;
    plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
    self->_plusSuggesterSuggestionMetadataReported = 0;

  }
}

- (void)setPlusSuggesterSuggestionRedundancyReported:(id)a3
{
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;

  v4 = (PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 121;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = v4;

}

- (PLUSSchemaPLUSSuggesterSuggestionRedundancyReported)plusSuggesterSuggestionRedundancyReported
{
  if (self->_whichEvent_Type == 121)
    return self->_plusSuggesterSuggestionRedundancyReported;
  else
    return (PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *)0;
}

- (void)deletePlusSuggesterSuggestionRedundancyReported
{
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;

  if (self->_whichEvent_Type == 121)
  {
    self->_whichEvent_Type = 0;
    plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
    self->_plusSuggesterSuggestionRedundancyReported = 0;

  }
}

- (void)setSuggestionGenerated:(id)a3
{
  PLUSSchemaPLUSSuggestionGenerated *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;
  unint64_t v27;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;

  v4 = (PLUSSchemaPLUSSuggestionGenerated *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = 0;

  v27 = 122;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = v4;

}

- (PLUSSchemaPLUSSuggestionGenerated)suggestionGenerated
{
  if (self->_whichEvent_Type == 122)
    return self->_suggestionGenerated;
  else
    return (PLUSSchemaPLUSSuggestionGenerated *)0;
}

- (void)deleteSuggestionGenerated
{
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;

  if (self->_whichEvent_Type == 122)
  {
    self->_whichEvent_Type = 0;
    suggestionGenerated = self->_suggestionGenerated;
    self->_suggestionGenerated = 0;

  }
}

- (void)setSuggestionOutcomeReported:(id)a3
{
  PLUSSchemaPLUSSuggestionOutcomeReported *v4;
  PLUSSchemaPLUSContactSuggesterQueryContext *contactSuggesterQueryContext;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *contactSuggestionOutcomeReported;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *contactSuggesterRequestMetadataReported;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *contactSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSUSOGraphTier1 *usoGraphTier1;
  PLUSSchemaPLUSInferencePluginInvocationContext *inferencePluginInvocationContext;
  PLUSSchemaPLUSContactGroundTruthGenerated *contactGroundTruthGenerated;
  PLUSSchemaPLUSContactSuggestionGenerated *contactSuggestionGenerated;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *phoneCallMetadataExtracted;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *tmdcGroundTruthGenerated;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *patternSequenceGenerated;
  PLUSSchemaPLUSSendMessageMetadataExtracted *sendMessageMetadataExtracted;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *contactSuggestionHeartbeatReported;
  PLUSSchemaPLUSContactSuggestionRemoved *contactSuggestionRemoved;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *contactSuggestionAccuracySignalReported;
  PLUSSchemaPLUSMediaGroundTruthGenerated *mediaGroundTruthGenerated;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *mediaEvaluationSummaryReported;
  PLUSSchemaPLUSSuggesterQueried *plusSuggesterQueried;
  PLUSSchemaPLUSSuggesterMetadataReported *plusSuggesterMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *plusSuggesterSuggestionMetadataReported;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *plusSuggesterSuggestionRedundancyReported;
  PLUSSchemaPLUSSuggestionGenerated *suggestionGenerated;
  unint64_t v27;
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;

  v4 = (PLUSSchemaPLUSSuggestionOutcomeReported *)a3;
  contactSuggesterQueryContext = self->_contactSuggesterQueryContext;
  self->_contactSuggesterQueryContext = 0;

  contactSuggestionOutcomeReported = self->_contactSuggestionOutcomeReported;
  self->_contactSuggestionOutcomeReported = 0;

  contactSuggesterRequestMetadataReported = self->_contactSuggesterRequestMetadataReported;
  self->_contactSuggesterRequestMetadataReported = 0;

  contactSuggesterSuggestionMetadataReported = self->_contactSuggesterSuggestionMetadataReported;
  self->_contactSuggesterSuggestionMetadataReported = 0;

  usoGraphTier1 = self->_usoGraphTier1;
  self->_usoGraphTier1 = 0;

  inferencePluginInvocationContext = self->_inferencePluginInvocationContext;
  self->_inferencePluginInvocationContext = 0;

  contactGroundTruthGenerated = self->_contactGroundTruthGenerated;
  self->_contactGroundTruthGenerated = 0;

  contactSuggestionGenerated = self->_contactSuggestionGenerated;
  self->_contactSuggestionGenerated = 0;

  phoneCallMetadataExtracted = self->_phoneCallMetadataExtracted;
  self->_phoneCallMetadataExtracted = 0;

  tmdcGroundTruthGenerated = self->_tmdcGroundTruthGenerated;
  self->_tmdcGroundTruthGenerated = 0;

  patternSequenceGenerated = self->_patternSequenceGenerated;
  self->_patternSequenceGenerated = 0;

  sendMessageMetadataExtracted = self->_sendMessageMetadataExtracted;
  self->_sendMessageMetadataExtracted = 0;

  contactSuggestionHeartbeatReported = self->_contactSuggestionHeartbeatReported;
  self->_contactSuggestionHeartbeatReported = 0;

  contactSuggestionRemoved = self->_contactSuggestionRemoved;
  self->_contactSuggestionRemoved = 0;

  contactSuggestionAccuracySignalReported = self->_contactSuggestionAccuracySignalReported;
  self->_contactSuggestionAccuracySignalReported = 0;

  mediaGroundTruthGenerated = self->_mediaGroundTruthGenerated;
  self->_mediaGroundTruthGenerated = 0;

  mediaEvaluationSummaryReported = self->_mediaEvaluationSummaryReported;
  self->_mediaEvaluationSummaryReported = 0;

  plusSuggesterQueried = self->_plusSuggesterQueried;
  self->_plusSuggesterQueried = 0;

  plusSuggesterMetadataReported = self->_plusSuggesterMetadataReported;
  self->_plusSuggesterMetadataReported = 0;

  plusSuggesterSuggestionMetadataReported = self->_plusSuggesterSuggestionMetadataReported;
  self->_plusSuggesterSuggestionMetadataReported = 0;

  plusSuggesterSuggestionRedundancyReported = self->_plusSuggesterSuggestionRedundancyReported;
  self->_plusSuggesterSuggestionRedundancyReported = 0;

  suggestionGenerated = self->_suggestionGenerated;
  self->_suggestionGenerated = 0;

  v27 = 123;
  if (!v4)
    v27 = 0;
  self->_whichEvent_Type = v27;
  suggestionOutcomeReported = self->_suggestionOutcomeReported;
  self->_suggestionOutcomeReported = v4;

}

- (PLUSSchemaPLUSSuggestionOutcomeReported)suggestionOutcomeReported
{
  if (self->_whichEvent_Type == 123)
    return self->_suggestionOutcomeReported;
  else
    return (PLUSSchemaPLUSSuggestionOutcomeReported *)0;
}

- (void)deleteSuggestionOutcomeReported
{
  PLUSSchemaPLUSSuggestionOutcomeReported *suggestionOutcomeReported;

  if (self->_whichEvent_Type == 123)
  {
    self->_whichEvent_Type = 0;
    suggestionOutcomeReported = self->_suggestionOutcomeReported;
    self->_suggestionOutcomeReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSClientEventReadFrom(self, (uint64_t)a3);
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
  id v52;

  v52 = a3;
  -[PLUSSchemaPLUSClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent contactSuggesterQueryContext](self, "contactSuggesterQueryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggesterQueryContext](self, "contactSuggesterQueryContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent contactSuggestionOutcomeReported](self, "contactSuggestionOutcomeReported");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggestionOutcomeReported](self, "contactSuggestionOutcomeReported");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent contactSuggesterRequestMetadataReported](self, "contactSuggesterRequestMetadataReported");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggesterRequestMetadataReported](self, "contactSuggesterRequestMetadataReported");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent contactSuggesterSuggestionMetadataReported](self, "contactSuggesterSuggestionMetadataReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggesterSuggestionMetadataReported](self, "contactSuggesterSuggestionMetadataReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent usoGraphTier1](self, "usoGraphTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PLUSSchemaPLUSClientEvent usoGraphTier1](self, "usoGraphTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent inferencePluginInvocationContext](self, "inferencePluginInvocationContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PLUSSchemaPLUSClientEvent inferencePluginInvocationContext](self, "inferencePluginInvocationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent contactGroundTruthGenerated](self, "contactGroundTruthGenerated");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PLUSSchemaPLUSClientEvent contactGroundTruthGenerated](self, "contactGroundTruthGenerated");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent contactSuggestionGenerated](self, "contactSuggestionGenerated");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggestionGenerated](self, "contactSuggestionGenerated");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent phoneCallMetadataExtracted](self, "phoneCallMetadataExtracted");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[PLUSSchemaPLUSClientEvent phoneCallMetadataExtracted](self, "phoneCallMetadataExtracted");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent tmdcGroundTruthGenerated](self, "tmdcGroundTruthGenerated");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[PLUSSchemaPLUSClientEvent tmdcGroundTruthGenerated](self, "tmdcGroundTruthGenerated");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent patternSequenceGenerated](self, "patternSequenceGenerated");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[PLUSSchemaPLUSClientEvent patternSequenceGenerated](self, "patternSequenceGenerated");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent sendMessageMetadataExtracted](self, "sendMessageMetadataExtracted");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[PLUSSchemaPLUSClientEvent sendMessageMetadataExtracted](self, "sendMessageMetadataExtracted");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent contactSuggestionHeartbeatReported](self, "contactSuggestionHeartbeatReported");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggestionHeartbeatReported](self, "contactSuggestionHeartbeatReported");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent contactSuggestionRemoved](self, "contactSuggestionRemoved");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggestionRemoved](self, "contactSuggestionRemoved");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent contactSuggestionAccuracySignalReported](self, "contactSuggestionAccuracySignalReported");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggestionAccuracySignalReported](self, "contactSuggestionAccuracySignalReported");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent mediaGroundTruthGenerated](self, "mediaGroundTruthGenerated");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[PLUSSchemaPLUSClientEvent mediaGroundTruthGenerated](self, "mediaGroundTruthGenerated");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent mediaEvaluationSummaryReported](self, "mediaEvaluationSummaryReported");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[PLUSSchemaPLUSClientEvent mediaEvaluationSummaryReported](self, "mediaEvaluationSummaryReported");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent plusSuggesterQueried](self, "plusSuggesterQueried");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[PLUSSchemaPLUSClientEvent plusSuggesterQueried](self, "plusSuggesterQueried");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent plusSuggesterMetadataReported](self, "plusSuggesterMetadataReported");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[PLUSSchemaPLUSClientEvent plusSuggesterMetadataReported](self, "plusSuggesterMetadataReported");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionMetadataReported](self, "plusSuggesterSuggestionMetadataReported");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionMetadataReported](self, "plusSuggesterSuggestionMetadataReported");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionRedundancyReported](self, "plusSuggesterSuggestionRedundancyReported");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionRedundancyReported](self, "plusSuggesterSuggestionRedundancyReported");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent suggestionGenerated](self, "suggestionGenerated");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[PLUSSchemaPLUSClientEvent suggestionGenerated](self, "suggestionGenerated");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSClientEvent suggestionOutcomeReported](self, "suggestionOutcomeReported");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[PLUSSchemaPLUSClientEvent suggestionOutcomeReported](self, "suggestionOutcomeReported");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v127;
  BOOL v128;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_123;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_123;
  -[PLUSSchemaPLUSClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PLUSSchemaPLUSClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent contactSuggesterQueryContext](self, "contactSuggesterQueryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactSuggesterQueryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent contactSuggesterQueryContext](self, "contactSuggesterQueryContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PLUSSchemaPLUSClientEvent contactSuggesterQueryContext](self, "contactSuggesterQueryContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactSuggesterQueryContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent contactSuggestionOutcomeReported](self, "contactSuggestionOutcomeReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactSuggestionOutcomeReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent contactSuggestionOutcomeReported](self, "contactSuggestionOutcomeReported");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PLUSSchemaPLUSClientEvent contactSuggestionOutcomeReported](self, "contactSuggestionOutcomeReported");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactSuggestionOutcomeReported");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent contactSuggesterRequestMetadataReported](self, "contactSuggesterRequestMetadataReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactSuggesterRequestMetadataReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent contactSuggesterRequestMetadataReported](self, "contactSuggesterRequestMetadataReported");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[PLUSSchemaPLUSClientEvent contactSuggesterRequestMetadataReported](self, "contactSuggesterRequestMetadataReported");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactSuggesterRequestMetadataReported");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent contactSuggesterSuggestionMetadataReported](self, "contactSuggesterSuggestionMetadataReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactSuggesterSuggestionMetadataReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent contactSuggesterSuggestionMetadataReported](self, "contactSuggesterSuggestionMetadataReported");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[PLUSSchemaPLUSClientEvent contactSuggesterSuggestionMetadataReported](self, "contactSuggesterSuggestionMetadataReported");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactSuggesterSuggestionMetadataReported");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent usoGraphTier1](self, "usoGraphTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usoGraphTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent usoGraphTier1](self, "usoGraphTier1");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[PLUSSchemaPLUSClientEvent usoGraphTier1](self, "usoGraphTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "usoGraphTier1");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent inferencePluginInvocationContext](self, "inferencePluginInvocationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inferencePluginInvocationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent inferencePluginInvocationContext](self, "inferencePluginInvocationContext");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[PLUSSchemaPLUSClientEvent inferencePluginInvocationContext](self, "inferencePluginInvocationContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inferencePluginInvocationContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent contactGroundTruthGenerated](self, "contactGroundTruthGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactGroundTruthGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent contactGroundTruthGenerated](self, "contactGroundTruthGenerated");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[PLUSSchemaPLUSClientEvent contactGroundTruthGenerated](self, "contactGroundTruthGenerated");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactGroundTruthGenerated");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent contactSuggestionGenerated](self, "contactSuggestionGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactSuggestionGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent contactSuggestionGenerated](self, "contactSuggestionGenerated");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[PLUSSchemaPLUSClientEvent contactSuggestionGenerated](self, "contactSuggestionGenerated");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactSuggestionGenerated");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent phoneCallMetadataExtracted](self, "phoneCallMetadataExtracted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneCallMetadataExtracted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent phoneCallMetadataExtracted](self, "phoneCallMetadataExtracted");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[PLUSSchemaPLUSClientEvent phoneCallMetadataExtracted](self, "phoneCallMetadataExtracted");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneCallMetadataExtracted");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent tmdcGroundTruthGenerated](self, "tmdcGroundTruthGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tmdcGroundTruthGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent tmdcGroundTruthGenerated](self, "tmdcGroundTruthGenerated");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[PLUSSchemaPLUSClientEvent tmdcGroundTruthGenerated](self, "tmdcGroundTruthGenerated");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tmdcGroundTruthGenerated");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent patternSequenceGenerated](self, "patternSequenceGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "patternSequenceGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent patternSequenceGenerated](self, "patternSequenceGenerated");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[PLUSSchemaPLUSClientEvent patternSequenceGenerated](self, "patternSequenceGenerated");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "patternSequenceGenerated");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent sendMessageMetadataExtracted](self, "sendMessageMetadataExtracted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessageMetadataExtracted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent sendMessageMetadataExtracted](self, "sendMessageMetadataExtracted");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[PLUSSchemaPLUSClientEvent sendMessageMetadataExtracted](self, "sendMessageMetadataExtracted");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendMessageMetadataExtracted");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent contactSuggestionHeartbeatReported](self, "contactSuggestionHeartbeatReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactSuggestionHeartbeatReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent contactSuggestionHeartbeatReported](self, "contactSuggestionHeartbeatReported");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[PLUSSchemaPLUSClientEvent contactSuggestionHeartbeatReported](self, "contactSuggestionHeartbeatReported");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactSuggestionHeartbeatReported");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent contactSuggestionRemoved](self, "contactSuggestionRemoved");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactSuggestionRemoved");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent contactSuggestionRemoved](self, "contactSuggestionRemoved");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[PLUSSchemaPLUSClientEvent contactSuggestionRemoved](self, "contactSuggestionRemoved");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactSuggestionRemoved");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent contactSuggestionAccuracySignalReported](self, "contactSuggestionAccuracySignalReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactSuggestionAccuracySignalReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent contactSuggestionAccuracySignalReported](self, "contactSuggestionAccuracySignalReported");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[PLUSSchemaPLUSClientEvent contactSuggestionAccuracySignalReported](self, "contactSuggestionAccuracySignalReported");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactSuggestionAccuracySignalReported");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent mediaGroundTruthGenerated](self, "mediaGroundTruthGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaGroundTruthGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent mediaGroundTruthGenerated](self, "mediaGroundTruthGenerated");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[PLUSSchemaPLUSClientEvent mediaGroundTruthGenerated](self, "mediaGroundTruthGenerated");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaGroundTruthGenerated");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent mediaEvaluationSummaryReported](self, "mediaEvaluationSummaryReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaEvaluationSummaryReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent mediaEvaluationSummaryReported](self, "mediaEvaluationSummaryReported");
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)v93;
    -[PLUSSchemaPLUSClientEvent mediaEvaluationSummaryReported](self, "mediaEvaluationSummaryReported");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaEvaluationSummaryReported");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v95, "isEqual:", v96);

    if (!v97)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent plusSuggesterQueried](self, "plusSuggesterQueried");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plusSuggesterQueried");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent plusSuggesterQueried](self, "plusSuggesterQueried");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    -[PLUSSchemaPLUSClientEvent plusSuggesterQueried](self, "plusSuggesterQueried");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plusSuggesterQueried");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "isEqual:", v101);

    if (!v102)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent plusSuggesterMetadataReported](self, "plusSuggesterMetadataReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plusSuggesterMetadataReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent plusSuggesterMetadataReported](self, "plusSuggesterMetadataReported");
  v103 = objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    v104 = (void *)v103;
    -[PLUSSchemaPLUSClientEvent plusSuggesterMetadataReported](self, "plusSuggesterMetadataReported");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plusSuggesterMetadataReported");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v105, "isEqual:", v106);

    if (!v107)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionMetadataReported](self, "plusSuggesterSuggestionMetadataReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plusSuggesterSuggestionMetadataReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionMetadataReported](self, "plusSuggesterSuggestionMetadataReported");
  v108 = objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    v109 = (void *)v108;
    -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionMetadataReported](self, "plusSuggesterSuggestionMetadataReported");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plusSuggesterSuggestionMetadataReported");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v110, "isEqual:", v111);

    if (!v112)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionRedundancyReported](self, "plusSuggesterSuggestionRedundancyReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plusSuggesterSuggestionRedundancyReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionRedundancyReported](self, "plusSuggesterSuggestionRedundancyReported");
  v113 = objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    v114 = (void *)v113;
    -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionRedundancyReported](self, "plusSuggesterSuggestionRedundancyReported");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plusSuggesterSuggestionRedundancyReported");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v115, "isEqual:", v116);

    if (!v117)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent suggestionGenerated](self, "suggestionGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_122;
  -[PLUSSchemaPLUSClientEvent suggestionGenerated](self, "suggestionGenerated");
  v118 = objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = (void *)v118;
    -[PLUSSchemaPLUSClientEvent suggestionGenerated](self, "suggestionGenerated");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionGenerated");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v120, "isEqual:", v121);

    if (!v122)
      goto LABEL_123;
  }
  else
  {

  }
  -[PLUSSchemaPLUSClientEvent suggestionOutcomeReported](self, "suggestionOutcomeReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionOutcomeReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[PLUSSchemaPLUSClientEvent suggestionOutcomeReported](self, "suggestionOutcomeReported");
    v123 = objc_claimAutoreleasedReturnValue();
    if (!v123)
    {

LABEL_126:
      v128 = 1;
      goto LABEL_124;
    }
    v124 = (void *)v123;
    -[PLUSSchemaPLUSClientEvent suggestionOutcomeReported](self, "suggestionOutcomeReported");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionOutcomeReported");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v125, "isEqual:", v126);

    if ((v127 & 1) != 0)
      goto LABEL_126;
  }
  else
  {
LABEL_122:

  }
LABEL_123:
  v128 = 0;
LABEL_124:

  return v128;
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

  v3 = -[PLUSSchemaPLUSClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[PLUSSchemaPLUSContactSuggesterQueryContext hash](self->_contactSuggesterQueryContext, "hash") ^ v3;
  v5 = -[PLUSSchemaPLUSContactSuggestionOutcomeReported hash](self->_contactSuggestionOutcomeReported, "hash");
  v6 = v4 ^ v5 ^ -[PLUSSchemaPLUSContactSuggesterRequestMetadataReported hash](self->_contactSuggesterRequestMetadataReported, "hash");
  v7 = -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported hash](self->_contactSuggesterSuggestionMetadataReported, "hash");
  v8 = v7 ^ -[PLUSSchemaPLUSUSOGraphTier1 hash](self->_usoGraphTier1, "hash");
  v9 = v6 ^ v8 ^ -[PLUSSchemaPLUSInferencePluginInvocationContext hash](self->_inferencePluginInvocationContext, "hash");
  v10 = -[PLUSSchemaPLUSContactGroundTruthGenerated hash](self->_contactGroundTruthGenerated, "hash");
  v11 = v10 ^ -[PLUSSchemaPLUSContactSuggestionGenerated hash](self->_contactSuggestionGenerated, "hash");
  v12 = v11 ^ -[PLUSSchemaPLUSPhoneCallMetadataExtracted hash](self->_phoneCallMetadataExtracted, "hash");
  v13 = v9 ^ v12 ^ -[PLUSSchemaPLUSTMDCGroundTruthGenerated hash](self->_tmdcGroundTruthGenerated, "hash");
  v14 = -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated hash](self->_patternSequenceGenerated, "hash");
  v15 = v14 ^ -[PLUSSchemaPLUSSendMessageMetadataExtracted hash](self->_sendMessageMetadataExtracted, "hash");
  v16 = v15 ^ -[PLUSSchemaPLUSContactSuggestionHeartbeatReported hash](self->_contactSuggestionHeartbeatReported, "hash");
  v17 = v16 ^ -[PLUSSchemaPLUSContactSuggestionRemoved hash](self->_contactSuggestionRemoved, "hash");
  v18 = v13 ^ v17 ^ -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported hash](self->_contactSuggestionAccuracySignalReported, "hash");
  v19 = -[PLUSSchemaPLUSMediaGroundTruthGenerated hash](self->_mediaGroundTruthGenerated, "hash");
  v20 = v19 ^ -[PLUSSchemaPLUSMediaEvaluationSummaryReported hash](self->_mediaEvaluationSummaryReported, "hash");
  v21 = v20 ^ -[PLUSSchemaPLUSSuggesterQueried hash](self->_plusSuggesterQueried, "hash");
  v22 = v21 ^ -[PLUSSchemaPLUSSuggesterMetadataReported hash](self->_plusSuggesterMetadataReported, "hash");
  v23 = v22 ^ -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported hash](self->_plusSuggesterSuggestionMetadataReported, "hash");
  v24 = v18 ^ v23 ^ -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported hash](self->_plusSuggesterSuggestionRedundancyReported, "hash");
  v25 = -[PLUSSchemaPLUSSuggestionGenerated hash](self->_suggestionGenerated, "hash");
  return v24 ^ v25 ^ -[PLUSSchemaPLUSSuggestionOutcomeReported hash](self->_suggestionOutcomeReported, "hash");
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
  id v76;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contactGroundTruthGenerated)
  {
    -[PLUSSchemaPLUSClientEvent contactGroundTruthGenerated](self, "contactGroundTruthGenerated");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactGroundTruthGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("contactGroundTruthGenerated"));

    }
  }
  if (self->_contactSuggesterQueryContext)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggesterQueryContext](self, "contactSuggesterQueryContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("contactSuggesterQueryContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("contactSuggesterQueryContext"));

    }
  }
  if (self->_contactSuggesterRequestMetadataReported)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggesterRequestMetadataReported](self, "contactSuggesterRequestMetadataReported");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("contactSuggesterRequestMetadataReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("contactSuggesterRequestMetadataReported"));

    }
  }
  if (self->_contactSuggesterSuggestionMetadataReported)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggesterSuggestionMetadataReported](self, "contactSuggesterSuggestionMetadataReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("contactSuggesterSuggestionMetadataReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("contactSuggesterSuggestionMetadataReported"));

    }
  }
  if (self->_contactSuggestionAccuracySignalReported)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggestionAccuracySignalReported](self, "contactSuggestionAccuracySignalReported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("contactSuggestionAccuracySignalReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("contactSuggestionAccuracySignalReported"));

    }
  }
  if (self->_contactSuggestionGenerated)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggestionGenerated](self, "contactSuggestionGenerated");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("contactSuggestionGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("contactSuggestionGenerated"));

    }
  }
  if (self->_contactSuggestionHeartbeatReported)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggestionHeartbeatReported](self, "contactSuggestionHeartbeatReported");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("contactSuggestionHeartbeatReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("contactSuggestionHeartbeatReported"));

    }
  }
  if (self->_contactSuggestionOutcomeReported)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggestionOutcomeReported](self, "contactSuggestionOutcomeReported");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("contactSuggestionOutcomeReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("contactSuggestionOutcomeReported"));

    }
  }
  if (self->_contactSuggestionRemoved)
  {
    -[PLUSSchemaPLUSClientEvent contactSuggestionRemoved](self, "contactSuggestionRemoved");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("contactSuggestionRemoved"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("contactSuggestionRemoved"));

    }
  }
  if (self->_eventMetadata)
  {
    -[PLUSSchemaPLUSClientEvent eventMetadata](self, "eventMetadata");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("eventMetadata"));

    }
  }
  if (self->_inferencePluginInvocationContext)
  {
    -[PLUSSchemaPLUSClientEvent inferencePluginInvocationContext](self, "inferencePluginInvocationContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("inferencePluginInvocationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("inferencePluginInvocationContext"));

    }
  }
  if (self->_mediaEvaluationSummaryReported)
  {
    -[PLUSSchemaPLUSClientEvent mediaEvaluationSummaryReported](self, "mediaEvaluationSummaryReported");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("mediaEvaluationSummaryReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("mediaEvaluationSummaryReported"));

    }
  }
  if (self->_mediaGroundTruthGenerated)
  {
    -[PLUSSchemaPLUSClientEvent mediaGroundTruthGenerated](self, "mediaGroundTruthGenerated");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("mediaGroundTruthGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("mediaGroundTruthGenerated"));

    }
  }
  if (self->_patternSequenceGenerated)
  {
    -[PLUSSchemaPLUSClientEvent patternSequenceGenerated](self, "patternSequenceGenerated");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("patternSequenceGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("patternSequenceGenerated"));

    }
  }
  if (self->_phoneCallMetadataExtracted)
  {
    -[PLUSSchemaPLUSClientEvent phoneCallMetadataExtracted](self, "phoneCallMetadataExtracted");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("phoneCallMetadataExtracted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("phoneCallMetadataExtracted"));

    }
  }
  if (self->_plusSuggesterMetadataReported)
  {
    -[PLUSSchemaPLUSClientEvent plusSuggesterMetadataReported](self, "plusSuggesterMetadataReported");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("plusSuggesterMetadataReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("plusSuggesterMetadataReported"));

    }
  }
  if (self->_plusSuggesterQueried)
  {
    -[PLUSSchemaPLUSClientEvent plusSuggesterQueried](self, "plusSuggesterQueried");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("plusSuggesterQueried"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("plusSuggesterQueried"));

    }
  }
  if (self->_plusSuggesterSuggestionMetadataReported)
  {
    -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionMetadataReported](self, "plusSuggesterSuggestionMetadataReported");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("plusSuggesterSuggestionMetadataReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("plusSuggesterSuggestionMetadataReported"));

    }
  }
  if (self->_plusSuggesterSuggestionRedundancyReported)
  {
    -[PLUSSchemaPLUSClientEvent plusSuggesterSuggestionRedundancyReported](self, "plusSuggesterSuggestionRedundancyReported");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("plusSuggesterSuggestionRedundancyReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("plusSuggesterSuggestionRedundancyReported"));

    }
  }
  if (self->_sendMessageMetadataExtracted)
  {
    -[PLUSSchemaPLUSClientEvent sendMessageMetadataExtracted](self, "sendMessageMetadataExtracted");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dictionaryRepresentation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("sendMessageMetadataExtracted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("sendMessageMetadataExtracted"));

    }
  }
  if (self->_suggestionGenerated)
  {
    -[PLUSSchemaPLUSClientEvent suggestionGenerated](self, "suggestionGenerated");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dictionaryRepresentation");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("suggestionGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("suggestionGenerated"));

    }
  }
  if (self->_suggestionOutcomeReported)
  {
    -[PLUSSchemaPLUSClientEvent suggestionOutcomeReported](self, "suggestionOutcomeReported");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("suggestionOutcomeReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("suggestionOutcomeReported"));

    }
  }
  if (self->_tmdcGroundTruthGenerated)
  {
    -[PLUSSchemaPLUSClientEvent tmdcGroundTruthGenerated](self, "tmdcGroundTruthGenerated");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "dictionaryRepresentation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("tmdcGroundTruthGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("tmdcGroundTruthGenerated"));

    }
  }
  if (self->_usoGraphTier1)
  {
    -[PLUSSchemaPLUSClientEvent usoGraphTier1](self, "usoGraphTier1");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("usoGraphTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("usoGraphTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v76 = v3;

  return v76;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSClientEvent)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSClientEvent *v5;
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
    self = -[PLUSSchemaPLUSClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSClientEvent)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSClientEvent *v5;
  uint64_t v6;
  PLUSSchemaPLUSClientEventMetadata *v7;
  uint64_t v8;
  PLUSSchemaPLUSContactSuggesterQueryContext *v9;
  uint64_t v10;
  PLUSSchemaPLUSContactSuggestionOutcomeReported *v11;
  uint64_t v12;
  PLUSSchemaPLUSContactSuggesterRequestMetadataReported *v13;
  uint64_t v14;
  PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported *v15;
  uint64_t v16;
  PLUSSchemaPLUSUSOGraphTier1 *v17;
  uint64_t v18;
  PLUSSchemaPLUSInferencePluginInvocationContext *v19;
  uint64_t v20;
  PLUSSchemaPLUSContactGroundTruthGenerated *v21;
  uint64_t v22;
  PLUSSchemaPLUSContactSuggestionGenerated *v23;
  uint64_t v24;
  PLUSSchemaPLUSPhoneCallMetadataExtracted *v25;
  uint64_t v26;
  PLUSSchemaPLUSTMDCGroundTruthGenerated *v27;
  uint64_t v28;
  PLUSSchemaPLUSRECTIFIPatternSequenceGenerated *v29;
  uint64_t v30;
  PLUSSchemaPLUSSendMessageMetadataExtracted *v31;
  uint64_t v32;
  PLUSSchemaPLUSContactSuggestionHeartbeatReported *v33;
  uint64_t v34;
  PLUSSchemaPLUSContactSuggestionRemoved *v35;
  uint64_t v36;
  PLUSSchemaPLUSContactSuggestionAccuracySignalReported *v37;
  uint64_t v38;
  PLUSSchemaPLUSMediaGroundTruthGenerated *v39;
  uint64_t v40;
  PLUSSchemaPLUSMediaEvaluationSummaryReported *v41;
  void *v42;
  PLUSSchemaPLUSSuggesterQueried *v43;
  void *v44;
  PLUSSchemaPLUSSuggesterMetadataReported *v45;
  void *v46;
  PLUSSchemaPLUSSuggesterSuggestionMetadataReported *v47;
  void *v48;
  void *v49;
  PLUSSchemaPLUSSuggesterSuggestionRedundancyReported *v50;
  void *v51;
  PLUSSchemaPLUSSuggestionGenerated *v52;
  void *v53;
  PLUSSchemaPLUSSuggestionOutcomeReported *v54;
  PLUSSchemaPLUSClientEvent *v55;
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
  objc_super v74;

  v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)PLUSSchemaPLUSClientEvent;
  v5 = -[PLUSSchemaPLUSClientEvent init](&v74, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PLUSSchemaPLUSClientEventMetadata initWithDictionary:]([PLUSSchemaPLUSClientEventMetadata alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSuggesterQueryContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PLUSSchemaPLUSContactSuggesterQueryContext initWithDictionary:]([PLUSSchemaPLUSContactSuggesterQueryContext alloc], "initWithDictionary:", v8);
      -[PLUSSchemaPLUSClientEvent setContactSuggesterQueryContext:](v5, "setContactSuggesterQueryContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSuggestionOutcomeReported"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PLUSSchemaPLUSContactSuggestionOutcomeReported initWithDictionary:]([PLUSSchemaPLUSContactSuggestionOutcomeReported alloc], "initWithDictionary:", v10);
      -[PLUSSchemaPLUSClientEvent setContactSuggestionOutcomeReported:](v5, "setContactSuggestionOutcomeReported:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSuggesterRequestMetadataReported"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[PLUSSchemaPLUSContactSuggesterRequestMetadataReported initWithDictionary:]([PLUSSchemaPLUSContactSuggesterRequestMetadataReported alloc], "initWithDictionary:", v12);
      -[PLUSSchemaPLUSClientEvent setContactSuggesterRequestMetadataReported:](v5, "setContactSuggesterRequestMetadataReported:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSuggesterSuggestionMetadataReported"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported initWithDictionary:]([PLUSSchemaPLUSContactSuggesterSuggestionMetadataReported alloc], "initWithDictionary:", v14);
      -[PLUSSchemaPLUSClientEvent setContactSuggesterSuggestionMetadataReported:](v5, "setContactSuggesterSuggestionMetadataReported:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usoGraphTier1"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PLUSSchemaPLUSUSOGraphTier1 initWithDictionary:]([PLUSSchemaPLUSUSOGraphTier1 alloc], "initWithDictionary:", v16);
      -[PLUSSchemaPLUSClientEvent setUsoGraphTier1:](v5, "setUsoGraphTier1:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inferencePluginInvocationContext"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v73 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[PLUSSchemaPLUSInferencePluginInvocationContext initWithDictionary:]([PLUSSchemaPLUSInferencePluginInvocationContext alloc], "initWithDictionary:", v18);
      -[PLUSSchemaPLUSClientEvent setInferencePluginInvocationContext:](v5, "setInferencePluginInvocationContext:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactGroundTruthGenerated"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v72 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PLUSSchemaPLUSContactGroundTruthGenerated initWithDictionary:]([PLUSSchemaPLUSContactGroundTruthGenerated alloc], "initWithDictionary:", v20);
      -[PLUSSchemaPLUSClientEvent setContactGroundTruthGenerated:](v5, "setContactGroundTruthGenerated:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSuggestionGenerated"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[PLUSSchemaPLUSContactSuggestionGenerated initWithDictionary:]([PLUSSchemaPLUSContactSuggestionGenerated alloc], "initWithDictionary:", v22);
      -[PLUSSchemaPLUSClientEvent setContactSuggestionGenerated:](v5, "setContactSuggestionGenerated:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneCallMetadataExtracted"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v70 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[PLUSSchemaPLUSPhoneCallMetadataExtracted initWithDictionary:]([PLUSSchemaPLUSPhoneCallMetadataExtracted alloc], "initWithDictionary:", v24);
      -[PLUSSchemaPLUSClientEvent setPhoneCallMetadataExtracted:](v5, "setPhoneCallMetadataExtracted:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tmdcGroundTruthGenerated"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v69 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[PLUSSchemaPLUSTMDCGroundTruthGenerated initWithDictionary:]([PLUSSchemaPLUSTMDCGroundTruthGenerated alloc], "initWithDictionary:", v26);
      -[PLUSSchemaPLUSClientEvent setTmdcGroundTruthGenerated:](v5, "setTmdcGroundTruthGenerated:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("patternSequenceGenerated"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v68 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[PLUSSchemaPLUSRECTIFIPatternSequenceGenerated initWithDictionary:]([PLUSSchemaPLUSRECTIFIPatternSequenceGenerated alloc], "initWithDictionary:", v28);
      -[PLUSSchemaPLUSClientEvent setPatternSequenceGenerated:](v5, "setPatternSequenceGenerated:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sendMessageMetadataExtracted"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v67 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[PLUSSchemaPLUSSendMessageMetadataExtracted initWithDictionary:]([PLUSSchemaPLUSSendMessageMetadataExtracted alloc], "initWithDictionary:", v30);
      -[PLUSSchemaPLUSClientEvent setSendMessageMetadataExtracted:](v5, "setSendMessageMetadataExtracted:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSuggestionHeartbeatReported"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v66 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[PLUSSchemaPLUSContactSuggestionHeartbeatReported initWithDictionary:]([PLUSSchemaPLUSContactSuggestionHeartbeatReported alloc], "initWithDictionary:", v32);
      -[PLUSSchemaPLUSClientEvent setContactSuggestionHeartbeatReported:](v5, "setContactSuggestionHeartbeatReported:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSuggestionRemoved"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[PLUSSchemaPLUSContactSuggestionRemoved initWithDictionary:]([PLUSSchemaPLUSContactSuggestionRemoved alloc], "initWithDictionary:", v34);
      -[PLUSSchemaPLUSClientEvent setContactSuggestionRemoved:](v5, "setContactSuggestionRemoved:", v35);

    }
    v64 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactSuggestionAccuracySignalReported"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[PLUSSchemaPLUSContactSuggestionAccuracySignalReported initWithDictionary:]([PLUSSchemaPLUSContactSuggestionAccuracySignalReported alloc], "initWithDictionary:", v36);
      -[PLUSSchemaPLUSClientEvent setContactSuggestionAccuracySignalReported:](v5, "setContactSuggestionAccuracySignalReported:", v37);

    }
    v58 = (void *)v36;
    v63 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaGroundTruthGenerated"));
    v38 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[PLUSSchemaPLUSMediaGroundTruthGenerated initWithDictionary:]([PLUSSchemaPLUSMediaGroundTruthGenerated alloc], "initWithDictionary:", v38);
      -[PLUSSchemaPLUSClientEvent setMediaGroundTruthGenerated:](v5, "setMediaGroundTruthGenerated:", v39);

    }
    v62 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaEvaluationSummaryReported"));
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[PLUSSchemaPLUSMediaEvaluationSummaryReported initWithDictionary:]([PLUSSchemaPLUSMediaEvaluationSummaryReported alloc], "initWithDictionary:", v40);
      -[PLUSSchemaPLUSClientEvent setMediaEvaluationSummaryReported:](v5, "setMediaEvaluationSummaryReported:", v41);

    }
    v61 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plusSuggesterQueried"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[PLUSSchemaPLUSSuggesterQueried initWithDictionary:]([PLUSSchemaPLUSSuggesterQueried alloc], "initWithDictionary:", v42);
      -[PLUSSchemaPLUSClientEvent setPlusSuggesterQueried:](v5, "setPlusSuggesterQueried:", v43);

    }
    v60 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plusSuggesterMetadataReported"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[PLUSSchemaPLUSSuggesterMetadataReported initWithDictionary:]([PLUSSchemaPLUSSuggesterMetadataReported alloc], "initWithDictionary:", v44);
      -[PLUSSchemaPLUSClientEvent setPlusSuggesterMetadataReported:](v5, "setPlusSuggesterMetadataReported:", v45);

    }
    v59 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plusSuggesterSuggestionMetadataReported"), v40);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[PLUSSchemaPLUSSuggesterSuggestionMetadataReported initWithDictionary:]([PLUSSchemaPLUSSuggesterSuggestionMetadataReported alloc], "initWithDictionary:", v46);
      -[PLUSSchemaPLUSClientEvent setPlusSuggesterSuggestionMetadataReported:](v5, "setPlusSuggesterSuggestionMetadataReported:", v47);

    }
    v48 = (void *)v38;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plusSuggesterSuggestionRedundancyReported"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50 = -[PLUSSchemaPLUSSuggesterSuggestionRedundancyReported initWithDictionary:]([PLUSSchemaPLUSSuggesterSuggestionRedundancyReported alloc], "initWithDictionary:", v49);
      -[PLUSSchemaPLUSClientEvent setPlusSuggesterSuggestionRedundancyReported:](v5, "setPlusSuggesterSuggestionRedundancyReported:", v50);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionGenerated"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = -[PLUSSchemaPLUSSuggestionGenerated initWithDictionary:]([PLUSSchemaPLUSSuggestionGenerated alloc], "initWithDictionary:", v51);
      -[PLUSSchemaPLUSClientEvent setSuggestionGenerated:](v5, "setSuggestionGenerated:", v52);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionOutcomeReported"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = -[PLUSSchemaPLUSSuggestionOutcomeReported initWithDictionary:]([PLUSSchemaPLUSSuggestionOutcomeReported alloc], "initWithDictionary:", v53);
      -[PLUSSchemaPLUSClientEvent setSuggestionOutcomeReported:](v5, "setSuggestionOutcomeReported:", v54);

    }
    v55 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PLUSSchemaPLUSClientEventMetadata)eventMetadata
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

- (BOOL)hasContactSuggesterQueryContext
{
  return self->_hasContactSuggesterQueryContext;
}

- (void)setHasContactSuggesterQueryContext:(BOOL)a3
{
  self->_hasContactSuggesterQueryContext = a3;
}

- (BOOL)hasContactSuggestionOutcomeReported
{
  return self->_hasContactSuggestionOutcomeReported;
}

- (void)setHasContactSuggestionOutcomeReported:(BOOL)a3
{
  self->_hasContactSuggestionOutcomeReported = a3;
}

- (BOOL)hasContactSuggesterRequestMetadataReported
{
  return self->_hasContactSuggesterRequestMetadataReported;
}

- (void)setHasContactSuggesterRequestMetadataReported:(BOOL)a3
{
  self->_hasContactSuggesterRequestMetadataReported = a3;
}

- (BOOL)hasContactSuggesterSuggestionMetadataReported
{
  return self->_hasContactSuggesterSuggestionMetadataReported;
}

- (void)setHasContactSuggesterSuggestionMetadataReported:(BOOL)a3
{
  self->_hasContactSuggesterSuggestionMetadataReported = a3;
}

- (BOOL)hasUsoGraphTier1
{
  return self->_hasUsoGraphTier1;
}

- (void)setHasUsoGraphTier1:(BOOL)a3
{
  self->_hasUsoGraphTier1 = a3;
}

- (BOOL)hasInferencePluginInvocationContext
{
  return self->_hasInferencePluginInvocationContext;
}

- (void)setHasInferencePluginInvocationContext:(BOOL)a3
{
  self->_hasInferencePluginInvocationContext = a3;
}

- (BOOL)hasContactGroundTruthGenerated
{
  return self->_hasContactGroundTruthGenerated;
}

- (void)setHasContactGroundTruthGenerated:(BOOL)a3
{
  self->_hasContactGroundTruthGenerated = a3;
}

- (BOOL)hasContactSuggestionGenerated
{
  return self->_hasContactSuggestionGenerated;
}

- (void)setHasContactSuggestionGenerated:(BOOL)a3
{
  self->_hasContactSuggestionGenerated = a3;
}

- (BOOL)hasPhoneCallMetadataExtracted
{
  return self->_hasPhoneCallMetadataExtracted;
}

- (void)setHasPhoneCallMetadataExtracted:(BOOL)a3
{
  self->_hasPhoneCallMetadataExtracted = a3;
}

- (BOOL)hasTmdcGroundTruthGenerated
{
  return self->_hasTmdcGroundTruthGenerated;
}

- (void)setHasTmdcGroundTruthGenerated:(BOOL)a3
{
  self->_hasTmdcGroundTruthGenerated = a3;
}

- (BOOL)hasPatternSequenceGenerated
{
  return self->_hasPatternSequenceGenerated;
}

- (void)setHasPatternSequenceGenerated:(BOOL)a3
{
  self->_hasPatternSequenceGenerated = a3;
}

- (BOOL)hasSendMessageMetadataExtracted
{
  return self->_hasSendMessageMetadataExtracted;
}

- (void)setHasSendMessageMetadataExtracted:(BOOL)a3
{
  self->_hasSendMessageMetadataExtracted = a3;
}

- (BOOL)hasContactSuggestionHeartbeatReported
{
  return self->_hasContactSuggestionHeartbeatReported;
}

- (void)setHasContactSuggestionHeartbeatReported:(BOOL)a3
{
  self->_hasContactSuggestionHeartbeatReported = a3;
}

- (BOOL)hasContactSuggestionRemoved
{
  return self->_hasContactSuggestionRemoved;
}

- (void)setHasContactSuggestionRemoved:(BOOL)a3
{
  self->_hasContactSuggestionRemoved = a3;
}

- (BOOL)hasContactSuggestionAccuracySignalReported
{
  return self->_hasContactSuggestionAccuracySignalReported;
}

- (void)setHasContactSuggestionAccuracySignalReported:(BOOL)a3
{
  self->_hasContactSuggestionAccuracySignalReported = a3;
}

- (BOOL)hasMediaGroundTruthGenerated
{
  return self->_hasMediaGroundTruthGenerated;
}

- (void)setHasMediaGroundTruthGenerated:(BOOL)a3
{
  self->_hasMediaGroundTruthGenerated = a3;
}

- (BOOL)hasMediaEvaluationSummaryReported
{
  return self->_hasMediaEvaluationSummaryReported;
}

- (void)setHasMediaEvaluationSummaryReported:(BOOL)a3
{
  self->_hasMediaEvaluationSummaryReported = a3;
}

- (BOOL)hasPlusSuggesterQueried
{
  return self->_hasPlusSuggesterQueried;
}

- (void)setHasPlusSuggesterQueried:(BOOL)a3
{
  self->_hasPlusSuggesterQueried = a3;
}

- (BOOL)hasPlusSuggesterMetadataReported
{
  return self->_hasPlusSuggesterMetadataReported;
}

- (void)setHasPlusSuggesterMetadataReported:(BOOL)a3
{
  self->_hasPlusSuggesterMetadataReported = a3;
}

- (BOOL)hasPlusSuggesterSuggestionMetadataReported
{
  return self->_hasPlusSuggesterSuggestionMetadataReported;
}

- (void)setHasPlusSuggesterSuggestionMetadataReported:(BOOL)a3
{
  self->_hasPlusSuggesterSuggestionMetadataReported = a3;
}

- (BOOL)hasPlusSuggesterSuggestionRedundancyReported
{
  return self->_hasPlusSuggesterSuggestionRedundancyReported;
}

- (void)setHasPlusSuggesterSuggestionRedundancyReported:(BOOL)a3
{
  self->_hasPlusSuggesterSuggestionRedundancyReported = a3;
}

- (BOOL)hasSuggestionGenerated
{
  return self->_hasSuggestionGenerated;
}

- (void)setHasSuggestionGenerated:(BOOL)a3
{
  self->_hasSuggestionGenerated = a3;
}

- (BOOL)hasSuggestionOutcomeReported
{
  return self->_hasSuggestionOutcomeReported;
}

- (void)setHasSuggestionOutcomeReported:(BOOL)a3
{
  self->_hasSuggestionOutcomeReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionOutcomeReported, 0);
  objc_storeStrong((id *)&self->_suggestionGenerated, 0);
  objc_storeStrong((id *)&self->_plusSuggesterSuggestionRedundancyReported, 0);
  objc_storeStrong((id *)&self->_plusSuggesterSuggestionMetadataReported, 0);
  objc_storeStrong((id *)&self->_plusSuggesterMetadataReported, 0);
  objc_storeStrong((id *)&self->_plusSuggesterQueried, 0);
  objc_storeStrong((id *)&self->_mediaEvaluationSummaryReported, 0);
  objc_storeStrong((id *)&self->_mediaGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_contactSuggestionAccuracySignalReported, 0);
  objc_storeStrong((id *)&self->_contactSuggestionRemoved, 0);
  objc_storeStrong((id *)&self->_contactSuggestionHeartbeatReported, 0);
  objc_storeStrong((id *)&self->_sendMessageMetadataExtracted, 0);
  objc_storeStrong((id *)&self->_patternSequenceGenerated, 0);
  objc_storeStrong((id *)&self->_tmdcGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_phoneCallMetadataExtracted, 0);
  objc_storeStrong((id *)&self->_contactSuggestionGenerated, 0);
  objc_storeStrong((id *)&self->_contactGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_inferencePluginInvocationContext, 0);
  objc_storeStrong((id *)&self->_usoGraphTier1, 0);
  objc_storeStrong((id *)&self->_contactSuggesterSuggestionMetadataReported, 0);
  objc_storeStrong((id *)&self->_contactSuggesterRequestMetadataReported, 0);
  objc_storeStrong((id *)&self->_contactSuggestionOutcomeReported, 0);
  objc_storeStrong((id *)&self->_contactSuggesterQueryContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 38;
}

@end
