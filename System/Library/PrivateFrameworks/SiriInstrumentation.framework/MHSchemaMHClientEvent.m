@implementation MHSchemaMHClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[MHSchemaMHClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mhId");
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

  -[MHSchemaMHClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mhId");
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
        LODWORD(v4) = 9;
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
  void *v129;
  void *v130;
  int v131;
  void *v132;
  void *v133;
  int v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  void *v142;
  int v143;
  void *v144;
  void *v145;
  int v146;
  void *v147;
  void *v148;
  int v149;
  void *v150;
  void *v151;
  int v152;
  void *v153;
  void *v154;
  int v155;
  void *v156;
  void *v157;
  int v158;
  void *v159;
  void *v160;
  int v161;
  void *v162;
  void *v163;
  int v164;
  void *v165;
  void *v166;
  int v167;
  void *v168;
  void *v169;
  int v170;
  void *v171;
  void *v172;
  int v173;
  void *v174;
  void *v175;
  int v176;
  void *v177;
  void *v178;
  int v179;
  void *v180;
  void *v181;
  int v182;
  void *v183;
  void *v184;
  int v185;
  void *v186;
  void *v187;
  int v188;
  void *v189;
  void *v190;
  int v191;
  id v192;
  objc_super v194;

  v4 = a3;
  v194.receiver = self;
  v194.super_class = (Class)MHSchemaMHClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v194, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MHSchemaMHClientEvent mhId](self, "mhId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[MHSchemaMHClientEvent deleteMhId](self, "deleteMhId");
  -[MHSchemaMHClientEvent eventMetadata](self, "eventMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[MHSchemaMHClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[MHSchemaMHClientEvent acousticFalseTriggerMitigationEvaluationContext](self, "acousticFalseTriggerMitigationEvaluationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[MHSchemaMHClientEvent deleteAcousticFalseTriggerMitigationEvaluationContext](self, "deleteAcousticFalseTriggerMitigationEvaluationContext");
  -[MHSchemaMHClientEvent latticeFalseTriggerMitigationEvaluationContext](self, "latticeFalseTriggerMitigationEvaluationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[MHSchemaMHClientEvent deleteLatticeFalseTriggerMitigationEvaluationContext](self, "deleteLatticeFalseTriggerMitigationEvaluationContext");
  -[MHSchemaMHClientEvent unintendedResponseSuppressionExecutionContext](self, "unintendedResponseSuppressionExecutionContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[MHSchemaMHClientEvent deleteUnintendedResponseSuppressionExecutionContext](self, "deleteUnintendedResponseSuppressionExecutionContext");
  -[MHSchemaMHClientEvent coreSpeechPreprocessorCompleted](self, "coreSpeechPreprocessorCompleted");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[MHSchemaMHClientEvent deleteCoreSpeechPreprocessorCompleted](self, "deleteCoreSpeechPreprocessorCompleted");
  -[MHSchemaMHClientEvent asrAudioConfigureStarted](self, "asrAudioConfigureStarted");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[MHSchemaMHClientEvent deleteAsrAudioConfigureStarted](self, "deleteAsrAudioConfigureStarted");
  -[MHSchemaMHClientEvent assistantDaemonAudioInitContext](self, "assistantDaemonAudioInitContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioInitContext](self, "deleteAssistantDaemonAudioInitContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioConfigureContext](self, "assistantDaemonAudioConfigureContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioConfigureContext](self, "deleteAssistantDaemonAudioConfigureContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioPrepareContext](self, "assistantDaemonAudioPrepareContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioPrepareContext](self, "deleteAssistantDaemonAudioPrepareContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioPrewarmContext](self, "assistantDaemonAudioPrewarmContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioPrewarmContext](self, "deleteAssistantDaemonAudioPrewarmContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioStartRecordingContext](self, "assistantDaemonAudioStartRecordingContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioStartRecordingContext](self, "deleteAssistantDaemonAudioStartRecordingContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioStopRecordingContext](self, "assistantDaemonAudioStopRecordingContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioStopRecordingContext](self, "deleteAssistantDaemonAudioStopRecordingContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetActiveContext](self, "assistantDaemonAudioSessionSetActiveContext");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioSessionSetActiveContext](self, "deleteAssistantDaemonAudioSessionSetActiveContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetInactiveContext](self, "assistantDaemonAudioSessionSetInactiveContext");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioSessionSetInactiveContext](self, "deleteAssistantDaemonAudioSessionSetInactiveContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioFetchRouteContext](self, "assistantDaemonAudioFetchRouteContext");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioFetchRouteContext](self, "deleteAssistantDaemonAudioFetchRouteContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingContext](self, "assistantDaemonAudioRecordingContext");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioRecordingContext](self, "deleteAssistantDaemonAudioRecordingContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingMissedBufferDetected](self, "assistantDaemonAudioRecordingMissedBufferDetected");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applySensitiveConditionsPolicy:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "suppressMessage");

  if (v59)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioRecordingMissedBufferDetected](self, "deleteAssistantDaemonAudioRecordingMissedBufferDetected");
  -[MHSchemaMHClientEvent assistantDaemonAudioLateBufferDetected](self, "assistantDaemonAudioLateBufferDetected");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "applySensitiveConditionsPolicy:", v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "suppressMessage");

  if (v62)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioLateBufferDetected](self, "deleteAssistantDaemonAudioLateBufferDetected");
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFirstBufferContext](self, "assistantDaemonAudioRecordingFirstBufferContext");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "applySensitiveConditionsPolicy:", v4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "suppressMessage");

  if (v65)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioRecordingFirstBufferContext](self, "deleteAssistantDaemonAudioRecordingFirstBufferContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingLastBufferContext](self, "assistantDaemonAudioRecordingLastBufferContext");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "applySensitiveConditionsPolicy:", v4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "suppressMessage");

  if (v68)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioRecordingLastBufferContext](self, "deleteAssistantDaemonAudioRecordingLastBufferContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionContext](self, "assistantDaemonAudioRecordingInterruptionContext");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "applySensitiveConditionsPolicy:", v4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "suppressMessage");

  if (v71)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioRecordingInterruptionContext](self, "deleteAssistantDaemonAudioRecordingInterruptionContext");
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionStartedTier1](self, "assistantDaemonAudioRecordingInterruptionStartedTier1");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "applySensitiveConditionsPolicy:", v4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "suppressMessage");

  if (v74)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioRecordingInterruptionStartedTier1](self, "deleteAssistantDaemonAudioRecordingInterruptionStartedTier1");
  -[MHSchemaMHClientEvent assistantDaemonAudioBluetoothInfo](self, "assistantDaemonAudioBluetoothInfo");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "applySensitiveConditionsPolicy:", v4);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "suppressMessage");

  if (v77)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioBluetoothInfo](self, "deleteAssistantDaemonAudioBluetoothInfo");
  -[MHSchemaMHClientEvent voiceTriggerTwoShotDetected](self, "voiceTriggerTwoShotDetected");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "applySensitiveConditionsPolicy:", v4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "suppressMessage");

  if (v80)
    -[MHSchemaMHClientEvent deleteVoiceTriggerTwoShotDetected](self, "deleteVoiceTriggerTwoShotDetected");
  -[MHSchemaMHClientEvent assistantDaemonAudioTwoShotTransitionContext](self, "assistantDaemonAudioTwoShotTransitionContext");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "applySensitiveConditionsPolicy:", v4);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "suppressMessage");

  if (v83)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioTwoShotTransitionContext](self, "deleteAssistantDaemonAudioTwoShotTransitionContext");
  -[MHSchemaMHClientEvent voiceTriggerContext](self, "voiceTriggerContext");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "applySensitiveConditionsPolicy:", v4);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "suppressMessage");

  if (v86)
    -[MHSchemaMHClientEvent deleteVoiceTriggerContext](self, "deleteVoiceTriggerContext");
  -[MHSchemaMHClientEvent endpointDetected](self, "endpointDetected");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "applySensitiveConditionsPolicy:", v4);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "suppressMessage");

  if (v89)
    -[MHSchemaMHClientEvent deleteEndpointDetected](self, "deleteEndpointDetected");
  -[MHSchemaMHClientEvent endpointLatencyInfoReported](self, "endpointLatencyInfoReported");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "applySensitiveConditionsPolicy:", v4);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "suppressMessage");

  if (v92)
    -[MHSchemaMHClientEvent deleteEndpointLatencyInfoReported](self, "deleteEndpointLatencyInfoReported");
  -[MHSchemaMHClientEvent adblockerContext](self, "adblockerContext");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "applySensitiveConditionsPolicy:", v4);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "suppressMessage");

  if (v95)
    -[MHSchemaMHClientEvent deleteAdblockerContext](self, "deleteAdblockerContext");
  -[MHSchemaMHClientEvent onDeviceEndpointerContext](self, "onDeviceEndpointerContext");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "applySensitiveConditionsPolicy:", v4);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "suppressMessage");

  if (v98)
    -[MHSchemaMHClientEvent deleteOnDeviceEndpointerContext](self, "deleteOnDeviceEndpointerContext");
  -[MHSchemaMHClientEvent serverEndpointerContext](self, "serverEndpointerContext");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "applySensitiveConditionsPolicy:", v4);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "suppressMessage");

  if (v101)
    -[MHSchemaMHClientEvent deleteServerEndpointerContext](self, "deleteServerEndpointerContext");
  -[MHSchemaMHClientEvent endpointerUsed](self, "endpointerUsed");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "applySensitiveConditionsPolicy:", v4);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "suppressMessage");

  if (v104)
    -[MHSchemaMHClientEvent deleteEndpointerUsed](self, "deleteEndpointerUsed");
  -[MHSchemaMHClientEvent endpointDelayContext](self, "endpointDelayContext");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "applySensitiveConditionsPolicy:", v4);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "suppressMessage");

  if (v107)
    -[MHSchemaMHClientEvent deleteEndpointDelayContext](self, "deleteEndpointDelayContext");
  -[MHSchemaMHClientEvent finalMitigationRecommendation](self, "finalMitigationRecommendation");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "applySensitiveConditionsPolicy:", v4);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "suppressMessage");

  if (v110)
    -[MHSchemaMHClientEvent deleteFinalMitigationRecommendation](self, "deleteFinalMitigationRecommendation");
  -[MHSchemaMHClientEvent applicationPlaybackAttempted](self, "applicationPlaybackAttempted");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "applySensitiveConditionsPolicy:", v4);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v112, "suppressMessage");

  if (v113)
    -[MHSchemaMHClientEvent deleteApplicationPlaybackAttempted](self, "deleteApplicationPlaybackAttempted");
  -[MHSchemaMHClientEvent siriLaunchRequestContext](self, "siriLaunchRequestContext");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "applySensitiveConditionsPolicy:", v4);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "suppressMessage");

  if (v116)
    -[MHSchemaMHClientEvent deleteSiriLaunchRequestContext](self, "deleteSiriLaunchRequestContext");
  -[MHSchemaMHClientEvent endpointerAccessibleContext](self, "endpointerAccessibleContext");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "applySensitiveConditionsPolicy:", v4);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v118, "suppressMessage");

  if (v119)
    -[MHSchemaMHClientEvent deleteEndpointerAccessibleContext](self, "deleteEndpointerAccessibleContext");
  -[MHSchemaMHClientEvent carPlayLangaugeMismatched](self, "carPlayLangaugeMismatched");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "applySensitiveConditionsPolicy:", v4);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(v121, "suppressMessage");

  if (v122)
    -[MHSchemaMHClientEvent deleteCarPlayLangaugeMismatched](self, "deleteCarPlayLangaugeMismatched");
  -[MHSchemaMHClientEvent darwinConnectedDeviceWakeContext](self, "darwinConnectedDeviceWakeContext");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "applySensitiveConditionsPolicy:", v4);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v124, "suppressMessage");

  if (v125)
    -[MHSchemaMHClientEvent deleteDarwinConnectedDeviceWakeContext](self, "deleteDarwinConnectedDeviceWakeContext");
  -[MHSchemaMHClientEvent odldFalseTriggerMitigated](self, "odldFalseTriggerMitigated");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "applySensitiveConditionsPolicy:", v4);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(v127, "suppressMessage");

  if (v128)
    -[MHSchemaMHClientEvent deleteOdldFalseTriggerMitigated](self, "deleteOdldFalseTriggerMitigated");
  -[MHSchemaMHClientEvent speakerFalseTriggerMitigated](self, "speakerFalseTriggerMitigated");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "applySensitiveConditionsPolicy:", v4);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v130, "suppressMessage");

  if (v131)
    -[MHSchemaMHClientEvent deleteSpeakerFalseTriggerMitigated](self, "deleteSpeakerFalseTriggerMitigated");
  -[MHSchemaMHClientEvent siriDirectedSpeechDetectionFailed](self, "siriDirectedSpeechDetectionFailed");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "applySensitiveConditionsPolicy:", v4);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = objc_msgSend(v133, "suppressMessage");

  if (v134)
    -[MHSchemaMHClientEvent deleteSiriDirectedSpeechDetectionFailed](self, "deleteSiriDirectedSpeechDetectionFailed");
  -[MHSchemaMHClientEvent audioDucked](self, "audioDucked");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "applySensitiveConditionsPolicy:", v4);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend(v136, "suppressMessage");

  if (v137)
    -[MHSchemaMHClientEvent deleteAudioDucked](self, "deleteAudioDucked");
  -[MHSchemaMHClientEvent audioRecordingFailed](self, "audioRecordingFailed");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "applySensitiveConditionsPolicy:", v4);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = objc_msgSend(v139, "suppressMessage");

  if (v140)
    -[MHSchemaMHClientEvent deleteAudioRecordingFailed](self, "deleteAudioRecordingFailed");
  -[MHSchemaMHClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "applySensitiveConditionsPolicy:", v4);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v142, "suppressMessage");

  if (v143)
    -[MHSchemaMHClientEvent deleteRtsFalseRejectDetected](self, "deleteRtsFalseRejectDetected");
  -[MHSchemaMHClientEvent trpCreated](self, "trpCreated");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "applySensitiveConditionsPolicy:", v4);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = objc_msgSend(v145, "suppressMessage");

  if (v146)
    -[MHSchemaMHClientEvent deleteTrpCreated](self, "deleteTrpCreated");
  -[MHSchemaMHClientEvent userSpeakingContext](self, "userSpeakingContext");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "applySensitiveConditionsPolicy:", v4);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = objc_msgSend(v148, "suppressMessage");

  if (v149)
    -[MHSchemaMHClientEvent deleteUserSpeakingContext](self, "deleteUserSpeakingContext");
  -[MHSchemaMHClientEvent speechStopDetected](self, "speechStopDetected");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "applySensitiveConditionsPolicy:", v4);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = objc_msgSend(v151, "suppressMessage");

  if (v152)
    -[MHSchemaMHClientEvent deleteSpeechStopDetected](self, "deleteSpeechStopDetected");
  -[MHSchemaMHClientEvent speechDetectorContext](self, "speechDetectorContext");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "applySensitiveConditionsPolicy:", v4);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = objc_msgSend(v154, "suppressMessage");

  if (v155)
    -[MHSchemaMHClientEvent deleteSpeechDetectorContext](self, "deleteSpeechDetectorContext");
  -[MHSchemaMHClientEvent stoppedListeningForSpeechContinuation](self, "stoppedListeningForSpeechContinuation");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "applySensitiveConditionsPolicy:", v4);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = objc_msgSend(v157, "suppressMessage");

  if (v158)
    -[MHSchemaMHClientEvent deleteStoppedListeningForSpeechContinuation](self, "deleteStoppedListeningForSpeechContinuation");
  -[MHSchemaMHClientEvent userEngagementModelContext](self, "userEngagementModelContext");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "applySensitiveConditionsPolicy:", v4);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = objc_msgSend(v160, "suppressMessage");

  if (v161)
    -[MHSchemaMHClientEvent deleteUserEngagementModelContext](self, "deleteUserEngagementModelContext");
  -[MHSchemaMHClientEvent attendingContext](self, "attendingContext");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "applySensitiveConditionsPolicy:", v4);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = objc_msgSend(v163, "suppressMessage");

  if (v164)
    -[MHSchemaMHClientEvent deleteAttendingContext](self, "deleteAttendingContext");
  -[MHSchemaMHClientEvent crownPressed](self, "crownPressed");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "applySensitiveConditionsPolicy:", v4);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = objc_msgSend(v166, "suppressMessage");

  if (v167)
    -[MHSchemaMHClientEvent deleteCrownPressed](self, "deleteCrownPressed");
  -[MHSchemaMHClientEvent rtsTriggered](self, "rtsTriggered");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "applySensitiveConditionsPolicy:", v4);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = objc_msgSend(v169, "suppressMessage");

  if (v170)
    -[MHSchemaMHClientEvent deleteRtsTriggered](self, "deleteRtsTriggered");
  -[MHSchemaMHClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "applySensitiveConditionsPolicy:", v4);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = objc_msgSend(v172, "suppressMessage");

  if (v173)
    -[MHSchemaMHClientEvent deleteRtsFirstPassPolicyTriggered](self, "deleteRtsFirstPassPolicyTriggered");
  -[MHSchemaMHClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "applySensitiveConditionsPolicy:", v4);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = objc_msgSend(v175, "suppressMessage");

  if (v176)
    -[MHSchemaMHClientEvent deleteRtsSecondPassPolicyDecisionMade](self, "deleteRtsSecondPassPolicyDecisionMade");
  -[MHSchemaMHClientEvent voiceProfileOnboarded](self, "voiceProfileOnboarded");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "applySensitiveConditionsPolicy:", v4);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = objc_msgSend(v178, "suppressMessage");

  if (v179)
    -[MHSchemaMHClientEvent deleteVoiceProfileOnboarded](self, "deleteVoiceProfileOnboarded");
  -[MHSchemaMHClientEvent sensorControlStatusReported](self, "sensorControlStatusReported");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "applySensitiveConditionsPolicy:", v4);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = objc_msgSend(v181, "suppressMessage");

  if (v182)
    -[MHSchemaMHClientEvent deleteSensorControlStatusReported](self, "deleteSensorControlStatusReported");
  -[MHSchemaMHClientEvent voiceTriggerRePrompted](self, "voiceTriggerRePrompted");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "applySensitiveConditionsPolicy:", v4);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = objc_msgSend(v184, "suppressMessage");

  if (v185)
    -[MHSchemaMHClientEvent deleteVoiceTriggerRePrompted](self, "deleteVoiceTriggerRePrompted");
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFailureInsufficientPriority](self, "assistantDaemonAudioRecordingFailureInsufficientPriority");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "applySensitiveConditionsPolicy:", v4);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = objc_msgSend(v187, "suppressMessage");

  if (v188)
    -[MHSchemaMHClientEvent deleteAssistantDaemonAudioRecordingFailureInsufficientPriority](self, "deleteAssistantDaemonAudioRecordingFailureInsufficientPriority");
  -[MHSchemaMHClientEvent voiceProfileICloudSyncFinished](self, "voiceProfileICloudSyncFinished");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "applySensitiveConditionsPolicy:", v4);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = objc_msgSend(v190, "suppressMessage");

  if (v191)
    -[MHSchemaMHClientEvent deleteVoiceProfileICloudSyncFinished](self, "deleteVoiceProfileICloudSyncFinished");
  v192 = v5;

  return v192;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[MHSchemaMHClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 100 > 0x3B)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629A08[v3 - 100]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 100 > 0x3B)
    return 0;
  else
    return off_1E5629BE8[a3 - 100];
}

- (int)clockIsolationLevel
{
  if (((-[MHSchemaMHClientEvent whichEvent_Type](self, "whichEvent_Type") - 157) & 0xFFFFFFFFFFFFFFFDLL) != 0)
    return 1;
  else
    return 2;
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[MHSchemaMHClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 100 > 0x3B)
    return CFSTR("com.apple.aiml.siri.mh.MHClientEvent");
  else
    return off_1E5630438[v2 - 100];
}

- (BOOL)hasMhId
{
  return self->_mhId != 0;
}

- (void)deleteMhId
{
  -[MHSchemaMHClientEvent setMhId:](self, "setMhId:", 0);
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[MHSchemaMHClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setAcousticFalseTriggerMitigationEvaluationContext:(id)a3
{
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *v4;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;

  v4 = (MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *)a3;
  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 100;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = v4;

}

- (MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext)acousticFalseTriggerMitigationEvaluationContext
{
  if (self->_whichEvent_Type == 100)
    return self->_acousticFalseTriggerMitigationEvaluationContext;
  else
    return (MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *)0;
}

- (void)deleteAcousticFalseTriggerMitigationEvaluationContext
{
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;

  if (self->_whichEvent_Type == 100)
  {
    self->_whichEvent_Type = 0;
    acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
    self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  }
}

- (void)setLatticeFalseTriggerMitigationEvaluationContext:(id)a3
{
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;

  v4 = (MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 101;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = v4;

}

- (MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext)latticeFalseTriggerMitigationEvaluationContext
{
  if (self->_whichEvent_Type == 101)
    return self->_latticeFalseTriggerMitigationEvaluationContext;
  else
    return (MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *)0;
}

- (void)deleteLatticeFalseTriggerMitigationEvaluationContext
{
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
    self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  }
}

- (void)setUnintendedResponseSuppressionExecutionContext:(id)a3
{
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;

  v4 = (MHSchemaMHUnintendedResponseSuppressionEvaluationContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 102;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = v4;

}

- (MHSchemaMHUnintendedResponseSuppressionEvaluationContext)unintendedResponseSuppressionExecutionContext
{
  if (self->_whichEvent_Type == 102)
    return self->_unintendedResponseSuppressionExecutionContext;
  else
    return (MHSchemaMHUnintendedResponseSuppressionEvaluationContext *)0;
}

- (void)deleteUnintendedResponseSuppressionExecutionContext
{
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
    self->_unintendedResponseSuppressionExecutionContext = 0;

  }
}

- (void)setCoreSpeechPreprocessorCompleted:(id)a3
{
  MHSchemaMHCoreSpeechPreprocessorCompleted *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;

  v4 = (MHSchemaMHCoreSpeechPreprocessorCompleted *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 103;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = v4;

}

- (MHSchemaMHCoreSpeechPreprocessorCompleted)coreSpeechPreprocessorCompleted
{
  if (self->_whichEvent_Type == 103)
    return self->_coreSpeechPreprocessorCompleted;
  else
    return (MHSchemaMHCoreSpeechPreprocessorCompleted *)0;
}

- (void)deleteCoreSpeechPreprocessorCompleted
{
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
    self->_coreSpeechPreprocessorCompleted = 0;

  }
}

- (void)setAsrAudioConfigureStarted:(id)a3
{
  MHSchemaMHASRAudioConfigureStarted *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;

  v4 = (MHSchemaMHASRAudioConfigureStarted *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 104;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = v4;

}

- (MHSchemaMHASRAudioConfigureStarted)asrAudioConfigureStarted
{
  if (self->_whichEvent_Type == 104)
    return self->_asrAudioConfigureStarted;
  else
    return (MHSchemaMHASRAudioConfigureStarted *)0;
}

- (void)deleteAsrAudioConfigureStarted
{
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
    self->_asrAudioConfigureStarted = 0;

  }
}

- (void)setAssistantDaemonAudioInitContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioInitContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;

  v4 = (MHSchemaMHAssistantDaemonAudioInitContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 105;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioInitContext)assistantDaemonAudioInitContext
{
  if (self->_whichEvent_Type == 105)
    return self->_assistantDaemonAudioInitContext;
  else
    return (MHSchemaMHAssistantDaemonAudioInitContext *)0;
}

- (void)deleteAssistantDaemonAudioInitContext
{
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
    self->_assistantDaemonAudioInitContext = 0;

  }
}

- (void)setAssistantDaemonAudioConfigureContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioConfigureContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;

  v4 = (MHSchemaMHAssistantDaemonAudioConfigureContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 106;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioConfigureContext)assistantDaemonAudioConfigureContext
{
  if (self->_whichEvent_Type == 106)
    return self->_assistantDaemonAudioConfigureContext;
  else
    return (MHSchemaMHAssistantDaemonAudioConfigureContext *)0;
}

- (void)deleteAssistantDaemonAudioConfigureContext
{
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
    self->_assistantDaemonAudioConfigureContext = 0;

  }
}

- (void)setAssistantDaemonAudioPrepareContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioPrepareContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;

  v4 = (MHSchemaMHAssistantDaemonAudioPrepareContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 107;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioPrepareContext)assistantDaemonAudioPrepareContext
{
  if (self->_whichEvent_Type == 107)
    return self->_assistantDaemonAudioPrepareContext;
  else
    return (MHSchemaMHAssistantDaemonAudioPrepareContext *)0;
}

- (void)deleteAssistantDaemonAudioPrepareContext
{
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
    self->_assistantDaemonAudioPrepareContext = 0;

  }
}

- (void)setAssistantDaemonAudioPrewarmContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioPrewarmContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;

  v4 = (MHSchemaMHAssistantDaemonAudioPrewarmContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 108;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioPrewarmContext)assistantDaemonAudioPrewarmContext
{
  if (self->_whichEvent_Type == 108)
    return self->_assistantDaemonAudioPrewarmContext;
  else
    return (MHSchemaMHAssistantDaemonAudioPrewarmContext *)0;
}

- (void)deleteAssistantDaemonAudioPrewarmContext
{
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
    self->_assistantDaemonAudioPrewarmContext = 0;

  }
}

- (void)setAssistantDaemonAudioStartRecordingContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;

  v4 = (MHSchemaMHAssistantDaemonAudioStartRecordingContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 109;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioStartRecordingContext)assistantDaemonAudioStartRecordingContext
{
  if (self->_whichEvent_Type == 109)
    return self->_assistantDaemonAudioStartRecordingContext;
  else
    return (MHSchemaMHAssistantDaemonAudioStartRecordingContext *)0;
}

- (void)deleteAssistantDaemonAudioStartRecordingContext
{
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
    self->_assistantDaemonAudioStartRecordingContext = 0;

  }
}

- (void)setAssistantDaemonAudioStopRecordingContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;

  v4 = (MHSchemaMHAssistantDaemonAudioStopRecordingContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 110;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioStopRecordingContext)assistantDaemonAudioStopRecordingContext
{
  if (self->_whichEvent_Type == 110)
    return self->_assistantDaemonAudioStopRecordingContext;
  else
    return (MHSchemaMHAssistantDaemonAudioStopRecordingContext *)0;
}

- (void)deleteAssistantDaemonAudioStopRecordingContext
{
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;

  if (self->_whichEvent_Type == 110)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
    self->_assistantDaemonAudioStopRecordingContext = 0;

  }
}

- (void)setAssistantDaemonAudioSessionSetActiveContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;

  v4 = (MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 111;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioSessionSetActiveContext)assistantDaemonAudioSessionSetActiveContext
{
  if (self->_whichEvent_Type == 111)
    return self->_assistantDaemonAudioSessionSetActiveContext;
  else
    return (MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *)0;
}

- (void)deleteAssistantDaemonAudioSessionSetActiveContext
{
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;

  if (self->_whichEvent_Type == 111)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
    self->_assistantDaemonAudioSessionSetActiveContext = 0;

  }
}

- (void)setAssistantDaemonAudioSessionSetInactiveContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;

  v4 = (MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 112;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext)assistantDaemonAudioSessionSetInactiveContext
{
  if (self->_whichEvent_Type == 112)
    return self->_assistantDaemonAudioSessionSetInactiveContext;
  else
    return (MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *)0;
}

- (void)deleteAssistantDaemonAudioSessionSetInactiveContext
{
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;

  if (self->_whichEvent_Type == 112)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
    self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  }
}

- (void)setAssistantDaemonAudioFetchRouteContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;

  v4 = (MHSchemaMHAssistantDaemonAudioFetchRouteContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 113;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioFetchRouteContext)assistantDaemonAudioFetchRouteContext
{
  if (self->_whichEvent_Type == 113)
    return self->_assistantDaemonAudioFetchRouteContext;
  else
    return (MHSchemaMHAssistantDaemonAudioFetchRouteContext *)0;
}

- (void)deleteAssistantDaemonAudioFetchRouteContext
{
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;

  if (self->_whichEvent_Type == 113)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
    self->_assistantDaemonAudioFetchRouteContext = 0;

  }
}

- (void)setAssistantDaemonAudioRecordingContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioRecordingContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;

  v4 = (MHSchemaMHAssistantDaemonAudioRecordingContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 114;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioRecordingContext)assistantDaemonAudioRecordingContext
{
  if (self->_whichEvent_Type == 114)
    return self->_assistantDaemonAudioRecordingContext;
  else
    return (MHSchemaMHAssistantDaemonAudioRecordingContext *)0;
}

- (void)deleteAssistantDaemonAudioRecordingContext
{
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;

  if (self->_whichEvent_Type == 114)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
    self->_assistantDaemonAudioRecordingContext = 0;

  }
}

- (void)setAssistantDaemonAudioRecordingMissedBufferDetected:(id)a3
{
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;

  v4 = (MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 115;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = v4;

}

- (MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected)assistantDaemonAudioRecordingMissedBufferDetected
{
  if (self->_whichEvent_Type == 115)
    return self->_assistantDaemonAudioRecordingMissedBufferDetected;
  else
    return (MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *)0;
}

- (void)deleteAssistantDaemonAudioRecordingMissedBufferDetected
{
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;

  if (self->_whichEvent_Type == 115)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
    self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  }
}

- (void)setAssistantDaemonAudioLateBufferDetected:(id)a3
{
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;

  v4 = (MHSchemaMHAssistantDaemonAudioLateBufferDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 116;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = v4;

}

- (MHSchemaMHAssistantDaemonAudioLateBufferDetected)assistantDaemonAudioLateBufferDetected
{
  if (self->_whichEvent_Type == 116)
    return self->_assistantDaemonAudioLateBufferDetected;
  else
    return (MHSchemaMHAssistantDaemonAudioLateBufferDetected *)0;
}

- (void)deleteAssistantDaemonAudioLateBufferDetected
{
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;

  if (self->_whichEvent_Type == 116)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
    self->_assistantDaemonAudioLateBufferDetected = 0;

  }
}

- (void)setAssistantDaemonAudioRecordingFirstBufferContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;

  v4 = (MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 117;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext)assistantDaemonAudioRecordingFirstBufferContext
{
  if (self->_whichEvent_Type == 117)
    return self->_assistantDaemonAudioRecordingFirstBufferContext;
  else
    return (MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *)0;
}

- (void)deleteAssistantDaemonAudioRecordingFirstBufferContext
{
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;

  if (self->_whichEvent_Type == 117)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
    self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  }
}

- (void)setAssistantDaemonAudioRecordingLastBufferContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;

  v4 = (MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 118;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext)assistantDaemonAudioRecordingLastBufferContext
{
  if (self->_whichEvent_Type == 118)
    return self->_assistantDaemonAudioRecordingLastBufferContext;
  else
    return (MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *)0;
}

- (void)deleteAssistantDaemonAudioRecordingLastBufferContext
{
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;

  if (self->_whichEvent_Type == 118)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
    self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  }
}

- (void)setAssistantDaemonAudioRecordingInterruptionContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;

  v4 = (MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 119;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext)assistantDaemonAudioRecordingInterruptionContext
{
  if (self->_whichEvent_Type == 119)
    return self->_assistantDaemonAudioRecordingInterruptionContext;
  else
    return (MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *)0;
}

- (void)deleteAssistantDaemonAudioRecordingInterruptionContext
{
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;

  if (self->_whichEvent_Type == 119)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
    self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  }
}

- (void)setAssistantDaemonAudioRecordingInterruptionStartedTier1:(id)a3
{
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;

  v4 = (MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 120;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = v4;

}

- (MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1)assistantDaemonAudioRecordingInterruptionStartedTier1
{
  if (self->_whichEvent_Type == 120)
    return self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  else
    return (MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *)0;
}

- (void)deleteAssistantDaemonAudioRecordingInterruptionStartedTier1
{
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;

  if (self->_whichEvent_Type == 120)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
    self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  }
}

- (void)setAssistantDaemonAudioBluetoothInfo:(id)a3
{
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;

  v4 = (MHSchemaMHAssistantDaemonAudioBluetoothInfo *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 121;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = v4;

}

- (MHSchemaMHAssistantDaemonAudioBluetoothInfo)assistantDaemonAudioBluetoothInfo
{
  if (self->_whichEvent_Type == 121)
    return self->_assistantDaemonAudioBluetoothInfo;
  else
    return (MHSchemaMHAssistantDaemonAudioBluetoothInfo *)0;
}

- (void)deleteAssistantDaemonAudioBluetoothInfo
{
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;

  if (self->_whichEvent_Type == 121)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
    self->_assistantDaemonAudioBluetoothInfo = 0;

  }
}

- (void)setVoiceTriggerTwoShotDetected:(id)a3
{
  MHSchemaMHVoiceTriggerTwoShotDetected *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;

  v4 = (MHSchemaMHVoiceTriggerTwoShotDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 122;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = v4;

}

- (MHSchemaMHVoiceTriggerTwoShotDetected)voiceTriggerTwoShotDetected
{
  if (self->_whichEvent_Type == 122)
    return self->_voiceTriggerTwoShotDetected;
  else
    return (MHSchemaMHVoiceTriggerTwoShotDetected *)0;
}

- (void)deleteVoiceTriggerTwoShotDetected
{
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;

  if (self->_whichEvent_Type == 122)
  {
    self->_whichEvent_Type = 0;
    voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
    self->_voiceTriggerTwoShotDetected = 0;

  }
}

- (void)setAssistantDaemonAudioTwoShotTransitionContext:(id)a3
{
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;

  v4 = (MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 123;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = v4;

}

- (MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext)assistantDaemonAudioTwoShotTransitionContext
{
  if (self->_whichEvent_Type == 123)
    return self->_assistantDaemonAudioTwoShotTransitionContext;
  else
    return (MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *)0;
}

- (void)deleteAssistantDaemonAudioTwoShotTransitionContext
{
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;

  if (self->_whichEvent_Type == 123)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
    self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  }
}

- (void)setVoiceTriggerContext:(id)a3
{
  MHSchemaMHVoiceTriggerContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;

  v4 = (MHSchemaMHVoiceTriggerContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 124;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = v4;

}

- (MHSchemaMHVoiceTriggerContext)voiceTriggerContext
{
  if (self->_whichEvent_Type == 124)
    return self->_voiceTriggerContext;
  else
    return (MHSchemaMHVoiceTriggerContext *)0;
}

- (void)deleteVoiceTriggerContext
{
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;

  if (self->_whichEvent_Type == 124)
  {
    self->_whichEvent_Type = 0;
    voiceTriggerContext = self->_voiceTriggerContext;
    self->_voiceTriggerContext = 0;

  }
}

- (void)setEndpointDetected:(id)a3
{
  MHSchemaMHEndpointDetected *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHEndpointDetected *endpointDetected;

  v4 = (MHSchemaMHEndpointDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 125;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = v4;

}

- (MHSchemaMHEndpointDetected)endpointDetected
{
  if (self->_whichEvent_Type == 125)
    return self->_endpointDetected;
  else
    return (MHSchemaMHEndpointDetected *)0;
}

- (void)deleteEndpointDetected
{
  MHSchemaMHEndpointDetected *endpointDetected;

  if (self->_whichEvent_Type == 125)
  {
    self->_whichEvent_Type = 0;
    endpointDetected = self->_endpointDetected;
    self->_endpointDetected = 0;

  }
}

- (void)setEndpointLatencyInfoReported:(id)a3
{
  MHSchemaMHEndpointLatencyInfoReported *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;

  v4 = (MHSchemaMHEndpointLatencyInfoReported *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 126;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = v4;

}

- (MHSchemaMHEndpointLatencyInfoReported)endpointLatencyInfoReported
{
  if (self->_whichEvent_Type == 126)
    return self->_endpointLatencyInfoReported;
  else
    return (MHSchemaMHEndpointLatencyInfoReported *)0;
}

- (void)deleteEndpointLatencyInfoReported
{
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;

  if (self->_whichEvent_Type == 126)
  {
    self->_whichEvent_Type = 0;
    endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
    self->_endpointLatencyInfoReported = 0;

  }
}

- (void)setAdblockerContext:(id)a3
{
  MHSchemaMHVoiceAdBlockerContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;

  v4 = (MHSchemaMHVoiceAdBlockerContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 127;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = v4;

}

- (MHSchemaMHVoiceAdBlockerContext)adblockerContext
{
  if (self->_whichEvent_Type == 127)
    return self->_adblockerContext;
  else
    return (MHSchemaMHVoiceAdBlockerContext *)0;
}

- (void)deleteAdblockerContext
{
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;

  if (self->_whichEvent_Type == 127)
  {
    self->_whichEvent_Type = 0;
    adblockerContext = self->_adblockerContext;
    self->_adblockerContext = 0;

  }
}

- (void)setOnDeviceEndpointerContext:(id)a3
{
  MHSchemaMHOnDeviceEndpointerContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;

  v4 = (MHSchemaMHOnDeviceEndpointerContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  self->_whichEvent_Type = (unint64_t)(v4 != 0) << 7;
  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = v4;

}

- (MHSchemaMHOnDeviceEndpointerContext)onDeviceEndpointerContext
{
  if (self->_whichEvent_Type == 128)
    return self->_onDeviceEndpointerContext;
  else
    return (MHSchemaMHOnDeviceEndpointerContext *)0;
}

- (void)deleteOnDeviceEndpointerContext
{
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;

  if (self->_whichEvent_Type == 128)
  {
    self->_whichEvent_Type = 0;
    onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
    self->_onDeviceEndpointerContext = 0;

  }
}

- (void)setServerEndpointerContext:(id)a3
{
  MHSchemaMHServerEndpointerContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;

  v4 = (MHSchemaMHServerEndpointerContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 129;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = v4;

}

- (MHSchemaMHServerEndpointerContext)serverEndpointerContext
{
  if (self->_whichEvent_Type == 129)
    return self->_serverEndpointerContext;
  else
    return (MHSchemaMHServerEndpointerContext *)0;
}

- (void)deleteServerEndpointerContext
{
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;

  if (self->_whichEvent_Type == 129)
  {
    self->_whichEvent_Type = 0;
    serverEndpointerContext = self->_serverEndpointerContext;
    self->_serverEndpointerContext = 0;

  }
}

- (void)setEndpointerUsed:(id)a3
{
  MHSchemaMHEndpointerUsed *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHEndpointerUsed *endpointerUsed;

  v4 = (MHSchemaMHEndpointerUsed *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 130;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = v4;

}

- (MHSchemaMHEndpointerUsed)endpointerUsed
{
  if (self->_whichEvent_Type == 130)
    return self->_endpointerUsed;
  else
    return (MHSchemaMHEndpointerUsed *)0;
}

- (void)deleteEndpointerUsed
{
  MHSchemaMHEndpointerUsed *endpointerUsed;

  if (self->_whichEvent_Type == 130)
  {
    self->_whichEvent_Type = 0;
    endpointerUsed = self->_endpointerUsed;
    self->_endpointerUsed = 0;

  }
}

- (void)setEndpointDelayContext:(id)a3
{
  MHSchemaMHEndpointDelayContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;

  v4 = (MHSchemaMHEndpointDelayContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 131;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = v4;

}

- (MHSchemaMHEndpointDelayContext)endpointDelayContext
{
  if (self->_whichEvent_Type == 131)
    return self->_endpointDelayContext;
  else
    return (MHSchemaMHEndpointDelayContext *)0;
}

- (void)deleteEndpointDelayContext
{
  MHSchemaMHEndpointDelayContext *endpointDelayContext;

  if (self->_whichEvent_Type == 131)
  {
    self->_whichEvent_Type = 0;
    endpointDelayContext = self->_endpointDelayContext;
    self->_endpointDelayContext = 0;

  }
}

- (void)setFinalMitigationRecommendation:(id)a3
{
  MHSchemaMHMitigationDecisionRecommended *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;

  v4 = (MHSchemaMHMitigationDecisionRecommended *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 132;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = v4;

}

- (MHSchemaMHMitigationDecisionRecommended)finalMitigationRecommendation
{
  if (self->_whichEvent_Type == 132)
    return self->_finalMitigationRecommendation;
  else
    return (MHSchemaMHMitigationDecisionRecommended *)0;
}

- (void)deleteFinalMitigationRecommendation
{
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;

  if (self->_whichEvent_Type == 132)
  {
    self->_whichEvent_Type = 0;
    finalMitigationRecommendation = self->_finalMitigationRecommendation;
    self->_finalMitigationRecommendation = 0;

  }
}

- (void)setApplicationPlaybackAttempted:(id)a3
{
  MHSchemaMHApplicationPlaybackAttempted *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;

  v4 = (MHSchemaMHApplicationPlaybackAttempted *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 133;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = v4;

}

- (MHSchemaMHApplicationPlaybackAttempted)applicationPlaybackAttempted
{
  if (self->_whichEvent_Type == 133)
    return self->_applicationPlaybackAttempted;
  else
    return (MHSchemaMHApplicationPlaybackAttempted *)0;
}

- (void)deleteApplicationPlaybackAttempted
{
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;

  if (self->_whichEvent_Type == 133)
  {
    self->_whichEvent_Type = 0;
    applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
    self->_applicationPlaybackAttempted = 0;

  }
}

- (void)setSiriLaunchRequestContext:(id)a3
{
  MHSchemaMHSiriLaunchRequestContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;

  v4 = (MHSchemaMHSiriLaunchRequestContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 134;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = v4;

}

- (MHSchemaMHSiriLaunchRequestContext)siriLaunchRequestContext
{
  if (self->_whichEvent_Type == 134)
    return self->_siriLaunchRequestContext;
  else
    return (MHSchemaMHSiriLaunchRequestContext *)0;
}

- (void)deleteSiriLaunchRequestContext
{
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;

  if (self->_whichEvent_Type == 134)
  {
    self->_whichEvent_Type = 0;
    siriLaunchRequestContext = self->_siriLaunchRequestContext;
    self->_siriLaunchRequestContext = 0;

  }
}

- (void)setEndpointerAccessibleContext:(id)a3
{
  MHSchemaMHEndpointerAccessibleContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;

  v4 = (MHSchemaMHEndpointerAccessibleContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 135;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = v4;

}

- (MHSchemaMHEndpointerAccessibleContext)endpointerAccessibleContext
{
  if (self->_whichEvent_Type == 135)
    return self->_endpointerAccessibleContext;
  else
    return (MHSchemaMHEndpointerAccessibleContext *)0;
}

- (void)deleteEndpointerAccessibleContext
{
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;

  if (self->_whichEvent_Type == 135)
  {
    self->_whichEvent_Type = 0;
    endpointerAccessibleContext = self->_endpointerAccessibleContext;
    self->_endpointerAccessibleContext = 0;

  }
}

- (void)setCarPlayLangaugeMismatched:(id)a3
{
  MHSchemaMHCarplayLanguageMismatch *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;

  v4 = (MHSchemaMHCarplayLanguageMismatch *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 136;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = v4;

}

- (MHSchemaMHCarplayLanguageMismatch)carPlayLangaugeMismatched
{
  if (self->_whichEvent_Type == 136)
    return self->_carPlayLangaugeMismatched;
  else
    return (MHSchemaMHCarplayLanguageMismatch *)0;
}

- (void)deleteCarPlayLangaugeMismatched
{
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;

  if (self->_whichEvent_Type == 136)
  {
    self->_whichEvent_Type = 0;
    carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
    self->_carPlayLangaugeMismatched = 0;

  }
}

- (void)setDarwinConnectedDeviceWakeContext:(id)a3
{
  MHSchemaMHDarwinConnectedDeviceWakeContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;

  v4 = (MHSchemaMHDarwinConnectedDeviceWakeContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 137;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = v4;

}

- (MHSchemaMHDarwinConnectedDeviceWakeContext)darwinConnectedDeviceWakeContext
{
  if (self->_whichEvent_Type == 137)
    return self->_darwinConnectedDeviceWakeContext;
  else
    return (MHSchemaMHDarwinConnectedDeviceWakeContext *)0;
}

- (void)deleteDarwinConnectedDeviceWakeContext
{
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;

  if (self->_whichEvent_Type == 137)
  {
    self->_whichEvent_Type = 0;
    darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
    self->_darwinConnectedDeviceWakeContext = 0;

  }
}

- (void)setOdldFalseTriggerMitigated:(id)a3
{
  MHSchemaMHOdldFalseTriggerMitigated *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;

  v4 = (MHSchemaMHOdldFalseTriggerMitigated *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 138;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = v4;

}

- (MHSchemaMHOdldFalseTriggerMitigated)odldFalseTriggerMitigated
{
  if (self->_whichEvent_Type == 138)
    return self->_odldFalseTriggerMitigated;
  else
    return (MHSchemaMHOdldFalseTriggerMitigated *)0;
}

- (void)deleteOdldFalseTriggerMitigated
{
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;

  if (self->_whichEvent_Type == 138)
  {
    self->_whichEvent_Type = 0;
    odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
    self->_odldFalseTriggerMitigated = 0;

  }
}

- (void)setSpeakerFalseTriggerMitigated:(id)a3
{
  MHSchemaMHSpeakerFalseTriggerMitigated *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;

  v4 = (MHSchemaMHSpeakerFalseTriggerMitigated *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 139;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = v4;

}

- (MHSchemaMHSpeakerFalseTriggerMitigated)speakerFalseTriggerMitigated
{
  if (self->_whichEvent_Type == 139)
    return self->_speakerFalseTriggerMitigated;
  else
    return (MHSchemaMHSpeakerFalseTriggerMitigated *)0;
}

- (void)deleteSpeakerFalseTriggerMitigated
{
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;

  if (self->_whichEvent_Type == 139)
  {
    self->_whichEvent_Type = 0;
    speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
    self->_speakerFalseTriggerMitigated = 0;

  }
}

- (void)setSiriDirectedSpeechDetectionFailed:(id)a3
{
  MHSchemaMHSiriDirectedSpeechDetectionFailed *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;

  v4 = (MHSchemaMHSiriDirectedSpeechDetectionFailed *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 140;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = v4;

}

- (MHSchemaMHSiriDirectedSpeechDetectionFailed)siriDirectedSpeechDetectionFailed
{
  if (self->_whichEvent_Type == 140)
    return self->_siriDirectedSpeechDetectionFailed;
  else
    return (MHSchemaMHSiriDirectedSpeechDetectionFailed *)0;
}

- (void)deleteSiriDirectedSpeechDetectionFailed
{
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;

  if (self->_whichEvent_Type == 140)
  {
    self->_whichEvent_Type = 0;
    siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
    self->_siriDirectedSpeechDetectionFailed = 0;

  }
}

- (void)setAudioDucked:(id)a3
{
  MHSchemaMHAudioDucked *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAudioDucked *audioDucked;

  v4 = (MHSchemaMHAudioDucked *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 141;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  audioDucked = self->_audioDucked;
  self->_audioDucked = v4;

}

- (MHSchemaMHAudioDucked)audioDucked
{
  if (self->_whichEvent_Type == 141)
    return self->_audioDucked;
  else
    return (MHSchemaMHAudioDucked *)0;
}

- (void)deleteAudioDucked
{
  MHSchemaMHAudioDucked *audioDucked;

  if (self->_whichEvent_Type == 141)
  {
    self->_whichEvent_Type = 0;
    audioDucked = self->_audioDucked;
    self->_audioDucked = 0;

  }
}

- (void)setAudioRecordingFailed:(id)a3
{
  MHSchemaMHAssistantDaemonAudioRecordingFailed *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;

  v4 = (MHSchemaMHAssistantDaemonAudioRecordingFailed *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 142;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = v4;

}

- (MHSchemaMHAssistantDaemonAudioRecordingFailed)audioRecordingFailed
{
  if (self->_whichEvent_Type == 142)
    return self->_audioRecordingFailed;
  else
    return (MHSchemaMHAssistantDaemonAudioRecordingFailed *)0;
}

- (void)deleteAudioRecordingFailed
{
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;

  if (self->_whichEvent_Type == 142)
  {
    self->_whichEvent_Type = 0;
    audioRecordingFailed = self->_audioRecordingFailed;
    self->_audioRecordingFailed = 0;

  }
}

- (void)setRtsFalseRejectDetected:(id)a3
{
  MHSchemaMHRTSFalseRejectDetected *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;

  v4 = (MHSchemaMHRTSFalseRejectDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 143;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = v4;

}

- (MHSchemaMHRTSFalseRejectDetected)rtsFalseRejectDetected
{
  if (self->_whichEvent_Type == 143)
    return self->_rtsFalseRejectDetected;
  else
    return (MHSchemaMHRTSFalseRejectDetected *)0;
}

- (void)deleteRtsFalseRejectDetected
{
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;

  if (self->_whichEvent_Type == 143)
  {
    self->_whichEvent_Type = 0;
    rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
    self->_rtsFalseRejectDetected = 0;

  }
}

- (void)setTrpCreated:(id)a3
{
  MHSchemaMHTRPCreated *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHTRPCreated *trpCreated;

  v4 = (MHSchemaMHTRPCreated *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 144;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  trpCreated = self->_trpCreated;
  self->_trpCreated = v4;

}

- (MHSchemaMHTRPCreated)trpCreated
{
  if (self->_whichEvent_Type == 144)
    return self->_trpCreated;
  else
    return (MHSchemaMHTRPCreated *)0;
}

- (void)deleteTrpCreated
{
  MHSchemaMHTRPCreated *trpCreated;

  if (self->_whichEvent_Type == 144)
  {
    self->_whichEvent_Type = 0;
    trpCreated = self->_trpCreated;
    self->_trpCreated = 0;

  }
}

- (void)setUserSpeakingContext:(id)a3
{
  MHSchemaMHUserSpeakingContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;

  v4 = (MHSchemaMHUserSpeakingContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 145;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = v4;

}

- (MHSchemaMHUserSpeakingContext)userSpeakingContext
{
  if (self->_whichEvent_Type == 145)
    return self->_userSpeakingContext;
  else
    return (MHSchemaMHUserSpeakingContext *)0;
}

- (void)deleteUserSpeakingContext
{
  MHSchemaMHUserSpeakingContext *userSpeakingContext;

  if (self->_whichEvent_Type == 145)
  {
    self->_whichEvent_Type = 0;
    userSpeakingContext = self->_userSpeakingContext;
    self->_userSpeakingContext = 0;

  }
}

- (void)setSpeechStopDetected:(id)a3
{
  MHSchemaMHSpeechStopDetected *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHSpeechStopDetected *speechStopDetected;

  v4 = (MHSchemaMHSpeechStopDetected *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 146;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = v4;

}

- (MHSchemaMHSpeechStopDetected)speechStopDetected
{
  if (self->_whichEvent_Type == 146)
    return self->_speechStopDetected;
  else
    return (MHSchemaMHSpeechStopDetected *)0;
}

- (void)deleteSpeechStopDetected
{
  MHSchemaMHSpeechStopDetected *speechStopDetected;

  if (self->_whichEvent_Type == 146)
  {
    self->_whichEvent_Type = 0;
    speechStopDetected = self->_speechStopDetected;
    self->_speechStopDetected = 0;

  }
}

- (void)setSpeechDetectorContext:(id)a3
{
  MHSchemaMHSpeechDetectorContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;

  v4 = (MHSchemaMHSpeechDetectorContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 147;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = v4;

}

- (MHSchemaMHSpeechDetectorContext)speechDetectorContext
{
  if (self->_whichEvent_Type == 147)
    return self->_speechDetectorContext;
  else
    return (MHSchemaMHSpeechDetectorContext *)0;
}

- (void)deleteSpeechDetectorContext
{
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;

  if (self->_whichEvent_Type == 147)
  {
    self->_whichEvent_Type = 0;
    speechDetectorContext = self->_speechDetectorContext;
    self->_speechDetectorContext = 0;

  }
}

- (void)setStoppedListeningForSpeechContinuation:(id)a3
{
  MHSchemaMHStoppedListeningForSpeechContinuation *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;

  v4 = (MHSchemaMHStoppedListeningForSpeechContinuation *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 148;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = v4;

}

- (MHSchemaMHStoppedListeningForSpeechContinuation)stoppedListeningForSpeechContinuation
{
  if (self->_whichEvent_Type == 148)
    return self->_stoppedListeningForSpeechContinuation;
  else
    return (MHSchemaMHStoppedListeningForSpeechContinuation *)0;
}

- (void)deleteStoppedListeningForSpeechContinuation
{
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;

  if (self->_whichEvent_Type == 148)
  {
    self->_whichEvent_Type = 0;
    stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
    self->_stoppedListeningForSpeechContinuation = 0;

  }
}

- (void)setUserEngagementModelContext:(id)a3
{
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;

  v4 = (MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 149;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = v4;

}

- (MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext)userEngagementModelContext
{
  if (self->_whichEvent_Type == 149)
    return self->_userEngagementModelContext;
  else
    return (MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *)0;
}

- (void)deleteUserEngagementModelContext
{
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;

  if (self->_whichEvent_Type == 149)
  {
    self->_whichEvent_Type = 0;
    userEngagementModelContext = self->_userEngagementModelContext;
    self->_userEngagementModelContext = 0;

  }
}

- (void)setAttendingContext:(id)a3
{
  MHSchemaMHAttendingContext *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAttendingContext *attendingContext;

  v4 = (MHSchemaMHAttendingContext *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 150;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  attendingContext = self->_attendingContext;
  self->_attendingContext = v4;

}

- (MHSchemaMHAttendingContext)attendingContext
{
  if (self->_whichEvent_Type == 150)
    return self->_attendingContext;
  else
    return (MHSchemaMHAttendingContext *)0;
}

- (void)deleteAttendingContext
{
  MHSchemaMHAttendingContext *attendingContext;

  if (self->_whichEvent_Type == 150)
  {
    self->_whichEvent_Type = 0;
    attendingContext = self->_attendingContext;
    self->_attendingContext = 0;

  }
}

- (void)setCrownPressed:(id)a3
{
  MHSchemaMHCrownPressed *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHCrownPressed *crownPressed;

  v4 = (MHSchemaMHCrownPressed *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 151;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  crownPressed = self->_crownPressed;
  self->_crownPressed = v4;

}

- (MHSchemaMHCrownPressed)crownPressed
{
  if (self->_whichEvent_Type == 151)
    return self->_crownPressed;
  else
    return (MHSchemaMHCrownPressed *)0;
}

- (void)deleteCrownPressed
{
  MHSchemaMHCrownPressed *crownPressed;

  if (self->_whichEvent_Type == 151)
  {
    self->_whichEvent_Type = 0;
    crownPressed = self->_crownPressed;
    self->_crownPressed = 0;

  }
}

- (void)setRtsTriggered:(id)a3
{
  MHSchemaMHRaiseToSpeakTriggered *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;

  v4 = (MHSchemaMHRaiseToSpeakTriggered *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 152;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = v4;

}

- (MHSchemaMHRaiseToSpeakTriggered)rtsTriggered
{
  if (self->_whichEvent_Type == 152)
    return self->_rtsTriggered;
  else
    return (MHSchemaMHRaiseToSpeakTriggered *)0;
}

- (void)deleteRtsTriggered
{
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;

  if (self->_whichEvent_Type == 152)
  {
    self->_whichEvent_Type = 0;
    rtsTriggered = self->_rtsTriggered;
    self->_rtsTriggered = 0;

  }
}

- (void)setRtsFirstPassPolicyTriggered:(id)a3
{
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;

  v4 = (MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 153;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = v4;

}

- (MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered)rtsFirstPassPolicyTriggered
{
  if (self->_whichEvent_Type == 153)
    return self->_rtsFirstPassPolicyTriggered;
  else
    return (MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *)0;
}

- (void)deleteRtsFirstPassPolicyTriggered
{
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;

  if (self->_whichEvent_Type == 153)
  {
    self->_whichEvent_Type = 0;
    rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
    self->_rtsFirstPassPolicyTriggered = 0;

  }
}

- (void)setRtsSecondPassPolicyDecisionMade:(id)a3
{
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;

  v4 = (MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 154;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = v4;

}

- (MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade)rtsSecondPassPolicyDecisionMade
{
  if (self->_whichEvent_Type == 154)
    return self->_rtsSecondPassPolicyDecisionMade;
  else
    return (MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *)0;
}

- (void)deleteRtsSecondPassPolicyDecisionMade
{
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;

  if (self->_whichEvent_Type == 154)
  {
    self->_whichEvent_Type = 0;
    rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
    self->_rtsSecondPassPolicyDecisionMade = 0;

  }
}

- (void)setVoiceProfileOnboarded:(id)a3
{
  MHSchemaMHVoiceProfileOnboarded *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;

  v4 = (MHSchemaMHVoiceProfileOnboarded *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 155;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = v4;

}

- (MHSchemaMHVoiceProfileOnboarded)voiceProfileOnboarded
{
  if (self->_whichEvent_Type == 155)
    return self->_voiceProfileOnboarded;
  else
    return (MHSchemaMHVoiceProfileOnboarded *)0;
}

- (void)deleteVoiceProfileOnboarded
{
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;

  if (self->_whichEvent_Type == 155)
  {
    self->_whichEvent_Type = 0;
    voiceProfileOnboarded = self->_voiceProfileOnboarded;
    self->_voiceProfileOnboarded = 0;

  }
}

- (void)setSensorControlStatusReported:(id)a3
{
  MHSchemaMHSensorControlStatusReported *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;

  v4 = (MHSchemaMHSensorControlStatusReported *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 156;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = v4;

}

- (MHSchemaMHSensorControlStatusReported)sensorControlStatusReported
{
  if (self->_whichEvent_Type == 156)
    return self->_sensorControlStatusReported;
  else
    return (MHSchemaMHSensorControlStatusReported *)0;
}

- (void)deleteSensorControlStatusReported
{
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;

  if (self->_whichEvent_Type == 156)
  {
    self->_whichEvent_Type = 0;
    sensorControlStatusReported = self->_sensorControlStatusReported;
    self->_sensorControlStatusReported = 0;

  }
}

- (void)setVoiceTriggerRePrompted:(id)a3
{
  MHSchemaMHVoiceTriggerRePrompted *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;

  v4 = (MHSchemaMHVoiceTriggerRePrompted *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 157;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = v4;

}

- (MHSchemaMHVoiceTriggerRePrompted)voiceTriggerRePrompted
{
  if (self->_whichEvent_Type == 157)
    return self->_voiceTriggerRePrompted;
  else
    return (MHSchemaMHVoiceTriggerRePrompted *)0;
}

- (void)deleteVoiceTriggerRePrompted
{
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;

  if (self->_whichEvent_Type == 157)
  {
    self->_whichEvent_Type = 0;
    voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
    self->_voiceTriggerRePrompted = 0;

  }
}

- (void)setAssistantDaemonAudioRecordingFailureInsufficientPriority:(id)a3
{
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;
  unint64_t v64;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;

  v4 = (MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = 0;

  v64 = 158;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = v4;

}

- (MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority)assistantDaemonAudioRecordingFailureInsufficientPriority
{
  if (self->_whichEvent_Type == 158)
    return self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  else
    return (MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *)0;
}

- (void)deleteAssistantDaemonAudioRecordingFailureInsufficientPriority
{
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;

  if (self->_whichEvent_Type == 158)
  {
    self->_whichEvent_Type = 0;
    assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
    self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  }
}

- (void)setVoiceProfileICloudSyncFinished:(id)a3
{
  MHSchemaMHVoiceProfileICloudSyncFinished *v4;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *acousticFalseTriggerMitigationEvaluationContext;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *latticeFalseTriggerMitigationEvaluationContext;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *unintendedResponseSuppressionExecutionContext;
  MHSchemaMHCoreSpeechPreprocessorCompleted *coreSpeechPreprocessorCompleted;
  MHSchemaMHASRAudioConfigureStarted *asrAudioConfigureStarted;
  MHSchemaMHAssistantDaemonAudioInitContext *assistantDaemonAudioInitContext;
  MHSchemaMHAssistantDaemonAudioConfigureContext *assistantDaemonAudioConfigureContext;
  MHSchemaMHAssistantDaemonAudioPrepareContext *assistantDaemonAudioPrepareContext;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *assistantDaemonAudioPrewarmContext;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *assistantDaemonAudioStartRecordingContext;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *assistantDaemonAudioStopRecordingContext;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *assistantDaemonAudioSessionSetActiveContext;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *assistantDaemonAudioSessionSetInactiveContext;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *assistantDaemonAudioFetchRouteContext;
  MHSchemaMHAssistantDaemonAudioRecordingContext *assistantDaemonAudioRecordingContext;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *assistantDaemonAudioRecordingMissedBufferDetected;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *assistantDaemonAudioLateBufferDetected;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *assistantDaemonAudioRecordingFirstBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *assistantDaemonAudioRecordingLastBufferContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *assistantDaemonAudioRecordingInterruptionContext;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *assistantDaemonAudioRecordingInterruptionStartedTier1;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *assistantDaemonAudioBluetoothInfo;
  MHSchemaMHVoiceTriggerTwoShotDetected *voiceTriggerTwoShotDetected;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *assistantDaemonAudioTwoShotTransitionContext;
  MHSchemaMHVoiceTriggerContext *voiceTriggerContext;
  MHSchemaMHEndpointDetected *endpointDetected;
  MHSchemaMHEndpointLatencyInfoReported *endpointLatencyInfoReported;
  MHSchemaMHVoiceAdBlockerContext *adblockerContext;
  MHSchemaMHOnDeviceEndpointerContext *onDeviceEndpointerContext;
  MHSchemaMHServerEndpointerContext *serverEndpointerContext;
  MHSchemaMHEndpointerUsed *endpointerUsed;
  MHSchemaMHEndpointDelayContext *endpointDelayContext;
  MHSchemaMHMitigationDecisionRecommended *finalMitigationRecommendation;
  MHSchemaMHApplicationPlaybackAttempted *applicationPlaybackAttempted;
  MHSchemaMHSiriLaunchRequestContext *siriLaunchRequestContext;
  MHSchemaMHEndpointerAccessibleContext *endpointerAccessibleContext;
  MHSchemaMHCarplayLanguageMismatch *carPlayLangaugeMismatched;
  MHSchemaMHDarwinConnectedDeviceWakeContext *darwinConnectedDeviceWakeContext;
  MHSchemaMHOdldFalseTriggerMitigated *odldFalseTriggerMitigated;
  MHSchemaMHSpeakerFalseTriggerMitigated *speakerFalseTriggerMitigated;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *siriDirectedSpeechDetectionFailed;
  MHSchemaMHAudioDucked *audioDucked;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *audioRecordingFailed;
  MHSchemaMHRTSFalseRejectDetected *rtsFalseRejectDetected;
  MHSchemaMHTRPCreated *trpCreated;
  MHSchemaMHUserSpeakingContext *userSpeakingContext;
  MHSchemaMHSpeechStopDetected *speechStopDetected;
  MHSchemaMHSpeechDetectorContext *speechDetectorContext;
  MHSchemaMHStoppedListeningForSpeechContinuation *stoppedListeningForSpeechContinuation;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *userEngagementModelContext;
  MHSchemaMHAttendingContext *attendingContext;
  MHSchemaMHCrownPressed *crownPressed;
  MHSchemaMHRaiseToSpeakTriggered *rtsTriggered;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *rtsFirstPassPolicyTriggered;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *rtsSecondPassPolicyDecisionMade;
  MHSchemaMHVoiceProfileOnboarded *voiceProfileOnboarded;
  MHSchemaMHSensorControlStatusReported *sensorControlStatusReported;
  MHSchemaMHVoiceTriggerRePrompted *voiceTriggerRePrompted;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *assistantDaemonAudioRecordingFailureInsufficientPriority;
  unint64_t v64;
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;

  v4 = (MHSchemaMHVoiceProfileICloudSyncFinished *)a3;
  acousticFalseTriggerMitigationEvaluationContext = self->_acousticFalseTriggerMitigationEvaluationContext;
  self->_acousticFalseTriggerMitigationEvaluationContext = 0;

  latticeFalseTriggerMitigationEvaluationContext = self->_latticeFalseTriggerMitigationEvaluationContext;
  self->_latticeFalseTriggerMitigationEvaluationContext = 0;

  unintendedResponseSuppressionExecutionContext = self->_unintendedResponseSuppressionExecutionContext;
  self->_unintendedResponseSuppressionExecutionContext = 0;

  coreSpeechPreprocessorCompleted = self->_coreSpeechPreprocessorCompleted;
  self->_coreSpeechPreprocessorCompleted = 0;

  asrAudioConfigureStarted = self->_asrAudioConfigureStarted;
  self->_asrAudioConfigureStarted = 0;

  assistantDaemonAudioInitContext = self->_assistantDaemonAudioInitContext;
  self->_assistantDaemonAudioInitContext = 0;

  assistantDaemonAudioConfigureContext = self->_assistantDaemonAudioConfigureContext;
  self->_assistantDaemonAudioConfigureContext = 0;

  assistantDaemonAudioPrepareContext = self->_assistantDaemonAudioPrepareContext;
  self->_assistantDaemonAudioPrepareContext = 0;

  assistantDaemonAudioPrewarmContext = self->_assistantDaemonAudioPrewarmContext;
  self->_assistantDaemonAudioPrewarmContext = 0;

  assistantDaemonAudioStartRecordingContext = self->_assistantDaemonAudioStartRecordingContext;
  self->_assistantDaemonAudioStartRecordingContext = 0;

  assistantDaemonAudioStopRecordingContext = self->_assistantDaemonAudioStopRecordingContext;
  self->_assistantDaemonAudioStopRecordingContext = 0;

  assistantDaemonAudioSessionSetActiveContext = self->_assistantDaemonAudioSessionSetActiveContext;
  self->_assistantDaemonAudioSessionSetActiveContext = 0;

  assistantDaemonAudioSessionSetInactiveContext = self->_assistantDaemonAudioSessionSetInactiveContext;
  self->_assistantDaemonAudioSessionSetInactiveContext = 0;

  assistantDaemonAudioFetchRouteContext = self->_assistantDaemonAudioFetchRouteContext;
  self->_assistantDaemonAudioFetchRouteContext = 0;

  assistantDaemonAudioRecordingContext = self->_assistantDaemonAudioRecordingContext;
  self->_assistantDaemonAudioRecordingContext = 0;

  assistantDaemonAudioRecordingMissedBufferDetected = self->_assistantDaemonAudioRecordingMissedBufferDetected;
  self->_assistantDaemonAudioRecordingMissedBufferDetected = 0;

  assistantDaemonAudioLateBufferDetected = self->_assistantDaemonAudioLateBufferDetected;
  self->_assistantDaemonAudioLateBufferDetected = 0;

  assistantDaemonAudioRecordingFirstBufferContext = self->_assistantDaemonAudioRecordingFirstBufferContext;
  self->_assistantDaemonAudioRecordingFirstBufferContext = 0;

  assistantDaemonAudioRecordingLastBufferContext = self->_assistantDaemonAudioRecordingLastBufferContext;
  self->_assistantDaemonAudioRecordingLastBufferContext = 0;

  assistantDaemonAudioRecordingInterruptionContext = self->_assistantDaemonAudioRecordingInterruptionContext;
  self->_assistantDaemonAudioRecordingInterruptionContext = 0;

  assistantDaemonAudioRecordingInterruptionStartedTier1 = self->_assistantDaemonAudioRecordingInterruptionStartedTier1;
  self->_assistantDaemonAudioRecordingInterruptionStartedTier1 = 0;

  assistantDaemonAudioBluetoothInfo = self->_assistantDaemonAudioBluetoothInfo;
  self->_assistantDaemonAudioBluetoothInfo = 0;

  voiceTriggerTwoShotDetected = self->_voiceTriggerTwoShotDetected;
  self->_voiceTriggerTwoShotDetected = 0;

  assistantDaemonAudioTwoShotTransitionContext = self->_assistantDaemonAudioTwoShotTransitionContext;
  self->_assistantDaemonAudioTwoShotTransitionContext = 0;

  voiceTriggerContext = self->_voiceTriggerContext;
  self->_voiceTriggerContext = 0;

  endpointDetected = self->_endpointDetected;
  self->_endpointDetected = 0;

  endpointLatencyInfoReported = self->_endpointLatencyInfoReported;
  self->_endpointLatencyInfoReported = 0;

  adblockerContext = self->_adblockerContext;
  self->_adblockerContext = 0;

  onDeviceEndpointerContext = self->_onDeviceEndpointerContext;
  self->_onDeviceEndpointerContext = 0;

  serverEndpointerContext = self->_serverEndpointerContext;
  self->_serverEndpointerContext = 0;

  endpointerUsed = self->_endpointerUsed;
  self->_endpointerUsed = 0;

  endpointDelayContext = self->_endpointDelayContext;
  self->_endpointDelayContext = 0;

  finalMitigationRecommendation = self->_finalMitigationRecommendation;
  self->_finalMitigationRecommendation = 0;

  applicationPlaybackAttempted = self->_applicationPlaybackAttempted;
  self->_applicationPlaybackAttempted = 0;

  siriLaunchRequestContext = self->_siriLaunchRequestContext;
  self->_siriLaunchRequestContext = 0;

  endpointerAccessibleContext = self->_endpointerAccessibleContext;
  self->_endpointerAccessibleContext = 0;

  carPlayLangaugeMismatched = self->_carPlayLangaugeMismatched;
  self->_carPlayLangaugeMismatched = 0;

  darwinConnectedDeviceWakeContext = self->_darwinConnectedDeviceWakeContext;
  self->_darwinConnectedDeviceWakeContext = 0;

  odldFalseTriggerMitigated = self->_odldFalseTriggerMitigated;
  self->_odldFalseTriggerMitigated = 0;

  speakerFalseTriggerMitigated = self->_speakerFalseTriggerMitigated;
  self->_speakerFalseTriggerMitigated = 0;

  siriDirectedSpeechDetectionFailed = self->_siriDirectedSpeechDetectionFailed;
  self->_siriDirectedSpeechDetectionFailed = 0;

  audioDucked = self->_audioDucked;
  self->_audioDucked = 0;

  audioRecordingFailed = self->_audioRecordingFailed;
  self->_audioRecordingFailed = 0;

  rtsFalseRejectDetected = self->_rtsFalseRejectDetected;
  self->_rtsFalseRejectDetected = 0;

  trpCreated = self->_trpCreated;
  self->_trpCreated = 0;

  userSpeakingContext = self->_userSpeakingContext;
  self->_userSpeakingContext = 0;

  speechStopDetected = self->_speechStopDetected;
  self->_speechStopDetected = 0;

  speechDetectorContext = self->_speechDetectorContext;
  self->_speechDetectorContext = 0;

  stoppedListeningForSpeechContinuation = self->_stoppedListeningForSpeechContinuation;
  self->_stoppedListeningForSpeechContinuation = 0;

  userEngagementModelContext = self->_userEngagementModelContext;
  self->_userEngagementModelContext = 0;

  attendingContext = self->_attendingContext;
  self->_attendingContext = 0;

  crownPressed = self->_crownPressed;
  self->_crownPressed = 0;

  rtsTriggered = self->_rtsTriggered;
  self->_rtsTriggered = 0;

  rtsFirstPassPolicyTriggered = self->_rtsFirstPassPolicyTriggered;
  self->_rtsFirstPassPolicyTriggered = 0;

  rtsSecondPassPolicyDecisionMade = self->_rtsSecondPassPolicyDecisionMade;
  self->_rtsSecondPassPolicyDecisionMade = 0;

  voiceProfileOnboarded = self->_voiceProfileOnboarded;
  self->_voiceProfileOnboarded = 0;

  sensorControlStatusReported = self->_sensorControlStatusReported;
  self->_sensorControlStatusReported = 0;

  voiceTriggerRePrompted = self->_voiceTriggerRePrompted;
  self->_voiceTriggerRePrompted = 0;

  assistantDaemonAudioRecordingFailureInsufficientPriority = self->_assistantDaemonAudioRecordingFailureInsufficientPriority;
  self->_assistantDaemonAudioRecordingFailureInsufficientPriority = 0;

  v64 = 159;
  if (!v4)
    v64 = 0;
  self->_whichEvent_Type = v64;
  voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
  self->_voiceProfileICloudSyncFinished = v4;

}

- (MHSchemaMHVoiceProfileICloudSyncFinished)voiceProfileICloudSyncFinished
{
  if (self->_whichEvent_Type == 159)
    return self->_voiceProfileICloudSyncFinished;
  else
    return (MHSchemaMHVoiceProfileICloudSyncFinished *)0;
}

- (void)deleteVoiceProfileICloudSyncFinished
{
  MHSchemaMHVoiceProfileICloudSyncFinished *voiceProfileICloudSyncFinished;

  if (self->_whichEvent_Type == 159)
  {
    self->_whichEvent_Type = 0;
    voiceProfileICloudSyncFinished = self->_voiceProfileICloudSyncFinished;
    self->_voiceProfileICloudSyncFinished = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHClientEventReadFrom(self, (uint64_t)a3);
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
  void *v127;
  id v128;

  v128 = a3;
  -[MHSchemaMHClientEvent mhId](self, "mhId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MHSchemaMHClientEvent mhId](self, "mhId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MHSchemaMHClientEvent eventMetadata](self, "eventMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent acousticFalseTriggerMitigationEvaluationContext](self, "acousticFalseTriggerMitigationEvaluationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MHSchemaMHClientEvent acousticFalseTriggerMitigationEvaluationContext](self, "acousticFalseTriggerMitigationEvaluationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent latticeFalseTriggerMitigationEvaluationContext](self, "latticeFalseTriggerMitigationEvaluationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MHSchemaMHClientEvent latticeFalseTriggerMitigationEvaluationContext](self, "latticeFalseTriggerMitigationEvaluationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent unintendedResponseSuppressionExecutionContext](self, "unintendedResponseSuppressionExecutionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MHSchemaMHClientEvent unintendedResponseSuppressionExecutionContext](self, "unintendedResponseSuppressionExecutionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent coreSpeechPreprocessorCompleted](self, "coreSpeechPreprocessorCompleted");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MHSchemaMHClientEvent coreSpeechPreprocessorCompleted](self, "coreSpeechPreprocessorCompleted");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent asrAudioConfigureStarted](self, "asrAudioConfigureStarted");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MHSchemaMHClientEvent asrAudioConfigureStarted](self, "asrAudioConfigureStarted");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioInitContext](self, "assistantDaemonAudioInitContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioInitContext](self, "assistantDaemonAudioInitContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioConfigureContext](self, "assistantDaemonAudioConfigureContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioConfigureContext](self, "assistantDaemonAudioConfigureContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioPrepareContext](self, "assistantDaemonAudioPrepareContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioPrepareContext](self, "assistantDaemonAudioPrepareContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioPrewarmContext](self, "assistantDaemonAudioPrewarmContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioPrewarmContext](self, "assistantDaemonAudioPrewarmContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioStartRecordingContext](self, "assistantDaemonAudioStartRecordingContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioStartRecordingContext](self, "assistantDaemonAudioStartRecordingContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioStopRecordingContext](self, "assistantDaemonAudioStopRecordingContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioStopRecordingContext](self, "assistantDaemonAudioStopRecordingContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetActiveContext](self, "assistantDaemonAudioSessionSetActiveContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetActiveContext](self, "assistantDaemonAudioSessionSetActiveContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetInactiveContext](self, "assistantDaemonAudioSessionSetInactiveContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetInactiveContext](self, "assistantDaemonAudioSessionSetInactiveContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioFetchRouteContext](self, "assistantDaemonAudioFetchRouteContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioFetchRouteContext](self, "assistantDaemonAudioFetchRouteContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingContext](self, "assistantDaemonAudioRecordingContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingContext](self, "assistantDaemonAudioRecordingContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingMissedBufferDetected](self, "assistantDaemonAudioRecordingMissedBufferDetected");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingMissedBufferDetected](self, "assistantDaemonAudioRecordingMissedBufferDetected");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioLateBufferDetected](self, "assistantDaemonAudioLateBufferDetected");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioLateBufferDetected](self, "assistantDaemonAudioLateBufferDetected");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFirstBufferContext](self, "assistantDaemonAudioRecordingFirstBufferContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFirstBufferContext](self, "assistantDaemonAudioRecordingFirstBufferContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingLastBufferContext](self, "assistantDaemonAudioRecordingLastBufferContext");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingLastBufferContext](self, "assistantDaemonAudioRecordingLastBufferContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionContext](self, "assistantDaemonAudioRecordingInterruptionContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionContext](self, "assistantDaemonAudioRecordingInterruptionContext");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionStartedTier1](self, "assistantDaemonAudioRecordingInterruptionStartedTier1");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionStartedTier1](self, "assistantDaemonAudioRecordingInterruptionStartedTier1");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioBluetoothInfo](self, "assistantDaemonAudioBluetoothInfo");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioBluetoothInfo](self, "assistantDaemonAudioBluetoothInfo");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent voiceTriggerTwoShotDetected](self, "voiceTriggerTwoShotDetected");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[MHSchemaMHClientEvent voiceTriggerTwoShotDetected](self, "voiceTriggerTwoShotDetected");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioTwoShotTransitionContext](self, "assistantDaemonAudioTwoShotTransitionContext");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioTwoShotTransitionContext](self, "assistantDaemonAudioTwoShotTransitionContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent voiceTriggerContext](self, "voiceTriggerContext");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[MHSchemaMHClientEvent voiceTriggerContext](self, "voiceTriggerContext");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent endpointDetected](self, "endpointDetected");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    -[MHSchemaMHClientEvent endpointDetected](self, "endpointDetected");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent endpointLatencyInfoReported](self, "endpointLatencyInfoReported");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    -[MHSchemaMHClientEvent endpointLatencyInfoReported](self, "endpointLatencyInfoReported");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent adblockerContext](self, "adblockerContext");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[MHSchemaMHClientEvent adblockerContext](self, "adblockerContext");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent onDeviceEndpointerContext](self, "onDeviceEndpointerContext");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[MHSchemaMHClientEvent onDeviceEndpointerContext](self, "onDeviceEndpointerContext");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent serverEndpointerContext](self, "serverEndpointerContext");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    -[MHSchemaMHClientEvent serverEndpointerContext](self, "serverEndpointerContext");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent endpointerUsed](self, "endpointerUsed");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    -[MHSchemaMHClientEvent endpointerUsed](self, "endpointerUsed");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent endpointDelayContext](self, "endpointDelayContext");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[MHSchemaMHClientEvent endpointDelayContext](self, "endpointDelayContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent finalMitigationRecommendation](self, "finalMitigationRecommendation");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    -[MHSchemaMHClientEvent finalMitigationRecommendation](self, "finalMitigationRecommendation");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent applicationPlaybackAttempted](self, "applicationPlaybackAttempted");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    -[MHSchemaMHClientEvent applicationPlaybackAttempted](self, "applicationPlaybackAttempted");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent siriLaunchRequestContext](self, "siriLaunchRequestContext");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    -[MHSchemaMHClientEvent siriLaunchRequestContext](self, "siriLaunchRequestContext");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent endpointerAccessibleContext](self, "endpointerAccessibleContext");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    -[MHSchemaMHClientEvent endpointerAccessibleContext](self, "endpointerAccessibleContext");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent carPlayLangaugeMismatched](self, "carPlayLangaugeMismatched");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    -[MHSchemaMHClientEvent carPlayLangaugeMismatched](self, "carPlayLangaugeMismatched");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent darwinConnectedDeviceWakeContext](self, "darwinConnectedDeviceWakeContext");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    -[MHSchemaMHClientEvent darwinConnectedDeviceWakeContext](self, "darwinConnectedDeviceWakeContext");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent odldFalseTriggerMitigated](self, "odldFalseTriggerMitigated");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    -[MHSchemaMHClientEvent odldFalseTriggerMitigated](self, "odldFalseTriggerMitigated");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent speakerFalseTriggerMitigated](self, "speakerFalseTriggerMitigated");
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    -[MHSchemaMHClientEvent speakerFalseTriggerMitigated](self, "speakerFalseTriggerMitigated");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent siriDirectedSpeechDetectionFailed](self, "siriDirectedSpeechDetectionFailed");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    -[MHSchemaMHClientEvent siriDirectedSpeechDetectionFailed](self, "siriDirectedSpeechDetectionFailed");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent audioDucked](self, "audioDucked");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    -[MHSchemaMHClientEvent audioDucked](self, "audioDucked");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent audioRecordingFailed](self, "audioRecordingFailed");
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (v92)
  {
    -[MHSchemaMHClientEvent audioRecordingFailed](self, "audioRecordingFailed");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (v94)
  {
    -[MHSchemaMHClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent trpCreated](self, "trpCreated");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
  {
    -[MHSchemaMHClientEvent trpCreated](self, "trpCreated");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent userSpeakingContext](self, "userSpeakingContext");
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (v98)
  {
    -[MHSchemaMHClientEvent userSpeakingContext](self, "userSpeakingContext");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent speechStopDetected](self, "speechStopDetected");
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    -[MHSchemaMHClientEvent speechStopDetected](self, "speechStopDetected");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent speechDetectorContext](self, "speechDetectorContext");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  if (v102)
  {
    -[MHSchemaMHClientEvent speechDetectorContext](self, "speechDetectorContext");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent stoppedListeningForSpeechContinuation](self, "stoppedListeningForSpeechContinuation");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    -[MHSchemaMHClientEvent stoppedListeningForSpeechContinuation](self, "stoppedListeningForSpeechContinuation");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent userEngagementModelContext](self, "userEngagementModelContext");
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    -[MHSchemaMHClientEvent userEngagementModelContext](self, "userEngagementModelContext");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent attendingContext](self, "attendingContext");
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
  {
    -[MHSchemaMHClientEvent attendingContext](self, "attendingContext");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent crownPressed](self, "crownPressed");
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  if (v110)
  {
    -[MHSchemaMHClientEvent crownPressed](self, "crownPressed");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent rtsTriggered](self, "rtsTriggered");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (v112)
  {
    -[MHSchemaMHClientEvent rtsTriggered](self, "rtsTriggered");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (v114)
  {
    -[MHSchemaMHClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  if (v116)
  {
    -[MHSchemaMHClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent voiceProfileOnboarded](self, "voiceProfileOnboarded");
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  if (v118)
  {
    -[MHSchemaMHClientEvent voiceProfileOnboarded](self, "voiceProfileOnboarded");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent sensorControlStatusReported](self, "sensorControlStatusReported");
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  if (v120)
  {
    -[MHSchemaMHClientEvent sensorControlStatusReported](self, "sensorControlStatusReported");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent voiceTriggerRePrompted](self, "voiceTriggerRePrompted");
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  if (v122)
  {
    -[MHSchemaMHClientEvent voiceTriggerRePrompted](self, "voiceTriggerRePrompted");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFailureInsufficientPriority](self, "assistantDaemonAudioRecordingFailureInsufficientPriority");
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  if (v124)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFailureInsufficientPriority](self, "assistantDaemonAudioRecordingFailureInsufficientPriority");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHClientEvent voiceProfileICloudSyncFinished](self, "voiceProfileICloudSyncFinished");
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  if (v126)
  {
    -[MHSchemaMHClientEvent voiceProfileICloudSyncFinished](self, "voiceProfileICloudSyncFinished");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v212;
  uint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  int v217;
  uint64_t v218;
  void *v219;
  void *v220;
  void *v221;
  int v222;
  uint64_t v223;
  void *v224;
  void *v225;
  void *v226;
  int v227;
  uint64_t v228;
  void *v229;
  void *v230;
  void *v231;
  int v232;
  uint64_t v233;
  void *v234;
  void *v235;
  void *v236;
  int v237;
  uint64_t v238;
  void *v239;
  void *v240;
  void *v241;
  int v242;
  uint64_t v243;
  void *v244;
  void *v245;
  void *v246;
  int v247;
  uint64_t v248;
  void *v249;
  void *v250;
  void *v251;
  int v252;
  uint64_t v253;
  void *v254;
  void *v255;
  void *v256;
  int v257;
  uint64_t v258;
  void *v259;
  void *v260;
  void *v261;
  int v262;
  uint64_t v263;
  void *v264;
  void *v265;
  void *v266;
  int v267;
  uint64_t v268;
  void *v269;
  void *v270;
  void *v271;
  int v272;
  uint64_t v273;
  void *v274;
  void *v275;
  void *v276;
  int v277;
  uint64_t v278;
  void *v279;
  void *v280;
  void *v281;
  int v282;
  uint64_t v283;
  void *v284;
  void *v285;
  void *v286;
  int v287;
  uint64_t v288;
  void *v289;
  void *v290;
  void *v291;
  int v292;
  uint64_t v293;
  void *v294;
  void *v295;
  void *v296;
  int v297;
  uint64_t v298;
  void *v299;
  void *v300;
  void *v301;
  int v302;
  uint64_t v303;
  void *v304;
  void *v305;
  void *v306;
  int v307;
  uint64_t v308;
  void *v309;
  void *v310;
  void *v311;
  int v312;
  uint64_t v313;
  void *v314;
  void *v315;
  void *v316;
  char v317;
  BOOL v318;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_313;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_313;
  -[MHSchemaMHClientEvent mhId](self, "mhId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mhId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent mhId](self, "mhId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[MHSchemaMHClientEvent mhId](self, "mhId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mhId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent eventMetadata](self, "eventMetadata");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[MHSchemaMHClientEvent eventMetadata](self, "eventMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent acousticFalseTriggerMitigationEvaluationContext](self, "acousticFalseTriggerMitigationEvaluationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acousticFalseTriggerMitigationEvaluationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent acousticFalseTriggerMitigationEvaluationContext](self, "acousticFalseTriggerMitigationEvaluationContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[MHSchemaMHClientEvent acousticFalseTriggerMitigationEvaluationContext](self, "acousticFalseTriggerMitigationEvaluationContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "acousticFalseTriggerMitigationEvaluationContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent latticeFalseTriggerMitigationEvaluationContext](self, "latticeFalseTriggerMitigationEvaluationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latticeFalseTriggerMitigationEvaluationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent latticeFalseTriggerMitigationEvaluationContext](self, "latticeFalseTriggerMitigationEvaluationContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[MHSchemaMHClientEvent latticeFalseTriggerMitigationEvaluationContext](self, "latticeFalseTriggerMitigationEvaluationContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latticeFalseTriggerMitigationEvaluationContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent unintendedResponseSuppressionExecutionContext](self, "unintendedResponseSuppressionExecutionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unintendedResponseSuppressionExecutionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent unintendedResponseSuppressionExecutionContext](self, "unintendedResponseSuppressionExecutionContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[MHSchemaMHClientEvent unintendedResponseSuppressionExecutionContext](self, "unintendedResponseSuppressionExecutionContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unintendedResponseSuppressionExecutionContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent coreSpeechPreprocessorCompleted](self, "coreSpeechPreprocessorCompleted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreSpeechPreprocessorCompleted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent coreSpeechPreprocessorCompleted](self, "coreSpeechPreprocessorCompleted");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[MHSchemaMHClientEvent coreSpeechPreprocessorCompleted](self, "coreSpeechPreprocessorCompleted");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coreSpeechPreprocessorCompleted");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent asrAudioConfigureStarted](self, "asrAudioConfigureStarted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asrAudioConfigureStarted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent asrAudioConfigureStarted](self, "asrAudioConfigureStarted");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[MHSchemaMHClientEvent asrAudioConfigureStarted](self, "asrAudioConfigureStarted");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asrAudioConfigureStarted");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioInitContext](self, "assistantDaemonAudioInitContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioInitContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioInitContext](self, "assistantDaemonAudioInitContext");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[MHSchemaMHClientEvent assistantDaemonAudioInitContext](self, "assistantDaemonAudioInitContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioInitContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioConfigureContext](self, "assistantDaemonAudioConfigureContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioConfigureContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioConfigureContext](self, "assistantDaemonAudioConfigureContext");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[MHSchemaMHClientEvent assistantDaemonAudioConfigureContext](self, "assistantDaemonAudioConfigureContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioConfigureContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioPrepareContext](self, "assistantDaemonAudioPrepareContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioPrepareContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioPrepareContext](self, "assistantDaemonAudioPrepareContext");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[MHSchemaMHClientEvent assistantDaemonAudioPrepareContext](self, "assistantDaemonAudioPrepareContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioPrepareContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioPrewarmContext](self, "assistantDaemonAudioPrewarmContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioPrewarmContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioPrewarmContext](self, "assistantDaemonAudioPrewarmContext");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[MHSchemaMHClientEvent assistantDaemonAudioPrewarmContext](self, "assistantDaemonAudioPrewarmContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioPrewarmContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioStartRecordingContext](self, "assistantDaemonAudioStartRecordingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioStartRecordingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioStartRecordingContext](self, "assistantDaemonAudioStartRecordingContext");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[MHSchemaMHClientEvent assistantDaemonAudioStartRecordingContext](self, "assistantDaemonAudioStartRecordingContext");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioStartRecordingContext");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioStopRecordingContext](self, "assistantDaemonAudioStopRecordingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioStopRecordingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioStopRecordingContext](self, "assistantDaemonAudioStopRecordingContext");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[MHSchemaMHClientEvent assistantDaemonAudioStopRecordingContext](self, "assistantDaemonAudioStopRecordingContext");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioStopRecordingContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetActiveContext](self, "assistantDaemonAudioSessionSetActiveContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioSessionSetActiveContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetActiveContext](self, "assistantDaemonAudioSessionSetActiveContext");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetActiveContext](self, "assistantDaemonAudioSessionSetActiveContext");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioSessionSetActiveContext");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetInactiveContext](self, "assistantDaemonAudioSessionSetInactiveContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioSessionSetInactiveContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetInactiveContext](self, "assistantDaemonAudioSessionSetInactiveContext");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetInactiveContext](self, "assistantDaemonAudioSessionSetInactiveContext");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioSessionSetInactiveContext");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioFetchRouteContext](self, "assistantDaemonAudioFetchRouteContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioFetchRouteContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioFetchRouteContext](self, "assistantDaemonAudioFetchRouteContext");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[MHSchemaMHClientEvent assistantDaemonAudioFetchRouteContext](self, "assistantDaemonAudioFetchRouteContext");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioFetchRouteContext");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingContext](self, "assistantDaemonAudioRecordingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioRecordingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingContext](self, "assistantDaemonAudioRecordingContext");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingContext](self, "assistantDaemonAudioRecordingContext");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioRecordingContext");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingMissedBufferDetected](self, "assistantDaemonAudioRecordingMissedBufferDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioRecordingMissedBufferDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingMissedBufferDetected](self, "assistantDaemonAudioRecordingMissedBufferDetected");
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)v93;
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingMissedBufferDetected](self, "assistantDaemonAudioRecordingMissedBufferDetected");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioRecordingMissedBufferDetected");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v95, "isEqual:", v96);

    if (!v97)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioLateBufferDetected](self, "assistantDaemonAudioLateBufferDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioLateBufferDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioLateBufferDetected](self, "assistantDaemonAudioLateBufferDetected");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    -[MHSchemaMHClientEvent assistantDaemonAudioLateBufferDetected](self, "assistantDaemonAudioLateBufferDetected");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioLateBufferDetected");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "isEqual:", v101);

    if (!v102)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFirstBufferContext](self, "assistantDaemonAudioRecordingFirstBufferContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioRecordingFirstBufferContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFirstBufferContext](self, "assistantDaemonAudioRecordingFirstBufferContext");
  v103 = objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    v104 = (void *)v103;
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFirstBufferContext](self, "assistantDaemonAudioRecordingFirstBufferContext");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioRecordingFirstBufferContext");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v105, "isEqual:", v106);

    if (!v107)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingLastBufferContext](self, "assistantDaemonAudioRecordingLastBufferContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioRecordingLastBufferContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingLastBufferContext](self, "assistantDaemonAudioRecordingLastBufferContext");
  v108 = objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    v109 = (void *)v108;
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingLastBufferContext](self, "assistantDaemonAudioRecordingLastBufferContext");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioRecordingLastBufferContext");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v110, "isEqual:", v111);

    if (!v112)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionContext](self, "assistantDaemonAudioRecordingInterruptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioRecordingInterruptionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionContext](self, "assistantDaemonAudioRecordingInterruptionContext");
  v113 = objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    v114 = (void *)v113;
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionContext](self, "assistantDaemonAudioRecordingInterruptionContext");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioRecordingInterruptionContext");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v115, "isEqual:", v116);

    if (!v117)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionStartedTier1](self, "assistantDaemonAudioRecordingInterruptionStartedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioRecordingInterruptionStartedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionStartedTier1](self, "assistantDaemonAudioRecordingInterruptionStartedTier1");
  v118 = objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = (void *)v118;
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionStartedTier1](self, "assistantDaemonAudioRecordingInterruptionStartedTier1");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioRecordingInterruptionStartedTier1");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v120, "isEqual:", v121);

    if (!v122)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioBluetoothInfo](self, "assistantDaemonAudioBluetoothInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioBluetoothInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioBluetoothInfo](self, "assistantDaemonAudioBluetoothInfo");
  v123 = objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    v124 = (void *)v123;
    -[MHSchemaMHClientEvent assistantDaemonAudioBluetoothInfo](self, "assistantDaemonAudioBluetoothInfo");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioBluetoothInfo");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v125, "isEqual:", v126);

    if (!v127)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent voiceTriggerTwoShotDetected](self, "voiceTriggerTwoShotDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceTriggerTwoShotDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent voiceTriggerTwoShotDetected](self, "voiceTriggerTwoShotDetected");
  v128 = objc_claimAutoreleasedReturnValue();
  if (v128)
  {
    v129 = (void *)v128;
    -[MHSchemaMHClientEvent voiceTriggerTwoShotDetected](self, "voiceTriggerTwoShotDetected");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceTriggerTwoShotDetected");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v130, "isEqual:", v131);

    if (!v132)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioTwoShotTransitionContext](self, "assistantDaemonAudioTwoShotTransitionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioTwoShotTransitionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioTwoShotTransitionContext](self, "assistantDaemonAudioTwoShotTransitionContext");
  v133 = objc_claimAutoreleasedReturnValue();
  if (v133)
  {
    v134 = (void *)v133;
    -[MHSchemaMHClientEvent assistantDaemonAudioTwoShotTransitionContext](self, "assistantDaemonAudioTwoShotTransitionContext");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioTwoShotTransitionContext");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v135, "isEqual:", v136);

    if (!v137)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent voiceTriggerContext](self, "voiceTriggerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceTriggerContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent voiceTriggerContext](self, "voiceTriggerContext");
  v138 = objc_claimAutoreleasedReturnValue();
  if (v138)
  {
    v139 = (void *)v138;
    -[MHSchemaMHClientEvent voiceTriggerContext](self, "voiceTriggerContext");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceTriggerContext");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v140, "isEqual:", v141);

    if (!v142)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent endpointDetected](self, "endpointDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent endpointDetected](self, "endpointDetected");
  v143 = objc_claimAutoreleasedReturnValue();
  if (v143)
  {
    v144 = (void *)v143;
    -[MHSchemaMHClientEvent endpointDetected](self, "endpointDetected");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointDetected");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = objc_msgSend(v145, "isEqual:", v146);

    if (!v147)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent endpointLatencyInfoReported](self, "endpointLatencyInfoReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointLatencyInfoReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent endpointLatencyInfoReported](self, "endpointLatencyInfoReported");
  v148 = objc_claimAutoreleasedReturnValue();
  if (v148)
  {
    v149 = (void *)v148;
    -[MHSchemaMHClientEvent endpointLatencyInfoReported](self, "endpointLatencyInfoReported");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointLatencyInfoReported");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = objc_msgSend(v150, "isEqual:", v151);

    if (!v152)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent adblockerContext](self, "adblockerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adblockerContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent adblockerContext](self, "adblockerContext");
  v153 = objc_claimAutoreleasedReturnValue();
  if (v153)
  {
    v154 = (void *)v153;
    -[MHSchemaMHClientEvent adblockerContext](self, "adblockerContext");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "adblockerContext");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = objc_msgSend(v155, "isEqual:", v156);

    if (!v157)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent onDeviceEndpointerContext](self, "onDeviceEndpointerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onDeviceEndpointerContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent onDeviceEndpointerContext](self, "onDeviceEndpointerContext");
  v158 = objc_claimAutoreleasedReturnValue();
  if (v158)
  {
    v159 = (void *)v158;
    -[MHSchemaMHClientEvent onDeviceEndpointerContext](self, "onDeviceEndpointerContext");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "onDeviceEndpointerContext");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = objc_msgSend(v160, "isEqual:", v161);

    if (!v162)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent serverEndpointerContext](self, "serverEndpointerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverEndpointerContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent serverEndpointerContext](self, "serverEndpointerContext");
  v163 = objc_claimAutoreleasedReturnValue();
  if (v163)
  {
    v164 = (void *)v163;
    -[MHSchemaMHClientEvent serverEndpointerContext](self, "serverEndpointerContext");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverEndpointerContext");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = objc_msgSend(v165, "isEqual:", v166);

    if (!v167)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent endpointerUsed](self, "endpointerUsed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointerUsed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent endpointerUsed](self, "endpointerUsed");
  v168 = objc_claimAutoreleasedReturnValue();
  if (v168)
  {
    v169 = (void *)v168;
    -[MHSchemaMHClientEvent endpointerUsed](self, "endpointerUsed");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointerUsed");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = objc_msgSend(v170, "isEqual:", v171);

    if (!v172)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent endpointDelayContext](self, "endpointDelayContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointDelayContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent endpointDelayContext](self, "endpointDelayContext");
  v173 = objc_claimAutoreleasedReturnValue();
  if (v173)
  {
    v174 = (void *)v173;
    -[MHSchemaMHClientEvent endpointDelayContext](self, "endpointDelayContext");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointDelayContext");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = objc_msgSend(v175, "isEqual:", v176);

    if (!v177)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent finalMitigationRecommendation](self, "finalMitigationRecommendation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalMitigationRecommendation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent finalMitigationRecommendation](self, "finalMitigationRecommendation");
  v178 = objc_claimAutoreleasedReturnValue();
  if (v178)
  {
    v179 = (void *)v178;
    -[MHSchemaMHClientEvent finalMitigationRecommendation](self, "finalMitigationRecommendation");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finalMitigationRecommendation");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = objc_msgSend(v180, "isEqual:", v181);

    if (!v182)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent applicationPlaybackAttempted](self, "applicationPlaybackAttempted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationPlaybackAttempted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent applicationPlaybackAttempted](self, "applicationPlaybackAttempted");
  v183 = objc_claimAutoreleasedReturnValue();
  if (v183)
  {
    v184 = (void *)v183;
    -[MHSchemaMHClientEvent applicationPlaybackAttempted](self, "applicationPlaybackAttempted");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationPlaybackAttempted");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = objc_msgSend(v185, "isEqual:", v186);

    if (!v187)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent siriLaunchRequestContext](self, "siriLaunchRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriLaunchRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent siriLaunchRequestContext](self, "siriLaunchRequestContext");
  v188 = objc_claimAutoreleasedReturnValue();
  if (v188)
  {
    v189 = (void *)v188;
    -[MHSchemaMHClientEvent siriLaunchRequestContext](self, "siriLaunchRequestContext");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriLaunchRequestContext");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = objc_msgSend(v190, "isEqual:", v191);

    if (!v192)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent endpointerAccessibleContext](self, "endpointerAccessibleContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointerAccessibleContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent endpointerAccessibleContext](self, "endpointerAccessibleContext");
  v193 = objc_claimAutoreleasedReturnValue();
  if (v193)
  {
    v194 = (void *)v193;
    -[MHSchemaMHClientEvent endpointerAccessibleContext](self, "endpointerAccessibleContext");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointerAccessibleContext");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = objc_msgSend(v195, "isEqual:", v196);

    if (!v197)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent carPlayLangaugeMismatched](self, "carPlayLangaugeMismatched");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carPlayLangaugeMismatched");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent carPlayLangaugeMismatched](self, "carPlayLangaugeMismatched");
  v198 = objc_claimAutoreleasedReturnValue();
  if (v198)
  {
    v199 = (void *)v198;
    -[MHSchemaMHClientEvent carPlayLangaugeMismatched](self, "carPlayLangaugeMismatched");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carPlayLangaugeMismatched");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = objc_msgSend(v200, "isEqual:", v201);

    if (!v202)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent darwinConnectedDeviceWakeContext](self, "darwinConnectedDeviceWakeContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "darwinConnectedDeviceWakeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent darwinConnectedDeviceWakeContext](self, "darwinConnectedDeviceWakeContext");
  v203 = objc_claimAutoreleasedReturnValue();
  if (v203)
  {
    v204 = (void *)v203;
    -[MHSchemaMHClientEvent darwinConnectedDeviceWakeContext](self, "darwinConnectedDeviceWakeContext");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "darwinConnectedDeviceWakeContext");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = objc_msgSend(v205, "isEqual:", v206);

    if (!v207)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent odldFalseTriggerMitigated](self, "odldFalseTriggerMitigated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "odldFalseTriggerMitigated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent odldFalseTriggerMitigated](self, "odldFalseTriggerMitigated");
  v208 = objc_claimAutoreleasedReturnValue();
  if (v208)
  {
    v209 = (void *)v208;
    -[MHSchemaMHClientEvent odldFalseTriggerMitigated](self, "odldFalseTriggerMitigated");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "odldFalseTriggerMitigated");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = objc_msgSend(v210, "isEqual:", v211);

    if (!v212)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent speakerFalseTriggerMitigated](self, "speakerFalseTriggerMitigated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speakerFalseTriggerMitigated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent speakerFalseTriggerMitigated](self, "speakerFalseTriggerMitigated");
  v213 = objc_claimAutoreleasedReturnValue();
  if (v213)
  {
    v214 = (void *)v213;
    -[MHSchemaMHClientEvent speakerFalseTriggerMitigated](self, "speakerFalseTriggerMitigated");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speakerFalseTriggerMitigated");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = objc_msgSend(v215, "isEqual:", v216);

    if (!v217)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent siriDirectedSpeechDetectionFailed](self, "siriDirectedSpeechDetectionFailed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriDirectedSpeechDetectionFailed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent siriDirectedSpeechDetectionFailed](self, "siriDirectedSpeechDetectionFailed");
  v218 = objc_claimAutoreleasedReturnValue();
  if (v218)
  {
    v219 = (void *)v218;
    -[MHSchemaMHClientEvent siriDirectedSpeechDetectionFailed](self, "siriDirectedSpeechDetectionFailed");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriDirectedSpeechDetectionFailed");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    v222 = objc_msgSend(v220, "isEqual:", v221);

    if (!v222)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent audioDucked](self, "audioDucked");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioDucked");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent audioDucked](self, "audioDucked");
  v223 = objc_claimAutoreleasedReturnValue();
  if (v223)
  {
    v224 = (void *)v223;
    -[MHSchemaMHClientEvent audioDucked](self, "audioDucked");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioDucked");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    v227 = objc_msgSend(v225, "isEqual:", v226);

    if (!v227)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent audioRecordingFailed](self, "audioRecordingFailed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioRecordingFailed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent audioRecordingFailed](self, "audioRecordingFailed");
  v228 = objc_claimAutoreleasedReturnValue();
  if (v228)
  {
    v229 = (void *)v228;
    -[MHSchemaMHClientEvent audioRecordingFailed](self, "audioRecordingFailed");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioRecordingFailed");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    v232 = objc_msgSend(v230, "isEqual:", v231);

    if (!v232)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtsFalseRejectDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
  v233 = objc_claimAutoreleasedReturnValue();
  if (v233)
  {
    v234 = (void *)v233;
    -[MHSchemaMHClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtsFalseRejectDetected");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    v237 = objc_msgSend(v235, "isEqual:", v236);

    if (!v237)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent trpCreated](self, "trpCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent trpCreated](self, "trpCreated");
  v238 = objc_claimAutoreleasedReturnValue();
  if (v238)
  {
    v239 = (void *)v238;
    -[MHSchemaMHClientEvent trpCreated](self, "trpCreated");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trpCreated");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = objc_msgSend(v240, "isEqual:", v241);

    if (!v242)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent userSpeakingContext](self, "userSpeakingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSpeakingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent userSpeakingContext](self, "userSpeakingContext");
  v243 = objc_claimAutoreleasedReturnValue();
  if (v243)
  {
    v244 = (void *)v243;
    -[MHSchemaMHClientEvent userSpeakingContext](self, "userSpeakingContext");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSpeakingContext");
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    v247 = objc_msgSend(v245, "isEqual:", v246);

    if (!v247)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent speechStopDetected](self, "speechStopDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechStopDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent speechStopDetected](self, "speechStopDetected");
  v248 = objc_claimAutoreleasedReturnValue();
  if (v248)
  {
    v249 = (void *)v248;
    -[MHSchemaMHClientEvent speechStopDetected](self, "speechStopDetected");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechStopDetected");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    v252 = objc_msgSend(v250, "isEqual:", v251);

    if (!v252)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent speechDetectorContext](self, "speechDetectorContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechDetectorContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent speechDetectorContext](self, "speechDetectorContext");
  v253 = objc_claimAutoreleasedReturnValue();
  if (v253)
  {
    v254 = (void *)v253;
    -[MHSchemaMHClientEvent speechDetectorContext](self, "speechDetectorContext");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechDetectorContext");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    v257 = objc_msgSend(v255, "isEqual:", v256);

    if (!v257)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent stoppedListeningForSpeechContinuation](self, "stoppedListeningForSpeechContinuation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stoppedListeningForSpeechContinuation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent stoppedListeningForSpeechContinuation](self, "stoppedListeningForSpeechContinuation");
  v258 = objc_claimAutoreleasedReturnValue();
  if (v258)
  {
    v259 = (void *)v258;
    -[MHSchemaMHClientEvent stoppedListeningForSpeechContinuation](self, "stoppedListeningForSpeechContinuation");
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stoppedListeningForSpeechContinuation");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    v262 = objc_msgSend(v260, "isEqual:", v261);

    if (!v262)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent userEngagementModelContext](self, "userEngagementModelContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userEngagementModelContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent userEngagementModelContext](self, "userEngagementModelContext");
  v263 = objc_claimAutoreleasedReturnValue();
  if (v263)
  {
    v264 = (void *)v263;
    -[MHSchemaMHClientEvent userEngagementModelContext](self, "userEngagementModelContext");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userEngagementModelContext");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    v267 = objc_msgSend(v265, "isEqual:", v266);

    if (!v267)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent attendingContext](self, "attendingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attendingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent attendingContext](self, "attendingContext");
  v268 = objc_claimAutoreleasedReturnValue();
  if (v268)
  {
    v269 = (void *)v268;
    -[MHSchemaMHClientEvent attendingContext](self, "attendingContext");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attendingContext");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    v272 = objc_msgSend(v270, "isEqual:", v271);

    if (!v272)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent crownPressed](self, "crownPressed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crownPressed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent crownPressed](self, "crownPressed");
  v273 = objc_claimAutoreleasedReturnValue();
  if (v273)
  {
    v274 = (void *)v273;
    -[MHSchemaMHClientEvent crownPressed](self, "crownPressed");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "crownPressed");
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    v277 = objc_msgSend(v275, "isEqual:", v276);

    if (!v277)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent rtsTriggered](self, "rtsTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtsTriggered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent rtsTriggered](self, "rtsTriggered");
  v278 = objc_claimAutoreleasedReturnValue();
  if (v278)
  {
    v279 = (void *)v278;
    -[MHSchemaMHClientEvent rtsTriggered](self, "rtsTriggered");
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtsTriggered");
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    v282 = objc_msgSend(v280, "isEqual:", v281);

    if (!v282)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtsFirstPassPolicyTriggered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
  v283 = objc_claimAutoreleasedReturnValue();
  if (v283)
  {
    v284 = (void *)v283;
    -[MHSchemaMHClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtsFirstPassPolicyTriggered");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    v287 = objc_msgSend(v285, "isEqual:", v286);

    if (!v287)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtsSecondPassPolicyDecisionMade");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
  v288 = objc_claimAutoreleasedReturnValue();
  if (v288)
  {
    v289 = (void *)v288;
    -[MHSchemaMHClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rtsSecondPassPolicyDecisionMade");
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    v292 = objc_msgSend(v290, "isEqual:", v291);

    if (!v292)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent voiceProfileOnboarded](self, "voiceProfileOnboarded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceProfileOnboarded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent voiceProfileOnboarded](self, "voiceProfileOnboarded");
  v293 = objc_claimAutoreleasedReturnValue();
  if (v293)
  {
    v294 = (void *)v293;
    -[MHSchemaMHClientEvent voiceProfileOnboarded](self, "voiceProfileOnboarded");
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceProfileOnboarded");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    v297 = objc_msgSend(v295, "isEqual:", v296);

    if (!v297)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent sensorControlStatusReported](self, "sensorControlStatusReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sensorControlStatusReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent sensorControlStatusReported](self, "sensorControlStatusReported");
  v298 = objc_claimAutoreleasedReturnValue();
  if (v298)
  {
    v299 = (void *)v298;
    -[MHSchemaMHClientEvent sensorControlStatusReported](self, "sensorControlStatusReported");
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sensorControlStatusReported");
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    v302 = objc_msgSend(v300, "isEqual:", v301);

    if (!v302)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent voiceTriggerRePrompted](self, "voiceTriggerRePrompted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceTriggerRePrompted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent voiceTriggerRePrompted](self, "voiceTriggerRePrompted");
  v303 = objc_claimAutoreleasedReturnValue();
  if (v303)
  {
    v304 = (void *)v303;
    -[MHSchemaMHClientEvent voiceTriggerRePrompted](self, "voiceTriggerRePrompted");
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceTriggerRePrompted");
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    v307 = objc_msgSend(v305, "isEqual:", v306);

    if (!v307)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFailureInsufficientPriority](self, "assistantDaemonAudioRecordingFailureInsufficientPriority");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDaemonAudioRecordingFailureInsufficientPriority");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_312;
  -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFailureInsufficientPriority](self, "assistantDaemonAudioRecordingFailureInsufficientPriority");
  v308 = objc_claimAutoreleasedReturnValue();
  if (v308)
  {
    v309 = (void *)v308;
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFailureInsufficientPriority](self, "assistantDaemonAudioRecordingFailureInsufficientPriority");
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDaemonAudioRecordingFailureInsufficientPriority");
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    v312 = objc_msgSend(v310, "isEqual:", v311);

    if (!v312)
      goto LABEL_313;
  }
  else
  {

  }
  -[MHSchemaMHClientEvent voiceProfileICloudSyncFinished](self, "voiceProfileICloudSyncFinished");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceProfileICloudSyncFinished");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[MHSchemaMHClientEvent voiceProfileICloudSyncFinished](self, "voiceProfileICloudSyncFinished");
    v313 = objc_claimAutoreleasedReturnValue();
    if (!v313)
    {

LABEL_316:
      v318 = 1;
      goto LABEL_314;
    }
    v314 = (void *)v313;
    -[MHSchemaMHClientEvent voiceProfileICloudSyncFinished](self, "voiceProfileICloudSyncFinished");
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceProfileICloudSyncFinished");
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    v317 = objc_msgSend(v315, "isEqual:", v316);

    if ((v317 & 1) != 0)
      goto LABEL_316;
  }
  else
  {
LABEL_312:

  }
LABEL_313:
  v318 = 0;
LABEL_314:

  return v318;
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
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;

  v3 = -[SISchemaUUID hash](self->_mhId, "hash");
  v4 = -[MHSchemaMHClientEventMetadata hash](self->_eventMetadata, "hash") ^ v3;
  v5 = -[MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext hash](self->_acousticFalseTriggerMitigationEvaluationContext, "hash");
  v6 = v4 ^ v5 ^ -[MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext hash](self->_latticeFalseTriggerMitigationEvaluationContext, "hash");
  v7 = -[MHSchemaMHUnintendedResponseSuppressionEvaluationContext hash](self->_unintendedResponseSuppressionExecutionContext, "hash");
  v8 = v7 ^ -[MHSchemaMHCoreSpeechPreprocessorCompleted hash](self->_coreSpeechPreprocessorCompleted, "hash");
  v9 = v6 ^ v8 ^ -[MHSchemaMHASRAudioConfigureStarted hash](self->_asrAudioConfigureStarted, "hash");
  v10 = -[MHSchemaMHAssistantDaemonAudioInitContext hash](self->_assistantDaemonAudioInitContext, "hash");
  v11 = v10 ^ -[MHSchemaMHAssistantDaemonAudioConfigureContext hash](self->_assistantDaemonAudioConfigureContext, "hash");
  v12 = v11 ^ -[MHSchemaMHAssistantDaemonAudioPrepareContext hash](self->_assistantDaemonAudioPrepareContext, "hash");
  v13 = v9 ^ v12 ^ -[MHSchemaMHAssistantDaemonAudioPrewarmContext hash](self->_assistantDaemonAudioPrewarmContext, "hash");
  v14 = -[MHSchemaMHAssistantDaemonAudioStartRecordingContext hash](self->_assistantDaemonAudioStartRecordingContext, "hash");
  v15 = v14 ^ -[MHSchemaMHAssistantDaemonAudioStopRecordingContext hash](self->_assistantDaemonAudioStopRecordingContext, "hash");
  v16 = v15 ^ -[MHSchemaMHAssistantDaemonAudioSessionSetActiveContext hash](self->_assistantDaemonAudioSessionSetActiveContext, "hash");
  v17 = v16 ^ -[MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext hash](self->_assistantDaemonAudioSessionSetInactiveContext, "hash");
  v18 = v13 ^ v17 ^ -[MHSchemaMHAssistantDaemonAudioFetchRouteContext hash](self->_assistantDaemonAudioFetchRouteContext, "hash");
  v19 = -[MHSchemaMHAssistantDaemonAudioRecordingContext hash](self->_assistantDaemonAudioRecordingContext, "hash");
  v20 = v19 ^ -[MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected hash](self->_assistantDaemonAudioRecordingMissedBufferDetected, "hash");
  v21 = v20 ^ -[MHSchemaMHAssistantDaemonAudioLateBufferDetected hash](self->_assistantDaemonAudioLateBufferDetected, "hash");
  v22 = v21 ^ -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext hash](self->_assistantDaemonAudioRecordingFirstBufferContext, "hash");
  v23 = v22 ^ -[MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext hash](self->_assistantDaemonAudioRecordingLastBufferContext, "hash");
  v24 = v18 ^ v23 ^ -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext hash](self->_assistantDaemonAudioRecordingInterruptionContext, "hash");
  v25 = -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 hash](self->_assistantDaemonAudioRecordingInterruptionStartedTier1, "hash");
  v26 = v25 ^ -[MHSchemaMHAssistantDaemonAudioBluetoothInfo hash](self->_assistantDaemonAudioBluetoothInfo, "hash");
  v27 = v26 ^ -[MHSchemaMHVoiceTriggerTwoShotDetected hash](self->_voiceTriggerTwoShotDetected, "hash");
  v28 = v27 ^ -[MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext hash](self->_assistantDaemonAudioTwoShotTransitionContext, "hash");
  v29 = v28 ^ -[MHSchemaMHVoiceTriggerContext hash](self->_voiceTriggerContext, "hash");
  v30 = v29 ^ -[MHSchemaMHEndpointDetected hash](self->_endpointDetected, "hash");
  v31 = v24 ^ v30 ^ -[MHSchemaMHEndpointLatencyInfoReported hash](self->_endpointLatencyInfoReported, "hash");
  v32 = -[MHSchemaMHVoiceAdBlockerContext hash](self->_adblockerContext, "hash");
  v33 = v32 ^ -[MHSchemaMHOnDeviceEndpointerContext hash](self->_onDeviceEndpointerContext, "hash");
  v34 = v33 ^ -[MHSchemaMHServerEndpointerContext hash](self->_serverEndpointerContext, "hash");
  v35 = v34 ^ -[MHSchemaMHEndpointerUsed hash](self->_endpointerUsed, "hash");
  v36 = v35 ^ -[MHSchemaMHEndpointDelayContext hash](self->_endpointDelayContext, "hash");
  v37 = v36 ^ -[MHSchemaMHMitigationDecisionRecommended hash](self->_finalMitigationRecommendation, "hash");
  v38 = v37 ^ -[MHSchemaMHApplicationPlaybackAttempted hash](self->_applicationPlaybackAttempted, "hash");
  v39 = v31 ^ v38 ^ -[MHSchemaMHSiriLaunchRequestContext hash](self->_siriLaunchRequestContext, "hash");
  v40 = -[MHSchemaMHEndpointerAccessibleContext hash](self->_endpointerAccessibleContext, "hash");
  v41 = v40 ^ -[MHSchemaMHCarplayLanguageMismatch hash](self->_carPlayLangaugeMismatched, "hash");
  v42 = v41 ^ -[MHSchemaMHDarwinConnectedDeviceWakeContext hash](self->_darwinConnectedDeviceWakeContext, "hash");
  v43 = v42 ^ -[MHSchemaMHOdldFalseTriggerMitigated hash](self->_odldFalseTriggerMitigated, "hash");
  v44 = v43 ^ -[MHSchemaMHSpeakerFalseTriggerMitigated hash](self->_speakerFalseTriggerMitigated, "hash");
  v45 = v44 ^ -[MHSchemaMHSiriDirectedSpeechDetectionFailed hash](self->_siriDirectedSpeechDetectionFailed, "hash");
  v46 = v45 ^ -[MHSchemaMHAudioDucked hash](self->_audioDucked, "hash");
  v47 = v46 ^ -[MHSchemaMHAssistantDaemonAudioRecordingFailed hash](self->_audioRecordingFailed, "hash");
  v48 = v39 ^ v47 ^ -[MHSchemaMHRTSFalseRejectDetected hash](self->_rtsFalseRejectDetected, "hash");
  v49 = -[MHSchemaMHTRPCreated hash](self->_trpCreated, "hash");
  v50 = v49 ^ -[MHSchemaMHUserSpeakingContext hash](self->_userSpeakingContext, "hash");
  v51 = v50 ^ -[MHSchemaMHSpeechStopDetected hash](self->_speechStopDetected, "hash");
  v52 = v51 ^ -[MHSchemaMHSpeechDetectorContext hash](self->_speechDetectorContext, "hash");
  v53 = v52 ^ -[MHSchemaMHStoppedListeningForSpeechContinuation hash](self->_stoppedListeningForSpeechContinuation, "hash");
  v54 = v53 ^ -[MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext hash](self->_userEngagementModelContext, "hash");
  v55 = v54 ^ -[MHSchemaMHAttendingContext hash](self->_attendingContext, "hash");
  v56 = v55 ^ -[MHSchemaMHCrownPressed hash](self->_crownPressed, "hash");
  v57 = v56 ^ -[MHSchemaMHRaiseToSpeakTriggered hash](self->_rtsTriggered, "hash");
  v58 = v48 ^ v57 ^ -[MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered hash](self->_rtsFirstPassPolicyTriggered, "hash");
  v59 = -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade hash](self->_rtsSecondPassPolicyDecisionMade, "hash");
  v60 = v59 ^ -[MHSchemaMHVoiceProfileOnboarded hash](self->_voiceProfileOnboarded, "hash");
  v61 = v60 ^ -[MHSchemaMHSensorControlStatusReported hash](self->_sensorControlStatusReported, "hash");
  v62 = v61 ^ -[MHSchemaMHVoiceTriggerRePrompted hash](self->_voiceTriggerRePrompted, "hash");
  v63 = v62 ^ -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority hash](self->_assistantDaemonAudioRecordingFailureInsufficientPriority, "hash");
  return v58 ^ v63 ^ -[MHSchemaMHVoiceProfileICloudSyncFinished hash](self->_voiceProfileICloudSyncFinished, "hash");
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
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  id v190;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_acousticFalseTriggerMitigationEvaluationContext)
  {
    -[MHSchemaMHClientEvent acousticFalseTriggerMitigationEvaluationContext](self, "acousticFalseTriggerMitigationEvaluationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("acousticFalseTriggerMitigationEvaluationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("acousticFalseTriggerMitigationEvaluationContext"));

    }
  }
  if (self->_adblockerContext)
  {
    -[MHSchemaMHClientEvent adblockerContext](self, "adblockerContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("adblockerContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("adblockerContext"));

    }
  }
  if (self->_applicationPlaybackAttempted)
  {
    -[MHSchemaMHClientEvent applicationPlaybackAttempted](self, "applicationPlaybackAttempted");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("applicationPlaybackAttempted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("applicationPlaybackAttempted"));

    }
  }
  if (self->_asrAudioConfigureStarted)
  {
    -[MHSchemaMHClientEvent asrAudioConfigureStarted](self, "asrAudioConfigureStarted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("asrAudioConfigureStarted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("asrAudioConfigureStarted"));

    }
  }
  if (self->_assistantDaemonAudioBluetoothInfo)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioBluetoothInfo](self, "assistantDaemonAudioBluetoothInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("assistantDaemonAudioBluetoothInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("assistantDaemonAudioBluetoothInfo"));

    }
  }
  if (self->_assistantDaemonAudioConfigureContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioConfigureContext](self, "assistantDaemonAudioConfigureContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("assistantDaemonAudioConfigureContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("assistantDaemonAudioConfigureContext"));

    }
  }
  if (self->_assistantDaemonAudioFetchRouteContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioFetchRouteContext](self, "assistantDaemonAudioFetchRouteContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("assistantDaemonAudioFetchRouteContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("assistantDaemonAudioFetchRouteContext"));

    }
  }
  if (self->_assistantDaemonAudioInitContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioInitContext](self, "assistantDaemonAudioInitContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("assistantDaemonAudioInitContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("assistantDaemonAudioInitContext"));

    }
  }
  if (self->_assistantDaemonAudioLateBufferDetected)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioLateBufferDetected](self, "assistantDaemonAudioLateBufferDetected");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("assistantDaemonAudioLateBufferDetected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("assistantDaemonAudioLateBufferDetected"));

    }
  }
  if (self->_assistantDaemonAudioPrepareContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioPrepareContext](self, "assistantDaemonAudioPrepareContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("assistantDaemonAudioPrepareContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("assistantDaemonAudioPrepareContext"));

    }
  }
  if (self->_assistantDaemonAudioPrewarmContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioPrewarmContext](self, "assistantDaemonAudioPrewarmContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("assistantDaemonAudioPrewarmContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("assistantDaemonAudioPrewarmContext"));

    }
  }
  if (self->_assistantDaemonAudioRecordingContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingContext](self, "assistantDaemonAudioRecordingContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("assistantDaemonAudioRecordingContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("assistantDaemonAudioRecordingContext"));

    }
  }
  if (self->_assistantDaemonAudioRecordingFailureInsufficientPriority)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFailureInsufficientPriority](self, "assistantDaemonAudioRecordingFailureInsufficientPriority");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("assistantDaemonAudioRecordingFailureInsufficientPriority"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("assistantDaemonAudioRecordingFailureInsufficientPriority"));

    }
  }
  if (self->_assistantDaemonAudioRecordingFirstBufferContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingFirstBufferContext](self, "assistantDaemonAudioRecordingFirstBufferContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("assistantDaemonAudioRecordingFirstBufferContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("assistantDaemonAudioRecordingFirstBufferContext"));

    }
  }
  if (self->_assistantDaemonAudioRecordingInterruptionContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionContext](self, "assistantDaemonAudioRecordingInterruptionContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("assistantDaemonAudioRecordingInterruptionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("assistantDaemonAudioRecordingInterruptionContext"));

    }
  }
  if (self->_assistantDaemonAudioRecordingInterruptionStartedTier1)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingInterruptionStartedTier1](self, "assistantDaemonAudioRecordingInterruptionStartedTier1");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("assistantDaemonAudioRecordingInterruptionStartedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("assistantDaemonAudioRecordingInterruptionStartedTier1"));

    }
  }
  if (self->_assistantDaemonAudioRecordingLastBufferContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingLastBufferContext](self, "assistantDaemonAudioRecordingLastBufferContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("assistantDaemonAudioRecordingLastBufferContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("assistantDaemonAudioRecordingLastBufferContext"));

    }
  }
  if (self->_assistantDaemonAudioRecordingMissedBufferDetected)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioRecordingMissedBufferDetected](self, "assistantDaemonAudioRecordingMissedBufferDetected");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("assistantDaemonAudioRecordingMissedBufferDetected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("assistantDaemonAudioRecordingMissedBufferDetected"));

    }
  }
  if (self->_assistantDaemonAudioSessionSetActiveContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetActiveContext](self, "assistantDaemonAudioSessionSetActiveContext");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("assistantDaemonAudioSessionSetActiveContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("assistantDaemonAudioSessionSetActiveContext"));

    }
  }
  if (self->_assistantDaemonAudioSessionSetInactiveContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioSessionSetInactiveContext](self, "assistantDaemonAudioSessionSetInactiveContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dictionaryRepresentation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("assistantDaemonAudioSessionSetInactiveContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("assistantDaemonAudioSessionSetInactiveContext"));

    }
  }
  if (self->_assistantDaemonAudioStartRecordingContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioStartRecordingContext](self, "assistantDaemonAudioStartRecordingContext");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dictionaryRepresentation");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("assistantDaemonAudioStartRecordingContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("assistantDaemonAudioStartRecordingContext"));

    }
  }
  if (self->_assistantDaemonAudioStopRecordingContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioStopRecordingContext](self, "assistantDaemonAudioStopRecordingContext");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("assistantDaemonAudioStopRecordingContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("assistantDaemonAudioStopRecordingContext"));

    }
  }
  if (self->_assistantDaemonAudioTwoShotTransitionContext)
  {
    -[MHSchemaMHClientEvent assistantDaemonAudioTwoShotTransitionContext](self, "assistantDaemonAudioTwoShotTransitionContext");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "dictionaryRepresentation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("assistantDaemonAudioTwoShotTransitionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("assistantDaemonAudioTwoShotTransitionContext"));

    }
  }
  if (self->_attendingContext)
  {
    -[MHSchemaMHClientEvent attendingContext](self, "attendingContext");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("attendingContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("attendingContext"));

    }
  }
  if (self->_audioDucked)
  {
    -[MHSchemaMHClientEvent audioDucked](self, "audioDucked");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "dictionaryRepresentation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("audioDucked"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("audioDucked"));

    }
  }
  if (self->_audioRecordingFailed)
  {
    -[MHSchemaMHClientEvent audioRecordingFailed](self, "audioRecordingFailed");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "dictionaryRepresentation");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("audioRecordingFailed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("audioRecordingFailed"));

    }
  }
  if (self->_carPlayLangaugeMismatched)
  {
    -[MHSchemaMHClientEvent carPlayLangaugeMismatched](self, "carPlayLangaugeMismatched");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "dictionaryRepresentation");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (v83)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("carPlayLangaugeMismatched"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("carPlayLangaugeMismatched"));

    }
  }
  if (self->_coreSpeechPreprocessorCompleted)
  {
    -[MHSchemaMHClientEvent coreSpeechPreprocessorCompleted](self, "coreSpeechPreprocessorCompleted");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "dictionaryRepresentation");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("coreSpeechPreprocessorCompleted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("coreSpeechPreprocessorCompleted"));

    }
  }
  if (self->_crownPressed)
  {
    -[MHSchemaMHClientEvent crownPressed](self, "crownPressed");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "dictionaryRepresentation");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("crownPressed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("crownPressed"));

    }
  }
  if (self->_darwinConnectedDeviceWakeContext)
  {
    -[MHSchemaMHClientEvent darwinConnectedDeviceWakeContext](self, "darwinConnectedDeviceWakeContext");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "dictionaryRepresentation");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("darwinConnectedDeviceWakeContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("darwinConnectedDeviceWakeContext"));

    }
  }
  if (self->_endpointDelayContext)
  {
    -[MHSchemaMHClientEvent endpointDelayContext](self, "endpointDelayContext");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "dictionaryRepresentation");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("endpointDelayContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("endpointDelayContext"));

    }
  }
  if (self->_endpointDetected)
  {
    -[MHSchemaMHClientEvent endpointDetected](self, "endpointDetected");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "dictionaryRepresentation");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("endpointDetected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("endpointDetected"));

    }
  }
  if (self->_endpointLatencyInfoReported)
  {
    -[MHSchemaMHClientEvent endpointLatencyInfoReported](self, "endpointLatencyInfoReported");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "dictionaryRepresentation");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v101)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("endpointLatencyInfoReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v102, CFSTR("endpointLatencyInfoReported"));

    }
  }
  if (self->_endpointerAccessibleContext)
  {
    -[MHSchemaMHClientEvent endpointerAccessibleContext](self, "endpointerAccessibleContext");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "dictionaryRepresentation");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v104)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v104, CFSTR("endpointerAccessibleContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("endpointerAccessibleContext"));

    }
  }
  if (self->_endpointerUsed)
  {
    -[MHSchemaMHClientEvent endpointerUsed](self, "endpointerUsed");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "dictionaryRepresentation");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (v107)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v107, CFSTR("endpointerUsed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("endpointerUsed"));

    }
  }
  if (self->_eventMetadata)
  {
    -[MHSchemaMHClientEvent eventMetadata](self, "eventMetadata");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "dictionaryRepresentation");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (v110)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v110, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v111, CFSTR("eventMetadata"));

    }
  }
  if (self->_finalMitigationRecommendation)
  {
    -[MHSchemaMHClientEvent finalMitigationRecommendation](self, "finalMitigationRecommendation");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "dictionaryRepresentation");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (v113)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v113, CFSTR("finalMitigationRecommendation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v114, CFSTR("finalMitigationRecommendation"));

    }
  }
  if (self->_latticeFalseTriggerMitigationEvaluationContext)
  {
    -[MHSchemaMHClientEvent latticeFalseTriggerMitigationEvaluationContext](self, "latticeFalseTriggerMitigationEvaluationContext");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "dictionaryRepresentation");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (v116)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v116, CFSTR("latticeFalseTriggerMitigationEvaluationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v117, CFSTR("latticeFalseTriggerMitigationEvaluationContext"));

    }
  }
  if (self->_mhId)
  {
    -[MHSchemaMHClientEvent mhId](self, "mhId");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "dictionaryRepresentation");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (v119)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v119, CFSTR("mhId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v120, CFSTR("mhId"));

    }
  }
  if (self->_odldFalseTriggerMitigated)
  {
    -[MHSchemaMHClientEvent odldFalseTriggerMitigated](self, "odldFalseTriggerMitigated");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "dictionaryRepresentation");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (v122)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v122, CFSTR("odldFalseTriggerMitigated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v123, CFSTR("odldFalseTriggerMitigated"));

    }
  }
  if (self->_onDeviceEndpointerContext)
  {
    -[MHSchemaMHClientEvent onDeviceEndpointerContext](self, "onDeviceEndpointerContext");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "dictionaryRepresentation");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if (v125)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v125, CFSTR("onDeviceEndpointerContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v126, CFSTR("onDeviceEndpointerContext"));

    }
  }
  if (self->_rtsFalseRejectDetected)
  {
    -[MHSchemaMHClientEvent rtsFalseRejectDetected](self, "rtsFalseRejectDetected");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "dictionaryRepresentation");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    if (v128)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v128, CFSTR("rtsFalseRejectDetected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v129, CFSTR("rtsFalseRejectDetected"));

    }
  }
  if (self->_rtsFirstPassPolicyTriggered)
  {
    -[MHSchemaMHClientEvent rtsFirstPassPolicyTriggered](self, "rtsFirstPassPolicyTriggered");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "dictionaryRepresentation");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (v131)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v131, CFSTR("rtsFirstPassPolicyTriggered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v132, CFSTR("rtsFirstPassPolicyTriggered"));

    }
  }
  if (self->_rtsSecondPassPolicyDecisionMade)
  {
    -[MHSchemaMHClientEvent rtsSecondPassPolicyDecisionMade](self, "rtsSecondPassPolicyDecisionMade");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "dictionaryRepresentation");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    if (v134)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v134, CFSTR("rtsSecondPassPolicyDecisionMade"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v135, CFSTR("rtsSecondPassPolicyDecisionMade"));

    }
  }
  if (self->_rtsTriggered)
  {
    -[MHSchemaMHClientEvent rtsTriggered](self, "rtsTriggered");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "dictionaryRepresentation");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    if (v137)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v137, CFSTR("rtsTriggered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v138, CFSTR("rtsTriggered"));

    }
  }
  if (self->_sensorControlStatusReported)
  {
    -[MHSchemaMHClientEvent sensorControlStatusReported](self, "sensorControlStatusReported");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "dictionaryRepresentation");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    if (v140)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v140, CFSTR("sensorControlStatusReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v141, CFSTR("sensorControlStatusReported"));

    }
  }
  if (self->_serverEndpointerContext)
  {
    -[MHSchemaMHClientEvent serverEndpointerContext](self, "serverEndpointerContext");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "dictionaryRepresentation");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    if (v143)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v143, CFSTR("serverEndpointerContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v144, CFSTR("serverEndpointerContext"));

    }
  }
  if (self->_siriDirectedSpeechDetectionFailed)
  {
    -[MHSchemaMHClientEvent siriDirectedSpeechDetectionFailed](self, "siriDirectedSpeechDetectionFailed");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "dictionaryRepresentation");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    if (v146)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v146, CFSTR("siriDirectedSpeechDetectionFailed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v147, CFSTR("siriDirectedSpeechDetectionFailed"));

    }
  }
  if (self->_siriLaunchRequestContext)
  {
    -[MHSchemaMHClientEvent siriLaunchRequestContext](self, "siriLaunchRequestContext");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "dictionaryRepresentation");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    if (v149)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v149, CFSTR("siriLaunchRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v150, CFSTR("siriLaunchRequestContext"));

    }
  }
  if (self->_speakerFalseTriggerMitigated)
  {
    -[MHSchemaMHClientEvent speakerFalseTriggerMitigated](self, "speakerFalseTriggerMitigated");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "dictionaryRepresentation");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    if (v152)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v152, CFSTR("speakerFalseTriggerMitigated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v153, CFSTR("speakerFalseTriggerMitigated"));

    }
  }
  if (self->_speechDetectorContext)
  {
    -[MHSchemaMHClientEvent speechDetectorContext](self, "speechDetectorContext");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "dictionaryRepresentation");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    if (v155)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v155, CFSTR("speechDetectorContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v156, CFSTR("speechDetectorContext"));

    }
  }
  if (self->_speechStopDetected)
  {
    -[MHSchemaMHClientEvent speechStopDetected](self, "speechStopDetected");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "dictionaryRepresentation");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    if (v158)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v158, CFSTR("speechStopDetected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v159, CFSTR("speechStopDetected"));

    }
  }
  if (self->_stoppedListeningForSpeechContinuation)
  {
    -[MHSchemaMHClientEvent stoppedListeningForSpeechContinuation](self, "stoppedListeningForSpeechContinuation");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "dictionaryRepresentation");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    if (v161)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v161, CFSTR("stoppedListeningForSpeechContinuation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v162, CFSTR("stoppedListeningForSpeechContinuation"));

    }
  }
  if (self->_trpCreated)
  {
    -[MHSchemaMHClientEvent trpCreated](self, "trpCreated");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "dictionaryRepresentation");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    if (v164)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v164, CFSTR("trpCreated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v165, CFSTR("trpCreated"));

    }
  }
  if (self->_unintendedResponseSuppressionExecutionContext)
  {
    -[MHSchemaMHClientEvent unintendedResponseSuppressionExecutionContext](self, "unintendedResponseSuppressionExecutionContext");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "dictionaryRepresentation");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    if (v167)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v167, CFSTR("unintendedResponseSuppressionExecutionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v168, CFSTR("unintendedResponseSuppressionExecutionContext"));

    }
  }
  if (self->_userEngagementModelContext)
  {
    -[MHSchemaMHClientEvent userEngagementModelContext](self, "userEngagementModelContext");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "dictionaryRepresentation");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    if (v170)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v170, CFSTR("userEngagementModelContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v171, CFSTR("userEngagementModelContext"));

    }
  }
  if (self->_userSpeakingContext)
  {
    -[MHSchemaMHClientEvent userSpeakingContext](self, "userSpeakingContext");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "dictionaryRepresentation");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    if (v173)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v173, CFSTR("userSpeakingContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v174, CFSTR("userSpeakingContext"));

    }
  }
  if (self->_voiceProfileICloudSyncFinished)
  {
    -[MHSchemaMHClientEvent voiceProfileICloudSyncFinished](self, "voiceProfileICloudSyncFinished");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "dictionaryRepresentation");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    if (v176)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v176, CFSTR("voiceProfileICloudSyncFinished"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v177, CFSTR("voiceProfileICloudSyncFinished"));

    }
  }
  if (self->_voiceProfileOnboarded)
  {
    -[MHSchemaMHClientEvent voiceProfileOnboarded](self, "voiceProfileOnboarded");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "dictionaryRepresentation");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    if (v179)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v179, CFSTR("voiceProfileOnboarded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v180, CFSTR("voiceProfileOnboarded"));

    }
  }
  if (self->_voiceTriggerContext)
  {
    -[MHSchemaMHClientEvent voiceTriggerContext](self, "voiceTriggerContext");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "dictionaryRepresentation");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    if (v182)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v182, CFSTR("voiceTriggerContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v183, CFSTR("voiceTriggerContext"));

    }
  }
  if (self->_voiceTriggerRePrompted)
  {
    -[MHSchemaMHClientEvent voiceTriggerRePrompted](self, "voiceTriggerRePrompted");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "dictionaryRepresentation");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    if (v185)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v185, CFSTR("voiceTriggerRePrompted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v186, CFSTR("voiceTriggerRePrompted"));

    }
  }
  if (self->_voiceTriggerTwoShotDetected)
  {
    -[MHSchemaMHClientEvent voiceTriggerTwoShotDetected](self, "voiceTriggerTwoShotDetected");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "dictionaryRepresentation");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    if (v188)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v188, CFSTR("voiceTriggerTwoShotDetected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v189, CFSTR("voiceTriggerTwoShotDetected"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v190 = v3;

  return v190;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHClientEvent)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHClientEvent *v5;
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
    self = -[MHSchemaMHClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHClientEvent)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHClientEvent *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  uint64_t v8;
  MHSchemaMHClientEventMetadata *v9;
  uint64_t v10;
  MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext *v11;
  uint64_t v12;
  MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext *v13;
  uint64_t v14;
  MHSchemaMHUnintendedResponseSuppressionEvaluationContext *v15;
  uint64_t v16;
  MHSchemaMHCoreSpeechPreprocessorCompleted *v17;
  uint64_t v18;
  MHSchemaMHASRAudioConfigureStarted *v19;
  uint64_t v20;
  MHSchemaMHAssistantDaemonAudioInitContext *v21;
  uint64_t v22;
  MHSchemaMHAssistantDaemonAudioConfigureContext *v23;
  uint64_t v24;
  MHSchemaMHAssistantDaemonAudioPrepareContext *v25;
  uint64_t v26;
  MHSchemaMHAssistantDaemonAudioPrewarmContext *v27;
  uint64_t v28;
  MHSchemaMHAssistantDaemonAudioStartRecordingContext *v29;
  uint64_t v30;
  MHSchemaMHAssistantDaemonAudioStopRecordingContext *v31;
  uint64_t v32;
  MHSchemaMHAssistantDaemonAudioSessionSetActiveContext *v33;
  uint64_t v34;
  MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext *v35;
  uint64_t v36;
  MHSchemaMHAssistantDaemonAudioFetchRouteContext *v37;
  uint64_t v38;
  MHSchemaMHAssistantDaemonAudioRecordingContext *v39;
  uint64_t v40;
  MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected *v41;
  uint64_t v42;
  MHSchemaMHAssistantDaemonAudioLateBufferDetected *v43;
  uint64_t v44;
  MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext *v45;
  uint64_t v46;
  MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext *v47;
  uint64_t v48;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext *v49;
  uint64_t v50;
  MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 *v51;
  uint64_t v52;
  MHSchemaMHAssistantDaemonAudioBluetoothInfo *v53;
  uint64_t v54;
  MHSchemaMHVoiceTriggerTwoShotDetected *v55;
  uint64_t v56;
  MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext *v57;
  uint64_t v58;
  MHSchemaMHVoiceTriggerContext *v59;
  uint64_t v60;
  MHSchemaMHEndpointDetected *v61;
  uint64_t v62;
  MHSchemaMHEndpointLatencyInfoReported *v63;
  uint64_t v64;
  MHSchemaMHVoiceAdBlockerContext *v65;
  uint64_t v66;
  MHSchemaMHOnDeviceEndpointerContext *v67;
  uint64_t v68;
  MHSchemaMHServerEndpointerContext *v69;
  uint64_t v70;
  MHSchemaMHEndpointerUsed *v71;
  uint64_t v72;
  MHSchemaMHEndpointDelayContext *v73;
  uint64_t v74;
  MHSchemaMHMitigationDecisionRecommended *v75;
  uint64_t v76;
  MHSchemaMHApplicationPlaybackAttempted *v77;
  uint64_t v78;
  MHSchemaMHSiriLaunchRequestContext *v79;
  uint64_t v80;
  MHSchemaMHEndpointerAccessibleContext *v81;
  uint64_t v82;
  MHSchemaMHCarplayLanguageMismatch *v83;
  uint64_t v84;
  MHSchemaMHDarwinConnectedDeviceWakeContext *v85;
  uint64_t v86;
  MHSchemaMHOdldFalseTriggerMitigated *v87;
  uint64_t v88;
  MHSchemaMHSpeakerFalseTriggerMitigated *v89;
  uint64_t v90;
  MHSchemaMHSiriDirectedSpeechDetectionFailed *v91;
  uint64_t v92;
  MHSchemaMHAudioDucked *v93;
  uint64_t v94;
  MHSchemaMHAssistantDaemonAudioRecordingFailed *v95;
  uint64_t v96;
  MHSchemaMHRTSFalseRejectDetected *v97;
  uint64_t v98;
  MHSchemaMHTRPCreated *v99;
  uint64_t v100;
  MHSchemaMHUserSpeakingContext *v101;
  uint64_t v102;
  MHSchemaMHSpeechStopDetected *v103;
  uint64_t v104;
  MHSchemaMHSpeechDetectorContext *v105;
  uint64_t v106;
  MHSchemaMHStoppedListeningForSpeechContinuation *v107;
  uint64_t v108;
  MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext *v109;
  uint64_t v110;
  MHSchemaMHAttendingContext *v111;
  uint64_t v112;
  MHSchemaMHCrownPressed *v113;
  uint64_t v114;
  MHSchemaMHRaiseToSpeakTriggered *v115;
  void *v116;
  MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered *v117;
  void *v118;
  MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade *v119;
  void *v120;
  MHSchemaMHVoiceProfileOnboarded *v121;
  void *v122;
  MHSchemaMHSensorControlStatusReported *v123;
  void *v124;
  MHSchemaMHVoiceTriggerRePrompted *v125;
  void *v126;
  MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority *v127;
  void *v128;
  MHSchemaMHVoiceProfileICloudSyncFinished *v129;
  MHSchemaMHClientEvent *v130;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  objc_super v187;

  v4 = a3;
  v187.receiver = self;
  v187.super_class = (Class)MHSchemaMHClientEvent;
  v5 = -[MHSchemaMHClientEvent init](&v187, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mhId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[MHSchemaMHClientEvent setMhId:](v5, "setMhId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[MHSchemaMHClientEventMetadata initWithDictionary:]([MHSchemaMHClientEventMetadata alloc], "initWithDictionary:", v8);
      -[MHSchemaMHClientEvent setEventMetadata:](v5, "setEventMetadata:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acousticFalseTriggerMitigationEvaluationContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext initWithDictionary:]([MHSchemaMHAcousticFalseTriggerMitigationEvaluationContext alloc], "initWithDictionary:", v10);
      -[MHSchemaMHClientEvent setAcousticFalseTriggerMitigationEvaluationContext:](v5, "setAcousticFalseTriggerMitigationEvaluationContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("latticeFalseTriggerMitigationEvaluationContext"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext initWithDictionary:]([MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext alloc], "initWithDictionary:", v12);
      -[MHSchemaMHClientEvent setLatticeFalseTriggerMitigationEvaluationContext:](v5, "setLatticeFalseTriggerMitigationEvaluationContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unintendedResponseSuppressionExecutionContext"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[MHSchemaMHUnintendedResponseSuppressionEvaluationContext initWithDictionary:]([MHSchemaMHUnintendedResponseSuppressionEvaluationContext alloc], "initWithDictionary:", v14);
      -[MHSchemaMHClientEvent setUnintendedResponseSuppressionExecutionContext:](v5, "setUnintendedResponseSuppressionExecutionContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coreSpeechPreprocessorCompleted"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[MHSchemaMHCoreSpeechPreprocessorCompleted initWithDictionary:]([MHSchemaMHCoreSpeechPreprocessorCompleted alloc], "initWithDictionary:", v16);
      -[MHSchemaMHClientEvent setCoreSpeechPreprocessorCompleted:](v5, "setCoreSpeechPreprocessorCompleted:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrAudioConfigureStarted"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v186 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[MHSchemaMHASRAudioConfigureStarted initWithDictionary:]([MHSchemaMHASRAudioConfigureStarted alloc], "initWithDictionary:", v18);
      -[MHSchemaMHClientEvent setAsrAudioConfigureStarted:](v5, "setAsrAudioConfigureStarted:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioInitContext"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v185 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[MHSchemaMHAssistantDaemonAudioInitContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioInitContext alloc], "initWithDictionary:", v20);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioInitContext:](v5, "setAssistantDaemonAudioInitContext:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioConfigureContext"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v184 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[MHSchemaMHAssistantDaemonAudioConfigureContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioConfigureContext alloc], "initWithDictionary:", v22);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioConfigureContext:](v5, "setAssistantDaemonAudioConfigureContext:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioPrepareContext"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v183 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[MHSchemaMHAssistantDaemonAudioPrepareContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioPrepareContext alloc], "initWithDictionary:", v24);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioPrepareContext:](v5, "setAssistantDaemonAudioPrepareContext:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioPrewarmContext"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v182 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[MHSchemaMHAssistantDaemonAudioPrewarmContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioPrewarmContext alloc], "initWithDictionary:", v26);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioPrewarmContext:](v5, "setAssistantDaemonAudioPrewarmContext:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioStartRecordingContext"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v181 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[MHSchemaMHAssistantDaemonAudioStartRecordingContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioStartRecordingContext alloc], "initWithDictionary:", v28);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioStartRecordingContext:](v5, "setAssistantDaemonAudioStartRecordingContext:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioStopRecordingContext"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v180 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[MHSchemaMHAssistantDaemonAudioStopRecordingContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioStopRecordingContext alloc], "initWithDictionary:", v30);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioStopRecordingContext:](v5, "setAssistantDaemonAudioStopRecordingContext:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioSessionSetActiveContext"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v179 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[MHSchemaMHAssistantDaemonAudioSessionSetActiveContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioSessionSetActiveContext alloc], "initWithDictionary:", v32);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioSessionSetActiveContext:](v5, "setAssistantDaemonAudioSessionSetActiveContext:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioSessionSetInactiveContext"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v178 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioSessionSetInactiveContext alloc], "initWithDictionary:", v34);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioSessionSetInactiveContext:](v5, "setAssistantDaemonAudioSessionSetInactiveContext:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioFetchRouteContext"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v177 = (void *)v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[MHSchemaMHAssistantDaemonAudioFetchRouteContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioFetchRouteContext alloc], "initWithDictionary:", v36);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioFetchRouteContext:](v5, "setAssistantDaemonAudioFetchRouteContext:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioRecordingContext"));
    v38 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v176 = (void *)v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[MHSchemaMHAssistantDaemonAudioRecordingContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioRecordingContext alloc], "initWithDictionary:", v38);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioRecordingContext:](v5, "setAssistantDaemonAudioRecordingContext:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioRecordingMissedBufferDetected"));
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v175 = (void *)v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected initWithDictionary:]([MHSchemaMHAssistantDaemonAudioRecordingMissedBufferDetected alloc], "initWithDictionary:", v40);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioRecordingMissedBufferDetected:](v5, "setAssistantDaemonAudioRecordingMissedBufferDetected:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioLateBufferDetected"));
    v42 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v174 = (void *)v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[MHSchemaMHAssistantDaemonAudioLateBufferDetected initWithDictionary:]([MHSchemaMHAssistantDaemonAudioLateBufferDetected alloc], "initWithDictionary:", v42);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioLateBufferDetected:](v5, "setAssistantDaemonAudioLateBufferDetected:", v43);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioRecordingFirstBufferContext"));
    v44 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v173 = (void *)v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioRecordingFirstBufferContext alloc], "initWithDictionary:", v44);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioRecordingFirstBufferContext:](v5, "setAssistantDaemonAudioRecordingFirstBufferContext:", v45);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioRecordingLastBufferContext"));
    v46 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v172 = (void *)v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioRecordingLastBufferContext alloc], "initWithDictionary:", v46);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioRecordingLastBufferContext:](v5, "setAssistantDaemonAudioRecordingLastBufferContext:", v47);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioRecordingInterruptionContext"));
    v48 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v171 = (void *)v48;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioRecordingInterruptionContext alloc], "initWithDictionary:", v48);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioRecordingInterruptionContext:](v5, "setAssistantDaemonAudioRecordingInterruptionContext:", v49);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioRecordingInterruptionStartedTier1"));
    v50 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v170 = (void *)v50;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = -[MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 initWithDictionary:]([MHSchemaMHAssistantDaemonAudioRecordingInterruptionStartedTier1 alloc], "initWithDictionary:", v50);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioRecordingInterruptionStartedTier1:](v5, "setAssistantDaemonAudioRecordingInterruptionStartedTier1:", v51);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioBluetoothInfo"));
    v52 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v169 = (void *)v52;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = -[MHSchemaMHAssistantDaemonAudioBluetoothInfo initWithDictionary:]([MHSchemaMHAssistantDaemonAudioBluetoothInfo alloc], "initWithDictionary:", v52);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioBluetoothInfo:](v5, "setAssistantDaemonAudioBluetoothInfo:", v53);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceTriggerTwoShotDetected"));
    v54 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v168 = (void *)v54;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = -[MHSchemaMHVoiceTriggerTwoShotDetected initWithDictionary:]([MHSchemaMHVoiceTriggerTwoShotDetected alloc], "initWithDictionary:", v54);
      -[MHSchemaMHClientEvent setVoiceTriggerTwoShotDetected:](v5, "setVoiceTriggerTwoShotDetected:", v55);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioTwoShotTransitionContext"));
    v56 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = (void *)v56;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = -[MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext initWithDictionary:]([MHSchemaMHAssistantDaemonAudioTwoShotTransitionContext alloc], "initWithDictionary:", v56);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioTwoShotTransitionContext:](v5, "setAssistantDaemonAudioTwoShotTransitionContext:", v57);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceTriggerContext"));
    v58 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v166 = (void *)v58;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = -[MHSchemaMHVoiceTriggerContext initWithDictionary:]([MHSchemaMHVoiceTriggerContext alloc], "initWithDictionary:", v58);
      -[MHSchemaMHClientEvent setVoiceTriggerContext:](v5, "setVoiceTriggerContext:", v59);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointDetected"));
    v60 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v165 = (void *)v60;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = -[MHSchemaMHEndpointDetected initWithDictionary:]([MHSchemaMHEndpointDetected alloc], "initWithDictionary:", v60);
      -[MHSchemaMHClientEvent setEndpointDetected:](v5, "setEndpointDetected:", v61);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointLatencyInfoReported"));
    v62 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v164 = (void *)v62;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = -[MHSchemaMHEndpointLatencyInfoReported initWithDictionary:]([MHSchemaMHEndpointLatencyInfoReported alloc], "initWithDictionary:", v62);
      -[MHSchemaMHClientEvent setEndpointLatencyInfoReported:](v5, "setEndpointLatencyInfoReported:", v63);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adblockerContext"));
    v64 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v163 = (void *)v64;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = -[MHSchemaMHVoiceAdBlockerContext initWithDictionary:]([MHSchemaMHVoiceAdBlockerContext alloc], "initWithDictionary:", v64);
      -[MHSchemaMHClientEvent setAdblockerContext:](v5, "setAdblockerContext:", v65);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onDeviceEndpointerContext"));
    v66 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v162 = (void *)v66;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = -[MHSchemaMHOnDeviceEndpointerContext initWithDictionary:]([MHSchemaMHOnDeviceEndpointerContext alloc], "initWithDictionary:", v66);
      -[MHSchemaMHClientEvent setOnDeviceEndpointerContext:](v5, "setOnDeviceEndpointerContext:", v67);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverEndpointerContext"));
    v68 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v161 = (void *)v68;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = -[MHSchemaMHServerEndpointerContext initWithDictionary:]([MHSchemaMHServerEndpointerContext alloc], "initWithDictionary:", v68);
      -[MHSchemaMHClientEvent setServerEndpointerContext:](v5, "setServerEndpointerContext:", v69);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointerUsed"));
    v70 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v160 = (void *)v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v71 = -[MHSchemaMHEndpointerUsed initWithDictionary:]([MHSchemaMHEndpointerUsed alloc], "initWithDictionary:", v70);
      -[MHSchemaMHClientEvent setEndpointerUsed:](v5, "setEndpointerUsed:", v71);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointDelayContext"));
    v72 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v159 = (void *)v72;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v73 = -[MHSchemaMHEndpointDelayContext initWithDictionary:]([MHSchemaMHEndpointDelayContext alloc], "initWithDictionary:", v72);
      -[MHSchemaMHClientEvent setEndpointDelayContext:](v5, "setEndpointDelayContext:", v73);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalMitigationRecommendation"));
    v74 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v158 = (void *)v74;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v75 = -[MHSchemaMHMitigationDecisionRecommended initWithDictionary:]([MHSchemaMHMitigationDecisionRecommended alloc], "initWithDictionary:", v74);
      -[MHSchemaMHClientEvent setFinalMitigationRecommendation:](v5, "setFinalMitigationRecommendation:", v75);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationPlaybackAttempted"));
    v76 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v157 = (void *)v76;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = -[MHSchemaMHApplicationPlaybackAttempted initWithDictionary:]([MHSchemaMHApplicationPlaybackAttempted alloc], "initWithDictionary:", v76);
      -[MHSchemaMHClientEvent setApplicationPlaybackAttempted:](v5, "setApplicationPlaybackAttempted:", v77);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriLaunchRequestContext"));
    v78 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v156 = (void *)v78;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v79 = -[MHSchemaMHSiriLaunchRequestContext initWithDictionary:]([MHSchemaMHSiriLaunchRequestContext alloc], "initWithDictionary:", v78);
      -[MHSchemaMHClientEvent setSiriLaunchRequestContext:](v5, "setSiriLaunchRequestContext:", v79);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endpointerAccessibleContext"));
    v80 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v155 = (void *)v80;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v81 = -[MHSchemaMHEndpointerAccessibleContext initWithDictionary:]([MHSchemaMHEndpointerAccessibleContext alloc], "initWithDictionary:", v80);
      -[MHSchemaMHClientEvent setEndpointerAccessibleContext:](v5, "setEndpointerAccessibleContext:", v81);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carPlayLangaugeMismatched"));
    v82 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v154 = (void *)v82;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v83 = -[MHSchemaMHCarplayLanguageMismatch initWithDictionary:]([MHSchemaMHCarplayLanguageMismatch alloc], "initWithDictionary:", v82);
      -[MHSchemaMHClientEvent setCarPlayLangaugeMismatched:](v5, "setCarPlayLangaugeMismatched:", v83);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("darwinConnectedDeviceWakeContext"));
    v84 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v153 = (void *)v84;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v85 = -[MHSchemaMHDarwinConnectedDeviceWakeContext initWithDictionary:]([MHSchemaMHDarwinConnectedDeviceWakeContext alloc], "initWithDictionary:", v84);
      -[MHSchemaMHClientEvent setDarwinConnectedDeviceWakeContext:](v5, "setDarwinConnectedDeviceWakeContext:", v85);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("odldFalseTriggerMitigated"));
    v86 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v152 = (void *)v86;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v87 = -[MHSchemaMHOdldFalseTriggerMitigated initWithDictionary:]([MHSchemaMHOdldFalseTriggerMitigated alloc], "initWithDictionary:", v86);
      -[MHSchemaMHClientEvent setOdldFalseTriggerMitigated:](v5, "setOdldFalseTriggerMitigated:", v87);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speakerFalseTriggerMitigated"));
    v88 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v151 = (void *)v88;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v89 = -[MHSchemaMHSpeakerFalseTriggerMitigated initWithDictionary:]([MHSchemaMHSpeakerFalseTriggerMitigated alloc], "initWithDictionary:", v88);
      -[MHSchemaMHClientEvent setSpeakerFalseTriggerMitigated:](v5, "setSpeakerFalseTriggerMitigated:", v89);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriDirectedSpeechDetectionFailed"));
    v90 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v150 = (void *)v90;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v91 = -[MHSchemaMHSiriDirectedSpeechDetectionFailed initWithDictionary:]([MHSchemaMHSiriDirectedSpeechDetectionFailed alloc], "initWithDictionary:", v90);
      -[MHSchemaMHClientEvent setSiriDirectedSpeechDetectionFailed:](v5, "setSiriDirectedSpeechDetectionFailed:", v91);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioDucked"));
    v92 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v149 = (void *)v92;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v93 = -[MHSchemaMHAudioDucked initWithDictionary:]([MHSchemaMHAudioDucked alloc], "initWithDictionary:", v92);
      -[MHSchemaMHClientEvent setAudioDucked:](v5, "setAudioDucked:", v93);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioRecordingFailed"));
    v94 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v148 = (void *)v94;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v95 = -[MHSchemaMHAssistantDaemonAudioRecordingFailed initWithDictionary:]([MHSchemaMHAssistantDaemonAudioRecordingFailed alloc], "initWithDictionary:", v94);
      -[MHSchemaMHClientEvent setAudioRecordingFailed:](v5, "setAudioRecordingFailed:", v95);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rtsFalseRejectDetected"));
    v96 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v147 = (void *)v96;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v97 = -[MHSchemaMHRTSFalseRejectDetected initWithDictionary:]([MHSchemaMHRTSFalseRejectDetected alloc], "initWithDictionary:", v96);
      -[MHSchemaMHClientEvent setRtsFalseRejectDetected:](v5, "setRtsFalseRejectDetected:", v97);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpCreated"));
    v98 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v146 = (void *)v98;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v99 = -[MHSchemaMHTRPCreated initWithDictionary:]([MHSchemaMHTRPCreated alloc], "initWithDictionary:", v98);
      -[MHSchemaMHClientEvent setTrpCreated:](v5, "setTrpCreated:", v99);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userSpeakingContext"));
    v100 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v145 = (void *)v100;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v101 = -[MHSchemaMHUserSpeakingContext initWithDictionary:]([MHSchemaMHUserSpeakingContext alloc], "initWithDictionary:", v100);
      -[MHSchemaMHClientEvent setUserSpeakingContext:](v5, "setUserSpeakingContext:", v101);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechStopDetected"));
    v102 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v144 = (void *)v102;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v103 = -[MHSchemaMHSpeechStopDetected initWithDictionary:]([MHSchemaMHSpeechStopDetected alloc], "initWithDictionary:", v102);
      -[MHSchemaMHClientEvent setSpeechStopDetected:](v5, "setSpeechStopDetected:", v103);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechDetectorContext"));
    v104 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v143 = (void *)v104;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v105 = -[MHSchemaMHSpeechDetectorContext initWithDictionary:]([MHSchemaMHSpeechDetectorContext alloc], "initWithDictionary:", v104);
      -[MHSchemaMHClientEvent setSpeechDetectorContext:](v5, "setSpeechDetectorContext:", v105);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stoppedListeningForSpeechContinuation"));
    v106 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v142 = (void *)v106;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v107 = -[MHSchemaMHStoppedListeningForSpeechContinuation initWithDictionary:]([MHSchemaMHStoppedListeningForSpeechContinuation alloc], "initWithDictionary:", v106);
      -[MHSchemaMHClientEvent setStoppedListeningForSpeechContinuation:](v5, "setStoppedListeningForSpeechContinuation:", v107);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userEngagementModelContext"));
    v108 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v141 = (void *)v108;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v109 = -[MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext initWithDictionary:]([MHSchemaMHUserEngagementFalseTriggerMitigationEvaluationContext alloc], "initWithDictionary:", v108);
      -[MHSchemaMHClientEvent setUserEngagementModelContext:](v5, "setUserEngagementModelContext:", v109);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attendingContext"));
    v110 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v140 = (void *)v110;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v111 = -[MHSchemaMHAttendingContext initWithDictionary:]([MHSchemaMHAttendingContext alloc], "initWithDictionary:", v110);
      -[MHSchemaMHClientEvent setAttendingContext:](v5, "setAttendingContext:", v111);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crownPressed"));
    v112 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v139 = (void *)v112;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v113 = -[MHSchemaMHCrownPressed initWithDictionary:]([MHSchemaMHCrownPressed alloc], "initWithDictionary:", v112);
      -[MHSchemaMHClientEvent setCrownPressed:](v5, "setCrownPressed:", v113);

    }
    v133 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rtsTriggered"));
    v114 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v115 = -[MHSchemaMHRaiseToSpeakTriggered initWithDictionary:]([MHSchemaMHRaiseToSpeakTriggered alloc], "initWithDictionary:", v114);
      -[MHSchemaMHClientEvent setRtsTriggered:](v5, "setRtsTriggered:", v115);

    }
    v138 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rtsFirstPassPolicyTriggered"), v114);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v117 = -[MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered initWithDictionary:]([MHSchemaMHRaiseToSpeakFirstPassPolicyTriggered alloc], "initWithDictionary:", v116);
      -[MHSchemaMHClientEvent setRtsFirstPassPolicyTriggered:](v5, "setRtsFirstPassPolicyTriggered:", v117);

    }
    v137 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rtsSecondPassPolicyDecisionMade"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v119 = -[MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade initWithDictionary:]([MHSchemaMHRaiseToSpeakSecondPassPolicyDecisionMade alloc], "initWithDictionary:", v118);
      -[MHSchemaMHClientEvent setRtsSecondPassPolicyDecisionMade:](v5, "setRtsSecondPassPolicyDecisionMade:", v119);

    }
    v136 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceProfileOnboarded"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v121 = -[MHSchemaMHVoiceProfileOnboarded initWithDictionary:]([MHSchemaMHVoiceProfileOnboarded alloc], "initWithDictionary:", v120);
      -[MHSchemaMHClientEvent setVoiceProfileOnboarded:](v5, "setVoiceProfileOnboarded:", v121);

    }
    v135 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sensorControlStatusReported"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v123 = -[MHSchemaMHSensorControlStatusReported initWithDictionary:]([MHSchemaMHSensorControlStatusReported alloc], "initWithDictionary:", v122);
      -[MHSchemaMHClientEvent setSensorControlStatusReported:](v5, "setSensorControlStatusReported:", v123);

    }
    v134 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceTriggerRePrompted"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v125 = -[MHSchemaMHVoiceTriggerRePrompted initWithDictionary:]([MHSchemaMHVoiceTriggerRePrompted alloc], "initWithDictionary:", v124);
      -[MHSchemaMHClientEvent setVoiceTriggerRePrompted:](v5, "setVoiceTriggerRePrompted:", v125);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDaemonAudioRecordingFailureInsufficientPriority"));
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v127 = -[MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority initWithDictionary:]([MHSchemaMHAssistantDaemonAudioRecordingFailureInsufficientPriority alloc], "initWithDictionary:", v126);
      -[MHSchemaMHClientEvent setAssistantDaemonAudioRecordingFailureInsufficientPriority:](v5, "setAssistantDaemonAudioRecordingFailureInsufficientPriority:", v127);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceProfileICloudSyncFinished"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v129 = -[MHSchemaMHVoiceProfileICloudSyncFinished initWithDictionary:]([MHSchemaMHVoiceProfileICloudSyncFinished alloc], "initWithDictionary:", v128);
      -[MHSchemaMHClientEvent setVoiceProfileICloudSyncFinished:](v5, "setVoiceProfileICloudSyncFinished:", v129);

    }
    v130 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SISchemaUUID)mhId
{
  return self->_mhId;
}

- (void)setMhId:(id)a3
{
  objc_storeStrong((id *)&self->_mhId, a3);
}

- (MHSchemaMHClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasMhId:(BOOL)a3
{
  self->_hasMhId = a3;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasAcousticFalseTriggerMitigationEvaluationContext
{
  return self->_hasAcousticFalseTriggerMitigationEvaluationContext;
}

- (void)setHasAcousticFalseTriggerMitigationEvaluationContext:(BOOL)a3
{
  self->_hasAcousticFalseTriggerMitigationEvaluationContext = a3;
}

- (BOOL)hasLatticeFalseTriggerMitigationEvaluationContext
{
  return self->_hasLatticeFalseTriggerMitigationEvaluationContext;
}

- (void)setHasLatticeFalseTriggerMitigationEvaluationContext:(BOOL)a3
{
  self->_hasLatticeFalseTriggerMitigationEvaluationContext = a3;
}

- (BOOL)hasUnintendedResponseSuppressionExecutionContext
{
  return self->_hasUnintendedResponseSuppressionExecutionContext;
}

- (void)setHasUnintendedResponseSuppressionExecutionContext:(BOOL)a3
{
  self->_hasUnintendedResponseSuppressionExecutionContext = a3;
}

- (BOOL)hasCoreSpeechPreprocessorCompleted
{
  return self->_hasCoreSpeechPreprocessorCompleted;
}

- (void)setHasCoreSpeechPreprocessorCompleted:(BOOL)a3
{
  self->_hasCoreSpeechPreprocessorCompleted = a3;
}

- (BOOL)hasAsrAudioConfigureStarted
{
  return self->_hasAsrAudioConfigureStarted;
}

- (void)setHasAsrAudioConfigureStarted:(BOOL)a3
{
  self->_hasAsrAudioConfigureStarted = a3;
}

- (BOOL)hasAssistantDaemonAudioInitContext
{
  return self->_hasAssistantDaemonAudioInitContext;
}

- (void)setHasAssistantDaemonAudioInitContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioInitContext = a3;
}

- (BOOL)hasAssistantDaemonAudioConfigureContext
{
  return self->_hasAssistantDaemonAudioConfigureContext;
}

- (void)setHasAssistantDaemonAudioConfigureContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioConfigureContext = a3;
}

- (BOOL)hasAssistantDaemonAudioPrepareContext
{
  return self->_hasAssistantDaemonAudioPrepareContext;
}

- (void)setHasAssistantDaemonAudioPrepareContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioPrepareContext = a3;
}

- (BOOL)hasAssistantDaemonAudioPrewarmContext
{
  return self->_hasAssistantDaemonAudioPrewarmContext;
}

- (void)setHasAssistantDaemonAudioPrewarmContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioPrewarmContext = a3;
}

- (BOOL)hasAssistantDaemonAudioStartRecordingContext
{
  return self->_hasAssistantDaemonAudioStartRecordingContext;
}

- (void)setHasAssistantDaemonAudioStartRecordingContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioStartRecordingContext = a3;
}

- (BOOL)hasAssistantDaemonAudioStopRecordingContext
{
  return self->_hasAssistantDaemonAudioStopRecordingContext;
}

- (void)setHasAssistantDaemonAudioStopRecordingContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioStopRecordingContext = a3;
}

- (BOOL)hasAssistantDaemonAudioSessionSetActiveContext
{
  return self->_hasAssistantDaemonAudioSessionSetActiveContext;
}

- (void)setHasAssistantDaemonAudioSessionSetActiveContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioSessionSetActiveContext = a3;
}

- (BOOL)hasAssistantDaemonAudioSessionSetInactiveContext
{
  return self->_hasAssistantDaemonAudioSessionSetInactiveContext;
}

- (void)setHasAssistantDaemonAudioSessionSetInactiveContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioSessionSetInactiveContext = a3;
}

- (BOOL)hasAssistantDaemonAudioFetchRouteContext
{
  return self->_hasAssistantDaemonAudioFetchRouteContext;
}

- (void)setHasAssistantDaemonAudioFetchRouteContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioFetchRouteContext = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingContext
{
  return self->_hasAssistantDaemonAudioRecordingContext;
}

- (void)setHasAssistantDaemonAudioRecordingContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingContext = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingMissedBufferDetected
{
  return self->_hasAssistantDaemonAudioRecordingMissedBufferDetected;
}

- (void)setHasAssistantDaemonAudioRecordingMissedBufferDetected:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingMissedBufferDetected = a3;
}

- (BOOL)hasAssistantDaemonAudioLateBufferDetected
{
  return self->_hasAssistantDaemonAudioLateBufferDetected;
}

- (void)setHasAssistantDaemonAudioLateBufferDetected:(BOOL)a3
{
  self->_hasAssistantDaemonAudioLateBufferDetected = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingFirstBufferContext
{
  return self->_hasAssistantDaemonAudioRecordingFirstBufferContext;
}

- (void)setHasAssistantDaemonAudioRecordingFirstBufferContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingFirstBufferContext = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingLastBufferContext
{
  return self->_hasAssistantDaemonAudioRecordingLastBufferContext;
}

- (void)setHasAssistantDaemonAudioRecordingLastBufferContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingLastBufferContext = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingInterruptionContext
{
  return self->_hasAssistantDaemonAudioRecordingInterruptionContext;
}

- (void)setHasAssistantDaemonAudioRecordingInterruptionContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingInterruptionContext = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingInterruptionStartedTier1
{
  return self->_hasAssistantDaemonAudioRecordingInterruptionStartedTier1;
}

- (void)setHasAssistantDaemonAudioRecordingInterruptionStartedTier1:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingInterruptionStartedTier1 = a3;
}

- (BOOL)hasAssistantDaemonAudioBluetoothInfo
{
  return self->_hasAssistantDaemonAudioBluetoothInfo;
}

- (void)setHasAssistantDaemonAudioBluetoothInfo:(BOOL)a3
{
  self->_hasAssistantDaemonAudioBluetoothInfo = a3;
}

- (BOOL)hasVoiceTriggerTwoShotDetected
{
  return self->_hasVoiceTriggerTwoShotDetected;
}

- (void)setHasVoiceTriggerTwoShotDetected:(BOOL)a3
{
  self->_hasVoiceTriggerTwoShotDetected = a3;
}

- (BOOL)hasAssistantDaemonAudioTwoShotTransitionContext
{
  return self->_hasAssistantDaemonAudioTwoShotTransitionContext;
}

- (void)setHasAssistantDaemonAudioTwoShotTransitionContext:(BOOL)a3
{
  self->_hasAssistantDaemonAudioTwoShotTransitionContext = a3;
}

- (BOOL)hasVoiceTriggerContext
{
  return self->_hasVoiceTriggerContext;
}

- (void)setHasVoiceTriggerContext:(BOOL)a3
{
  self->_hasVoiceTriggerContext = a3;
}

- (BOOL)hasEndpointDetected
{
  return self->_hasEndpointDetected;
}

- (void)setHasEndpointDetected:(BOOL)a3
{
  self->_hasEndpointDetected = a3;
}

- (BOOL)hasEndpointLatencyInfoReported
{
  return self->_hasEndpointLatencyInfoReported;
}

- (void)setHasEndpointLatencyInfoReported:(BOOL)a3
{
  self->_hasEndpointLatencyInfoReported = a3;
}

- (BOOL)hasAdblockerContext
{
  return self->_hasAdblockerContext;
}

- (void)setHasAdblockerContext:(BOOL)a3
{
  self->_hasAdblockerContext = a3;
}

- (BOOL)hasOnDeviceEndpointerContext
{
  return self->_hasOnDeviceEndpointerContext;
}

- (void)setHasOnDeviceEndpointerContext:(BOOL)a3
{
  self->_hasOnDeviceEndpointerContext = a3;
}

- (BOOL)hasServerEndpointerContext
{
  return self->_hasServerEndpointerContext;
}

- (void)setHasServerEndpointerContext:(BOOL)a3
{
  self->_hasServerEndpointerContext = a3;
}

- (BOOL)hasEndpointerUsed
{
  return self->_hasEndpointerUsed;
}

- (void)setHasEndpointerUsed:(BOOL)a3
{
  self->_hasEndpointerUsed = a3;
}

- (BOOL)hasEndpointDelayContext
{
  return self->_hasEndpointDelayContext;
}

- (void)setHasEndpointDelayContext:(BOOL)a3
{
  self->_hasEndpointDelayContext = a3;
}

- (BOOL)hasFinalMitigationRecommendation
{
  return self->_hasFinalMitigationRecommendation;
}

- (void)setHasFinalMitigationRecommendation:(BOOL)a3
{
  self->_hasFinalMitigationRecommendation = a3;
}

- (BOOL)hasApplicationPlaybackAttempted
{
  return self->_hasApplicationPlaybackAttempted;
}

- (void)setHasApplicationPlaybackAttempted:(BOOL)a3
{
  self->_hasApplicationPlaybackAttempted = a3;
}

- (BOOL)hasSiriLaunchRequestContext
{
  return self->_hasSiriLaunchRequestContext;
}

- (void)setHasSiriLaunchRequestContext:(BOOL)a3
{
  self->_hasSiriLaunchRequestContext = a3;
}

- (BOOL)hasEndpointerAccessibleContext
{
  return self->_hasEndpointerAccessibleContext;
}

- (void)setHasEndpointerAccessibleContext:(BOOL)a3
{
  self->_hasEndpointerAccessibleContext = a3;
}

- (BOOL)hasCarPlayLangaugeMismatched
{
  return self->_hasCarPlayLangaugeMismatched;
}

- (void)setHasCarPlayLangaugeMismatched:(BOOL)a3
{
  self->_hasCarPlayLangaugeMismatched = a3;
}

- (BOOL)hasDarwinConnectedDeviceWakeContext
{
  return self->_hasDarwinConnectedDeviceWakeContext;
}

- (void)setHasDarwinConnectedDeviceWakeContext:(BOOL)a3
{
  self->_hasDarwinConnectedDeviceWakeContext = a3;
}

- (BOOL)hasOdldFalseTriggerMitigated
{
  return self->_hasOdldFalseTriggerMitigated;
}

- (void)setHasOdldFalseTriggerMitigated:(BOOL)a3
{
  self->_hasOdldFalseTriggerMitigated = a3;
}

- (BOOL)hasSpeakerFalseTriggerMitigated
{
  return self->_hasSpeakerFalseTriggerMitigated;
}

- (void)setHasSpeakerFalseTriggerMitigated:(BOOL)a3
{
  self->_hasSpeakerFalseTriggerMitigated = a3;
}

- (BOOL)hasSiriDirectedSpeechDetectionFailed
{
  return self->_hasSiriDirectedSpeechDetectionFailed;
}

- (void)setHasSiriDirectedSpeechDetectionFailed:(BOOL)a3
{
  self->_hasSiriDirectedSpeechDetectionFailed = a3;
}

- (BOOL)hasAudioDucked
{
  return self->_hasAudioDucked;
}

- (void)setHasAudioDucked:(BOOL)a3
{
  self->_hasAudioDucked = a3;
}

- (BOOL)hasAudioRecordingFailed
{
  return self->_hasAudioRecordingFailed;
}

- (void)setHasAudioRecordingFailed:(BOOL)a3
{
  self->_hasAudioRecordingFailed = a3;
}

- (BOOL)hasRtsFalseRejectDetected
{
  return self->_hasRtsFalseRejectDetected;
}

- (void)setHasRtsFalseRejectDetected:(BOOL)a3
{
  self->_hasRtsFalseRejectDetected = a3;
}

- (BOOL)hasTrpCreated
{
  return self->_hasTrpCreated;
}

- (void)setHasTrpCreated:(BOOL)a3
{
  self->_hasTrpCreated = a3;
}

- (BOOL)hasUserSpeakingContext
{
  return self->_hasUserSpeakingContext;
}

- (void)setHasUserSpeakingContext:(BOOL)a3
{
  self->_hasUserSpeakingContext = a3;
}

- (BOOL)hasSpeechStopDetected
{
  return self->_hasSpeechStopDetected;
}

- (void)setHasSpeechStopDetected:(BOOL)a3
{
  self->_hasSpeechStopDetected = a3;
}

- (BOOL)hasSpeechDetectorContext
{
  return self->_hasSpeechDetectorContext;
}

- (void)setHasSpeechDetectorContext:(BOOL)a3
{
  self->_hasSpeechDetectorContext = a3;
}

- (BOOL)hasStoppedListeningForSpeechContinuation
{
  return self->_hasStoppedListeningForSpeechContinuation;
}

- (void)setHasStoppedListeningForSpeechContinuation:(BOOL)a3
{
  self->_hasStoppedListeningForSpeechContinuation = a3;
}

- (BOOL)hasUserEngagementModelContext
{
  return self->_hasUserEngagementModelContext;
}

- (void)setHasUserEngagementModelContext:(BOOL)a3
{
  self->_hasUserEngagementModelContext = a3;
}

- (BOOL)hasAttendingContext
{
  return self->_hasAttendingContext;
}

- (void)setHasAttendingContext:(BOOL)a3
{
  self->_hasAttendingContext = a3;
}

- (BOOL)hasCrownPressed
{
  return self->_hasCrownPressed;
}

- (void)setHasCrownPressed:(BOOL)a3
{
  self->_hasCrownPressed = a3;
}

- (BOOL)hasRtsTriggered
{
  return self->_hasRtsTriggered;
}

- (void)setHasRtsTriggered:(BOOL)a3
{
  self->_hasRtsTriggered = a3;
}

- (BOOL)hasRtsFirstPassPolicyTriggered
{
  return self->_hasRtsFirstPassPolicyTriggered;
}

- (void)setHasRtsFirstPassPolicyTriggered:(BOOL)a3
{
  self->_hasRtsFirstPassPolicyTriggered = a3;
}

- (BOOL)hasRtsSecondPassPolicyDecisionMade
{
  return self->_hasRtsSecondPassPolicyDecisionMade;
}

- (void)setHasRtsSecondPassPolicyDecisionMade:(BOOL)a3
{
  self->_hasRtsSecondPassPolicyDecisionMade = a3;
}

- (BOOL)hasVoiceProfileOnboarded
{
  return self->_hasVoiceProfileOnboarded;
}

- (void)setHasVoiceProfileOnboarded:(BOOL)a3
{
  self->_hasVoiceProfileOnboarded = a3;
}

- (BOOL)hasSensorControlStatusReported
{
  return self->_hasSensorControlStatusReported;
}

- (void)setHasSensorControlStatusReported:(BOOL)a3
{
  self->_hasSensorControlStatusReported = a3;
}

- (BOOL)hasVoiceTriggerRePrompted
{
  return self->_hasVoiceTriggerRePrompted;
}

- (void)setHasVoiceTriggerRePrompted:(BOOL)a3
{
  self->_hasVoiceTriggerRePrompted = a3;
}

- (BOOL)hasAssistantDaemonAudioRecordingFailureInsufficientPriority
{
  return self->_hasAssistantDaemonAudioRecordingFailureInsufficientPriority;
}

- (void)setHasAssistantDaemonAudioRecordingFailureInsufficientPriority:(BOOL)a3
{
  self->_hasAssistantDaemonAudioRecordingFailureInsufficientPriority = a3;
}

- (BOOL)hasVoiceProfileICloudSyncFinished
{
  return self->_hasVoiceProfileICloudSyncFinished;
}

- (void)setHasVoiceProfileICloudSyncFinished:(BOOL)a3
{
  self->_hasVoiceProfileICloudSyncFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceProfileICloudSyncFinished, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingFailureInsufficientPriority, 0);
  objc_storeStrong((id *)&self->_voiceTriggerRePrompted, 0);
  objc_storeStrong((id *)&self->_sensorControlStatusReported, 0);
  objc_storeStrong((id *)&self->_voiceProfileOnboarded, 0);
  objc_storeStrong((id *)&self->_rtsSecondPassPolicyDecisionMade, 0);
  objc_storeStrong((id *)&self->_rtsFirstPassPolicyTriggered, 0);
  objc_storeStrong((id *)&self->_rtsTriggered, 0);
  objc_storeStrong((id *)&self->_crownPressed, 0);
  objc_storeStrong((id *)&self->_attendingContext, 0);
  objc_storeStrong((id *)&self->_userEngagementModelContext, 0);
  objc_storeStrong((id *)&self->_stoppedListeningForSpeechContinuation, 0);
  objc_storeStrong((id *)&self->_speechDetectorContext, 0);
  objc_storeStrong((id *)&self->_speechStopDetected, 0);
  objc_storeStrong((id *)&self->_userSpeakingContext, 0);
  objc_storeStrong((id *)&self->_trpCreated, 0);
  objc_storeStrong((id *)&self->_rtsFalseRejectDetected, 0);
  objc_storeStrong((id *)&self->_audioRecordingFailed, 0);
  objc_storeStrong((id *)&self->_audioDucked, 0);
  objc_storeStrong((id *)&self->_siriDirectedSpeechDetectionFailed, 0);
  objc_storeStrong((id *)&self->_speakerFalseTriggerMitigated, 0);
  objc_storeStrong((id *)&self->_odldFalseTriggerMitigated, 0);
  objc_storeStrong((id *)&self->_darwinConnectedDeviceWakeContext, 0);
  objc_storeStrong((id *)&self->_carPlayLangaugeMismatched, 0);
  objc_storeStrong((id *)&self->_endpointerAccessibleContext, 0);
  objc_storeStrong((id *)&self->_siriLaunchRequestContext, 0);
  objc_storeStrong((id *)&self->_applicationPlaybackAttempted, 0);
  objc_storeStrong((id *)&self->_finalMitigationRecommendation, 0);
  objc_storeStrong((id *)&self->_endpointDelayContext, 0);
  objc_storeStrong((id *)&self->_endpointerUsed, 0);
  objc_storeStrong((id *)&self->_serverEndpointerContext, 0);
  objc_storeStrong((id *)&self->_onDeviceEndpointerContext, 0);
  objc_storeStrong((id *)&self->_adblockerContext, 0);
  objc_storeStrong((id *)&self->_endpointLatencyInfoReported, 0);
  objc_storeStrong((id *)&self->_endpointDetected, 0);
  objc_storeStrong((id *)&self->_voiceTriggerContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioTwoShotTransitionContext, 0);
  objc_storeStrong((id *)&self->_voiceTriggerTwoShotDetected, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioBluetoothInfo, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingInterruptionStartedTier1, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingInterruptionContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingLastBufferContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingFirstBufferContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioLateBufferDetected, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingMissedBufferDetected, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioRecordingContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioFetchRouteContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioSessionSetInactiveContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioSessionSetActiveContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioStopRecordingContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioStartRecordingContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioPrewarmContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioPrepareContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioConfigureContext, 0);
  objc_storeStrong((id *)&self->_assistantDaemonAudioInitContext, 0);
  objc_storeStrong((id *)&self->_asrAudioConfigureStarted, 0);
  objc_storeStrong((id *)&self->_coreSpeechPreprocessorCompleted, 0);
  objc_storeStrong((id *)&self->_unintendedResponseSuppressionExecutionContext, 0);
  objc_storeStrong((id *)&self->_latticeFalseTriggerMitigationEvaluationContext, 0);
  objc_storeStrong((id *)&self->_acousticFalseTriggerMitigationEvaluationContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
}

- (int)getAnyEventType
{
  return 23;
}

@end
