@implementation ASRSchemaASRClientEvent

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
  id v11;
  void *v12;
  uint64_t v13;

  -[ASRSchemaASRClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asrId");
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
        goto LABEL_8;
    }
  }
  -[ASRSchemaASRClientEvent eventMetadata](self, "eventMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v10, "value");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      v4 = v10;
LABEL_8:
      v11 = v4;
      v10 = v11;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (int)componentName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  -[ASRSchemaASRClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asrId");
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
    v9 = 8;
  }
  else
  {
LABEL_5:
    -[ASRSchemaASRClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "value");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v11, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v14, "length") != 0;

      }
      else
      {
        v9 = 0;
      }
      v4 = v11;
    }
    else
    {
      v9 = 0;
      v4 = 0;
    }
  }

  return v9;
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
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  int v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  void *v118;
  int v119;
  void *v120;
  void *v121;
  int v122;
  void *v123;
  void *v124;
  int v125;
  void *v126;
  void *v127;
  int v128;
  id v129;
  objc_super v131;

  v4 = a3;
  v131.receiver = self;
  v131.super_class = (Class)ASRSchemaASRClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v131, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[ASRSchemaASRClientEvent deleteRecognitionResultTier1](self, "deleteRecognitionResultTier1");
    -[ASRSchemaASRClientEvent deleteIntermediateUtteranceInfoTier1](self, "deleteIntermediateUtteranceInfoTier1");
    -[ASRSchemaASRClientEvent deleteJitLanguageModelEnrollmentEndedTier1](self, "deleteJitLanguageModelEnrollmentEndedTier1");
    -[ASRSchemaASRClientEvent deleteManualEditTextClassified](self, "deleteManualEditTextClassified");
    -[ASRSchemaASRClientEvent deleteAlternativeSelectionTextCategorized](self, "deleteAlternativeSelectionTextCategorized");
    -[ASRSchemaASRClientEvent deleteDictationVoiceCommandInfoTier1](self, "deleteDictationVoiceCommandInfoTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[ASRSchemaASRClientEvent deleteRecognitionResultTier1](self, "deleteRecognitionResultTier1");
    -[ASRSchemaASRClientEvent deleteIntermediateUtteranceInfoTier1](self, "deleteIntermediateUtteranceInfoTier1");
    -[ASRSchemaASRClientEvent deleteJitLanguageModelEnrollmentEndedTier1](self, "deleteJitLanguageModelEnrollmentEndedTier1");
    -[ASRSchemaASRClientEvent deleteManualEditTextClassified](self, "deleteManualEditTextClassified");
    -[ASRSchemaASRClientEvent deleteAlternativeSelectionTextCategorized](self, "deleteAlternativeSelectionTextCategorized");
    -[ASRSchemaASRClientEvent deleteDictationVoiceCommandInfoTier1](self, "deleteDictationVoiceCommandInfoTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[ASRSchemaASRClientEvent deleteRecognitionResultTier1](self, "deleteRecognitionResultTier1");
    -[ASRSchemaASRClientEvent deleteIntermediateUtteranceInfoTier1](self, "deleteIntermediateUtteranceInfoTier1");
    -[ASRSchemaASRClientEvent deleteJitLanguageModelEnrollmentEndedTier1](self, "deleteJitLanguageModelEnrollmentEndedTier1");
    -[ASRSchemaASRClientEvent deleteManualEditTextClassified](self, "deleteManualEditTextClassified");
    -[ASRSchemaASRClientEvent deleteAlternativeSelectionTextCategorized](self, "deleteAlternativeSelectionTextCategorized");
    -[ASRSchemaASRClientEvent deleteDictationVoiceCommandInfoTier1](self, "deleteDictationVoiceCommandInfoTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[ASRSchemaASRClientEvent deleteRecognitionResultTier1](self, "deleteRecognitionResultTier1");
    -[ASRSchemaASRClientEvent deleteIntermediateUtteranceInfoTier1](self, "deleteIntermediateUtteranceInfoTier1");
    -[ASRSchemaASRClientEvent deleteJitLanguageModelEnrollmentEndedTier1](self, "deleteJitLanguageModelEnrollmentEndedTier1");
    -[ASRSchemaASRClientEvent deleteManualEditTextClassified](self, "deleteManualEditTextClassified");
    -[ASRSchemaASRClientEvent deleteAlternativeSelectionTextCategorized](self, "deleteAlternativeSelectionTextCategorized");
    -[ASRSchemaASRClientEvent deleteDictationVoiceCommandInfoTier1](self, "deleteDictationVoiceCommandInfoTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[ASRSchemaASRClientEvent deleteRecognitionResultTier1](self, "deleteRecognitionResultTier1");
    -[ASRSchemaASRClientEvent deleteIntermediateUtteranceInfoTier1](self, "deleteIntermediateUtteranceInfoTier1");
    -[ASRSchemaASRClientEvent deleteJitLanguageModelEnrollmentEndedTier1](self, "deleteJitLanguageModelEnrollmentEndedTier1");
    -[ASRSchemaASRClientEvent deleteManualEditTextClassified](self, "deleteManualEditTextClassified");
    -[ASRSchemaASRClientEvent deleteAlternativeSelectionTextCategorized](self, "deleteAlternativeSelectionTextCategorized");
    -[ASRSchemaASRClientEvent deleteDictationVoiceCommandInfoTier1](self, "deleteDictationVoiceCommandInfoTier1");
  }
  -[ASRSchemaASRClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ASRSchemaASRClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[ASRSchemaASRClientEvent preheatContext](self, "preheatContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ASRSchemaASRClientEvent deletePreheatContext](self, "deletePreheatContext");
  -[ASRSchemaASRClientEvent requestContext](self, "requestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ASRSchemaASRClientEvent deleteRequestContext](self, "deleteRequestContext");
  -[ASRSchemaASRClientEvent partialResultGenerated](self, "partialResultGenerated");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ASRSchemaASRClientEvent deletePartialResultGenerated](self, "deletePartialResultGenerated");
  -[ASRSchemaASRClientEvent packageGenerated](self, "packageGenerated");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[ASRSchemaASRClientEvent deletePackageGenerated](self, "deletePackageGenerated");
  -[ASRSchemaASRClientEvent recognitionResultTier1](self, "recognitionResultTier1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[ASRSchemaASRClientEvent deleteRecognitionResultTier1](self, "deleteRecognitionResultTier1");
  -[ASRSchemaASRClientEvent finalResultGenerated](self, "finalResultGenerated");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[ASRSchemaASRClientEvent deleteFinalResultGenerated](self, "deleteFinalResultGenerated");
  -[ASRSchemaASRClientEvent intermediateUtteranceInfoTier1](self, "intermediateUtteranceInfoTier1");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[ASRSchemaASRClientEvent deleteIntermediateUtteranceInfoTier1](self, "deleteIntermediateUtteranceInfoTier1");
  -[ASRSchemaASRClientEvent initializationContext](self, "initializationContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[ASRSchemaASRClientEvent deleteInitializationContext](self, "deleteInitializationContext");
  -[ASRSchemaASRClientEvent assetLoadContext](self, "assetLoadContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[ASRSchemaASRClientEvent deleteAssetLoadContext](self, "deleteAssetLoadContext");
  -[ASRSchemaASRClientEvent languageModelEnrollmentContext](self, "languageModelEnrollmentContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[ASRSchemaASRClientEvent deleteLanguageModelEnrollmentContext](self, "deleteLanguageModelEnrollmentContext");
  -[ASRSchemaASRClientEvent jitLanguageModelEnrollmentEndedTier1](self, "jitLanguageModelEnrollmentEndedTier1");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[ASRSchemaASRClientEvent deleteJitLanguageModelEnrollmentEndedTier1](self, "deleteJitLanguageModelEnrollmentEndedTier1");
  -[ASRSchemaASRClientEvent audioPacketArrivalContext](self, "audioPacketArrivalContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[ASRSchemaASRClientEvent deleteAudioPacketArrivalContext](self, "deleteAudioPacketArrivalContext");
  -[ASRSchemaASRClientEvent firstAudioPacketProcessed](self, "firstAudioPacketProcessed");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[ASRSchemaASRClientEvent deleteFirstAudioPacketProcessed](self, "deleteFirstAudioPacketProcessed");
  -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReceived](self, "finalAudioPacketContainingSpeechReceived");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[ASRSchemaASRClientEvent deleteFinalAudioPacketContainingSpeechReceived](self, "deleteFinalAudioPacketContainingSpeechReceived");
  -[ASRSchemaASRClientEvent sampledAudioFileStored](self, "sampledAudioFileStored");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[ASRSchemaASRClientEvent deleteSampledAudioFileStored](self, "deleteSampledAudioFileStored");
  -[ASRSchemaASRClientEvent sampledAudioFileStorageFailed](self, "sampledAudioFileStorageFailed");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[ASRSchemaASRClientEvent deleteSampledAudioFileStorageFailed](self, "deleteSampledAudioFileStorageFailed");
  -[ASRSchemaASRClientEvent sampledAudioFileEnqueued](self, "sampledAudioFileEnqueued");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applySensitiveConditionsPolicy:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "suppressMessage");

  if (v59)
    -[ASRSchemaASRClientEvent deleteSampledAudioFileEnqueued](self, "deleteSampledAudioFileEnqueued");
  -[ASRSchemaASRClientEvent sampledAudioFileEnqueueFailed](self, "sampledAudioFileEnqueueFailed");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "applySensitiveConditionsPolicy:", v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "suppressMessage");

  if (v62)
    -[ASRSchemaASRClientEvent deleteSampledAudioFileEnqueueFailed](self, "deleteSampledAudioFileEnqueueFailed");
  -[ASRSchemaASRClientEvent sampledAudioFileDeleted](self, "sampledAudioFileDeleted");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "applySensitiveConditionsPolicy:", v4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "suppressMessage");

  if (v65)
    -[ASRSchemaASRClientEvent deleteSampledAudioFileDeleted](self, "deleteSampledAudioFileDeleted");
  -[ASRSchemaASRClientEvent sampledAudioFileDeletionFailed](self, "sampledAudioFileDeletionFailed");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "applySensitiveConditionsPolicy:", v4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "suppressMessage");

  if (v68)
    -[ASRSchemaASRClientEvent deleteSampledAudioFileDeletionFailed](self, "deleteSampledAudioFileDeletionFailed");
  -[ASRSchemaASRClientEvent appleNeuralEngineCompilationContext](self, "appleNeuralEngineCompilationContext");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "applySensitiveConditionsPolicy:", v4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "suppressMessage");

  if (v71)
    -[ASRSchemaASRClientEvent deleteAppleNeuralEngineCompilationContext](self, "deleteAppleNeuralEngineCompilationContext");
  -[ASRSchemaASRClientEvent dictationVoiceCommandMetricsReported](self, "dictationVoiceCommandMetricsReported");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "applySensitiveConditionsPolicy:", v4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "suppressMessage");

  if (v74)
    -[ASRSchemaASRClientEvent deleteDictationVoiceCommandMetricsReported](self, "deleteDictationVoiceCommandMetricsReported");
  -[ASRSchemaASRClientEvent appLanguageModelLoadContext](self, "appLanguageModelLoadContext");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "applySensitiveConditionsPolicy:", v4);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "suppressMessage");

  if (v77)
    -[ASRSchemaASRClientEvent deleteAppLanguageModelLoadContext](self, "deleteAppLanguageModelLoadContext");
  -[ASRSchemaASRClientEvent embeddedSpeechProcessContext](self, "embeddedSpeechProcessContext");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "applySensitiveConditionsPolicy:", v4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "suppressMessage");

  if (v80)
    -[ASRSchemaASRClientEvent deleteEmbeddedSpeechProcessContext](self, "deleteEmbeddedSpeechProcessContext");
  -[ASRSchemaASRClientEvent manualEditTextClassified](self, "manualEditTextClassified");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "applySensitiveConditionsPolicy:", v4);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "suppressMessage");

  if (v83)
    -[ASRSchemaASRClientEvent deleteManualEditTextClassified](self, "deleteManualEditTextClassified");
  -[ASRSchemaASRClientEvent manualEditMetricClassified](self, "manualEditMetricClassified");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "applySensitiveConditionsPolicy:", v4);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "suppressMessage");

  if (v86)
    -[ASRSchemaASRClientEvent deleteManualEditMetricClassified](self, "deleteManualEditMetricClassified");
  -[ASRSchemaASRClientEvent manualEditClassificationContext](self, "manualEditClassificationContext");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "applySensitiveConditionsPolicy:", v4);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "suppressMessage");

  if (v89)
    -[ASRSchemaASRClientEvent deleteManualEditClassificationContext](self, "deleteManualEditClassificationContext");
  -[ASRSchemaASRClientEvent activeConfigUpdateContext](self, "activeConfigUpdateContext");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "applySensitiveConditionsPolicy:", v4);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "suppressMessage");

  if (v92)
    -[ASRSchemaASRClientEvent deleteActiveConfigUpdateContext](self, "deleteActiveConfigUpdateContext");
  -[ASRSchemaASRClientEvent appleNeuralEngineModelInitializationContext](self, "appleNeuralEngineModelInitializationContext");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "applySensitiveConditionsPolicy:", v4);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "suppressMessage");

  if (v95)
    -[ASRSchemaASRClientEvent deleteAppleNeuralEngineModelInitializationContext](self, "deleteAppleNeuralEngineModelInitializationContext");
  -[ASRSchemaASRClientEvent frameProcessingReady](self, "frameProcessingReady");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "applySensitiveConditionsPolicy:", v4);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "suppressMessage");

  if (v98)
    -[ASRSchemaASRClientEvent deleteFrameProcessingReady](self, "deleteFrameProcessingReady");
  -[ASRSchemaASRClientEvent leadingSilenceProcessed](self, "leadingSilenceProcessed");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "applySensitiveConditionsPolicy:", v4);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "suppressMessage");

  if (v101)
    -[ASRSchemaASRClientEvent deleteLeadingSilenceProcessed](self, "deleteLeadingSilenceProcessed");
  -[ASRSchemaASRClientEvent firstSecondAfterLeadingSilenceProcessed](self, "firstSecondAfterLeadingSilenceProcessed");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "applySensitiveConditionsPolicy:", v4);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "suppressMessage");

  if (v104)
    -[ASRSchemaASRClientEvent deleteFirstSecondAfterLeadingSilenceProcessed](self, "deleteFirstSecondAfterLeadingSilenceProcessed");
  -[ASRSchemaASRClientEvent audioSpeechPacketArrivalContext](self, "audioSpeechPacketArrivalContext");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "applySensitiveConditionsPolicy:", v4);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "suppressMessage");

  if (v107)
    -[ASRSchemaASRClientEvent deleteAudioSpeechPacketArrivalContext](self, "deleteAudioSpeechPacketArrivalContext");
  -[ASRSchemaASRClientEvent audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived](self, "audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "applySensitiveConditionsPolicy:", v4);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "suppressMessage");

  if (v110)
    -[ASRSchemaASRClientEvent deleteAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived](self, "deleteAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived");
  -[ASRSchemaASRClientEvent firstAudioPacketRecorded](self, "firstAudioPacketRecorded");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "applySensitiveConditionsPolicy:", v4);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v112, "suppressMessage");

  if (v113)
    -[ASRSchemaASRClientEvent deleteFirstAudioPacketRecorded](self, "deleteFirstAudioPacketRecorded");
  -[ASRSchemaASRClientEvent audioPacketContainingEndOfFirstWordReadyUpstream](self, "audioPacketContainingEndOfFirstWordReadyUpstream");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "applySensitiveConditionsPolicy:", v4);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "suppressMessage");

  if (v116)
    -[ASRSchemaASRClientEvent deleteAudioPacketContainingEndOfFirstWordReadyUpstream](self, "deleteAudioPacketContainingEndOfFirstWordReadyUpstream");
  -[ASRSchemaASRClientEvent firstAudioPacketReadyUpstream](self, "firstAudioPacketReadyUpstream");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "applySensitiveConditionsPolicy:", v4);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v118, "suppressMessage");

  if (v119)
    -[ASRSchemaASRClientEvent deleteFirstAudioPacketReadyUpstream](self, "deleteFirstAudioPacketReadyUpstream");
  -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReadyUpstream](self, "finalAudioPacketContainingSpeechReadyUpstream");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "applySensitiveConditionsPolicy:", v4);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(v121, "suppressMessage");

  if (v122)
    -[ASRSchemaASRClientEvent deleteFinalAudioPacketContainingSpeechReadyUpstream](self, "deleteFinalAudioPacketContainingSpeechReadyUpstream");
  -[ASRSchemaASRClientEvent alternativeSelectionTextCategorized](self, "alternativeSelectionTextCategorized");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "applySensitiveConditionsPolicy:", v4);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v124, "suppressMessage");

  if (v125)
    -[ASRSchemaASRClientEvent deleteAlternativeSelectionTextCategorized](self, "deleteAlternativeSelectionTextCategorized");
  -[ASRSchemaASRClientEvent dictationVoiceCommandInfoTier1](self, "dictationVoiceCommandInfoTier1");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "applySensitiveConditionsPolicy:", v4);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(v127, "suppressMessage");

  if (v128)
    -[ASRSchemaASRClientEvent deleteDictationVoiceCommandInfoTier1](self, "deleteDictationVoiceCommandInfoTier1");
  v129 = v5;

  return v129;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[ASRSchemaASRClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 0x27)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5628CA0[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0x27)
    return 0;
  else
    return off_1E5628DE0[a3 - 101];
}

- (int)clockIsolationLevel
{
  unint64_t v2;

  v2 = -[ASRSchemaASRClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 125 > 0xE || ((1 << (v2 - 125)) & 0x4007) == 0)
    return 1;
  else
    return 2;
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[ASRSchemaASRClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 0x27)
    return CFSTR("com.apple.aiml.siri.asr.ASRClientEvent");
  else
    return off_1E562B4C8[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[ASRSchemaASRClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setPreheatContext:(id)a3
{
  ASRSchemaASRPreheatContext *v4;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRPreheatContext *preheatContext;

  v4 = (ASRSchemaASRPreheatContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 101;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  preheatContext = self->_preheatContext;
  self->_preheatContext = v4;

}

- (ASRSchemaASRPreheatContext)preheatContext
{
  if (self->_whichEvent_Type == 101)
    return self->_preheatContext;
  else
    return (ASRSchemaASRPreheatContext *)0;
}

- (void)deletePreheatContext
{
  ASRSchemaASRPreheatContext *preheatContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    preheatContext = self->_preheatContext;
    self->_preheatContext = 0;

  }
}

- (void)setRequestContext:(id)a3
{
  ASRSchemaASRRequestContext *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRRequestContext *requestContext;

  v4 = (ASRSchemaASRRequestContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 102;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  requestContext = self->_requestContext;
  self->_requestContext = v4;

}

- (ASRSchemaASRRequestContext)requestContext
{
  if (self->_whichEvent_Type == 102)
    return self->_requestContext;
  else
    return (ASRSchemaASRRequestContext *)0;
}

- (void)deleteRequestContext
{
  ASRSchemaASRRequestContext *requestContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    requestContext = self->_requestContext;
    self->_requestContext = 0;

  }
}

- (void)setPartialResultGenerated:(id)a3
{
  ASRSchemaASRPartialResultGenerated *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;

  v4 = (ASRSchemaASRPartialResultGenerated *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 103;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = v4;

}

- (ASRSchemaASRPartialResultGenerated)partialResultGenerated
{
  if (self->_whichEvent_Type == 103)
    return self->_partialResultGenerated;
  else
    return (ASRSchemaASRPartialResultGenerated *)0;
}

- (void)deletePartialResultGenerated
{
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    partialResultGenerated = self->_partialResultGenerated;
    self->_partialResultGenerated = 0;

  }
}

- (void)setPackageGenerated:(id)a3
{
  ASRSchemaASRPackageGenerated *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRPackageGenerated *packageGenerated;

  v4 = (ASRSchemaASRPackageGenerated *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 104;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = v4;

}

- (ASRSchemaASRPackageGenerated)packageGenerated
{
  if (self->_whichEvent_Type == 104)
    return self->_packageGenerated;
  else
    return (ASRSchemaASRPackageGenerated *)0;
}

- (void)deletePackageGenerated
{
  ASRSchemaASRPackageGenerated *packageGenerated;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    packageGenerated = self->_packageGenerated;
    self->_packageGenerated = 0;

  }
}

- (void)setRecognitionResultTier1:(id)a3
{
  ASRSchemaASRRecognitionResultTier1 *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;

  v4 = (ASRSchemaASRRecognitionResultTier1 *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 105;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = v4;

}

- (ASRSchemaASRRecognitionResultTier1)recognitionResultTier1
{
  if (self->_whichEvent_Type == 105)
    return self->_recognitionResultTier1;
  else
    return (ASRSchemaASRRecognitionResultTier1 *)0;
}

- (void)deleteRecognitionResultTier1
{
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    recognitionResultTier1 = self->_recognitionResultTier1;
    self->_recognitionResultTier1 = 0;

  }
}

- (void)setFinalResultGenerated:(id)a3
{
  ASRSchemaASRFinalResultGenerated *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;

  v4 = (ASRSchemaASRFinalResultGenerated *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 106;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = v4;

}

- (ASRSchemaASRFinalResultGenerated)finalResultGenerated
{
  if (self->_whichEvent_Type == 106)
    return self->_finalResultGenerated;
  else
    return (ASRSchemaASRFinalResultGenerated *)0;
}

- (void)deleteFinalResultGenerated
{
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    finalResultGenerated = self->_finalResultGenerated;
    self->_finalResultGenerated = 0;

  }
}

- (void)setIntermediateUtteranceInfoTier1:(id)a3
{
  ASRSchemaASRIntermediateUtteranceInfoTier1 *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;

  v4 = (ASRSchemaASRIntermediateUtteranceInfoTier1 *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 107;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = v4;

}

- (ASRSchemaASRIntermediateUtteranceInfoTier1)intermediateUtteranceInfoTier1
{
  if (self->_whichEvent_Type == 107)
    return self->_intermediateUtteranceInfoTier1;
  else
    return (ASRSchemaASRIntermediateUtteranceInfoTier1 *)0;
}

- (void)deleteIntermediateUtteranceInfoTier1
{
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
    self->_intermediateUtteranceInfoTier1 = 0;

  }
}

- (void)setInitializationContext:(id)a3
{
  ASRSchemaASRInitializationContext *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRInitializationContext *initializationContext;

  v4 = (ASRSchemaASRInitializationContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 108;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  initializationContext = self->_initializationContext;
  self->_initializationContext = v4;

}

- (ASRSchemaASRInitializationContext)initializationContext
{
  if (self->_whichEvent_Type == 108)
    return self->_initializationContext;
  else
    return (ASRSchemaASRInitializationContext *)0;
}

- (void)deleteInitializationContext
{
  ASRSchemaASRInitializationContext *initializationContext;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    initializationContext = self->_initializationContext;
    self->_initializationContext = 0;

  }
}

- (void)setAssetLoadContext:(id)a3
{
  ASRSchemaASRAssetLoadContext *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRAssetLoadContext *assetLoadContext;

  v4 = (ASRSchemaASRAssetLoadContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 109;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = v4;

}

- (ASRSchemaASRAssetLoadContext)assetLoadContext
{
  if (self->_whichEvent_Type == 109)
    return self->_assetLoadContext;
  else
    return (ASRSchemaASRAssetLoadContext *)0;
}

- (void)deleteAssetLoadContext
{
  ASRSchemaASRAssetLoadContext *assetLoadContext;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    assetLoadContext = self->_assetLoadContext;
    self->_assetLoadContext = 0;

  }
}

- (void)setLanguageModelEnrollmentContext:(id)a3
{
  ASRSchemaASRJitLanguageModelEnrollmentContext *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;

  v4 = (ASRSchemaASRJitLanguageModelEnrollmentContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 110;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = v4;

}

- (ASRSchemaASRJitLanguageModelEnrollmentContext)languageModelEnrollmentContext
{
  if (self->_whichEvent_Type == 110)
    return self->_languageModelEnrollmentContext;
  else
    return (ASRSchemaASRJitLanguageModelEnrollmentContext *)0;
}

- (void)deleteLanguageModelEnrollmentContext
{
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;

  if (self->_whichEvent_Type == 110)
  {
    self->_whichEvent_Type = 0;
    languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
    self->_languageModelEnrollmentContext = 0;

  }
}

- (void)setJitLanguageModelEnrollmentEndedTier1:(id)a3
{
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;

  v4 = (ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 111;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = v4;

}

- (ASRSchemaASRJitLanguageModelEnrollmentEndedTier1)jitLanguageModelEnrollmentEndedTier1
{
  if (self->_whichEvent_Type == 111)
    return self->_jitLanguageModelEnrollmentEndedTier1;
  else
    return (ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *)0;
}

- (void)deleteJitLanguageModelEnrollmentEndedTier1
{
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;

  if (self->_whichEvent_Type == 111)
  {
    self->_whichEvent_Type = 0;
    jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
    self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  }
}

- (void)setAudioPacketArrivalContext:(id)a3
{
  ASRSchemaASRAudioPacketArrivalContext *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;

  v4 = (ASRSchemaASRAudioPacketArrivalContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 112;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = v4;

}

- (ASRSchemaASRAudioPacketArrivalContext)audioPacketArrivalContext
{
  if (self->_whichEvent_Type == 112)
    return self->_audioPacketArrivalContext;
  else
    return (ASRSchemaASRAudioPacketArrivalContext *)0;
}

- (void)deleteAudioPacketArrivalContext
{
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;

  if (self->_whichEvent_Type == 112)
  {
    self->_whichEvent_Type = 0;
    audioPacketArrivalContext = self->_audioPacketArrivalContext;
    self->_audioPacketArrivalContext = 0;

  }
}

- (void)setFirstAudioPacketProcessed:(id)a3
{
  ASRSchemaASRFirstAudioPacketProcessed *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;

  v4 = (ASRSchemaASRFirstAudioPacketProcessed *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 113;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = v4;

}

- (ASRSchemaASRFirstAudioPacketProcessed)firstAudioPacketProcessed
{
  if (self->_whichEvent_Type == 113)
    return self->_firstAudioPacketProcessed;
  else
    return (ASRSchemaASRFirstAudioPacketProcessed *)0;
}

- (void)deleteFirstAudioPacketProcessed
{
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;

  if (self->_whichEvent_Type == 113)
  {
    self->_whichEvent_Type = 0;
    firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
    self->_firstAudioPacketProcessed = 0;

  }
}

- (void)setFinalAudioPacketContainingSpeechReceived:(id)a3
{
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;

  v4 = (ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 114;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = v4;

}

- (ASRSchemaASRFinalAudioPacketContainingSpeechReceived)finalAudioPacketContainingSpeechReceived
{
  if (self->_whichEvent_Type == 114)
    return self->_finalAudioPacketContainingSpeechReceived;
  else
    return (ASRSchemaASRFinalAudioPacketContainingSpeechReceived *)0;
}

- (void)deleteFinalAudioPacketContainingSpeechReceived
{
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;

  if (self->_whichEvent_Type == 114)
  {
    self->_whichEvent_Type = 0;
    finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
    self->_finalAudioPacketContainingSpeechReceived = 0;

  }
}

- (void)setSampledAudioFileStored:(id)a3
{
  ASRSchemaASRSampledAudioFileStored *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;

  v4 = (ASRSchemaASRSampledAudioFileStored *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 115;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = v4;

}

- (ASRSchemaASRSampledAudioFileStored)sampledAudioFileStored
{
  if (self->_whichEvent_Type == 115)
    return self->_sampledAudioFileStored;
  else
    return (ASRSchemaASRSampledAudioFileStored *)0;
}

- (void)deleteSampledAudioFileStored
{
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;

  if (self->_whichEvent_Type == 115)
  {
    self->_whichEvent_Type = 0;
    sampledAudioFileStored = self->_sampledAudioFileStored;
    self->_sampledAudioFileStored = 0;

  }
}

- (void)setSampledAudioFileStorageFailed:(id)a3
{
  ASRSchemaASRSampledAudioFileStorageFailed *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;

  v4 = (ASRSchemaASRSampledAudioFileStorageFailed *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 116;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = v4;

}

- (ASRSchemaASRSampledAudioFileStorageFailed)sampledAudioFileStorageFailed
{
  if (self->_whichEvent_Type == 116)
    return self->_sampledAudioFileStorageFailed;
  else
    return (ASRSchemaASRSampledAudioFileStorageFailed *)0;
}

- (void)deleteSampledAudioFileStorageFailed
{
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;

  if (self->_whichEvent_Type == 116)
  {
    self->_whichEvent_Type = 0;
    sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
    self->_sampledAudioFileStorageFailed = 0;

  }
}

- (void)setSampledAudioFileEnqueued:(id)a3
{
  ASRSchemaASRSampledAudioFileEnqueued *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;

  v4 = (ASRSchemaASRSampledAudioFileEnqueued *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 117;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = v4;

}

- (ASRSchemaASRSampledAudioFileEnqueued)sampledAudioFileEnqueued
{
  if (self->_whichEvent_Type == 117)
    return self->_sampledAudioFileEnqueued;
  else
    return (ASRSchemaASRSampledAudioFileEnqueued *)0;
}

- (void)deleteSampledAudioFileEnqueued
{
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;

  if (self->_whichEvent_Type == 117)
  {
    self->_whichEvent_Type = 0;
    sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
    self->_sampledAudioFileEnqueued = 0;

  }
}

- (void)setSampledAudioFileEnqueueFailed:(id)a3
{
  ASRSchemaASRSampledAudioFileEnqueueFailed *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;

  v4 = (ASRSchemaASRSampledAudioFileEnqueueFailed *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 118;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = v4;

}

- (ASRSchemaASRSampledAudioFileEnqueueFailed)sampledAudioFileEnqueueFailed
{
  if (self->_whichEvent_Type == 118)
    return self->_sampledAudioFileEnqueueFailed;
  else
    return (ASRSchemaASRSampledAudioFileEnqueueFailed *)0;
}

- (void)deleteSampledAudioFileEnqueueFailed
{
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;

  if (self->_whichEvent_Type == 118)
  {
    self->_whichEvent_Type = 0;
    sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
    self->_sampledAudioFileEnqueueFailed = 0;

  }
}

- (void)setSampledAudioFileDeleted:(id)a3
{
  ASRSchemaASRSampledAudioFileDeleted *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;

  v4 = (ASRSchemaASRSampledAudioFileDeleted *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 119;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = v4;

}

- (ASRSchemaASRSampledAudioFileDeleted)sampledAudioFileDeleted
{
  if (self->_whichEvent_Type == 119)
    return self->_sampledAudioFileDeleted;
  else
    return (ASRSchemaASRSampledAudioFileDeleted *)0;
}

- (void)deleteSampledAudioFileDeleted
{
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;

  if (self->_whichEvent_Type == 119)
  {
    self->_whichEvent_Type = 0;
    sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
    self->_sampledAudioFileDeleted = 0;

  }
}

- (void)setSampledAudioFileDeletionFailed:(id)a3
{
  ASRSchemaASRSampledAudioFileDeletionFailed *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;

  v4 = (ASRSchemaASRSampledAudioFileDeletionFailed *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 120;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = v4;

}

- (ASRSchemaASRSampledAudioFileDeletionFailed)sampledAudioFileDeletionFailed
{
  if (self->_whichEvent_Type == 120)
    return self->_sampledAudioFileDeletionFailed;
  else
    return (ASRSchemaASRSampledAudioFileDeletionFailed *)0;
}

- (void)deleteSampledAudioFileDeletionFailed
{
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;

  if (self->_whichEvent_Type == 120)
  {
    self->_whichEvent_Type = 0;
    sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
    self->_sampledAudioFileDeletionFailed = 0;

  }
}

- (void)setAppleNeuralEngineCompilationContext:(id)a3
{
  ASRSchemaASRAppleNeuralEngineCompilationContext *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;

  v4 = (ASRSchemaASRAppleNeuralEngineCompilationContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 121;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = v4;

}

- (ASRSchemaASRAppleNeuralEngineCompilationContext)appleNeuralEngineCompilationContext
{
  if (self->_whichEvent_Type == 121)
    return self->_appleNeuralEngineCompilationContext;
  else
    return (ASRSchemaASRAppleNeuralEngineCompilationContext *)0;
}

- (void)deleteAppleNeuralEngineCompilationContext
{
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;

  if (self->_whichEvent_Type == 121)
  {
    self->_whichEvent_Type = 0;
    appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
    self->_appleNeuralEngineCompilationContext = 0;

  }
}

- (void)setDictationVoiceCommandMetricsReported:(id)a3
{
  ASRSchemaASRDictationVoiceCommandMetricsReported *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;

  v4 = (ASRSchemaASRDictationVoiceCommandMetricsReported *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 122;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = v4;

}

- (ASRSchemaASRDictationVoiceCommandMetricsReported)dictationVoiceCommandMetricsReported
{
  if (self->_whichEvent_Type == 122)
    return self->_dictationVoiceCommandMetricsReported;
  else
    return (ASRSchemaASRDictationVoiceCommandMetricsReported *)0;
}

- (void)deleteDictationVoiceCommandMetricsReported
{
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;

  if (self->_whichEvent_Type == 122)
  {
    self->_whichEvent_Type = 0;
    dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
    self->_dictationVoiceCommandMetricsReported = 0;

  }
}

- (void)setAppLanguageModelLoadContext:(id)a3
{
  ASRSchemaASRAppLanguageModelLoadContext *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;

  v4 = (ASRSchemaASRAppLanguageModelLoadContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 123;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = v4;

}

- (ASRSchemaASRAppLanguageModelLoadContext)appLanguageModelLoadContext
{
  if (self->_whichEvent_Type == 123)
    return self->_appLanguageModelLoadContext;
  else
    return (ASRSchemaASRAppLanguageModelLoadContext *)0;
}

- (void)deleteAppLanguageModelLoadContext
{
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;

  if (self->_whichEvent_Type == 123)
  {
    self->_whichEvent_Type = 0;
    appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
    self->_appLanguageModelLoadContext = 0;

  }
}

- (void)setEmbeddedSpeechProcessContext:(id)a3
{
  ASRSchemaASREmbeddedSpeechProcessContext *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;

  v4 = (ASRSchemaASREmbeddedSpeechProcessContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 124;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = v4;

}

- (ASRSchemaASREmbeddedSpeechProcessContext)embeddedSpeechProcessContext
{
  if (self->_whichEvent_Type == 124)
    return self->_embeddedSpeechProcessContext;
  else
    return (ASRSchemaASREmbeddedSpeechProcessContext *)0;
}

- (void)deleteEmbeddedSpeechProcessContext
{
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;

  if (self->_whichEvent_Type == 124)
  {
    self->_whichEvent_Type = 0;
    embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
    self->_embeddedSpeechProcessContext = 0;

  }
}

- (void)setManualEditTextClassified:(id)a3
{
  ASRSchemaASRManualEditTextClassified *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;

  v4 = (ASRSchemaASRManualEditTextClassified *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 125;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = v4;

}

- (ASRSchemaASRManualEditTextClassified)manualEditTextClassified
{
  if (self->_whichEvent_Type == 125)
    return self->_manualEditTextClassified;
  else
    return (ASRSchemaASRManualEditTextClassified *)0;
}

- (void)deleteManualEditTextClassified
{
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;

  if (self->_whichEvent_Type == 125)
  {
    self->_whichEvent_Type = 0;
    manualEditTextClassified = self->_manualEditTextClassified;
    self->_manualEditTextClassified = 0;

  }
}

- (void)setManualEditMetricClassified:(id)a3
{
  ASRSchemaASRManualEditMetricClassified *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;

  v4 = (ASRSchemaASRManualEditMetricClassified *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 126;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = v4;

}

- (ASRSchemaASRManualEditMetricClassified)manualEditMetricClassified
{
  if (self->_whichEvent_Type == 126)
    return self->_manualEditMetricClassified;
  else
    return (ASRSchemaASRManualEditMetricClassified *)0;
}

- (void)deleteManualEditMetricClassified
{
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;

  if (self->_whichEvent_Type == 126)
  {
    self->_whichEvent_Type = 0;
    manualEditMetricClassified = self->_manualEditMetricClassified;
    self->_manualEditMetricClassified = 0;

  }
}

- (void)setManualEditClassificationContext:(id)a3
{
  ASRSchemaASRManualEditClassificationContext *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;

  v4 = (ASRSchemaASRManualEditClassificationContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 127;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = v4;

}

- (ASRSchemaASRManualEditClassificationContext)manualEditClassificationContext
{
  if (self->_whichEvent_Type == 127)
    return self->_manualEditClassificationContext;
  else
    return (ASRSchemaASRManualEditClassificationContext *)0;
}

- (void)deleteManualEditClassificationContext
{
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;

  if (self->_whichEvent_Type == 127)
  {
    self->_whichEvent_Type = 0;
    manualEditClassificationContext = self->_manualEditClassificationContext;
    self->_manualEditClassificationContext = 0;

  }
}

- (void)setActiveConfigUpdateContext:(id)a3
{
  ASRSchemaASRActiveConfigUpdateContext *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;

  v4 = (ASRSchemaASRActiveConfigUpdateContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  self->_whichEvent_Type = (unint64_t)(v4 != 0) << 7;
  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = v4;

}

- (ASRSchemaASRActiveConfigUpdateContext)activeConfigUpdateContext
{
  if (self->_whichEvent_Type == 128)
    return self->_activeConfigUpdateContext;
  else
    return (ASRSchemaASRActiveConfigUpdateContext *)0;
}

- (void)deleteActiveConfigUpdateContext
{
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;

  if (self->_whichEvent_Type == 128)
  {
    self->_whichEvent_Type = 0;
    activeConfigUpdateContext = self->_activeConfigUpdateContext;
    self->_activeConfigUpdateContext = 0;

  }
}

- (void)setAppleNeuralEngineModelInitializationContext:(id)a3
{
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;

  v4 = (ASRSchemaASRAppleNeuralEngineModelInitializationContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 129;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = v4;

}

- (ASRSchemaASRAppleNeuralEngineModelInitializationContext)appleNeuralEngineModelInitializationContext
{
  if (self->_whichEvent_Type == 129)
    return self->_appleNeuralEngineModelInitializationContext;
  else
    return (ASRSchemaASRAppleNeuralEngineModelInitializationContext *)0;
}

- (void)deleteAppleNeuralEngineModelInitializationContext
{
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;

  if (self->_whichEvent_Type == 129)
  {
    self->_whichEvent_Type = 0;
    appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
    self->_appleNeuralEngineModelInitializationContext = 0;

  }
}

- (void)setFrameProcessingReady:(id)a3
{
  ASRSchemaASRFrameProcessingReady *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;

  v4 = (ASRSchemaASRFrameProcessingReady *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 130;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = v4;

}

- (ASRSchemaASRFrameProcessingReady)frameProcessingReady
{
  if (self->_whichEvent_Type == 130)
    return self->_frameProcessingReady;
  else
    return (ASRSchemaASRFrameProcessingReady *)0;
}

- (void)deleteFrameProcessingReady
{
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;

  if (self->_whichEvent_Type == 130)
  {
    self->_whichEvent_Type = 0;
    frameProcessingReady = self->_frameProcessingReady;
    self->_frameProcessingReady = 0;

  }
}

- (void)setLeadingSilenceProcessed:(id)a3
{
  ASRSchemaASRLeadingSilenceProcessed *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;

  v4 = (ASRSchemaASRLeadingSilenceProcessed *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 131;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = v4;

}

- (ASRSchemaASRLeadingSilenceProcessed)leadingSilenceProcessed
{
  if (self->_whichEvent_Type == 131)
    return self->_leadingSilenceProcessed;
  else
    return (ASRSchemaASRLeadingSilenceProcessed *)0;
}

- (void)deleteLeadingSilenceProcessed
{
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;

  if (self->_whichEvent_Type == 131)
  {
    self->_whichEvent_Type = 0;
    leadingSilenceProcessed = self->_leadingSilenceProcessed;
    self->_leadingSilenceProcessed = 0;

  }
}

- (void)setFirstSecondAfterLeadingSilenceProcessed:(id)a3
{
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;

  v4 = (ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 132;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = v4;

}

- (ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed)firstSecondAfterLeadingSilenceProcessed
{
  if (self->_whichEvent_Type == 132)
    return self->_firstSecondAfterLeadingSilenceProcessed;
  else
    return (ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *)0;
}

- (void)deleteFirstSecondAfterLeadingSilenceProcessed
{
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;

  if (self->_whichEvent_Type == 132)
  {
    self->_whichEvent_Type = 0;
    firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
    self->_firstSecondAfterLeadingSilenceProcessed = 0;

  }
}

- (void)setAudioSpeechPacketArrivalContext:(id)a3
{
  ASRSchemaASRAudioSpeechPacketArrivalContext *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;

  v4 = (ASRSchemaASRAudioSpeechPacketArrivalContext *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 133;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = v4;

}

- (ASRSchemaASRAudioSpeechPacketArrivalContext)audioSpeechPacketArrivalContext
{
  if (self->_whichEvent_Type == 133)
    return self->_audioSpeechPacketArrivalContext;
  else
    return (ASRSchemaASRAudioSpeechPacketArrivalContext *)0;
}

- (void)deleteAudioSpeechPacketArrivalContext
{
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;

  if (self->_whichEvent_Type == 133)
  {
    self->_whichEvent_Type = 0;
    audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
    self->_audioSpeechPacketArrivalContext = 0;

  }
}

- (void)setAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:(id)a3
{
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;

  v4 = (ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 134;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = v4;

}

- (ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived)audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived
{
  if (self->_whichEvent_Type == 134)
    return self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  else
    return (ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *)0;
}

- (void)deleteAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived
{
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;

  if (self->_whichEvent_Type == 134)
  {
    self->_whichEvent_Type = 0;
    audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
    self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  }
}

- (void)setFirstAudioPacketRecorded:(id)a3
{
  ASRSchemaASRFirstAudioPacketRecorded *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;

  v4 = (ASRSchemaASRFirstAudioPacketRecorded *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 135;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = v4;

}

- (ASRSchemaASRFirstAudioPacketRecorded)firstAudioPacketRecorded
{
  if (self->_whichEvent_Type == 135)
    return self->_firstAudioPacketRecorded;
  else
    return (ASRSchemaASRFirstAudioPacketRecorded *)0;
}

- (void)deleteFirstAudioPacketRecorded
{
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;

  if (self->_whichEvent_Type == 135)
  {
    self->_whichEvent_Type = 0;
    firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
    self->_firstAudioPacketRecorded = 0;

  }
}

- (void)setAudioPacketContainingEndOfFirstWordReadyUpstream:(id)a3
{
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;

  v4 = (ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 136;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = v4;

}

- (ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream)audioPacketContainingEndOfFirstWordReadyUpstream
{
  if (self->_whichEvent_Type == 136)
    return self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  else
    return (ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *)0;
}

- (void)deleteAudioPacketContainingEndOfFirstWordReadyUpstream
{
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;

  if (self->_whichEvent_Type == 136)
  {
    self->_whichEvent_Type = 0;
    audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
    self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  }
}

- (void)setFirstAudioPacketReadyUpstream:(id)a3
{
  ASRSchemaASRFirstAudioPacketReadyUpstream *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;

  v4 = (ASRSchemaASRFirstAudioPacketReadyUpstream *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 137;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = v4;

}

- (ASRSchemaASRFirstAudioPacketReadyUpstream)firstAudioPacketReadyUpstream
{
  if (self->_whichEvent_Type == 137)
    return self->_firstAudioPacketReadyUpstream;
  else
    return (ASRSchemaASRFirstAudioPacketReadyUpstream *)0;
}

- (void)deleteFirstAudioPacketReadyUpstream
{
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;

  if (self->_whichEvent_Type == 137)
  {
    self->_whichEvent_Type = 0;
    firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
    self->_firstAudioPacketReadyUpstream = 0;

  }
}

- (void)setFinalAudioPacketContainingSpeechReadyUpstream:(id)a3
{
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;

  v4 = (ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 138;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = v4;

}

- (ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream)finalAudioPacketContainingSpeechReadyUpstream
{
  if (self->_whichEvent_Type == 138)
    return self->_finalAudioPacketContainingSpeechReadyUpstream;
  else
    return (ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *)0;
}

- (void)deleteFinalAudioPacketContainingSpeechReadyUpstream
{
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;

  if (self->_whichEvent_Type == 138)
  {
    self->_whichEvent_Type = 0;
    finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
    self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  }
}

- (void)setAlternativeSelectionTextCategorized:(id)a3
{
  ASRSchemaASRAlternativeSelectionTextCategorized *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;
  unint64_t v44;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;

  v4 = (ASRSchemaASRAlternativeSelectionTextCategorized *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = 0;

  v44 = 139;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = v4;

}

- (ASRSchemaASRAlternativeSelectionTextCategorized)alternativeSelectionTextCategorized
{
  if (self->_whichEvent_Type == 139)
    return self->_alternativeSelectionTextCategorized;
  else
    return (ASRSchemaASRAlternativeSelectionTextCategorized *)0;
}

- (void)deleteAlternativeSelectionTextCategorized
{
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;

  if (self->_whichEvent_Type == 139)
  {
    self->_whichEvent_Type = 0;
    alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
    self->_alternativeSelectionTextCategorized = 0;

  }
}

- (void)setDictationVoiceCommandInfoTier1:(id)a3
{
  ASRSchemaASRDictationVoiceCommandInfoTier1 *v4;
  ASRSchemaASRPreheatContext *preheatContext;
  ASRSchemaASRRequestContext *requestContext;
  ASRSchemaASRPartialResultGenerated *partialResultGenerated;
  ASRSchemaASRPackageGenerated *packageGenerated;
  ASRSchemaASRRecognitionResultTier1 *recognitionResultTier1;
  ASRSchemaASRFinalResultGenerated *finalResultGenerated;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *intermediateUtteranceInfoTier1;
  ASRSchemaASRInitializationContext *initializationContext;
  ASRSchemaASRAssetLoadContext *assetLoadContext;
  ASRSchemaASRJitLanguageModelEnrollmentContext *languageModelEnrollmentContext;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *jitLanguageModelEnrollmentEndedTier1;
  ASRSchemaASRAudioPacketArrivalContext *audioPacketArrivalContext;
  ASRSchemaASRFirstAudioPacketProcessed *firstAudioPacketProcessed;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *finalAudioPacketContainingSpeechReceived;
  ASRSchemaASRSampledAudioFileStored *sampledAudioFileStored;
  ASRSchemaASRSampledAudioFileStorageFailed *sampledAudioFileStorageFailed;
  ASRSchemaASRSampledAudioFileEnqueued *sampledAudioFileEnqueued;
  ASRSchemaASRSampledAudioFileEnqueueFailed *sampledAudioFileEnqueueFailed;
  ASRSchemaASRSampledAudioFileDeleted *sampledAudioFileDeleted;
  ASRSchemaASRSampledAudioFileDeletionFailed *sampledAudioFileDeletionFailed;
  ASRSchemaASRAppleNeuralEngineCompilationContext *appleNeuralEngineCompilationContext;
  ASRSchemaASRDictationVoiceCommandMetricsReported *dictationVoiceCommandMetricsReported;
  ASRSchemaASRAppLanguageModelLoadContext *appLanguageModelLoadContext;
  ASRSchemaASREmbeddedSpeechProcessContext *embeddedSpeechProcessContext;
  ASRSchemaASRManualEditTextClassified *manualEditTextClassified;
  ASRSchemaASRManualEditMetricClassified *manualEditMetricClassified;
  ASRSchemaASRManualEditClassificationContext *manualEditClassificationContext;
  ASRSchemaASRActiveConfigUpdateContext *activeConfigUpdateContext;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *appleNeuralEngineModelInitializationContext;
  ASRSchemaASRFrameProcessingReady *frameProcessingReady;
  ASRSchemaASRLeadingSilenceProcessed *leadingSilenceProcessed;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *firstSecondAfterLeadingSilenceProcessed;
  ASRSchemaASRAudioSpeechPacketArrivalContext *audioSpeechPacketArrivalContext;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  ASRSchemaASRFirstAudioPacketRecorded *firstAudioPacketRecorded;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *audioPacketContainingEndOfFirstWordReadyUpstream;
  ASRSchemaASRFirstAudioPacketReadyUpstream *firstAudioPacketReadyUpstream;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *finalAudioPacketContainingSpeechReadyUpstream;
  ASRSchemaASRAlternativeSelectionTextCategorized *alternativeSelectionTextCategorized;
  unint64_t v44;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;

  v4 = (ASRSchemaASRDictationVoiceCommandInfoTier1 *)a3;
  preheatContext = self->_preheatContext;
  self->_preheatContext = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  partialResultGenerated = self->_partialResultGenerated;
  self->_partialResultGenerated = 0;

  packageGenerated = self->_packageGenerated;
  self->_packageGenerated = 0;

  recognitionResultTier1 = self->_recognitionResultTier1;
  self->_recognitionResultTier1 = 0;

  finalResultGenerated = self->_finalResultGenerated;
  self->_finalResultGenerated = 0;

  intermediateUtteranceInfoTier1 = self->_intermediateUtteranceInfoTier1;
  self->_intermediateUtteranceInfoTier1 = 0;

  initializationContext = self->_initializationContext;
  self->_initializationContext = 0;

  assetLoadContext = self->_assetLoadContext;
  self->_assetLoadContext = 0;

  languageModelEnrollmentContext = self->_languageModelEnrollmentContext;
  self->_languageModelEnrollmentContext = 0;

  jitLanguageModelEnrollmentEndedTier1 = self->_jitLanguageModelEnrollmentEndedTier1;
  self->_jitLanguageModelEnrollmentEndedTier1 = 0;

  audioPacketArrivalContext = self->_audioPacketArrivalContext;
  self->_audioPacketArrivalContext = 0;

  firstAudioPacketProcessed = self->_firstAudioPacketProcessed;
  self->_firstAudioPacketProcessed = 0;

  finalAudioPacketContainingSpeechReceived = self->_finalAudioPacketContainingSpeechReceived;
  self->_finalAudioPacketContainingSpeechReceived = 0;

  sampledAudioFileStored = self->_sampledAudioFileStored;
  self->_sampledAudioFileStored = 0;

  sampledAudioFileStorageFailed = self->_sampledAudioFileStorageFailed;
  self->_sampledAudioFileStorageFailed = 0;

  sampledAudioFileEnqueued = self->_sampledAudioFileEnqueued;
  self->_sampledAudioFileEnqueued = 0;

  sampledAudioFileEnqueueFailed = self->_sampledAudioFileEnqueueFailed;
  self->_sampledAudioFileEnqueueFailed = 0;

  sampledAudioFileDeleted = self->_sampledAudioFileDeleted;
  self->_sampledAudioFileDeleted = 0;

  sampledAudioFileDeletionFailed = self->_sampledAudioFileDeletionFailed;
  self->_sampledAudioFileDeletionFailed = 0;

  appleNeuralEngineCompilationContext = self->_appleNeuralEngineCompilationContext;
  self->_appleNeuralEngineCompilationContext = 0;

  dictationVoiceCommandMetricsReported = self->_dictationVoiceCommandMetricsReported;
  self->_dictationVoiceCommandMetricsReported = 0;

  appLanguageModelLoadContext = self->_appLanguageModelLoadContext;
  self->_appLanguageModelLoadContext = 0;

  embeddedSpeechProcessContext = self->_embeddedSpeechProcessContext;
  self->_embeddedSpeechProcessContext = 0;

  manualEditTextClassified = self->_manualEditTextClassified;
  self->_manualEditTextClassified = 0;

  manualEditMetricClassified = self->_manualEditMetricClassified;
  self->_manualEditMetricClassified = 0;

  manualEditClassificationContext = self->_manualEditClassificationContext;
  self->_manualEditClassificationContext = 0;

  activeConfigUpdateContext = self->_activeConfigUpdateContext;
  self->_activeConfigUpdateContext = 0;

  appleNeuralEngineModelInitializationContext = self->_appleNeuralEngineModelInitializationContext;
  self->_appleNeuralEngineModelInitializationContext = 0;

  frameProcessingReady = self->_frameProcessingReady;
  self->_frameProcessingReady = 0;

  leadingSilenceProcessed = self->_leadingSilenceProcessed;
  self->_leadingSilenceProcessed = 0;

  firstSecondAfterLeadingSilenceProcessed = self->_firstSecondAfterLeadingSilenceProcessed;
  self->_firstSecondAfterLeadingSilenceProcessed = 0;

  audioSpeechPacketArrivalContext = self->_audioSpeechPacketArrivalContext;
  self->_audioSpeechPacketArrivalContext = 0;

  audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
  self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = 0;

  firstAudioPacketRecorded = self->_firstAudioPacketRecorded;
  self->_firstAudioPacketRecorded = 0;

  audioPacketContainingEndOfFirstWordReadyUpstream = self->_audioPacketContainingEndOfFirstWordReadyUpstream;
  self->_audioPacketContainingEndOfFirstWordReadyUpstream = 0;

  firstAudioPacketReadyUpstream = self->_firstAudioPacketReadyUpstream;
  self->_firstAudioPacketReadyUpstream = 0;

  finalAudioPacketContainingSpeechReadyUpstream = self->_finalAudioPacketContainingSpeechReadyUpstream;
  self->_finalAudioPacketContainingSpeechReadyUpstream = 0;

  alternativeSelectionTextCategorized = self->_alternativeSelectionTextCategorized;
  self->_alternativeSelectionTextCategorized = 0;

  v44 = 140;
  if (!v4)
    v44 = 0;
  self->_whichEvent_Type = v44;
  dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
  self->_dictationVoiceCommandInfoTier1 = v4;

}

- (ASRSchemaASRDictationVoiceCommandInfoTier1)dictationVoiceCommandInfoTier1
{
  if (self->_whichEvent_Type == 140)
    return self->_dictationVoiceCommandInfoTier1;
  else
    return (ASRSchemaASRDictationVoiceCommandInfoTier1 *)0;
}

- (void)deleteDictationVoiceCommandInfoTier1
{
  ASRSchemaASRDictationVoiceCommandInfoTier1 *dictationVoiceCommandInfoTier1;

  if (self->_whichEvent_Type == 140)
  {
    self->_whichEvent_Type = 0;
    dictationVoiceCommandInfoTier1 = self->_dictationVoiceCommandInfoTier1;
    self->_dictationVoiceCommandInfoTier1 = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRClientEventReadFrom(self, (uint64_t)a3);
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
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;

  v86 = a3;
  -[ASRSchemaASRClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASRSchemaASRClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent preheatContext](self, "preheatContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ASRSchemaASRClientEvent preheatContext](self, "preheatContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent requestContext](self, "requestContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ASRSchemaASRClientEvent requestContext](self, "requestContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent partialResultGenerated](self, "partialResultGenerated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ASRSchemaASRClientEvent partialResultGenerated](self, "partialResultGenerated");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent packageGenerated](self, "packageGenerated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ASRSchemaASRClientEvent packageGenerated](self, "packageGenerated");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent recognitionResultTier1](self, "recognitionResultTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ASRSchemaASRClientEvent recognitionResultTier1](self, "recognitionResultTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent finalResultGenerated](self, "finalResultGenerated");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[ASRSchemaASRClientEvent finalResultGenerated](self, "finalResultGenerated");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent intermediateUtteranceInfoTier1](self, "intermediateUtteranceInfoTier1");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[ASRSchemaASRClientEvent intermediateUtteranceInfoTier1](self, "intermediateUtteranceInfoTier1");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent initializationContext](self, "initializationContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[ASRSchemaASRClientEvent initializationContext](self, "initializationContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent assetLoadContext](self, "assetLoadContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[ASRSchemaASRClientEvent assetLoadContext](self, "assetLoadContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent languageModelEnrollmentContext](self, "languageModelEnrollmentContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[ASRSchemaASRClientEvent languageModelEnrollmentContext](self, "languageModelEnrollmentContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent jitLanguageModelEnrollmentEndedTier1](self, "jitLanguageModelEnrollmentEndedTier1");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[ASRSchemaASRClientEvent jitLanguageModelEnrollmentEndedTier1](self, "jitLanguageModelEnrollmentEndedTier1");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent audioPacketArrivalContext](self, "audioPacketArrivalContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[ASRSchemaASRClientEvent audioPacketArrivalContext](self, "audioPacketArrivalContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent firstAudioPacketProcessed](self, "firstAudioPacketProcessed");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[ASRSchemaASRClientEvent firstAudioPacketProcessed](self, "firstAudioPacketProcessed");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReceived](self, "finalAudioPacketContainingSpeechReceived");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReceived](self, "finalAudioPacketContainingSpeechReceived");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent sampledAudioFileStored](self, "sampledAudioFileStored");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[ASRSchemaASRClientEvent sampledAudioFileStored](self, "sampledAudioFileStored");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent sampledAudioFileStorageFailed](self, "sampledAudioFileStorageFailed");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[ASRSchemaASRClientEvent sampledAudioFileStorageFailed](self, "sampledAudioFileStorageFailed");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent sampledAudioFileEnqueued](self, "sampledAudioFileEnqueued");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[ASRSchemaASRClientEvent sampledAudioFileEnqueued](self, "sampledAudioFileEnqueued");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent sampledAudioFileEnqueueFailed](self, "sampledAudioFileEnqueueFailed");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[ASRSchemaASRClientEvent sampledAudioFileEnqueueFailed](self, "sampledAudioFileEnqueueFailed");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent sampledAudioFileDeleted](self, "sampledAudioFileDeleted");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[ASRSchemaASRClientEvent sampledAudioFileDeleted](self, "sampledAudioFileDeleted");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent sampledAudioFileDeletionFailed](self, "sampledAudioFileDeletionFailed");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[ASRSchemaASRClientEvent sampledAudioFileDeletionFailed](self, "sampledAudioFileDeletionFailed");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent appleNeuralEngineCompilationContext](self, "appleNeuralEngineCompilationContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[ASRSchemaASRClientEvent appleNeuralEngineCompilationContext](self, "appleNeuralEngineCompilationContext");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent dictationVoiceCommandMetricsReported](self, "dictationVoiceCommandMetricsReported");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[ASRSchemaASRClientEvent dictationVoiceCommandMetricsReported](self, "dictationVoiceCommandMetricsReported");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent appLanguageModelLoadContext](self, "appLanguageModelLoadContext");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[ASRSchemaASRClientEvent appLanguageModelLoadContext](self, "appLanguageModelLoadContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent embeddedSpeechProcessContext](self, "embeddedSpeechProcessContext");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[ASRSchemaASRClientEvent embeddedSpeechProcessContext](self, "embeddedSpeechProcessContext");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent manualEditTextClassified](self, "manualEditTextClassified");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[ASRSchemaASRClientEvent manualEditTextClassified](self, "manualEditTextClassified");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent manualEditMetricClassified](self, "manualEditMetricClassified");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[ASRSchemaASRClientEvent manualEditMetricClassified](self, "manualEditMetricClassified");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent manualEditClassificationContext](self, "manualEditClassificationContext");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    -[ASRSchemaASRClientEvent manualEditClassificationContext](self, "manualEditClassificationContext");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent activeConfigUpdateContext](self, "activeConfigUpdateContext");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    -[ASRSchemaASRClientEvent activeConfigUpdateContext](self, "activeConfigUpdateContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent appleNeuralEngineModelInitializationContext](self, "appleNeuralEngineModelInitializationContext");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[ASRSchemaASRClientEvent appleNeuralEngineModelInitializationContext](self, "appleNeuralEngineModelInitializationContext");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent frameProcessingReady](self, "frameProcessingReady");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[ASRSchemaASRClientEvent frameProcessingReady](self, "frameProcessingReady");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent leadingSilenceProcessed](self, "leadingSilenceProcessed");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    -[ASRSchemaASRClientEvent leadingSilenceProcessed](self, "leadingSilenceProcessed");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent firstSecondAfterLeadingSilenceProcessed](self, "firstSecondAfterLeadingSilenceProcessed");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    -[ASRSchemaASRClientEvent firstSecondAfterLeadingSilenceProcessed](self, "firstSecondAfterLeadingSilenceProcessed");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent audioSpeechPacketArrivalContext](self, "audioSpeechPacketArrivalContext");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[ASRSchemaASRClientEvent audioSpeechPacketArrivalContext](self, "audioSpeechPacketArrivalContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived](self, "audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    -[ASRSchemaASRClientEvent audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived](self, "audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent firstAudioPacketRecorded](self, "firstAudioPacketRecorded");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    -[ASRSchemaASRClientEvent firstAudioPacketRecorded](self, "firstAudioPacketRecorded");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent audioPacketContainingEndOfFirstWordReadyUpstream](self, "audioPacketContainingEndOfFirstWordReadyUpstream");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    -[ASRSchemaASRClientEvent audioPacketContainingEndOfFirstWordReadyUpstream](self, "audioPacketContainingEndOfFirstWordReadyUpstream");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent firstAudioPacketReadyUpstream](self, "firstAudioPacketReadyUpstream");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    -[ASRSchemaASRClientEvent firstAudioPacketReadyUpstream](self, "firstAudioPacketReadyUpstream");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReadyUpstream](self, "finalAudioPacketContainingSpeechReadyUpstream");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReadyUpstream](self, "finalAudioPacketContainingSpeechReadyUpstream");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent alternativeSelectionTextCategorized](self, "alternativeSelectionTextCategorized");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    -[ASRSchemaASRClientEvent alternativeSelectionTextCategorized](self, "alternativeSelectionTextCategorized");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ASRSchemaASRClientEvent dictationVoiceCommandInfoTier1](self, "dictationVoiceCommandInfoTier1");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    -[ASRSchemaASRClientEvent dictationVoiceCommandInfoTier1](self, "dictationVoiceCommandInfoTier1");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  int v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  int v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  int v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  int v157;
  uint64_t v158;
  void *v159;
  void *v160;
  void *v161;
  int v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  int v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  int v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void *v176;
  int v177;
  uint64_t v178;
  void *v179;
  void *v180;
  void *v181;
  int v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  int v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  int v192;
  uint64_t v193;
  void *v194;
  void *v195;
  void *v196;
  int v197;
  uint64_t v198;
  void *v199;
  void *v200;
  void *v201;
  int v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  int v207;
  uint64_t v208;
  void *v209;
  void *v210;
  void *v211;
  char v212;
  BOOL v213;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_208;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_208;
  -[ASRSchemaASRClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ASRSchemaASRClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent preheatContext](self, "preheatContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preheatContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent preheatContext](self, "preheatContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ASRSchemaASRClientEvent preheatContext](self, "preheatContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preheatContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent requestContext](self, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent requestContext](self, "requestContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[ASRSchemaASRClientEvent requestContext](self, "requestContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent partialResultGenerated](self, "partialResultGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "partialResultGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent partialResultGenerated](self, "partialResultGenerated");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[ASRSchemaASRClientEvent partialResultGenerated](self, "partialResultGenerated");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "partialResultGenerated");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent packageGenerated](self, "packageGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "packageGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent packageGenerated](self, "packageGenerated");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[ASRSchemaASRClientEvent packageGenerated](self, "packageGenerated");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "packageGenerated");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent recognitionResultTier1](self, "recognitionResultTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recognitionResultTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent recognitionResultTier1](self, "recognitionResultTier1");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[ASRSchemaASRClientEvent recognitionResultTier1](self, "recognitionResultTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recognitionResultTier1");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent finalResultGenerated](self, "finalResultGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalResultGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent finalResultGenerated](self, "finalResultGenerated");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[ASRSchemaASRClientEvent finalResultGenerated](self, "finalResultGenerated");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finalResultGenerated");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent intermediateUtteranceInfoTier1](self, "intermediateUtteranceInfoTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intermediateUtteranceInfoTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent intermediateUtteranceInfoTier1](self, "intermediateUtteranceInfoTier1");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[ASRSchemaASRClientEvent intermediateUtteranceInfoTier1](self, "intermediateUtteranceInfoTier1");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intermediateUtteranceInfoTier1");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent initializationContext](self, "initializationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initializationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent initializationContext](self, "initializationContext");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[ASRSchemaASRClientEvent initializationContext](self, "initializationContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "initializationContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent assetLoadContext](self, "assetLoadContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetLoadContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent assetLoadContext](self, "assetLoadContext");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[ASRSchemaASRClientEvent assetLoadContext](self, "assetLoadContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetLoadContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent languageModelEnrollmentContext](self, "languageModelEnrollmentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageModelEnrollmentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent languageModelEnrollmentContext](self, "languageModelEnrollmentContext");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[ASRSchemaASRClientEvent languageModelEnrollmentContext](self, "languageModelEnrollmentContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageModelEnrollmentContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent jitLanguageModelEnrollmentEndedTier1](self, "jitLanguageModelEnrollmentEndedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jitLanguageModelEnrollmentEndedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent jitLanguageModelEnrollmentEndedTier1](self, "jitLanguageModelEnrollmentEndedTier1");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[ASRSchemaASRClientEvent jitLanguageModelEnrollmentEndedTier1](self, "jitLanguageModelEnrollmentEndedTier1");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jitLanguageModelEnrollmentEndedTier1");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent audioPacketArrivalContext](self, "audioPacketArrivalContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioPacketArrivalContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent audioPacketArrivalContext](self, "audioPacketArrivalContext");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[ASRSchemaASRClientEvent audioPacketArrivalContext](self, "audioPacketArrivalContext");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioPacketArrivalContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent firstAudioPacketProcessed](self, "firstAudioPacketProcessed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstAudioPacketProcessed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent firstAudioPacketProcessed](self, "firstAudioPacketProcessed");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[ASRSchemaASRClientEvent firstAudioPacketProcessed](self, "firstAudioPacketProcessed");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstAudioPacketProcessed");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReceived](self, "finalAudioPacketContainingSpeechReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalAudioPacketContainingSpeechReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReceived](self, "finalAudioPacketContainingSpeechReceived");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReceived](self, "finalAudioPacketContainingSpeechReceived");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finalAudioPacketContainingSpeechReceived");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent sampledAudioFileStored](self, "sampledAudioFileStored");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampledAudioFileStored");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent sampledAudioFileStored](self, "sampledAudioFileStored");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[ASRSchemaASRClientEvent sampledAudioFileStored](self, "sampledAudioFileStored");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sampledAudioFileStored");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent sampledAudioFileStorageFailed](self, "sampledAudioFileStorageFailed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampledAudioFileStorageFailed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent sampledAudioFileStorageFailed](self, "sampledAudioFileStorageFailed");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[ASRSchemaASRClientEvent sampledAudioFileStorageFailed](self, "sampledAudioFileStorageFailed");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sampledAudioFileStorageFailed");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent sampledAudioFileEnqueued](self, "sampledAudioFileEnqueued");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampledAudioFileEnqueued");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent sampledAudioFileEnqueued](self, "sampledAudioFileEnqueued");
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)v93;
    -[ASRSchemaASRClientEvent sampledAudioFileEnqueued](self, "sampledAudioFileEnqueued");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sampledAudioFileEnqueued");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v95, "isEqual:", v96);

    if (!v97)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent sampledAudioFileEnqueueFailed](self, "sampledAudioFileEnqueueFailed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampledAudioFileEnqueueFailed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent sampledAudioFileEnqueueFailed](self, "sampledAudioFileEnqueueFailed");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    -[ASRSchemaASRClientEvent sampledAudioFileEnqueueFailed](self, "sampledAudioFileEnqueueFailed");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sampledAudioFileEnqueueFailed");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "isEqual:", v101);

    if (!v102)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent sampledAudioFileDeleted](self, "sampledAudioFileDeleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampledAudioFileDeleted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent sampledAudioFileDeleted](self, "sampledAudioFileDeleted");
  v103 = objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    v104 = (void *)v103;
    -[ASRSchemaASRClientEvent sampledAudioFileDeleted](self, "sampledAudioFileDeleted");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sampledAudioFileDeleted");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v105, "isEqual:", v106);

    if (!v107)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent sampledAudioFileDeletionFailed](self, "sampledAudioFileDeletionFailed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampledAudioFileDeletionFailed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent sampledAudioFileDeletionFailed](self, "sampledAudioFileDeletionFailed");
  v108 = objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    v109 = (void *)v108;
    -[ASRSchemaASRClientEvent sampledAudioFileDeletionFailed](self, "sampledAudioFileDeletionFailed");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sampledAudioFileDeletionFailed");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v110, "isEqual:", v111);

    if (!v112)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent appleNeuralEngineCompilationContext](self, "appleNeuralEngineCompilationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleNeuralEngineCompilationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent appleNeuralEngineCompilationContext](self, "appleNeuralEngineCompilationContext");
  v113 = objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    v114 = (void *)v113;
    -[ASRSchemaASRClientEvent appleNeuralEngineCompilationContext](self, "appleNeuralEngineCompilationContext");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleNeuralEngineCompilationContext");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v115, "isEqual:", v116);

    if (!v117)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent dictationVoiceCommandMetricsReported](self, "dictationVoiceCommandMetricsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationVoiceCommandMetricsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent dictationVoiceCommandMetricsReported](self, "dictationVoiceCommandMetricsReported");
  v118 = objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = (void *)v118;
    -[ASRSchemaASRClientEvent dictationVoiceCommandMetricsReported](self, "dictationVoiceCommandMetricsReported");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictationVoiceCommandMetricsReported");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v120, "isEqual:", v121);

    if (!v122)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent appLanguageModelLoadContext](self, "appLanguageModelLoadContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLanguageModelLoadContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent appLanguageModelLoadContext](self, "appLanguageModelLoadContext");
  v123 = objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    v124 = (void *)v123;
    -[ASRSchemaASRClientEvent appLanguageModelLoadContext](self, "appLanguageModelLoadContext");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLanguageModelLoadContext");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v125, "isEqual:", v126);

    if (!v127)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent embeddedSpeechProcessContext](self, "embeddedSpeechProcessContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "embeddedSpeechProcessContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent embeddedSpeechProcessContext](self, "embeddedSpeechProcessContext");
  v128 = objc_claimAutoreleasedReturnValue();
  if (v128)
  {
    v129 = (void *)v128;
    -[ASRSchemaASRClientEvent embeddedSpeechProcessContext](self, "embeddedSpeechProcessContext");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "embeddedSpeechProcessContext");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v130, "isEqual:", v131);

    if (!v132)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent manualEditTextClassified](self, "manualEditTextClassified");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manualEditTextClassified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent manualEditTextClassified](self, "manualEditTextClassified");
  v133 = objc_claimAutoreleasedReturnValue();
  if (v133)
  {
    v134 = (void *)v133;
    -[ASRSchemaASRClientEvent manualEditTextClassified](self, "manualEditTextClassified");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manualEditTextClassified");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v135, "isEqual:", v136);

    if (!v137)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent manualEditMetricClassified](self, "manualEditMetricClassified");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manualEditMetricClassified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent manualEditMetricClassified](self, "manualEditMetricClassified");
  v138 = objc_claimAutoreleasedReturnValue();
  if (v138)
  {
    v139 = (void *)v138;
    -[ASRSchemaASRClientEvent manualEditMetricClassified](self, "manualEditMetricClassified");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manualEditMetricClassified");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v140, "isEqual:", v141);

    if (!v142)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent manualEditClassificationContext](self, "manualEditClassificationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manualEditClassificationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent manualEditClassificationContext](self, "manualEditClassificationContext");
  v143 = objc_claimAutoreleasedReturnValue();
  if (v143)
  {
    v144 = (void *)v143;
    -[ASRSchemaASRClientEvent manualEditClassificationContext](self, "manualEditClassificationContext");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manualEditClassificationContext");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = objc_msgSend(v145, "isEqual:", v146);

    if (!v147)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent activeConfigUpdateContext](self, "activeConfigUpdateContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeConfigUpdateContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent activeConfigUpdateContext](self, "activeConfigUpdateContext");
  v148 = objc_claimAutoreleasedReturnValue();
  if (v148)
  {
    v149 = (void *)v148;
    -[ASRSchemaASRClientEvent activeConfigUpdateContext](self, "activeConfigUpdateContext");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeConfigUpdateContext");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = objc_msgSend(v150, "isEqual:", v151);

    if (!v152)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent appleNeuralEngineModelInitializationContext](self, "appleNeuralEngineModelInitializationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleNeuralEngineModelInitializationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent appleNeuralEngineModelInitializationContext](self, "appleNeuralEngineModelInitializationContext");
  v153 = objc_claimAutoreleasedReturnValue();
  if (v153)
  {
    v154 = (void *)v153;
    -[ASRSchemaASRClientEvent appleNeuralEngineModelInitializationContext](self, "appleNeuralEngineModelInitializationContext");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleNeuralEngineModelInitializationContext");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = objc_msgSend(v155, "isEqual:", v156);

    if (!v157)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent frameProcessingReady](self, "frameProcessingReady");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frameProcessingReady");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent frameProcessingReady](self, "frameProcessingReady");
  v158 = objc_claimAutoreleasedReturnValue();
  if (v158)
  {
    v159 = (void *)v158;
    -[ASRSchemaASRClientEvent frameProcessingReady](self, "frameProcessingReady");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frameProcessingReady");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = objc_msgSend(v160, "isEqual:", v161);

    if (!v162)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent leadingSilenceProcessed](self, "leadingSilenceProcessed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingSilenceProcessed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent leadingSilenceProcessed](self, "leadingSilenceProcessed");
  v163 = objc_claimAutoreleasedReturnValue();
  if (v163)
  {
    v164 = (void *)v163;
    -[ASRSchemaASRClientEvent leadingSilenceProcessed](self, "leadingSilenceProcessed");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingSilenceProcessed");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = objc_msgSend(v165, "isEqual:", v166);

    if (!v167)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent firstSecondAfterLeadingSilenceProcessed](self, "firstSecondAfterLeadingSilenceProcessed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstSecondAfterLeadingSilenceProcessed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent firstSecondAfterLeadingSilenceProcessed](self, "firstSecondAfterLeadingSilenceProcessed");
  v168 = objc_claimAutoreleasedReturnValue();
  if (v168)
  {
    v169 = (void *)v168;
    -[ASRSchemaASRClientEvent firstSecondAfterLeadingSilenceProcessed](self, "firstSecondAfterLeadingSilenceProcessed");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstSecondAfterLeadingSilenceProcessed");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = objc_msgSend(v170, "isEqual:", v171);

    if (!v172)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent audioSpeechPacketArrivalContext](self, "audioSpeechPacketArrivalContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioSpeechPacketArrivalContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent audioSpeechPacketArrivalContext](self, "audioSpeechPacketArrivalContext");
  v173 = objc_claimAutoreleasedReturnValue();
  if (v173)
  {
    v174 = (void *)v173;
    -[ASRSchemaASRClientEvent audioSpeechPacketArrivalContext](self, "audioSpeechPacketArrivalContext");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioSpeechPacketArrivalContext");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = objc_msgSend(v175, "isEqual:", v176);

    if (!v177)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived](self, "audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived](self, "audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived");
  v178 = objc_claimAutoreleasedReturnValue();
  if (v178)
  {
    v179 = (void *)v178;
    -[ASRSchemaASRClientEvent audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived](self, "audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = objc_msgSend(v180, "isEqual:", v181);

    if (!v182)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent firstAudioPacketRecorded](self, "firstAudioPacketRecorded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstAudioPacketRecorded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent firstAudioPacketRecorded](self, "firstAudioPacketRecorded");
  v183 = objc_claimAutoreleasedReturnValue();
  if (v183)
  {
    v184 = (void *)v183;
    -[ASRSchemaASRClientEvent firstAudioPacketRecorded](self, "firstAudioPacketRecorded");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstAudioPacketRecorded");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = objc_msgSend(v185, "isEqual:", v186);

    if (!v187)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent audioPacketContainingEndOfFirstWordReadyUpstream](self, "audioPacketContainingEndOfFirstWordReadyUpstream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioPacketContainingEndOfFirstWordReadyUpstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent audioPacketContainingEndOfFirstWordReadyUpstream](self, "audioPacketContainingEndOfFirstWordReadyUpstream");
  v188 = objc_claimAutoreleasedReturnValue();
  if (v188)
  {
    v189 = (void *)v188;
    -[ASRSchemaASRClientEvent audioPacketContainingEndOfFirstWordReadyUpstream](self, "audioPacketContainingEndOfFirstWordReadyUpstream");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioPacketContainingEndOfFirstWordReadyUpstream");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = objc_msgSend(v190, "isEqual:", v191);

    if (!v192)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent firstAudioPacketReadyUpstream](self, "firstAudioPacketReadyUpstream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstAudioPacketReadyUpstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent firstAudioPacketReadyUpstream](self, "firstAudioPacketReadyUpstream");
  v193 = objc_claimAutoreleasedReturnValue();
  if (v193)
  {
    v194 = (void *)v193;
    -[ASRSchemaASRClientEvent firstAudioPacketReadyUpstream](self, "firstAudioPacketReadyUpstream");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstAudioPacketReadyUpstream");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = objc_msgSend(v195, "isEqual:", v196);

    if (!v197)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReadyUpstream](self, "finalAudioPacketContainingSpeechReadyUpstream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalAudioPacketContainingSpeechReadyUpstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReadyUpstream](self, "finalAudioPacketContainingSpeechReadyUpstream");
  v198 = objc_claimAutoreleasedReturnValue();
  if (v198)
  {
    v199 = (void *)v198;
    -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReadyUpstream](self, "finalAudioPacketContainingSpeechReadyUpstream");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finalAudioPacketContainingSpeechReadyUpstream");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = objc_msgSend(v200, "isEqual:", v201);

    if (!v202)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent alternativeSelectionTextCategorized](self, "alternativeSelectionTextCategorized");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternativeSelectionTextCategorized");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_207;
  -[ASRSchemaASRClientEvent alternativeSelectionTextCategorized](self, "alternativeSelectionTextCategorized");
  v203 = objc_claimAutoreleasedReturnValue();
  if (v203)
  {
    v204 = (void *)v203;
    -[ASRSchemaASRClientEvent alternativeSelectionTextCategorized](self, "alternativeSelectionTextCategorized");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternativeSelectionTextCategorized");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = objc_msgSend(v205, "isEqual:", v206);

    if (!v207)
      goto LABEL_208;
  }
  else
  {

  }
  -[ASRSchemaASRClientEvent dictationVoiceCommandInfoTier1](self, "dictationVoiceCommandInfoTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationVoiceCommandInfoTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ASRSchemaASRClientEvent dictationVoiceCommandInfoTier1](self, "dictationVoiceCommandInfoTier1");
    v208 = objc_claimAutoreleasedReturnValue();
    if (!v208)
    {

LABEL_211:
      v213 = 1;
      goto LABEL_209;
    }
    v209 = (void *)v208;
    -[ASRSchemaASRClientEvent dictationVoiceCommandInfoTier1](self, "dictationVoiceCommandInfoTier1");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictationVoiceCommandInfoTier1");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = objc_msgSend(v210, "isEqual:", v211);

    if ((v212 & 1) != 0)
      goto LABEL_211;
  }
  else
  {
LABEL_207:

  }
LABEL_208:
  v213 = 0;
LABEL_209:

  return v213;
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
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;

  v3 = -[ASRSchemaASRClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[ASRSchemaASRPreheatContext hash](self->_preheatContext, "hash") ^ v3;
  v5 = -[ASRSchemaASRRequestContext hash](self->_requestContext, "hash");
  v6 = v4 ^ v5 ^ -[ASRSchemaASRPartialResultGenerated hash](self->_partialResultGenerated, "hash");
  v7 = -[ASRSchemaASRPackageGenerated hash](self->_packageGenerated, "hash");
  v8 = v7 ^ -[ASRSchemaASRRecognitionResultTier1 hash](self->_recognitionResultTier1, "hash");
  v9 = v6 ^ v8 ^ -[ASRSchemaASRFinalResultGenerated hash](self->_finalResultGenerated, "hash");
  v10 = -[ASRSchemaASRIntermediateUtteranceInfoTier1 hash](self->_intermediateUtteranceInfoTier1, "hash");
  v11 = v10 ^ -[ASRSchemaASRInitializationContext hash](self->_initializationContext, "hash");
  v12 = v11 ^ -[ASRSchemaASRAssetLoadContext hash](self->_assetLoadContext, "hash");
  v13 = v9 ^ v12 ^ -[ASRSchemaASRJitLanguageModelEnrollmentContext hash](self->_languageModelEnrollmentContext, "hash");
  v14 = -[ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 hash](self->_jitLanguageModelEnrollmentEndedTier1, "hash");
  v15 = v14 ^ -[ASRSchemaASRAudioPacketArrivalContext hash](self->_audioPacketArrivalContext, "hash");
  v16 = v15 ^ -[ASRSchemaASRFirstAudioPacketProcessed hash](self->_firstAudioPacketProcessed, "hash");
  v17 = v16 ^ -[ASRSchemaASRFinalAudioPacketContainingSpeechReceived hash](self->_finalAudioPacketContainingSpeechReceived, "hash");
  v18 = v13 ^ v17 ^ -[ASRSchemaASRSampledAudioFileStored hash](self->_sampledAudioFileStored, "hash");
  v19 = -[ASRSchemaASRSampledAudioFileStorageFailed hash](self->_sampledAudioFileStorageFailed, "hash");
  v20 = v19 ^ -[ASRSchemaASRSampledAudioFileEnqueued hash](self->_sampledAudioFileEnqueued, "hash");
  v21 = v20 ^ -[ASRSchemaASRSampledAudioFileEnqueueFailed hash](self->_sampledAudioFileEnqueueFailed, "hash");
  v22 = v21 ^ -[ASRSchemaASRSampledAudioFileDeleted hash](self->_sampledAudioFileDeleted, "hash");
  v23 = v22 ^ -[ASRSchemaASRSampledAudioFileDeletionFailed hash](self->_sampledAudioFileDeletionFailed, "hash");
  v24 = v18 ^ v23 ^ -[ASRSchemaASRAppleNeuralEngineCompilationContext hash](self->_appleNeuralEngineCompilationContext, "hash");
  v25 = -[ASRSchemaASRDictationVoiceCommandMetricsReported hash](self->_dictationVoiceCommandMetricsReported, "hash");
  v26 = v25 ^ -[ASRSchemaASRAppLanguageModelLoadContext hash](self->_appLanguageModelLoadContext, "hash");
  v27 = v26 ^ -[ASRSchemaASREmbeddedSpeechProcessContext hash](self->_embeddedSpeechProcessContext, "hash");
  v28 = v27 ^ -[ASRSchemaASRManualEditTextClassified hash](self->_manualEditTextClassified, "hash");
  v29 = v28 ^ -[ASRSchemaASRManualEditMetricClassified hash](self->_manualEditMetricClassified, "hash");
  v30 = v29 ^ -[ASRSchemaASRManualEditClassificationContext hash](self->_manualEditClassificationContext, "hash");
  v31 = v24 ^ v30 ^ -[ASRSchemaASRActiveConfigUpdateContext hash](self->_activeConfigUpdateContext, "hash");
  v32 = -[ASRSchemaASRAppleNeuralEngineModelInitializationContext hash](self->_appleNeuralEngineModelInitializationContext, "hash");
  v33 = v32 ^ -[ASRSchemaASRFrameProcessingReady hash](self->_frameProcessingReady, "hash");
  v34 = v33 ^ -[ASRSchemaASRLeadingSilenceProcessed hash](self->_leadingSilenceProcessed, "hash");
  v35 = v34 ^ -[ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed hash](self->_firstSecondAfterLeadingSilenceProcessed, "hash");
  v36 = v35 ^ -[ASRSchemaASRAudioSpeechPacketArrivalContext hash](self->_audioSpeechPacketArrivalContext, "hash");
  v37 = v36 ^ -[ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived hash](self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived, "hash");
  v38 = v37 ^ -[ASRSchemaASRFirstAudioPacketRecorded hash](self->_firstAudioPacketRecorded, "hash");
  v39 = v31 ^ v38 ^ -[ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream hash](self->_audioPacketContainingEndOfFirstWordReadyUpstream, "hash");
  v40 = -[ASRSchemaASRFirstAudioPacketReadyUpstream hash](self->_firstAudioPacketReadyUpstream, "hash");
  v41 = v40 ^ -[ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream hash](self->_finalAudioPacketContainingSpeechReadyUpstream, "hash");
  v42 = v41 ^ -[ASRSchemaASRAlternativeSelectionTextCategorized hash](self->_alternativeSelectionTextCategorized, "hash");
  return v39 ^ v42 ^ -[ASRSchemaASRDictationVoiceCommandInfoTier1 hash](self->_dictationVoiceCommandInfoTier1, "hash");
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
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_activeConfigUpdateContext)
  {
    -[ASRSchemaASRClientEvent activeConfigUpdateContext](self, "activeConfigUpdateContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("activeConfigUpdateContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("activeConfigUpdateContext"));

    }
  }
  if (self->_alternativeSelectionTextCategorized)
  {
    -[ASRSchemaASRClientEvent alternativeSelectionTextCategorized](self, "alternativeSelectionTextCategorized");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("alternativeSelectionTextCategorized"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("alternativeSelectionTextCategorized"));

    }
  }
  if (self->_appLanguageModelLoadContext)
  {
    -[ASRSchemaASRClientEvent appLanguageModelLoadContext](self, "appLanguageModelLoadContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("appLanguageModelLoadContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("appLanguageModelLoadContext"));

    }
  }
  if (self->_appleNeuralEngineCompilationContext)
  {
    -[ASRSchemaASRClientEvent appleNeuralEngineCompilationContext](self, "appleNeuralEngineCompilationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("appleNeuralEngineCompilationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("appleNeuralEngineCompilationContext"));

    }
  }
  if (self->_appleNeuralEngineModelInitializationContext)
  {
    -[ASRSchemaASRClientEvent appleNeuralEngineModelInitializationContext](self, "appleNeuralEngineModelInitializationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("appleNeuralEngineModelInitializationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("appleNeuralEngineModelInitializationContext"));

    }
  }
  if (self->_assetLoadContext)
  {
    -[ASRSchemaASRClientEvent assetLoadContext](self, "assetLoadContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("assetLoadContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("assetLoadContext"));

    }
  }
  if (self->_audioPacketArrivalContext)
  {
    -[ASRSchemaASRClientEvent audioPacketArrivalContext](self, "audioPacketArrivalContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("audioPacketArrivalContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("audioPacketArrivalContext"));

    }
  }
  if (self->_audioPacketContainingEndOfFirstWordReadyUpstream)
  {
    -[ASRSchemaASRClientEvent audioPacketContainingEndOfFirstWordReadyUpstream](self, "audioPacketContainingEndOfFirstWordReadyUpstream");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("audioPacketContainingEndOfFirstWordReadyUpstream"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("audioPacketContainingEndOfFirstWordReadyUpstream"));

    }
  }
  if (self->_audioSpeechPacketArrivalContext)
  {
    -[ASRSchemaASRClientEvent audioSpeechPacketArrivalContext](self, "audioSpeechPacketArrivalContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("audioSpeechPacketArrivalContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("audioSpeechPacketArrivalContext"));

    }
  }
  if (self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived)
  {
    -[ASRSchemaASRClientEvent audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived](self, "audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived"));

    }
  }
  if (self->_dictationVoiceCommandInfoTier1)
  {
    -[ASRSchemaASRClientEvent dictationVoiceCommandInfoTier1](self, "dictationVoiceCommandInfoTier1");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("dictationVoiceCommandInfoTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("dictationVoiceCommandInfoTier1"));

    }
  }
  if (self->_dictationVoiceCommandMetricsReported)
  {
    -[ASRSchemaASRClientEvent dictationVoiceCommandMetricsReported](self, "dictationVoiceCommandMetricsReported");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("dictationVoiceCommandMetricsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("dictationVoiceCommandMetricsReported"));

    }
  }
  if (self->_embeddedSpeechProcessContext)
  {
    -[ASRSchemaASRClientEvent embeddedSpeechProcessContext](self, "embeddedSpeechProcessContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("embeddedSpeechProcessContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("embeddedSpeechProcessContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[ASRSchemaASRClientEvent eventMetadata](self, "eventMetadata");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("eventMetadata"));

    }
  }
  if (self->_finalAudioPacketContainingSpeechReadyUpstream)
  {
    -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReadyUpstream](self, "finalAudioPacketContainingSpeechReadyUpstream");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("finalAudioPacketContainingSpeechReadyUpstream"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("finalAudioPacketContainingSpeechReadyUpstream"));

    }
  }
  if (self->_finalAudioPacketContainingSpeechReceived)
  {
    -[ASRSchemaASRClientEvent finalAudioPacketContainingSpeechReceived](self, "finalAudioPacketContainingSpeechReceived");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("finalAudioPacketContainingSpeechReceived"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("finalAudioPacketContainingSpeechReceived"));

    }
  }
  if (self->_finalResultGenerated)
  {
    -[ASRSchemaASRClientEvent finalResultGenerated](self, "finalResultGenerated");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("finalResultGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("finalResultGenerated"));

    }
  }
  if (self->_firstAudioPacketProcessed)
  {
    -[ASRSchemaASRClientEvent firstAudioPacketProcessed](self, "firstAudioPacketProcessed");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("firstAudioPacketProcessed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("firstAudioPacketProcessed"));

    }
  }
  if (self->_firstAudioPacketReadyUpstream)
  {
    -[ASRSchemaASRClientEvent firstAudioPacketReadyUpstream](self, "firstAudioPacketReadyUpstream");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("firstAudioPacketReadyUpstream"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("firstAudioPacketReadyUpstream"));

    }
  }
  if (self->_firstAudioPacketRecorded)
  {
    -[ASRSchemaASRClientEvent firstAudioPacketRecorded](self, "firstAudioPacketRecorded");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dictionaryRepresentation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("firstAudioPacketRecorded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("firstAudioPacketRecorded"));

    }
  }
  if (self->_firstSecondAfterLeadingSilenceProcessed)
  {
    -[ASRSchemaASRClientEvent firstSecondAfterLeadingSilenceProcessed](self, "firstSecondAfterLeadingSilenceProcessed");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dictionaryRepresentation");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("firstSecondAfterLeadingSilenceProcessed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("firstSecondAfterLeadingSilenceProcessed"));

    }
  }
  if (self->_frameProcessingReady)
  {
    -[ASRSchemaASRClientEvent frameProcessingReady](self, "frameProcessingReady");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("frameProcessingReady"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("frameProcessingReady"));

    }
  }
  if (self->_initializationContext)
  {
    -[ASRSchemaASRClientEvent initializationContext](self, "initializationContext");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "dictionaryRepresentation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("initializationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("initializationContext"));

    }
  }
  if (self->_intermediateUtteranceInfoTier1)
  {
    -[ASRSchemaASRClientEvent intermediateUtteranceInfoTier1](self, "intermediateUtteranceInfoTier1");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("intermediateUtteranceInfoTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("intermediateUtteranceInfoTier1"));

    }
  }
  if (self->_jitLanguageModelEnrollmentEndedTier1)
  {
    -[ASRSchemaASRClientEvent jitLanguageModelEnrollmentEndedTier1](self, "jitLanguageModelEnrollmentEndedTier1");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "dictionaryRepresentation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("jitLanguageModelEnrollmentEndedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("jitLanguageModelEnrollmentEndedTier1"));

    }
  }
  if (self->_languageModelEnrollmentContext)
  {
    -[ASRSchemaASRClientEvent languageModelEnrollmentContext](self, "languageModelEnrollmentContext");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "dictionaryRepresentation");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("languageModelEnrollmentContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("languageModelEnrollmentContext"));

    }
  }
  if (self->_leadingSilenceProcessed)
  {
    -[ASRSchemaASRClientEvent leadingSilenceProcessed](self, "leadingSilenceProcessed");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "dictionaryRepresentation");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (v83)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("leadingSilenceProcessed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("leadingSilenceProcessed"));

    }
  }
  if (self->_manualEditClassificationContext)
  {
    -[ASRSchemaASRClientEvent manualEditClassificationContext](self, "manualEditClassificationContext");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "dictionaryRepresentation");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("manualEditClassificationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("manualEditClassificationContext"));

    }
  }
  if (self->_manualEditMetricClassified)
  {
    -[ASRSchemaASRClientEvent manualEditMetricClassified](self, "manualEditMetricClassified");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "dictionaryRepresentation");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("manualEditMetricClassified"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("manualEditMetricClassified"));

    }
  }
  if (self->_manualEditTextClassified)
  {
    -[ASRSchemaASRClientEvent manualEditTextClassified](self, "manualEditTextClassified");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "dictionaryRepresentation");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("manualEditTextClassified"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("manualEditTextClassified"));

    }
  }
  if (self->_packageGenerated)
  {
    -[ASRSchemaASRClientEvent packageGenerated](self, "packageGenerated");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "dictionaryRepresentation");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("packageGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("packageGenerated"));

    }
  }
  if (self->_partialResultGenerated)
  {
    -[ASRSchemaASRClientEvent partialResultGenerated](self, "partialResultGenerated");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "dictionaryRepresentation");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("partialResultGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("partialResultGenerated"));

    }
  }
  if (self->_preheatContext)
  {
    -[ASRSchemaASRClientEvent preheatContext](self, "preheatContext");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "dictionaryRepresentation");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v101)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("preheatContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v102, CFSTR("preheatContext"));

    }
  }
  if (self->_recognitionResultTier1)
  {
    -[ASRSchemaASRClientEvent recognitionResultTier1](self, "recognitionResultTier1");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "dictionaryRepresentation");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v104)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v104, CFSTR("recognitionResultTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("recognitionResultTier1"));

    }
  }
  if (self->_requestContext)
  {
    -[ASRSchemaASRClientEvent requestContext](self, "requestContext");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "dictionaryRepresentation");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (v107)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v107, CFSTR("requestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("requestContext"));

    }
  }
  if (self->_sampledAudioFileDeleted)
  {
    -[ASRSchemaASRClientEvent sampledAudioFileDeleted](self, "sampledAudioFileDeleted");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "dictionaryRepresentation");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (v110)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v110, CFSTR("sampledAudioFileDeleted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v111, CFSTR("sampledAudioFileDeleted"));

    }
  }
  if (self->_sampledAudioFileDeletionFailed)
  {
    -[ASRSchemaASRClientEvent sampledAudioFileDeletionFailed](self, "sampledAudioFileDeletionFailed");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "dictionaryRepresentation");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (v113)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v113, CFSTR("sampledAudioFileDeletionFailed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v114, CFSTR("sampledAudioFileDeletionFailed"));

    }
  }
  if (self->_sampledAudioFileEnqueueFailed)
  {
    -[ASRSchemaASRClientEvent sampledAudioFileEnqueueFailed](self, "sampledAudioFileEnqueueFailed");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "dictionaryRepresentation");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (v116)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v116, CFSTR("sampledAudioFileEnqueueFailed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v117, CFSTR("sampledAudioFileEnqueueFailed"));

    }
  }
  if (self->_sampledAudioFileEnqueued)
  {
    -[ASRSchemaASRClientEvent sampledAudioFileEnqueued](self, "sampledAudioFileEnqueued");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "dictionaryRepresentation");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (v119)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v119, CFSTR("sampledAudioFileEnqueued"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v120, CFSTR("sampledAudioFileEnqueued"));

    }
  }
  if (self->_sampledAudioFileStorageFailed)
  {
    -[ASRSchemaASRClientEvent sampledAudioFileStorageFailed](self, "sampledAudioFileStorageFailed");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "dictionaryRepresentation");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (v122)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v122, CFSTR("sampledAudioFileStorageFailed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v123, CFSTR("sampledAudioFileStorageFailed"));

    }
  }
  if (self->_sampledAudioFileStored)
  {
    -[ASRSchemaASRClientEvent sampledAudioFileStored](self, "sampledAudioFileStored");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "dictionaryRepresentation");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if (v125)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v125, CFSTR("sampledAudioFileStored"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v126, CFSTR("sampledAudioFileStored"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v127 = v3;

  return v127;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRClientEvent)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRClientEvent *v5;
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
    self = -[ASRSchemaASRClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRClientEvent)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRClientEvent *v5;
  uint64_t v6;
  ASRSchemaASRClientEventMetadata *v7;
  uint64_t v8;
  ASRSchemaASRPreheatContext *v9;
  uint64_t v10;
  ASRSchemaASRRequestContext *v11;
  uint64_t v12;
  ASRSchemaASRPartialResultGenerated *v13;
  uint64_t v14;
  ASRSchemaASRPackageGenerated *v15;
  uint64_t v16;
  ASRSchemaASRRecognitionResultTier1 *v17;
  uint64_t v18;
  ASRSchemaASRFinalResultGenerated *v19;
  uint64_t v20;
  ASRSchemaASRIntermediateUtteranceInfoTier1 *v21;
  uint64_t v22;
  ASRSchemaASRInitializationContext *v23;
  uint64_t v24;
  ASRSchemaASRAssetLoadContext *v25;
  uint64_t v26;
  ASRSchemaASRJitLanguageModelEnrollmentContext *v27;
  uint64_t v28;
  ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 *v29;
  uint64_t v30;
  ASRSchemaASRAudioPacketArrivalContext *v31;
  uint64_t v32;
  ASRSchemaASRFirstAudioPacketProcessed *v33;
  uint64_t v34;
  ASRSchemaASRFinalAudioPacketContainingSpeechReceived *v35;
  uint64_t v36;
  ASRSchemaASRSampledAudioFileStored *v37;
  uint64_t v38;
  ASRSchemaASRSampledAudioFileStorageFailed *v39;
  uint64_t v40;
  ASRSchemaASRSampledAudioFileEnqueued *v41;
  uint64_t v42;
  ASRSchemaASRSampledAudioFileEnqueueFailed *v43;
  uint64_t v44;
  ASRSchemaASRSampledAudioFileDeleted *v45;
  uint64_t v46;
  ASRSchemaASRSampledAudioFileDeletionFailed *v47;
  uint64_t v48;
  ASRSchemaASRAppleNeuralEngineCompilationContext *v49;
  uint64_t v50;
  ASRSchemaASRDictationVoiceCommandMetricsReported *v51;
  uint64_t v52;
  ASRSchemaASRAppLanguageModelLoadContext *v53;
  uint64_t v54;
  ASRSchemaASREmbeddedSpeechProcessContext *v55;
  uint64_t v56;
  ASRSchemaASRManualEditTextClassified *v57;
  uint64_t v58;
  ASRSchemaASRManualEditMetricClassified *v59;
  uint64_t v60;
  ASRSchemaASRManualEditClassificationContext *v61;
  uint64_t v62;
  ASRSchemaASRActiveConfigUpdateContext *v63;
  uint64_t v64;
  ASRSchemaASRAppleNeuralEngineModelInitializationContext *v65;
  uint64_t v66;
  ASRSchemaASRFrameProcessingReady *v67;
  uint64_t v68;
  ASRSchemaASRLeadingSilenceProcessed *v69;
  uint64_t v70;
  ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed *v71;
  uint64_t v72;
  ASRSchemaASRAudioSpeechPacketArrivalContext *v73;
  void *v74;
  ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived *v75;
  void *v76;
  ASRSchemaASRFirstAudioPacketRecorded *v77;
  void *v78;
  ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream *v79;
  void *v80;
  ASRSchemaASRFirstAudioPacketReadyUpstream *v81;
  void *v82;
  ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream *v83;
  void *v84;
  ASRSchemaASRAlternativeSelectionTextCategorized *v85;
  void *v86;
  ASRSchemaASRDictationVoiceCommandInfoTier1 *v87;
  ASRSchemaASRClientEvent *v88;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  objc_super v124;

  v4 = a3;
  v124.receiver = self;
  v124.super_class = (Class)ASRSchemaASRClientEvent;
  v5 = -[ASRSchemaASRClientEvent init](&v124, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ASRSchemaASRClientEventMetadata initWithDictionary:]([ASRSchemaASRClientEventMetadata alloc], "initWithDictionary:", v6);
      -[ASRSchemaASRClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preheatContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ASRSchemaASRPreheatContext initWithDictionary:]([ASRSchemaASRPreheatContext alloc], "initWithDictionary:", v8);
      -[ASRSchemaASRClientEvent setPreheatContext:](v5, "setPreheatContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ASRSchemaASRRequestContext initWithDictionary:]([ASRSchemaASRRequestContext alloc], "initWithDictionary:", v10);
      -[ASRSchemaASRClientEvent setRequestContext:](v5, "setRequestContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("partialResultGenerated"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ASRSchemaASRPartialResultGenerated initWithDictionary:]([ASRSchemaASRPartialResultGenerated alloc], "initWithDictionary:", v12);
      -[ASRSchemaASRClientEvent setPartialResultGenerated:](v5, "setPartialResultGenerated:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("packageGenerated"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[ASRSchemaASRPackageGenerated initWithDictionary:]([ASRSchemaASRPackageGenerated alloc], "initWithDictionary:", v14);
      -[ASRSchemaASRClientEvent setPackageGenerated:](v5, "setPackageGenerated:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionResultTier1"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[ASRSchemaASRRecognitionResultTier1 initWithDictionary:]([ASRSchemaASRRecognitionResultTier1 alloc], "initWithDictionary:", v16);
      -[ASRSchemaASRClientEvent setRecognitionResultTier1:](v5, "setRecognitionResultTier1:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalResultGenerated"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v123 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[ASRSchemaASRFinalResultGenerated initWithDictionary:]([ASRSchemaASRFinalResultGenerated alloc], "initWithDictionary:", v18);
      -[ASRSchemaASRClientEvent setFinalResultGenerated:](v5, "setFinalResultGenerated:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intermediateUtteranceInfoTier1"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v122 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[ASRSchemaASRIntermediateUtteranceInfoTier1 initWithDictionary:]([ASRSchemaASRIntermediateUtteranceInfoTier1 alloc], "initWithDictionary:", v20);
      -[ASRSchemaASRClientEvent setIntermediateUtteranceInfoTier1:](v5, "setIntermediateUtteranceInfoTier1:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initializationContext"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v121 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[ASRSchemaASRInitializationContext initWithDictionary:]([ASRSchemaASRInitializationContext alloc], "initWithDictionary:", v22);
      -[ASRSchemaASRClientEvent setInitializationContext:](v5, "setInitializationContext:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetLoadContext"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v120 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[ASRSchemaASRAssetLoadContext initWithDictionary:]([ASRSchemaASRAssetLoadContext alloc], "initWithDictionary:", v24);
      -[ASRSchemaASRClientEvent setAssetLoadContext:](v5, "setAssetLoadContext:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageModelEnrollmentContext"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v119 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[ASRSchemaASRJitLanguageModelEnrollmentContext initWithDictionary:]([ASRSchemaASRJitLanguageModelEnrollmentContext alloc], "initWithDictionary:", v26);
      -[ASRSchemaASRClientEvent setLanguageModelEnrollmentContext:](v5, "setLanguageModelEnrollmentContext:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jitLanguageModelEnrollmentEndedTier1"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v118 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 initWithDictionary:]([ASRSchemaASRJitLanguageModelEnrollmentEndedTier1 alloc], "initWithDictionary:", v28);
      -[ASRSchemaASRClientEvent setJitLanguageModelEnrollmentEndedTier1:](v5, "setJitLanguageModelEnrollmentEndedTier1:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioPacketArrivalContext"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v117 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[ASRSchemaASRAudioPacketArrivalContext initWithDictionary:]([ASRSchemaASRAudioPacketArrivalContext alloc], "initWithDictionary:", v30);
      -[ASRSchemaASRClientEvent setAudioPacketArrivalContext:](v5, "setAudioPacketArrivalContext:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstAudioPacketProcessed"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v116 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[ASRSchemaASRFirstAudioPacketProcessed initWithDictionary:]([ASRSchemaASRFirstAudioPacketProcessed alloc], "initWithDictionary:", v32);
      -[ASRSchemaASRClientEvent setFirstAudioPacketProcessed:](v5, "setFirstAudioPacketProcessed:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalAudioPacketContainingSpeechReceived"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v115 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[ASRSchemaASRFinalAudioPacketContainingSpeechReceived initWithDictionary:]([ASRSchemaASRFinalAudioPacketContainingSpeechReceived alloc], "initWithDictionary:", v34);
      -[ASRSchemaASRClientEvent setFinalAudioPacketContainingSpeechReceived:](v5, "setFinalAudioPacketContainingSpeechReceived:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampledAudioFileStored"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v114 = (void *)v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[ASRSchemaASRSampledAudioFileStored initWithDictionary:]([ASRSchemaASRSampledAudioFileStored alloc], "initWithDictionary:", v36);
      -[ASRSchemaASRClientEvent setSampledAudioFileStored:](v5, "setSampledAudioFileStored:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampledAudioFileStorageFailed"));
    v38 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v113 = (void *)v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[ASRSchemaASRSampledAudioFileStorageFailed initWithDictionary:]([ASRSchemaASRSampledAudioFileStorageFailed alloc], "initWithDictionary:", v38);
      -[ASRSchemaASRClientEvent setSampledAudioFileStorageFailed:](v5, "setSampledAudioFileStorageFailed:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampledAudioFileEnqueued"));
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v112 = (void *)v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[ASRSchemaASRSampledAudioFileEnqueued initWithDictionary:]([ASRSchemaASRSampledAudioFileEnqueued alloc], "initWithDictionary:", v40);
      -[ASRSchemaASRClientEvent setSampledAudioFileEnqueued:](v5, "setSampledAudioFileEnqueued:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampledAudioFileEnqueueFailed"));
    v42 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v111 = (void *)v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[ASRSchemaASRSampledAudioFileEnqueueFailed initWithDictionary:]([ASRSchemaASRSampledAudioFileEnqueueFailed alloc], "initWithDictionary:", v42);
      -[ASRSchemaASRClientEvent setSampledAudioFileEnqueueFailed:](v5, "setSampledAudioFileEnqueueFailed:", v43);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampledAudioFileDeleted"));
    v44 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v110 = (void *)v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[ASRSchemaASRSampledAudioFileDeleted initWithDictionary:]([ASRSchemaASRSampledAudioFileDeleted alloc], "initWithDictionary:", v44);
      -[ASRSchemaASRClientEvent setSampledAudioFileDeleted:](v5, "setSampledAudioFileDeleted:", v45);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampledAudioFileDeletionFailed"));
    v46 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v109 = (void *)v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[ASRSchemaASRSampledAudioFileDeletionFailed initWithDictionary:]([ASRSchemaASRSampledAudioFileDeletionFailed alloc], "initWithDictionary:", v46);
      -[ASRSchemaASRClientEvent setSampledAudioFileDeletionFailed:](v5, "setSampledAudioFileDeletionFailed:", v47);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleNeuralEngineCompilationContext"));
    v48 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v108 = (void *)v48;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[ASRSchemaASRAppleNeuralEngineCompilationContext initWithDictionary:]([ASRSchemaASRAppleNeuralEngineCompilationContext alloc], "initWithDictionary:", v48);
      -[ASRSchemaASRClientEvent setAppleNeuralEngineCompilationContext:](v5, "setAppleNeuralEngineCompilationContext:", v49);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationVoiceCommandMetricsReported"));
    v50 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v107 = (void *)v50;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = -[ASRSchemaASRDictationVoiceCommandMetricsReported initWithDictionary:]([ASRSchemaASRDictationVoiceCommandMetricsReported alloc], "initWithDictionary:", v50);
      -[ASRSchemaASRClientEvent setDictationVoiceCommandMetricsReported:](v5, "setDictationVoiceCommandMetricsReported:", v51);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appLanguageModelLoadContext"));
    v52 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v106 = (void *)v52;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = -[ASRSchemaASRAppLanguageModelLoadContext initWithDictionary:]([ASRSchemaASRAppLanguageModelLoadContext alloc], "initWithDictionary:", v52);
      -[ASRSchemaASRClientEvent setAppLanguageModelLoadContext:](v5, "setAppLanguageModelLoadContext:", v53);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("embeddedSpeechProcessContext"));
    v54 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v105 = (void *)v54;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = -[ASRSchemaASREmbeddedSpeechProcessContext initWithDictionary:]([ASRSchemaASREmbeddedSpeechProcessContext alloc], "initWithDictionary:", v54);
      -[ASRSchemaASRClientEvent setEmbeddedSpeechProcessContext:](v5, "setEmbeddedSpeechProcessContext:", v55);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("manualEditTextClassified"));
    v56 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v104 = (void *)v56;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = -[ASRSchemaASRManualEditTextClassified initWithDictionary:]([ASRSchemaASRManualEditTextClassified alloc], "initWithDictionary:", v56);
      -[ASRSchemaASRClientEvent setManualEditTextClassified:](v5, "setManualEditTextClassified:", v57);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("manualEditMetricClassified"));
    v58 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v103 = (void *)v58;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = -[ASRSchemaASRManualEditMetricClassified initWithDictionary:]([ASRSchemaASRManualEditMetricClassified alloc], "initWithDictionary:", v58);
      -[ASRSchemaASRClientEvent setManualEditMetricClassified:](v5, "setManualEditMetricClassified:", v59);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("manualEditClassificationContext"));
    v60 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v102 = (void *)v60;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = -[ASRSchemaASRManualEditClassificationContext initWithDictionary:]([ASRSchemaASRManualEditClassificationContext alloc], "initWithDictionary:", v60);
      -[ASRSchemaASRClientEvent setManualEditClassificationContext:](v5, "setManualEditClassificationContext:", v61);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeConfigUpdateContext"));
    v62 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v101 = (void *)v62;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = -[ASRSchemaASRActiveConfigUpdateContext initWithDictionary:]([ASRSchemaASRActiveConfigUpdateContext alloc], "initWithDictionary:", v62);
      -[ASRSchemaASRClientEvent setActiveConfigUpdateContext:](v5, "setActiveConfigUpdateContext:", v63);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleNeuralEngineModelInitializationContext"));
    v64 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v100 = (void *)v64;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = -[ASRSchemaASRAppleNeuralEngineModelInitializationContext initWithDictionary:]([ASRSchemaASRAppleNeuralEngineModelInitializationContext alloc], "initWithDictionary:", v64);
      -[ASRSchemaASRClientEvent setAppleNeuralEngineModelInitializationContext:](v5, "setAppleNeuralEngineModelInitializationContext:", v65);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameProcessingReady"));
    v66 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v99 = (void *)v66;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = -[ASRSchemaASRFrameProcessingReady initWithDictionary:]([ASRSchemaASRFrameProcessingReady alloc], "initWithDictionary:", v66);
      -[ASRSchemaASRClientEvent setFrameProcessingReady:](v5, "setFrameProcessingReady:", v67);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leadingSilenceProcessed"));
    v68 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v98 = (void *)v68;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = -[ASRSchemaASRLeadingSilenceProcessed initWithDictionary:]([ASRSchemaASRLeadingSilenceProcessed alloc], "initWithDictionary:", v68);
      -[ASRSchemaASRClientEvent setLeadingSilenceProcessed:](v5, "setLeadingSilenceProcessed:", v69);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstSecondAfterLeadingSilenceProcessed"));
    v70 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v97 = (void *)v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v71 = -[ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed initWithDictionary:]([ASRSchemaASRFirstSecondAfterLeadingSilenceProcessed alloc], "initWithDictionary:", v70);
      -[ASRSchemaASRClientEvent setFirstSecondAfterLeadingSilenceProcessed:](v5, "setFirstSecondAfterLeadingSilenceProcessed:", v71);

    }
    v96 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioSpeechPacketArrivalContext"));
    v72 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v73 = -[ASRSchemaASRAudioSpeechPacketArrivalContext initWithDictionary:]([ASRSchemaASRAudioSpeechPacketArrivalContext alloc], "initWithDictionary:", v72);
      -[ASRSchemaASRClientEvent setAudioSpeechPacketArrivalContext:](v5, "setAudioSpeechPacketArrivalContext:", v73);

    }
    v90 = (void *)v72;
    v95 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v75 = -[ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived initWithDictionary:]([ASRSchemaASRAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived alloc], "initWithDictionary:", v74);
      -[ASRSchemaASRClientEvent setAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:](v5, "setAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:", v75);

    }
    v94 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstAudioPacketRecorded"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = -[ASRSchemaASRFirstAudioPacketRecorded initWithDictionary:]([ASRSchemaASRFirstAudioPacketRecorded alloc], "initWithDictionary:", v76);
      -[ASRSchemaASRClientEvent setFirstAudioPacketRecorded:](v5, "setFirstAudioPacketRecorded:", v77);

    }
    v93 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioPacketContainingEndOfFirstWordReadyUpstream"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v79 = -[ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream initWithDictionary:]([ASRSchemaASRAudioPacketContainingEndOfFirstWordReadyUpstream alloc], "initWithDictionary:", v78);
      -[ASRSchemaASRClientEvent setAudioPacketContainingEndOfFirstWordReadyUpstream:](v5, "setAudioPacketContainingEndOfFirstWordReadyUpstream:", v79);

    }
    v92 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstAudioPacketReadyUpstream"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v81 = -[ASRSchemaASRFirstAudioPacketReadyUpstream initWithDictionary:]([ASRSchemaASRFirstAudioPacketReadyUpstream alloc], "initWithDictionary:", v80);
      -[ASRSchemaASRClientEvent setFirstAudioPacketReadyUpstream:](v5, "setFirstAudioPacketReadyUpstream:", v81);

    }
    v91 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalAudioPacketContainingSpeechReadyUpstream"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v83 = -[ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream initWithDictionary:]([ASRSchemaASRFinalAudioPacketContainingSpeechReadyUpstream alloc], "initWithDictionary:", v82);
      -[ASRSchemaASRClientEvent setFinalAudioPacketContainingSpeechReadyUpstream:](v5, "setFinalAudioPacketContainingSpeechReadyUpstream:", v83);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternativeSelectionTextCategorized"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v85 = -[ASRSchemaASRAlternativeSelectionTextCategorized initWithDictionary:]([ASRSchemaASRAlternativeSelectionTextCategorized alloc], "initWithDictionary:", v84);
      -[ASRSchemaASRClientEvent setAlternativeSelectionTextCategorized:](v5, "setAlternativeSelectionTextCategorized:", v85);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationVoiceCommandInfoTier1"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v87 = -[ASRSchemaASRDictationVoiceCommandInfoTier1 initWithDictionary:]([ASRSchemaASRDictationVoiceCommandInfoTier1 alloc], "initWithDictionary:", v86);
      -[ASRSchemaASRClientEvent setDictationVoiceCommandInfoTier1:](v5, "setDictationVoiceCommandInfoTier1:", v87);

    }
    v88 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ASRSchemaASRClientEventMetadata)eventMetadata
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

- (BOOL)hasPreheatContext
{
  return self->_hasPreheatContext;
}

- (void)setHasPreheatContext:(BOOL)a3
{
  self->_hasPreheatContext = a3;
}

- (BOOL)hasRequestContext
{
  return self->_hasRequestContext;
}

- (void)setHasRequestContext:(BOOL)a3
{
  self->_hasRequestContext = a3;
}

- (BOOL)hasPartialResultGenerated
{
  return self->_hasPartialResultGenerated;
}

- (void)setHasPartialResultGenerated:(BOOL)a3
{
  self->_hasPartialResultGenerated = a3;
}

- (BOOL)hasPackageGenerated
{
  return self->_hasPackageGenerated;
}

- (void)setHasPackageGenerated:(BOOL)a3
{
  self->_hasPackageGenerated = a3;
}

- (BOOL)hasRecognitionResultTier1
{
  return self->_hasRecognitionResultTier1;
}

- (void)setHasRecognitionResultTier1:(BOOL)a3
{
  self->_hasRecognitionResultTier1 = a3;
}

- (BOOL)hasFinalResultGenerated
{
  return self->_hasFinalResultGenerated;
}

- (void)setHasFinalResultGenerated:(BOOL)a3
{
  self->_hasFinalResultGenerated = a3;
}

- (BOOL)hasIntermediateUtteranceInfoTier1
{
  return self->_hasIntermediateUtteranceInfoTier1;
}

- (void)setHasIntermediateUtteranceInfoTier1:(BOOL)a3
{
  self->_hasIntermediateUtteranceInfoTier1 = a3;
}

- (BOOL)hasInitializationContext
{
  return self->_hasInitializationContext;
}

- (void)setHasInitializationContext:(BOOL)a3
{
  self->_hasInitializationContext = a3;
}

- (BOOL)hasAssetLoadContext
{
  return self->_hasAssetLoadContext;
}

- (void)setHasAssetLoadContext:(BOOL)a3
{
  self->_hasAssetLoadContext = a3;
}

- (BOOL)hasLanguageModelEnrollmentContext
{
  return self->_hasLanguageModelEnrollmentContext;
}

- (void)setHasLanguageModelEnrollmentContext:(BOOL)a3
{
  self->_hasLanguageModelEnrollmentContext = a3;
}

- (BOOL)hasJitLanguageModelEnrollmentEndedTier1
{
  return self->_hasJitLanguageModelEnrollmentEndedTier1;
}

- (void)setHasJitLanguageModelEnrollmentEndedTier1:(BOOL)a3
{
  self->_hasJitLanguageModelEnrollmentEndedTier1 = a3;
}

- (BOOL)hasAudioPacketArrivalContext
{
  return self->_hasAudioPacketArrivalContext;
}

- (void)setHasAudioPacketArrivalContext:(BOOL)a3
{
  self->_hasAudioPacketArrivalContext = a3;
}

- (BOOL)hasFirstAudioPacketProcessed
{
  return self->_hasFirstAudioPacketProcessed;
}

- (void)setHasFirstAudioPacketProcessed:(BOOL)a3
{
  self->_hasFirstAudioPacketProcessed = a3;
}

- (BOOL)hasFinalAudioPacketContainingSpeechReceived
{
  return self->_hasFinalAudioPacketContainingSpeechReceived;
}

- (void)setHasFinalAudioPacketContainingSpeechReceived:(BOOL)a3
{
  self->_hasFinalAudioPacketContainingSpeechReceived = a3;
}

- (BOOL)hasSampledAudioFileStored
{
  return self->_hasSampledAudioFileStored;
}

- (void)setHasSampledAudioFileStored:(BOOL)a3
{
  self->_hasSampledAudioFileStored = a3;
}

- (BOOL)hasSampledAudioFileStorageFailed
{
  return self->_hasSampledAudioFileStorageFailed;
}

- (void)setHasSampledAudioFileStorageFailed:(BOOL)a3
{
  self->_hasSampledAudioFileStorageFailed = a3;
}

- (BOOL)hasSampledAudioFileEnqueued
{
  return self->_hasSampledAudioFileEnqueued;
}

- (void)setHasSampledAudioFileEnqueued:(BOOL)a3
{
  self->_hasSampledAudioFileEnqueued = a3;
}

- (BOOL)hasSampledAudioFileEnqueueFailed
{
  return self->_hasSampledAudioFileEnqueueFailed;
}

- (void)setHasSampledAudioFileEnqueueFailed:(BOOL)a3
{
  self->_hasSampledAudioFileEnqueueFailed = a3;
}

- (BOOL)hasSampledAudioFileDeleted
{
  return self->_hasSampledAudioFileDeleted;
}

- (void)setHasSampledAudioFileDeleted:(BOOL)a3
{
  self->_hasSampledAudioFileDeleted = a3;
}

- (BOOL)hasSampledAudioFileDeletionFailed
{
  return self->_hasSampledAudioFileDeletionFailed;
}

- (void)setHasSampledAudioFileDeletionFailed:(BOOL)a3
{
  self->_hasSampledAudioFileDeletionFailed = a3;
}

- (BOOL)hasAppleNeuralEngineCompilationContext
{
  return self->_hasAppleNeuralEngineCompilationContext;
}

- (void)setHasAppleNeuralEngineCompilationContext:(BOOL)a3
{
  self->_hasAppleNeuralEngineCompilationContext = a3;
}

- (BOOL)hasDictationVoiceCommandMetricsReported
{
  return self->_hasDictationVoiceCommandMetricsReported;
}

- (void)setHasDictationVoiceCommandMetricsReported:(BOOL)a3
{
  self->_hasDictationVoiceCommandMetricsReported = a3;
}

- (BOOL)hasAppLanguageModelLoadContext
{
  return self->_hasAppLanguageModelLoadContext;
}

- (void)setHasAppLanguageModelLoadContext:(BOOL)a3
{
  self->_hasAppLanguageModelLoadContext = a3;
}

- (BOOL)hasEmbeddedSpeechProcessContext
{
  return self->_hasEmbeddedSpeechProcessContext;
}

- (void)setHasEmbeddedSpeechProcessContext:(BOOL)a3
{
  self->_hasEmbeddedSpeechProcessContext = a3;
}

- (BOOL)hasManualEditTextClassified
{
  return self->_hasManualEditTextClassified;
}

- (void)setHasManualEditTextClassified:(BOOL)a3
{
  self->_hasManualEditTextClassified = a3;
}

- (BOOL)hasManualEditMetricClassified
{
  return self->_hasManualEditMetricClassified;
}

- (void)setHasManualEditMetricClassified:(BOOL)a3
{
  self->_hasManualEditMetricClassified = a3;
}

- (BOOL)hasManualEditClassificationContext
{
  return self->_hasManualEditClassificationContext;
}

- (void)setHasManualEditClassificationContext:(BOOL)a3
{
  self->_hasManualEditClassificationContext = a3;
}

- (BOOL)hasActiveConfigUpdateContext
{
  return self->_hasActiveConfigUpdateContext;
}

- (void)setHasActiveConfigUpdateContext:(BOOL)a3
{
  self->_hasActiveConfigUpdateContext = a3;
}

- (BOOL)hasAppleNeuralEngineModelInitializationContext
{
  return self->_hasAppleNeuralEngineModelInitializationContext;
}

- (void)setHasAppleNeuralEngineModelInitializationContext:(BOOL)a3
{
  self->_hasAppleNeuralEngineModelInitializationContext = a3;
}

- (BOOL)hasFrameProcessingReady
{
  return self->_hasFrameProcessingReady;
}

- (void)setHasFrameProcessingReady:(BOOL)a3
{
  self->_hasFrameProcessingReady = a3;
}

- (BOOL)hasLeadingSilenceProcessed
{
  return self->_hasLeadingSilenceProcessed;
}

- (void)setHasLeadingSilenceProcessed:(BOOL)a3
{
  self->_hasLeadingSilenceProcessed = a3;
}

- (BOOL)hasFirstSecondAfterLeadingSilenceProcessed
{
  return self->_hasFirstSecondAfterLeadingSilenceProcessed;
}

- (void)setHasFirstSecondAfterLeadingSilenceProcessed:(BOOL)a3
{
  self->_hasFirstSecondAfterLeadingSilenceProcessed = a3;
}

- (BOOL)hasAudioSpeechPacketArrivalContext
{
  return self->_hasAudioSpeechPacketArrivalContext;
}

- (void)setHasAudioSpeechPacketArrivalContext:(BOOL)a3
{
  self->_hasAudioSpeechPacketArrivalContext = a3;
}

- (BOOL)hasAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived
{
  return self->_hasAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived;
}

- (void)setHasAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived:(BOOL)a3
{
  self->_hasAudioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived = a3;
}

- (BOOL)hasFirstAudioPacketRecorded
{
  return self->_hasFirstAudioPacketRecorded;
}

- (void)setHasFirstAudioPacketRecorded:(BOOL)a3
{
  self->_hasFirstAudioPacketRecorded = a3;
}

- (BOOL)hasAudioPacketContainingEndOfFirstWordReadyUpstream
{
  return self->_hasAudioPacketContainingEndOfFirstWordReadyUpstream;
}

- (void)setHasAudioPacketContainingEndOfFirstWordReadyUpstream:(BOOL)a3
{
  self->_hasAudioPacketContainingEndOfFirstWordReadyUpstream = a3;
}

- (BOOL)hasFirstAudioPacketReadyUpstream
{
  return self->_hasFirstAudioPacketReadyUpstream;
}

- (void)setHasFirstAudioPacketReadyUpstream:(BOOL)a3
{
  self->_hasFirstAudioPacketReadyUpstream = a3;
}

- (BOOL)hasFinalAudioPacketContainingSpeechReadyUpstream
{
  return self->_hasFinalAudioPacketContainingSpeechReadyUpstream;
}

- (void)setHasFinalAudioPacketContainingSpeechReadyUpstream:(BOOL)a3
{
  self->_hasFinalAudioPacketContainingSpeechReadyUpstream = a3;
}

- (BOOL)hasAlternativeSelectionTextCategorized
{
  return self->_hasAlternativeSelectionTextCategorized;
}

- (void)setHasAlternativeSelectionTextCategorized:(BOOL)a3
{
  self->_hasAlternativeSelectionTextCategorized = a3;
}

- (BOOL)hasDictationVoiceCommandInfoTier1
{
  return self->_hasDictationVoiceCommandInfoTier1;
}

- (void)setHasDictationVoiceCommandInfoTier1:(BOOL)a3
{
  self->_hasDictationVoiceCommandInfoTier1 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationVoiceCommandInfoTier1, 0);
  objc_storeStrong((id *)&self->_alternativeSelectionTextCategorized, 0);
  objc_storeStrong((id *)&self->_finalAudioPacketContainingSpeechReadyUpstream, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketReadyUpstream, 0);
  objc_storeStrong((id *)&self->_audioPacketContainingEndOfFirstWordReadyUpstream, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketRecorded, 0);
  objc_storeStrong((id *)&self->_audioSpeechPacketFirstSecondAfterFirstSpeechPacketArrived, 0);
  objc_storeStrong((id *)&self->_audioSpeechPacketArrivalContext, 0);
  objc_storeStrong((id *)&self->_firstSecondAfterLeadingSilenceProcessed, 0);
  objc_storeStrong((id *)&self->_leadingSilenceProcessed, 0);
  objc_storeStrong((id *)&self->_frameProcessingReady, 0);
  objc_storeStrong((id *)&self->_appleNeuralEngineModelInitializationContext, 0);
  objc_storeStrong((id *)&self->_activeConfigUpdateContext, 0);
  objc_storeStrong((id *)&self->_manualEditClassificationContext, 0);
  objc_storeStrong((id *)&self->_manualEditMetricClassified, 0);
  objc_storeStrong((id *)&self->_manualEditTextClassified, 0);
  objc_storeStrong((id *)&self->_embeddedSpeechProcessContext, 0);
  objc_storeStrong((id *)&self->_appLanguageModelLoadContext, 0);
  objc_storeStrong((id *)&self->_dictationVoiceCommandMetricsReported, 0);
  objc_storeStrong((id *)&self->_appleNeuralEngineCompilationContext, 0);
  objc_storeStrong((id *)&self->_sampledAudioFileDeletionFailed, 0);
  objc_storeStrong((id *)&self->_sampledAudioFileDeleted, 0);
  objc_storeStrong((id *)&self->_sampledAudioFileEnqueueFailed, 0);
  objc_storeStrong((id *)&self->_sampledAudioFileEnqueued, 0);
  objc_storeStrong((id *)&self->_sampledAudioFileStorageFailed, 0);
  objc_storeStrong((id *)&self->_sampledAudioFileStored, 0);
  objc_storeStrong((id *)&self->_finalAudioPacketContainingSpeechReceived, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketProcessed, 0);
  objc_storeStrong((id *)&self->_audioPacketArrivalContext, 0);
  objc_storeStrong((id *)&self->_jitLanguageModelEnrollmentEndedTier1, 0);
  objc_storeStrong((id *)&self->_languageModelEnrollmentContext, 0);
  objc_storeStrong((id *)&self->_assetLoadContext, 0);
  objc_storeStrong((id *)&self->_initializationContext, 0);
  objc_storeStrong((id *)&self->_intermediateUtteranceInfoTier1, 0);
  objc_storeStrong((id *)&self->_finalResultGenerated, 0);
  objc_storeStrong((id *)&self->_recognitionResultTier1, 0);
  objc_storeStrong((id *)&self->_packageGenerated, 0);
  objc_storeStrong((id *)&self->_partialResultGenerated, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_preheatContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 20;
}

@end
