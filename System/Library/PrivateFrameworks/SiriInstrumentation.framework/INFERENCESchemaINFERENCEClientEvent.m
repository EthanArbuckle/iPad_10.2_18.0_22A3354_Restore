@implementation INFERENCESchemaINFERENCEClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[INFERENCESchemaINFERENCEClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inferenceId");
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

  -[INFERENCESchemaINFERENCEClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inferenceId");
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
        LODWORD(v4) = 27;
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
  objc_super v61;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)INFERENCESchemaINFERENCEClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v61, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCEClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[INFERENCESchemaINFERENCEClientEvent musicAppSelectionGroundTruthGenerated](self, "musicAppSelectionGroundTruthGenerated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCEClientEvent deleteMusicAppSelectionGroundTruthGenerated](self, "deleteMusicAppSelectionGroundTruthGenerated");
  -[INFERENCESchemaINFERENCEClientEvent videoPlayOnThirdPartyAppGroundTruthGenerated](self, "videoPlayOnThirdPartyAppGroundTruthGenerated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[INFERENCESchemaINFERENCEClientEvent deleteVideoPlayOnThirdPartyAppGroundTruthGenerated](self, "deleteVideoPlayOnThirdPartyAppGroundTruthGenerated");
  -[INFERENCESchemaINFERENCEClientEvent videoSmartAppSelectionDisambiguation](self, "videoSmartAppSelectionDisambiguation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[INFERENCESchemaINFERENCEClientEvent deleteVideoSmartAppSelectionDisambiguation](self, "deleteVideoSmartAppSelectionDisambiguation");
  -[INFERENCESchemaINFERENCEClientEvent resolutionRequestContext](self, "resolutionRequestContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[INFERENCESchemaINFERENCEClientEvent deleteResolutionRequestContext](self, "deleteResolutionRequestContext");
  -[INFERENCESchemaINFERENCEClientEvent simpleTaskInfoGenerated](self, "simpleTaskInfoGenerated");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[INFERENCESchemaINFERENCEClientEvent deleteSimpleTaskInfoGenerated](self, "deleteSimpleTaskInfoGenerated");
  -[INFERENCESchemaINFERENCEClientEvent resolutionQueryInfoGenerated](self, "resolutionQueryInfoGenerated");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[INFERENCESchemaINFERENCEClientEvent deleteResolutionQueryInfoGenerated](self, "deleteResolutionQueryInfoGenerated");
  -[INFERENCESchemaINFERENCEClientEvent userPromptSelectedInfoGenerated](self, "userPromptSelectedInfoGenerated");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[INFERENCESchemaINFERENCEClientEvent deleteUserPromptSelectedInfoGenerated](self, "deleteUserPromptSelectedInfoGenerated");
  -[INFERENCESchemaINFERENCEClientEvent contactCandidatesInfoGenerated](self, "contactCandidatesInfoGenerated");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[INFERENCESchemaINFERENCEClientEvent deleteContactCandidatesInfoGenerated](self, "deleteContactCandidatesInfoGenerated");
  -[INFERENCESchemaINFERENCEClientEvent crrTrainingSampleCollected](self, "crrTrainingSampleCollected");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[INFERENCESchemaINFERENCEClientEvent deleteCrrTrainingSampleCollected](self, "deleteCrrTrainingSampleCollected");
  -[INFERENCESchemaINFERENCEClientEvent abModelEvaluated](self, "abModelEvaluated");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[INFERENCESchemaINFERENCEClientEvent deleteAbModelEvaluated](self, "deleteAbModelEvaluated");
  -[INFERENCESchemaINFERENCEClientEvent abModelResultTriggered](self, "abModelResultTriggered");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[INFERENCESchemaINFERENCEClientEvent deleteAbModelResultTriggered](self, "deleteAbModelResultTriggered");
  -[INFERENCESchemaINFERENCEClientEvent workoutsAppSelectionGroundTruthGenerated](self, "workoutsAppSelectionGroundTruthGenerated");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[INFERENCESchemaINFERENCEClientEvent deleteWorkoutsAppSelectionGroundTruthGenerated](self, "deleteWorkoutsAppSelectionGroundTruthGenerated");
  -[INFERENCESchemaINFERENCEClientEvent notebookAppSelectionGroundTruthGenerated](self, "notebookAppSelectionGroundTruthGenerated");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[INFERENCESchemaINFERENCEClientEvent deleteNotebookAppSelectionGroundTruthGenerated](self, "deleteNotebookAppSelectionGroundTruthGenerated");
  -[INFERENCESchemaINFERENCEClientEvent commsAppSelectionGroundTruthGenerated](self, "commsAppSelectionGroundTruthGenerated");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[INFERENCESchemaINFERENCEClientEvent deleteCommsAppSelectionGroundTruthGenerated](self, "deleteCommsAppSelectionGroundTruthGenerated");
  -[INFERENCESchemaINFERENCEClientEvent pervasiveEntityResolutionGroundTruthGenerated](self, "pervasiveEntityResolutionGroundTruthGenerated");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[INFERENCESchemaINFERENCEClientEvent deletePervasiveEntityResolutionGroundTruthGenerated](self, "deletePervasiveEntityResolutionGroundTruthGenerated");
  -[INFERENCESchemaINFERENCEClientEvent seasExecutionPathReported](self, "seasExecutionPathReported");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[INFERENCESchemaINFERENCEClientEvent deleteSeasExecutionPathReported](self, "deleteSeasExecutionPathReported");
  -[INFERENCESchemaINFERENCEClientEvent asrEuclidEmbedding](self, "asrEuclidEmbedding");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applySensitiveConditionsPolicy:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "suppressMessage");

  if (v59)
    -[INFERENCESchemaINFERENCEClientEvent deleteAsrEuclidEmbedding](self, "deleteAsrEuclidEmbedding");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[INFERENCESchemaINFERENCEClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 0x10)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E56298F8[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0x10)
    return 0;
  else
    return off_1E5629980[a3 - 101];
}

- (int)clockIsolationLevel
{
  unint64_t v2;

  v2 = -[INFERENCESchemaINFERENCEClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 0xE)
    return 1;
  else
    return dword_1AA65D1B8[v2 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[INFERENCESchemaINFERENCEClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 0x10)
    return CFSTR("com.apple.aiml.siri.inference.INFERENCEClientEvent");
  else
    return off_1E562FB00[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[INFERENCESchemaINFERENCEClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setMusicAppSelectionGroundTruthGenerated:(id)a3
{
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *v4;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;

  v4 = (INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)a3;
  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 101;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = v4;

}

- (INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated)musicAppSelectionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 101)
    return self->_musicAppSelectionGroundTruthGenerated;
  else
    return (INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *)0;
}

- (void)deleteMusicAppSelectionGroundTruthGenerated
{
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
    self->_musicAppSelectionGroundTruthGenerated = 0;

  }
}

- (void)setVideoPlayOnThirdPartyAppGroundTruthGenerated:(id)a3
{
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;

  v4 = (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 102;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = v4;

}

- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated)videoPlayOnThirdPartyAppGroundTruthGenerated
{
  if (self->_whichEvent_Type == 102)
    return self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  else
    return (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *)0;
}

- (void)deleteVideoPlayOnThirdPartyAppGroundTruthGenerated
{
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
    self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  }
}

- (void)setVideoSmartAppSelectionDisambiguation:(id)a3
{
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;

  v4 = (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 103;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = v4;

}

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated)videoSmartAppSelectionDisambiguation
{
  if (self->_whichEvent_Type == 103)
    return self->_videoSmartAppSelectionDisambiguation;
  else
    return (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *)0;
}

- (void)deleteVideoSmartAppSelectionDisambiguation
{
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
    self->_videoSmartAppSelectionDisambiguation = 0;

  }
}

- (void)setResolutionRequestContext:(id)a3
{
  INFERENCESchemaINFERENCEResolutionRequestContext *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;

  v4 = (INFERENCESchemaINFERENCEResolutionRequestContext *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 104;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = v4;

}

- (INFERENCESchemaINFERENCEResolutionRequestContext)resolutionRequestContext
{
  if (self->_whichEvent_Type == 104)
    return self->_resolutionRequestContext;
  else
    return (INFERENCESchemaINFERENCEResolutionRequestContext *)0;
}

- (void)deleteResolutionRequestContext
{
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    resolutionRequestContext = self->_resolutionRequestContext;
    self->_resolutionRequestContext = 0;

  }
}

- (void)setSimpleTaskInfoGenerated:(id)a3
{
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;

  v4 = (INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 105;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = v4;

}

- (INFERENCESchemaINFERENCESimpleTaskInfoGenerated)simpleTaskInfoGenerated
{
  if (self->_whichEvent_Type == 105)
    return self->_simpleTaskInfoGenerated;
  else
    return (INFERENCESchemaINFERENCESimpleTaskInfoGenerated *)0;
}

- (void)deleteSimpleTaskInfoGenerated
{
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
    self->_simpleTaskInfoGenerated = 0;

  }
}

- (void)setResolutionQueryInfoGenerated:(id)a3
{
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;

  v4 = (INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 106;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = v4;

}

- (INFERENCESchemaINFERENCEResolutionQueryInfoGenerated)resolutionQueryInfoGenerated
{
  if (self->_whichEvent_Type == 106)
    return self->_resolutionQueryInfoGenerated;
  else
    return (INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *)0;
}

- (void)deleteResolutionQueryInfoGenerated
{
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
    self->_resolutionQueryInfoGenerated = 0;

  }
}

- (void)setUserPromptSelectedInfoGenerated:(id)a3
{
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;

  v4 = (INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 107;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = v4;

}

- (INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated)userPromptSelectedInfoGenerated
{
  if (self->_whichEvent_Type == 107)
    return self->_userPromptSelectedInfoGenerated;
  else
    return (INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *)0;
}

- (void)deleteUserPromptSelectedInfoGenerated
{
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
    self->_userPromptSelectedInfoGenerated = 0;

  }
}

- (void)setContactCandidatesInfoGenerated:(id)a3
{
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;

  v4 = (INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 108;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = v4;

}

- (INFERENCESchemaINFERENCEContactCandidatesInfoGenerated)contactCandidatesInfoGenerated
{
  if (self->_whichEvent_Type == 108)
    return self->_contactCandidatesInfoGenerated;
  else
    return (INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *)0;
}

- (void)deleteContactCandidatesInfoGenerated
{
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
    self->_contactCandidatesInfoGenerated = 0;

  }
}

- (void)setCrrTrainingSampleCollected:(id)a3
{
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;

  v4 = (INFERENCESchemaINFERENCECRRTrainingSampleCollected *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 109;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = v4;

}

- (INFERENCESchemaINFERENCECRRTrainingSampleCollected)crrTrainingSampleCollected
{
  if (self->_whichEvent_Type == 109)
    return self->_crrTrainingSampleCollected;
  else
    return (INFERENCESchemaINFERENCECRRTrainingSampleCollected *)0;
}

- (void)deleteCrrTrainingSampleCollected
{
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
    self->_crrTrainingSampleCollected = 0;

  }
}

- (void)setAbModelEvaluated:(id)a3
{
  INFERENCESchemaINFERENCEABModelEvaluated *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;

  v4 = (INFERENCESchemaINFERENCEABModelEvaluated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 110;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = v4;

}

- (INFERENCESchemaINFERENCEABModelEvaluated)abModelEvaluated
{
  if (self->_whichEvent_Type == 110)
    return self->_abModelEvaluated;
  else
    return (INFERENCESchemaINFERENCEABModelEvaluated *)0;
}

- (void)deleteAbModelEvaluated
{
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;

  if (self->_whichEvent_Type == 110)
  {
    self->_whichEvent_Type = 0;
    abModelEvaluated = self->_abModelEvaluated;
    self->_abModelEvaluated = 0;

  }
}

- (void)setAbModelResultTriggered:(id)a3
{
  INFERENCESchemaINFERENCEABModelResultTriggered *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;

  v4 = (INFERENCESchemaINFERENCEABModelResultTriggered *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 111;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = v4;

}

- (INFERENCESchemaINFERENCEABModelResultTriggered)abModelResultTriggered
{
  if (self->_whichEvent_Type == 111)
    return self->_abModelResultTriggered;
  else
    return (INFERENCESchemaINFERENCEABModelResultTriggered *)0;
}

- (void)deleteAbModelResultTriggered
{
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;

  if (self->_whichEvent_Type == 111)
  {
    self->_whichEvent_Type = 0;
    abModelResultTriggered = self->_abModelResultTriggered;
    self->_abModelResultTriggered = 0;

  }
}

- (void)setWorkoutsAppSelectionGroundTruthGenerated:(id)a3
{
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;

  v4 = (INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 112;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = v4;

}

- (INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated)workoutsAppSelectionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 112)
    return self->_workoutsAppSelectionGroundTruthGenerated;
  else
    return (INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *)0;
}

- (void)deleteWorkoutsAppSelectionGroundTruthGenerated
{
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;

  if (self->_whichEvent_Type == 112)
  {
    self->_whichEvent_Type = 0;
    workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
    self->_workoutsAppSelectionGroundTruthGenerated = 0;

  }
}

- (void)setNotebookAppSelectionGroundTruthGenerated:(id)a3
{
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;

  v4 = (INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 113;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = v4;

}

- (INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated)notebookAppSelectionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 113)
    return self->_notebookAppSelectionGroundTruthGenerated;
  else
    return (INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *)0;
}

- (void)deleteNotebookAppSelectionGroundTruthGenerated
{
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;

  if (self->_whichEvent_Type == 113)
  {
    self->_whichEvent_Type = 0;
    notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
    self->_notebookAppSelectionGroundTruthGenerated = 0;

  }
}

- (void)setCommsAppSelectionGroundTruthGenerated:(id)a3
{
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;

  v4 = (INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 114;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = v4;

}

- (INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated)commsAppSelectionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 114)
    return self->_commsAppSelectionGroundTruthGenerated;
  else
    return (INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *)0;
}

- (void)deleteCommsAppSelectionGroundTruthGenerated
{
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;

  if (self->_whichEvent_Type == 114)
  {
    self->_whichEvent_Type = 0;
    commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
    self->_commsAppSelectionGroundTruthGenerated = 0;

  }
}

- (void)setPervasiveEntityResolutionGroundTruthGenerated:(id)a3
{
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;

  v4 = (INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 115;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = v4;

}

- (INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated)pervasiveEntityResolutionGroundTruthGenerated
{
  if (self->_whichEvent_Type == 115)
    return self->_pervasiveEntityResolutionGroundTruthGenerated;
  else
    return (INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *)0;
}

- (void)deletePervasiveEntityResolutionGroundTruthGenerated
{
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;

  if (self->_whichEvent_Type == 115)
  {
    self->_whichEvent_Type = 0;
    pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
    self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  }
}

- (void)setSeasExecutionPathReported:(id)a3
{
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;
  unint64_t v21;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;

  v4 = (INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = 0;

  v21 = 116;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = v4;

}

- (INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported)seasExecutionPathReported
{
  if (self->_whichEvent_Type == 116)
    return self->_seasExecutionPathReported;
  else
    return (INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *)0;
}

- (void)deleteSeasExecutionPathReported
{
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;

  if (self->_whichEvent_Type == 116)
  {
    self->_whichEvent_Type = 0;
    seasExecutionPathReported = self->_seasExecutionPathReported;
    self->_seasExecutionPathReported = 0;

  }
}

- (void)setAsrEuclidEmbedding:(id)a3
{
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *v4;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *musicAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *videoPlayOnThirdPartyAppGroundTruthGenerated;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *videoSmartAppSelectionDisambiguation;
  INFERENCESchemaINFERENCEResolutionRequestContext *resolutionRequestContext;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *simpleTaskInfoGenerated;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *resolutionQueryInfoGenerated;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *userPromptSelectedInfoGenerated;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *contactCandidatesInfoGenerated;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *crrTrainingSampleCollected;
  INFERENCESchemaINFERENCEABModelEvaluated *abModelEvaluated;
  INFERENCESchemaINFERENCEABModelResultTriggered *abModelResultTriggered;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *workoutsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *notebookAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *commsAppSelectionGroundTruthGenerated;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *pervasiveEntityResolutionGroundTruthGenerated;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *seasExecutionPathReported;
  unint64_t v21;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;

  v4 = (INFERENCESchemaINFERENCEAsrEuclidEmbedding *)a3;
  musicAppSelectionGroundTruthGenerated = self->_musicAppSelectionGroundTruthGenerated;
  self->_musicAppSelectionGroundTruthGenerated = 0;

  videoPlayOnThirdPartyAppGroundTruthGenerated = self->_videoPlayOnThirdPartyAppGroundTruthGenerated;
  self->_videoPlayOnThirdPartyAppGroundTruthGenerated = 0;

  videoSmartAppSelectionDisambiguation = self->_videoSmartAppSelectionDisambiguation;
  self->_videoSmartAppSelectionDisambiguation = 0;

  resolutionRequestContext = self->_resolutionRequestContext;
  self->_resolutionRequestContext = 0;

  simpleTaskInfoGenerated = self->_simpleTaskInfoGenerated;
  self->_simpleTaskInfoGenerated = 0;

  resolutionQueryInfoGenerated = self->_resolutionQueryInfoGenerated;
  self->_resolutionQueryInfoGenerated = 0;

  userPromptSelectedInfoGenerated = self->_userPromptSelectedInfoGenerated;
  self->_userPromptSelectedInfoGenerated = 0;

  contactCandidatesInfoGenerated = self->_contactCandidatesInfoGenerated;
  self->_contactCandidatesInfoGenerated = 0;

  crrTrainingSampleCollected = self->_crrTrainingSampleCollected;
  self->_crrTrainingSampleCollected = 0;

  abModelEvaluated = self->_abModelEvaluated;
  self->_abModelEvaluated = 0;

  abModelResultTriggered = self->_abModelResultTriggered;
  self->_abModelResultTriggered = 0;

  workoutsAppSelectionGroundTruthGenerated = self->_workoutsAppSelectionGroundTruthGenerated;
  self->_workoutsAppSelectionGroundTruthGenerated = 0;

  notebookAppSelectionGroundTruthGenerated = self->_notebookAppSelectionGroundTruthGenerated;
  self->_notebookAppSelectionGroundTruthGenerated = 0;

  commsAppSelectionGroundTruthGenerated = self->_commsAppSelectionGroundTruthGenerated;
  self->_commsAppSelectionGroundTruthGenerated = 0;

  pervasiveEntityResolutionGroundTruthGenerated = self->_pervasiveEntityResolutionGroundTruthGenerated;
  self->_pervasiveEntityResolutionGroundTruthGenerated = 0;

  seasExecutionPathReported = self->_seasExecutionPathReported;
  self->_seasExecutionPathReported = 0;

  v21 = 117;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  asrEuclidEmbedding = self->_asrEuclidEmbedding;
  self->_asrEuclidEmbedding = v4;

}

- (INFERENCESchemaINFERENCEAsrEuclidEmbedding)asrEuclidEmbedding
{
  if (self->_whichEvent_Type == 117)
    return self->_asrEuclidEmbedding;
  else
    return (INFERENCESchemaINFERENCEAsrEuclidEmbedding *)0;
}

- (void)deleteAsrEuclidEmbedding
{
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *asrEuclidEmbedding;

  if (self->_whichEvent_Type == 117)
  {
    self->_whichEvent_Type = 0;
    asrEuclidEmbedding = self->_asrEuclidEmbedding;
    self->_asrEuclidEmbedding = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEClientEventReadFrom(self, (uint64_t)a3);
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
  id v40;

  v40 = a3;
  -[INFERENCESchemaINFERENCEClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INFERENCESchemaINFERENCEClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent musicAppSelectionGroundTruthGenerated](self, "musicAppSelectionGroundTruthGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INFERENCESchemaINFERENCEClientEvent musicAppSelectionGroundTruthGenerated](self, "musicAppSelectionGroundTruthGenerated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent videoPlayOnThirdPartyAppGroundTruthGenerated](self, "videoPlayOnThirdPartyAppGroundTruthGenerated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[INFERENCESchemaINFERENCEClientEvent videoPlayOnThirdPartyAppGroundTruthGenerated](self, "videoPlayOnThirdPartyAppGroundTruthGenerated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent videoSmartAppSelectionDisambiguation](self, "videoSmartAppSelectionDisambiguation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[INFERENCESchemaINFERENCEClientEvent videoSmartAppSelectionDisambiguation](self, "videoSmartAppSelectionDisambiguation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent resolutionRequestContext](self, "resolutionRequestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[INFERENCESchemaINFERENCEClientEvent resolutionRequestContext](self, "resolutionRequestContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent simpleTaskInfoGenerated](self, "simpleTaskInfoGenerated");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[INFERENCESchemaINFERENCEClientEvent simpleTaskInfoGenerated](self, "simpleTaskInfoGenerated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent resolutionQueryInfoGenerated](self, "resolutionQueryInfoGenerated");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[INFERENCESchemaINFERENCEClientEvent resolutionQueryInfoGenerated](self, "resolutionQueryInfoGenerated");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent userPromptSelectedInfoGenerated](self, "userPromptSelectedInfoGenerated");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[INFERENCESchemaINFERENCEClientEvent userPromptSelectedInfoGenerated](self, "userPromptSelectedInfoGenerated");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent contactCandidatesInfoGenerated](self, "contactCandidatesInfoGenerated");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[INFERENCESchemaINFERENCEClientEvent contactCandidatesInfoGenerated](self, "contactCandidatesInfoGenerated");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent crrTrainingSampleCollected](self, "crrTrainingSampleCollected");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[INFERENCESchemaINFERENCEClientEvent crrTrainingSampleCollected](self, "crrTrainingSampleCollected");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent abModelEvaluated](self, "abModelEvaluated");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[INFERENCESchemaINFERENCEClientEvent abModelEvaluated](self, "abModelEvaluated");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent abModelResultTriggered](self, "abModelResultTriggered");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[INFERENCESchemaINFERENCEClientEvent abModelResultTriggered](self, "abModelResultTriggered");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent workoutsAppSelectionGroundTruthGenerated](self, "workoutsAppSelectionGroundTruthGenerated");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[INFERENCESchemaINFERENCEClientEvent workoutsAppSelectionGroundTruthGenerated](self, "workoutsAppSelectionGroundTruthGenerated");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent notebookAppSelectionGroundTruthGenerated](self, "notebookAppSelectionGroundTruthGenerated");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[INFERENCESchemaINFERENCEClientEvent notebookAppSelectionGroundTruthGenerated](self, "notebookAppSelectionGroundTruthGenerated");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent commsAppSelectionGroundTruthGenerated](self, "commsAppSelectionGroundTruthGenerated");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[INFERENCESchemaINFERENCEClientEvent commsAppSelectionGroundTruthGenerated](self, "commsAppSelectionGroundTruthGenerated");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent pervasiveEntityResolutionGroundTruthGenerated](self, "pervasiveEntityResolutionGroundTruthGenerated");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[INFERENCESchemaINFERENCEClientEvent pervasiveEntityResolutionGroundTruthGenerated](self, "pervasiveEntityResolutionGroundTruthGenerated");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent seasExecutionPathReported](self, "seasExecutionPathReported");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[INFERENCESchemaINFERENCEClientEvent seasExecutionPathReported](self, "seasExecutionPathReported");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEClientEvent asrEuclidEmbedding](self, "asrEuclidEmbedding");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[INFERENCESchemaINFERENCEClientEvent asrEuclidEmbedding](self, "asrEuclidEmbedding");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v97;
  BOOL v98;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_93;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_93;
  -[INFERENCESchemaINFERENCEClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[INFERENCESchemaINFERENCEClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent musicAppSelectionGroundTruthGenerated](self, "musicAppSelectionGroundTruthGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "musicAppSelectionGroundTruthGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent musicAppSelectionGroundTruthGenerated](self, "musicAppSelectionGroundTruthGenerated");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[INFERENCESchemaINFERENCEClientEvent musicAppSelectionGroundTruthGenerated](self, "musicAppSelectionGroundTruthGenerated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "musicAppSelectionGroundTruthGenerated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent videoPlayOnThirdPartyAppGroundTruthGenerated](self, "videoPlayOnThirdPartyAppGroundTruthGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoPlayOnThirdPartyAppGroundTruthGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent videoPlayOnThirdPartyAppGroundTruthGenerated](self, "videoPlayOnThirdPartyAppGroundTruthGenerated");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[INFERENCESchemaINFERENCEClientEvent videoPlayOnThirdPartyAppGroundTruthGenerated](self, "videoPlayOnThirdPartyAppGroundTruthGenerated");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoPlayOnThirdPartyAppGroundTruthGenerated");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent videoSmartAppSelectionDisambiguation](self, "videoSmartAppSelectionDisambiguation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoSmartAppSelectionDisambiguation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent videoSmartAppSelectionDisambiguation](self, "videoSmartAppSelectionDisambiguation");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[INFERENCESchemaINFERENCEClientEvent videoSmartAppSelectionDisambiguation](self, "videoSmartAppSelectionDisambiguation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoSmartAppSelectionDisambiguation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent resolutionRequestContext](self, "resolutionRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolutionRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent resolutionRequestContext](self, "resolutionRequestContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[INFERENCESchemaINFERENCEClientEvent resolutionRequestContext](self, "resolutionRequestContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolutionRequestContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent simpleTaskInfoGenerated](self, "simpleTaskInfoGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "simpleTaskInfoGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent simpleTaskInfoGenerated](self, "simpleTaskInfoGenerated");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[INFERENCESchemaINFERENCEClientEvent simpleTaskInfoGenerated](self, "simpleTaskInfoGenerated");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "simpleTaskInfoGenerated");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent resolutionQueryInfoGenerated](self, "resolutionQueryInfoGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolutionQueryInfoGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent resolutionQueryInfoGenerated](self, "resolutionQueryInfoGenerated");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[INFERENCESchemaINFERENCEClientEvent resolutionQueryInfoGenerated](self, "resolutionQueryInfoGenerated");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolutionQueryInfoGenerated");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent userPromptSelectedInfoGenerated](self, "userPromptSelectedInfoGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userPromptSelectedInfoGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent userPromptSelectedInfoGenerated](self, "userPromptSelectedInfoGenerated");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[INFERENCESchemaINFERENCEClientEvent userPromptSelectedInfoGenerated](self, "userPromptSelectedInfoGenerated");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userPromptSelectedInfoGenerated");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent contactCandidatesInfoGenerated](self, "contactCandidatesInfoGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactCandidatesInfoGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent contactCandidatesInfoGenerated](self, "contactCandidatesInfoGenerated");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[INFERENCESchemaINFERENCEClientEvent contactCandidatesInfoGenerated](self, "contactCandidatesInfoGenerated");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactCandidatesInfoGenerated");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent crrTrainingSampleCollected](self, "crrTrainingSampleCollected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crrTrainingSampleCollected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent crrTrainingSampleCollected](self, "crrTrainingSampleCollected");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[INFERENCESchemaINFERENCEClientEvent crrTrainingSampleCollected](self, "crrTrainingSampleCollected");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "crrTrainingSampleCollected");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent abModelEvaluated](self, "abModelEvaluated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "abModelEvaluated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent abModelEvaluated](self, "abModelEvaluated");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[INFERENCESchemaINFERENCEClientEvent abModelEvaluated](self, "abModelEvaluated");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "abModelEvaluated");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent abModelResultTriggered](self, "abModelResultTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "abModelResultTriggered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent abModelResultTriggered](self, "abModelResultTriggered");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[INFERENCESchemaINFERENCEClientEvent abModelResultTriggered](self, "abModelResultTriggered");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "abModelResultTriggered");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent workoutsAppSelectionGroundTruthGenerated](self, "workoutsAppSelectionGroundTruthGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workoutsAppSelectionGroundTruthGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent workoutsAppSelectionGroundTruthGenerated](self, "workoutsAppSelectionGroundTruthGenerated");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[INFERENCESchemaINFERENCEClientEvent workoutsAppSelectionGroundTruthGenerated](self, "workoutsAppSelectionGroundTruthGenerated");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workoutsAppSelectionGroundTruthGenerated");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent notebookAppSelectionGroundTruthGenerated](self, "notebookAppSelectionGroundTruthGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notebookAppSelectionGroundTruthGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent notebookAppSelectionGroundTruthGenerated](self, "notebookAppSelectionGroundTruthGenerated");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[INFERENCESchemaINFERENCEClientEvent notebookAppSelectionGroundTruthGenerated](self, "notebookAppSelectionGroundTruthGenerated");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notebookAppSelectionGroundTruthGenerated");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent commsAppSelectionGroundTruthGenerated](self, "commsAppSelectionGroundTruthGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commsAppSelectionGroundTruthGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent commsAppSelectionGroundTruthGenerated](self, "commsAppSelectionGroundTruthGenerated");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[INFERENCESchemaINFERENCEClientEvent commsAppSelectionGroundTruthGenerated](self, "commsAppSelectionGroundTruthGenerated");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commsAppSelectionGroundTruthGenerated");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent pervasiveEntityResolutionGroundTruthGenerated](self, "pervasiveEntityResolutionGroundTruthGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pervasiveEntityResolutionGroundTruthGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent pervasiveEntityResolutionGroundTruthGenerated](self, "pervasiveEntityResolutionGroundTruthGenerated");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[INFERENCESchemaINFERENCEClientEvent pervasiveEntityResolutionGroundTruthGenerated](self, "pervasiveEntityResolutionGroundTruthGenerated");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pervasiveEntityResolutionGroundTruthGenerated");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent seasExecutionPathReported](self, "seasExecutionPathReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seasExecutionPathReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[INFERENCESchemaINFERENCEClientEvent seasExecutionPathReported](self, "seasExecutionPathReported");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[INFERENCESchemaINFERENCEClientEvent seasExecutionPathReported](self, "seasExecutionPathReported");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seasExecutionPathReported");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_93;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEClientEvent asrEuclidEmbedding](self, "asrEuclidEmbedding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asrEuclidEmbedding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[INFERENCESchemaINFERENCEClientEvent asrEuclidEmbedding](self, "asrEuclidEmbedding");
    v93 = objc_claimAutoreleasedReturnValue();
    if (!v93)
    {

LABEL_96:
      v98 = 1;
      goto LABEL_94;
    }
    v94 = (void *)v93;
    -[INFERENCESchemaINFERENCEClientEvent asrEuclidEmbedding](self, "asrEuclidEmbedding");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asrEuclidEmbedding");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v95, "isEqual:", v96);

    if ((v97 & 1) != 0)
      goto LABEL_96;
  }
  else
  {
LABEL_92:

  }
LABEL_93:
  v98 = 0;
LABEL_94:

  return v98;
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

  v3 = -[INFERENCESchemaINFERENCEClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated hash](self->_musicAppSelectionGroundTruthGenerated, "hash") ^ v3;
  v5 = -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated hash](self->_videoPlayOnThirdPartyAppGroundTruthGenerated, "hash");
  v6 = v4 ^ v5 ^ -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated hash](self->_videoSmartAppSelectionDisambiguation, "hash");
  v7 = -[INFERENCESchemaINFERENCEResolutionRequestContext hash](self->_resolutionRequestContext, "hash");
  v8 = v7 ^ -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated hash](self->_simpleTaskInfoGenerated, "hash");
  v9 = v6 ^ v8 ^ -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated hash](self->_resolutionQueryInfoGenerated, "hash");
  v10 = -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated hash](self->_userPromptSelectedInfoGenerated, "hash");
  v11 = v10 ^ -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated hash](self->_contactCandidatesInfoGenerated, "hash");
  v12 = v11 ^ -[INFERENCESchemaINFERENCECRRTrainingSampleCollected hash](self->_crrTrainingSampleCollected, "hash");
  v13 = v9 ^ v12 ^ -[INFERENCESchemaINFERENCEABModelEvaluated hash](self->_abModelEvaluated, "hash");
  v14 = -[INFERENCESchemaINFERENCEABModelResultTriggered hash](self->_abModelResultTriggered, "hash");
  v15 = v14 ^ -[INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated hash](self->_workoutsAppSelectionGroundTruthGenerated, "hash");
  v16 = v15 ^ -[INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated hash](self->_notebookAppSelectionGroundTruthGenerated, "hash");
  v17 = v16 ^ -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated hash](self->_commsAppSelectionGroundTruthGenerated, "hash");
  v18 = v13 ^ v17 ^ -[INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated hash](self->_pervasiveEntityResolutionGroundTruthGenerated, "hash");
  v19 = -[INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported hash](self->_seasExecutionPathReported, "hash");
  return v18 ^ v19 ^ -[INFERENCESchemaINFERENCEAsrEuclidEmbedding hash](self->_asrEuclidEmbedding, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_abModelEvaluated)
  {
    -[INFERENCESchemaINFERENCEClientEvent abModelEvaluated](self, "abModelEvaluated");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("abModelEvaluated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("abModelEvaluated"));

    }
  }
  if (self->_abModelResultTriggered)
  {
    -[INFERENCESchemaINFERENCEClientEvent abModelResultTriggered](self, "abModelResultTriggered");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("abModelResultTriggered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("abModelResultTriggered"));

    }
  }
  if (self->_asrEuclidEmbedding)
  {
    -[INFERENCESchemaINFERENCEClientEvent asrEuclidEmbedding](self, "asrEuclidEmbedding");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("asrEuclidEmbedding"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("asrEuclidEmbedding"));

    }
  }
  if (self->_commsAppSelectionGroundTruthGenerated)
  {
    -[INFERENCESchemaINFERENCEClientEvent commsAppSelectionGroundTruthGenerated](self, "commsAppSelectionGroundTruthGenerated");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("commsAppSelectionGroundTruthGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("commsAppSelectionGroundTruthGenerated"));

    }
  }
  if (self->_contactCandidatesInfoGenerated)
  {
    -[INFERENCESchemaINFERENCEClientEvent contactCandidatesInfoGenerated](self, "contactCandidatesInfoGenerated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("contactCandidatesInfoGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("contactCandidatesInfoGenerated"));

    }
  }
  if (self->_crrTrainingSampleCollected)
  {
    -[INFERENCESchemaINFERENCEClientEvent crrTrainingSampleCollected](self, "crrTrainingSampleCollected");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("crrTrainingSampleCollected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("crrTrainingSampleCollected"));

    }
  }
  if (self->_eventMetadata)
  {
    -[INFERENCESchemaINFERENCEClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_musicAppSelectionGroundTruthGenerated)
  {
    -[INFERENCESchemaINFERENCEClientEvent musicAppSelectionGroundTruthGenerated](self, "musicAppSelectionGroundTruthGenerated");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("musicAppSelectionGroundTruthGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("musicAppSelectionGroundTruthGenerated"));

    }
  }
  if (self->_notebookAppSelectionGroundTruthGenerated)
  {
    -[INFERENCESchemaINFERENCEClientEvent notebookAppSelectionGroundTruthGenerated](self, "notebookAppSelectionGroundTruthGenerated");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("notebookAppSelectionGroundTruthGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("notebookAppSelectionGroundTruthGenerated"));

    }
  }
  if (self->_pervasiveEntityResolutionGroundTruthGenerated)
  {
    -[INFERENCESchemaINFERENCEClientEvent pervasiveEntityResolutionGroundTruthGenerated](self, "pervasiveEntityResolutionGroundTruthGenerated");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("pervasiveEntityResolutionGroundTruthGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("pervasiveEntityResolutionGroundTruthGenerated"));

    }
  }
  if (self->_resolutionQueryInfoGenerated)
  {
    -[INFERENCESchemaINFERENCEClientEvent resolutionQueryInfoGenerated](self, "resolutionQueryInfoGenerated");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("resolutionQueryInfoGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("resolutionQueryInfoGenerated"));

    }
  }
  if (self->_resolutionRequestContext)
  {
    -[INFERENCESchemaINFERENCEClientEvent resolutionRequestContext](self, "resolutionRequestContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("resolutionRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("resolutionRequestContext"));

    }
  }
  if (self->_seasExecutionPathReported)
  {
    -[INFERENCESchemaINFERENCEClientEvent seasExecutionPathReported](self, "seasExecutionPathReported");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("seasExecutionPathReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("seasExecutionPathReported"));

    }
  }
  if (self->_simpleTaskInfoGenerated)
  {
    -[INFERENCESchemaINFERENCEClientEvent simpleTaskInfoGenerated](self, "simpleTaskInfoGenerated");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("simpleTaskInfoGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("simpleTaskInfoGenerated"));

    }
  }
  if (self->_userPromptSelectedInfoGenerated)
  {
    -[INFERENCESchemaINFERENCEClientEvent userPromptSelectedInfoGenerated](self, "userPromptSelectedInfoGenerated");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("userPromptSelectedInfoGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("userPromptSelectedInfoGenerated"));

    }
  }
  if (self->_videoPlayOnThirdPartyAppGroundTruthGenerated)
  {
    -[INFERENCESchemaINFERENCEClientEvent videoPlayOnThirdPartyAppGroundTruthGenerated](self, "videoPlayOnThirdPartyAppGroundTruthGenerated");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("videoPlayOnThirdPartyAppGroundTruthGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("videoPlayOnThirdPartyAppGroundTruthGenerated"));

    }
  }
  if (self->_videoSmartAppSelectionDisambiguation)
  {
    -[INFERENCESchemaINFERENCEClientEvent videoSmartAppSelectionDisambiguation](self, "videoSmartAppSelectionDisambiguation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("videoSmartAppSelectionDisambiguation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("videoSmartAppSelectionDisambiguation"));

    }
  }
  if (self->_workoutsAppSelectionGroundTruthGenerated)
  {
    -[INFERENCESchemaINFERENCEClientEvent workoutsAppSelectionGroundTruthGenerated](self, "workoutsAppSelectionGroundTruthGenerated");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("workoutsAppSelectionGroundTruthGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("workoutsAppSelectionGroundTruthGenerated"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEClientEvent)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEClientEvent *v5;
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
    self = -[INFERENCESchemaINFERENCEClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEClientEvent)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEClientEvent *v5;
  uint64_t v6;
  INFERENCESchemaINFERENCEClientEventMetadata *v7;
  uint64_t v8;
  INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated *v9;
  uint64_t v10;
  INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated *v11;
  uint64_t v12;
  INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated *v13;
  uint64_t v14;
  INFERENCESchemaINFERENCEResolutionRequestContext *v15;
  uint64_t v16;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *v17;
  uint64_t v18;
  INFERENCESchemaINFERENCEResolutionQueryInfoGenerated *v19;
  uint64_t v20;
  INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated *v21;
  uint64_t v22;
  INFERENCESchemaINFERENCEContactCandidatesInfoGenerated *v23;
  uint64_t v24;
  INFERENCESchemaINFERENCECRRTrainingSampleCollected *v25;
  uint64_t v26;
  INFERENCESchemaINFERENCEABModelEvaluated *v27;
  void *v28;
  INFERENCESchemaINFERENCEABModelResultTriggered *v29;
  void *v30;
  INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated *v31;
  void *v32;
  INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated *v33;
  void *v34;
  INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated *v35;
  void *v36;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated *v37;
  void *v38;
  INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported *v39;
  void *v40;
  INFERENCESchemaINFERENCEAsrEuclidEmbedding *v41;
  INFERENCESchemaINFERENCEClientEvent *v42;
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
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)INFERENCESchemaINFERENCEClientEvent;
  v5 = -[INFERENCESchemaINFERENCEClientEvent init](&v55, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[INFERENCESchemaINFERENCEClientEventMetadata initWithDictionary:]([INFERENCESchemaINFERENCEClientEventMetadata alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCEClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("musicAppSelectionGroundTruthGenerated"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated initWithDictionary:]([INFERENCESchemaINFERENCEMusicAppSelectionGroundTruthGenerated alloc], "initWithDictionary:", v8);
      -[INFERENCESchemaINFERENCEClientEvent setMusicAppSelectionGroundTruthGenerated:](v5, "setMusicAppSelectionGroundTruthGenerated:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoPlayOnThirdPartyAppGroundTruthGenerated"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated initWithDictionary:]([INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppGroundTruthGenerated alloc], "initWithDictionary:", v10);
      -[INFERENCESchemaINFERENCEClientEvent setVideoPlayOnThirdPartyAppGroundTruthGenerated:](v5, "setVideoPlayOnThirdPartyAppGroundTruthGenerated:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoSmartAppSelectionDisambiguation"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated initWithDictionary:]([INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationSignalsGenerated alloc], "initWithDictionary:", v12);
      -[INFERENCESchemaINFERENCEClientEvent setVideoSmartAppSelectionDisambiguation:](v5, "setVideoSmartAppSelectionDisambiguation:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolutionRequestContext"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[INFERENCESchemaINFERENCEResolutionRequestContext initWithDictionary:]([INFERENCESchemaINFERENCEResolutionRequestContext alloc], "initWithDictionary:", v14);
      -[INFERENCESchemaINFERENCEClientEvent setResolutionRequestContext:](v5, "setResolutionRequestContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("simpleTaskInfoGenerated"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated initWithDictionary:]([INFERENCESchemaINFERENCESimpleTaskInfoGenerated alloc], "initWithDictionary:", v16);
      -[INFERENCESchemaINFERENCEClientEvent setSimpleTaskInfoGenerated:](v5, "setSimpleTaskInfoGenerated:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolutionQueryInfoGenerated"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[INFERENCESchemaINFERENCEResolutionQueryInfoGenerated initWithDictionary:]([INFERENCESchemaINFERENCEResolutionQueryInfoGenerated alloc], "initWithDictionary:", v18);
      -[INFERENCESchemaINFERENCEClientEvent setResolutionQueryInfoGenerated:](v5, "setResolutionQueryInfoGenerated:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userPromptSelectedInfoGenerated"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated initWithDictionary:]([INFERENCESchemaINFERENCEQueryUserPromptSelectedInfoGenerated alloc], "initWithDictionary:", v20);
      -[INFERENCESchemaINFERENCEClientEvent setUserPromptSelectedInfoGenerated:](v5, "setUserPromptSelectedInfoGenerated:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactCandidatesInfoGenerated"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v52 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[INFERENCESchemaINFERENCEContactCandidatesInfoGenerated initWithDictionary:]([INFERENCESchemaINFERENCEContactCandidatesInfoGenerated alloc], "initWithDictionary:", v22);
      -[INFERENCESchemaINFERENCEClientEvent setContactCandidatesInfoGenerated:](v5, "setContactCandidatesInfoGenerated:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crrTrainingSampleCollected"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[INFERENCESchemaINFERENCECRRTrainingSampleCollected initWithDictionary:]([INFERENCESchemaINFERENCECRRTrainingSampleCollected alloc], "initWithDictionary:", v24);
      -[INFERENCESchemaINFERENCEClientEvent setCrrTrainingSampleCollected:](v5, "setCrrTrainingSampleCollected:", v25);

    }
    v49 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("abModelEvaluated"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[INFERENCESchemaINFERENCEABModelEvaluated initWithDictionary:]([INFERENCESchemaINFERENCEABModelEvaluated alloc], "initWithDictionary:", v26);
      -[INFERENCESchemaINFERENCEClientEvent setAbModelEvaluated:](v5, "setAbModelEvaluated:", v27);

    }
    v44 = (void *)v26;
    v48 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("abModelResultTriggered"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[INFERENCESchemaINFERENCEABModelResultTriggered initWithDictionary:]([INFERENCESchemaINFERENCEABModelResultTriggered alloc], "initWithDictionary:", v28);
      -[INFERENCESchemaINFERENCEClientEvent setAbModelResultTriggered:](v5, "setAbModelResultTriggered:", v29);

    }
    v47 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("workoutsAppSelectionGroundTruthGenerated"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated initWithDictionary:]([INFERENCESchemaINFERENCEWorkoutsAppSelectionGroundTruthGenerated alloc], "initWithDictionary:", v30);
      -[INFERENCESchemaINFERENCEClientEvent setWorkoutsAppSelectionGroundTruthGenerated:](v5, "setWorkoutsAppSelectionGroundTruthGenerated:", v31);

    }
    v46 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notebookAppSelectionGroundTruthGenerated"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated initWithDictionary:]([INFERENCESchemaINFERENCENotebookAppSelectionGroundTruthGenerated alloc], "initWithDictionary:", v32);
      -[INFERENCESchemaINFERENCEClientEvent setNotebookAppSelectionGroundTruthGenerated:](v5, "setNotebookAppSelectionGroundTruthGenerated:", v33);

    }
    v45 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commsAppSelectionGroundTruthGenerated"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated initWithDictionary:]([INFERENCESchemaINFERENCECommsAppSelectionGroundTruthGenerated alloc], "initWithDictionary:", v34);
      -[INFERENCESchemaINFERENCEClientEvent setCommsAppSelectionGroundTruthGenerated:](v5, "setCommsAppSelectionGroundTruthGenerated:", v35);

    }
    v50 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pervasiveEntityResolutionGroundTruthGenerated"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated initWithDictionary:]([INFERENCESchemaINFERENCEPervasiveEntityResolutionGroundTruthGenerated alloc], "initWithDictionary:", v36);
      -[INFERENCESchemaINFERENCEClientEvent setPervasiveEntityResolutionGroundTruthGenerated:](v5, "setPervasiveEntityResolutionGroundTruthGenerated:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seasExecutionPathReported"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported initWithDictionary:]([INFERENCESchemaINFERENCESmartEnoughAppSelectionExecutionPathReported alloc], "initWithDictionary:", v38);
      -[INFERENCESchemaINFERENCEClientEvent setSeasExecutionPathReported:](v5, "setSeasExecutionPathReported:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrEuclidEmbedding"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[INFERENCESchemaINFERENCEAsrEuclidEmbedding initWithDictionary:]([INFERENCESchemaINFERENCEAsrEuclidEmbedding alloc], "initWithDictionary:", v40);
      -[INFERENCESchemaINFERENCEClientEvent setAsrEuclidEmbedding:](v5, "setAsrEuclidEmbedding:", v41);

    }
    v42 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (INFERENCESchemaINFERENCEClientEventMetadata)eventMetadata
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

- (BOOL)hasMusicAppSelectionGroundTruthGenerated
{
  return self->_hasMusicAppSelectionGroundTruthGenerated;
}

- (void)setHasMusicAppSelectionGroundTruthGenerated:(BOOL)a3
{
  self->_hasMusicAppSelectionGroundTruthGenerated = a3;
}

- (BOOL)hasVideoPlayOnThirdPartyAppGroundTruthGenerated
{
  return self->_hasVideoPlayOnThirdPartyAppGroundTruthGenerated;
}

- (void)setHasVideoPlayOnThirdPartyAppGroundTruthGenerated:(BOOL)a3
{
  self->_hasVideoPlayOnThirdPartyAppGroundTruthGenerated = a3;
}

- (BOOL)hasVideoSmartAppSelectionDisambiguation
{
  return self->_hasVideoSmartAppSelectionDisambiguation;
}

- (void)setHasVideoSmartAppSelectionDisambiguation:(BOOL)a3
{
  self->_hasVideoSmartAppSelectionDisambiguation = a3;
}

- (BOOL)hasResolutionRequestContext
{
  return self->_hasResolutionRequestContext;
}

- (void)setHasResolutionRequestContext:(BOOL)a3
{
  self->_hasResolutionRequestContext = a3;
}

- (BOOL)hasSimpleTaskInfoGenerated
{
  return self->_hasSimpleTaskInfoGenerated;
}

- (void)setHasSimpleTaskInfoGenerated:(BOOL)a3
{
  self->_hasSimpleTaskInfoGenerated = a3;
}

- (BOOL)hasResolutionQueryInfoGenerated
{
  return self->_hasResolutionQueryInfoGenerated;
}

- (void)setHasResolutionQueryInfoGenerated:(BOOL)a3
{
  self->_hasResolutionQueryInfoGenerated = a3;
}

- (BOOL)hasUserPromptSelectedInfoGenerated
{
  return self->_hasUserPromptSelectedInfoGenerated;
}

- (void)setHasUserPromptSelectedInfoGenerated:(BOOL)a3
{
  self->_hasUserPromptSelectedInfoGenerated = a3;
}

- (BOOL)hasContactCandidatesInfoGenerated
{
  return self->_hasContactCandidatesInfoGenerated;
}

- (void)setHasContactCandidatesInfoGenerated:(BOOL)a3
{
  self->_hasContactCandidatesInfoGenerated = a3;
}

- (BOOL)hasCrrTrainingSampleCollected
{
  return self->_hasCrrTrainingSampleCollected;
}

- (void)setHasCrrTrainingSampleCollected:(BOOL)a3
{
  self->_hasCrrTrainingSampleCollected = a3;
}

- (BOOL)hasAbModelEvaluated
{
  return self->_hasAbModelEvaluated;
}

- (void)setHasAbModelEvaluated:(BOOL)a3
{
  self->_hasAbModelEvaluated = a3;
}

- (BOOL)hasAbModelResultTriggered
{
  return self->_hasAbModelResultTriggered;
}

- (void)setHasAbModelResultTriggered:(BOOL)a3
{
  self->_hasAbModelResultTriggered = a3;
}

- (BOOL)hasWorkoutsAppSelectionGroundTruthGenerated
{
  return self->_hasWorkoutsAppSelectionGroundTruthGenerated;
}

- (void)setHasWorkoutsAppSelectionGroundTruthGenerated:(BOOL)a3
{
  self->_hasWorkoutsAppSelectionGroundTruthGenerated = a3;
}

- (BOOL)hasNotebookAppSelectionGroundTruthGenerated
{
  return self->_hasNotebookAppSelectionGroundTruthGenerated;
}

- (void)setHasNotebookAppSelectionGroundTruthGenerated:(BOOL)a3
{
  self->_hasNotebookAppSelectionGroundTruthGenerated = a3;
}

- (BOOL)hasCommsAppSelectionGroundTruthGenerated
{
  return self->_hasCommsAppSelectionGroundTruthGenerated;
}

- (void)setHasCommsAppSelectionGroundTruthGenerated:(BOOL)a3
{
  self->_hasCommsAppSelectionGroundTruthGenerated = a3;
}

- (BOOL)hasPervasiveEntityResolutionGroundTruthGenerated
{
  return self->_hasPervasiveEntityResolutionGroundTruthGenerated;
}

- (void)setHasPervasiveEntityResolutionGroundTruthGenerated:(BOOL)a3
{
  self->_hasPervasiveEntityResolutionGroundTruthGenerated = a3;
}

- (BOOL)hasSeasExecutionPathReported
{
  return self->_hasSeasExecutionPathReported;
}

- (void)setHasSeasExecutionPathReported:(BOOL)a3
{
  self->_hasSeasExecutionPathReported = a3;
}

- (BOOL)hasAsrEuclidEmbedding
{
  return self->_hasAsrEuclidEmbedding;
}

- (void)setHasAsrEuclidEmbedding:(BOOL)a3
{
  self->_hasAsrEuclidEmbedding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrEuclidEmbedding, 0);
  objc_storeStrong((id *)&self->_seasExecutionPathReported, 0);
  objc_storeStrong((id *)&self->_pervasiveEntityResolutionGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_commsAppSelectionGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_notebookAppSelectionGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_workoutsAppSelectionGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_abModelResultTriggered, 0);
  objc_storeStrong((id *)&self->_abModelEvaluated, 0);
  objc_storeStrong((id *)&self->_crrTrainingSampleCollected, 0);
  objc_storeStrong((id *)&self->_contactCandidatesInfoGenerated, 0);
  objc_storeStrong((id *)&self->_userPromptSelectedInfoGenerated, 0);
  objc_storeStrong((id *)&self->_resolutionQueryInfoGenerated, 0);
  objc_storeStrong((id *)&self->_simpleTaskInfoGenerated, 0);
  objc_storeStrong((id *)&self->_resolutionRequestContext, 0);
  objc_storeStrong((id *)&self->_videoSmartAppSelectionDisambiguation, 0);
  objc_storeStrong((id *)&self->_videoPlayOnThirdPartyAppGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_musicAppSelectionGroundTruthGenerated, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 57;
}

@end
