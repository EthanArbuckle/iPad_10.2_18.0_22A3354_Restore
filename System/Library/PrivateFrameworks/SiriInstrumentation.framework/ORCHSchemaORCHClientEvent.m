@implementation ORCHSchemaORCHClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[ORCHSchemaORCHClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestId");
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
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;

  -[ORCHSchemaORCHClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "value"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length") != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
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
  id v117;
  objc_super v119;

  v4 = a3;
  v119.receiver = self;
  v119.super_class = (Class)ORCHSchemaORCHClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v119, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[ORCHSchemaORCHClientEvent deleteRouterRewrittenUtterance](self, "deleteRouterRewrittenUtterance");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[ORCHSchemaORCHClientEvent deleteRouterRewrittenUtterance](self, "deleteRouterRewrittenUtterance");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[ORCHSchemaORCHClientEvent deleteRouterRewrittenUtterance](self, "deleteRouterRewrittenUtterance");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[ORCHSchemaORCHClientEvent deleteRouterRewrittenUtterance](self, "deleteRouterRewrittenUtterance");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[ORCHSchemaORCHClientEvent deleteRouterRewrittenUtterance](self, "deleteRouterRewrittenUtterance");
  -[ORCHSchemaORCHClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaORCHClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[ORCHSchemaORCHClientEvent resourceUtilizationMetadata](self, "resourceUtilizationMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ORCHSchemaORCHClientEvent deleteResourceUtilizationMetadata](self, "deleteResourceUtilizationMetadata");
  -[ORCHSchemaORCHClientEvent requestContext](self, "requestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ORCHSchemaORCHClientEvent deleteRequestContext](self, "deleteRequestContext");
  -[ORCHSchemaORCHClientEvent asrBridgeContext](self, "asrBridgeContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ORCHSchemaORCHClientEvent deleteAsrBridgeContext](self, "deleteAsrBridgeContext");
  -[ORCHSchemaORCHClientEvent cdmBridgeContext](self, "cdmBridgeContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[ORCHSchemaORCHClientEvent deleteCdmBridgeContext](self, "deleteCdmBridgeContext");
  -[ORCHSchemaORCHClientEvent executionBridgeContext](self, "executionBridgeContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[ORCHSchemaORCHClientEvent deleteExecutionBridgeContext](self, "deleteExecutionBridgeContext");
  -[ORCHSchemaORCHClientEvent serverFallbackContext](self, "serverFallbackContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[ORCHSchemaORCHClientEvent deleteServerFallbackContext](self, "deleteServerFallbackContext");
  -[ORCHSchemaORCHClientEvent flowOutputSubmitted](self, "flowOutputSubmitted");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[ORCHSchemaORCHClientEvent deleteFlowOutputSubmitted](self, "deleteFlowOutputSubmitted");
  -[ORCHSchemaORCHClientEvent resultCandidate](self, "resultCandidate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[ORCHSchemaORCHClientEvent deleteResultCandidate](self, "deleteResultCandidate");
  -[ORCHSchemaORCHClientEvent resultSelected](self, "resultSelected");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[ORCHSchemaORCHClientEvent deleteResultSelected](self, "deleteResultSelected");
  -[ORCHSchemaORCHClientEvent contextSubmissionMessage](self, "contextSubmissionMessage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[ORCHSchemaORCHClientEvent deleteContextSubmissionMessage](self, "deleteContextSubmissionMessage");
  -[ORCHSchemaORCHClientEvent availableAssets](self, "availableAssets");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[ORCHSchemaORCHClientEvent deleteAvailableAssets](self, "deleteAvailableAssets");
  -[ORCHSchemaORCHClientEvent orchDeviceDynamicContext](self, "orchDeviceDynamicContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[ORCHSchemaORCHClientEvent deleteOrchDeviceDynamicContext](self, "deleteOrchDeviceDynamicContext");
  -[ORCHSchemaORCHClientEvent pommesBridgeContext](self, "pommesBridgeContext");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[ORCHSchemaORCHClientEvent deletePommesBridgeContext](self, "deletePommesBridgeContext");
  -[ORCHSchemaORCHClientEvent muxBridgeContext](self, "muxBridgeContext");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[ORCHSchemaORCHClientEvent deleteMuxBridgeContext](self, "deleteMuxBridgeContext");
  -[ORCHSchemaORCHClientEvent multiUserResultCandidate](self, "multiUserResultCandidate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[ORCHSchemaORCHClientEvent deleteMultiUserResultCandidate](self, "deleteMultiUserResultCandidate");
  -[ORCHSchemaORCHClientEvent multiUserResultSelected](self, "multiUserResultSelected");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[ORCHSchemaORCHClientEvent deleteMultiUserResultSelected](self, "deleteMultiUserResultSelected");
  -[ORCHSchemaORCHClientEvent aceCommandContext](self, "aceCommandContext");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applySensitiveConditionsPolicy:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "suppressMessage");

  if (v59)
    -[ORCHSchemaORCHClientEvent deleteAceCommandContext](self, "deleteAceCommandContext");
  -[ORCHSchemaORCHClientEvent trpFinalized](self, "trpFinalized");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "applySensitiveConditionsPolicy:", v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "suppressMessage");

  if (v62)
    -[ORCHSchemaORCHClientEvent deleteTrpFinalized](self, "deleteTrpFinalized");
  -[ORCHSchemaORCHClientEvent requestMitigated](self, "requestMitigated");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "applySensitiveConditionsPolicy:", v4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "suppressMessage");

  if (v65)
    -[ORCHSchemaORCHClientEvent deleteRequestMitigated](self, "deleteRequestMitigated");
  -[ORCHSchemaORCHClientEvent nlv3ServerFallbackDeprecated](self, "nlv3ServerFallbackDeprecated");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "applySensitiveConditionsPolicy:", v4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "suppressMessage");

  if (v68)
    -[ORCHSchemaORCHClientEvent deleteNlv3ServerFallbackDeprecated](self, "deleteNlv3ServerFallbackDeprecated");
  -[ORCHSchemaORCHClientEvent uiActivationContext](self, "uiActivationContext");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "applySensitiveConditionsPolicy:", v4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "suppressMessage");

  if (v71)
    -[ORCHSchemaORCHClientEvent deleteUiActivationContext](self, "deleteUiActivationContext");
  -[ORCHSchemaORCHClientEvent trpCandidateReceived](self, "trpCandidateReceived");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "applySensitiveConditionsPolicy:", v4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "suppressMessage");

  if (v74)
    -[ORCHSchemaORCHClientEvent deleteTrpCandidateReceived](self, "deleteTrpCandidateReceived");
  -[ORCHSchemaORCHClientEvent identityBridgeRequestContext](self, "identityBridgeRequestContext");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "applySensitiveConditionsPolicy:", v4);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "suppressMessage");

  if (v77)
    -[ORCHSchemaORCHClientEvent deleteIdentityBridgeRequestContext](self, "deleteIdentityBridgeRequestContext");
  -[ORCHSchemaORCHClientEvent assetSetsReported](self, "assetSetsReported");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "applySensitiveConditionsPolicy:", v4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "suppressMessage");

  if (v80)
    -[ORCHSchemaORCHClientEvent deleteAssetSetsReported](self, "deleteAssetSetsReported");
  -[ORCHSchemaORCHClientEvent candidateRequestContext](self, "candidateRequestContext");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "applySensitiveConditionsPolicy:", v4);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "suppressMessage");

  if (v83)
    -[ORCHSchemaORCHClientEvent deleteCandidateRequestContext](self, "deleteCandidateRequestContext");
  -[ORCHSchemaORCHClientEvent powerContextPolicyReported](self, "powerContextPolicyReported");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "applySensitiveConditionsPolicy:", v4);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "suppressMessage");

  if (v86)
    -[ORCHSchemaORCHClientEvent deletePowerContextPolicyReported](self, "deletePowerContextPolicyReported");
  -[ORCHSchemaORCHClientEvent executeOnRemoteRequestContext](self, "executeOnRemoteRequestContext");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "applySensitiveConditionsPolicy:", v4);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "suppressMessage");

  if (v89)
    -[ORCHSchemaORCHClientEvent deleteExecuteOnRemoteRequestContext](self, "deleteExecuteOnRemoteRequestContext");
  -[ORCHSchemaORCHClientEvent assistantdLaunchMetadataReported](self, "assistantdLaunchMetadataReported");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "applySensitiveConditionsPolicy:", v4);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "suppressMessage");

  if (v92)
    -[ORCHSchemaORCHClientEvent deleteAssistantdLaunchMetadataReported](self, "deleteAssistantdLaunchMetadataReported");
  -[ORCHSchemaORCHClientEvent intelligenceFlowQuerySent](self, "intelligenceFlowQuerySent");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "applySensitiveConditionsPolicy:", v4);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "suppressMessage");

  if (v95)
    -[ORCHSchemaORCHClientEvent deleteIntelligenceFlowQuerySent](self, "deleteIntelligenceFlowQuerySent");
  -[ORCHSchemaORCHClientEvent subRequestContext](self, "subRequestContext");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "applySensitiveConditionsPolicy:", v4);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "suppressMessage");

  if (v98)
    -[ORCHSchemaORCHClientEvent deleteSubRequestContext](self, "deleteSubRequestContext");
  -[ORCHSchemaORCHClientEvent routerRewrittenUtterance](self, "routerRewrittenUtterance");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "applySensitiveConditionsPolicy:", v4);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "suppressMessage");

  if (v101)
    -[ORCHSchemaORCHClientEvent deleteRouterRewrittenUtterance](self, "deleteRouterRewrittenUtterance");
  -[ORCHSchemaORCHClientEvent nlRouterBridgeContext](self, "nlRouterBridgeContext");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "applySensitiveConditionsPolicy:", v4);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "suppressMessage");

  if (v104)
    -[ORCHSchemaORCHClientEvent deleteNlRouterBridgeContext](self, "deleteNlRouterBridgeContext");
  -[ORCHSchemaORCHClientEvent shimToolContext](self, "shimToolContext");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "applySensitiveConditionsPolicy:", v4);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "suppressMessage");

  if (v107)
    -[ORCHSchemaORCHClientEvent deleteShimToolContext](self, "deleteShimToolContext");
  -[ORCHSchemaORCHClientEvent subRequestFallback](self, "subRequestFallback");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "applySensitiveConditionsPolicy:", v4);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "suppressMessage");

  if (v110)
    -[ORCHSchemaORCHClientEvent deleteSubRequestFallback](self, "deleteSubRequestFallback");
  -[ORCHSchemaORCHClientEvent nlRouterBridgeSubComponentContext](self, "nlRouterBridgeSubComponentContext");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "applySensitiveConditionsPolicy:", v4);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v112, "suppressMessage");

  if (v113)
    -[ORCHSchemaORCHClientEvent deleteNlRouterBridgeSubComponentContext](self, "deleteNlRouterBridgeSubComponentContext");
  -[ORCHSchemaORCHClientEvent unsupportedLanguageDetected](self, "unsupportedLanguageDetected");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "applySensitiveConditionsPolicy:", v4);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "suppressMessage");

  if (v116)
    -[ORCHSchemaORCHClientEvent deleteUnsupportedLanguageDetected](self, "deleteUnsupportedLanguageDetected");
  v117 = v5;

  return v117;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[ORCHSchemaORCHClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 0x22)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562A428[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0x22)
    return 0;
  else
    return off_1E562A540[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[ORCHSchemaORCHClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 0x22)
    return CFSTR("com.apple.aiml.siri.orch.ORCHClientEvent");
  else
    return off_1E56324E8[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[ORCHSchemaORCHClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (BOOL)hasResourceUtilizationMetadata
{
  return self->_resourceUtilizationMetadata != 0;
}

- (void)deleteResourceUtilizationMetadata
{
  -[ORCHSchemaORCHClientEvent setResourceUtilizationMetadata:](self, "setResourceUtilizationMetadata:", 0);
}

- (void)setRequestContext:(id)a3
{
  ORCHSchemaORCHRequestContext *v4;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHRequestContext *requestContext;

  v4 = (ORCHSchemaORCHRequestContext *)a3;
  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 101;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  requestContext = self->_requestContext;
  self->_requestContext = v4;

}

- (ORCHSchemaORCHRequestContext)requestContext
{
  if (self->_whichEvent_Type == 101)
    return self->_requestContext;
  else
    return (ORCHSchemaORCHRequestContext *)0;
}

- (void)deleteRequestContext
{
  ORCHSchemaORCHRequestContext *requestContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    requestContext = self->_requestContext;
    self->_requestContext = 0;

  }
}

- (void)setAsrBridgeContext:(id)a3
{
  ORCHSchemaORCHASRBridgeContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;

  v4 = (ORCHSchemaORCHASRBridgeContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 102;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = v4;

}

- (ORCHSchemaORCHASRBridgeContext)asrBridgeContext
{
  if (self->_whichEvent_Type == 102)
    return self->_asrBridgeContext;
  else
    return (ORCHSchemaORCHASRBridgeContext *)0;
}

- (void)deleteAsrBridgeContext
{
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    asrBridgeContext = self->_asrBridgeContext;
    self->_asrBridgeContext = 0;

  }
}

- (void)setCdmBridgeContext:(id)a3
{
  ORCHSchemaORCHCDMBridgeContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;

  v4 = (ORCHSchemaORCHCDMBridgeContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 103;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = v4;

}

- (ORCHSchemaORCHCDMBridgeContext)cdmBridgeContext
{
  if (self->_whichEvent_Type == 103)
    return self->_cdmBridgeContext;
  else
    return (ORCHSchemaORCHCDMBridgeContext *)0;
}

- (void)deleteCdmBridgeContext
{
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    cdmBridgeContext = self->_cdmBridgeContext;
    self->_cdmBridgeContext = 0;

  }
}

- (void)setExecutionBridgeContext:(id)a3
{
  ORCHSchemaORCHExecutionBridgeContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;

  v4 = (ORCHSchemaORCHExecutionBridgeContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 104;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = v4;

}

- (ORCHSchemaORCHExecutionBridgeContext)executionBridgeContext
{
  if (self->_whichEvent_Type == 104)
    return self->_executionBridgeContext;
  else
    return (ORCHSchemaORCHExecutionBridgeContext *)0;
}

- (void)deleteExecutionBridgeContext
{
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    executionBridgeContext = self->_executionBridgeContext;
    self->_executionBridgeContext = 0;

  }
}

- (void)setServerFallbackContext:(id)a3
{
  ORCHSchemaORCHServerFallbackContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;

  v4 = (ORCHSchemaORCHServerFallbackContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 105;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = v4;

}

- (ORCHSchemaORCHServerFallbackContext)serverFallbackContext
{
  if (self->_whichEvent_Type == 105)
    return self->_serverFallbackContext;
  else
    return (ORCHSchemaORCHServerFallbackContext *)0;
}

- (void)deleteServerFallbackContext
{
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    serverFallbackContext = self->_serverFallbackContext;
    self->_serverFallbackContext = 0;

  }
}

- (void)setFlowOutputSubmitted:(id)a3
{
  ORCHSchemaORCHFlowOutputSubmitted *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;

  v4 = (ORCHSchemaORCHFlowOutputSubmitted *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 106;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = v4;

}

- (ORCHSchemaORCHFlowOutputSubmitted)flowOutputSubmitted
{
  if (self->_whichEvent_Type == 106)
    return self->_flowOutputSubmitted;
  else
    return (ORCHSchemaORCHFlowOutputSubmitted *)0;
}

- (void)deleteFlowOutputSubmitted
{
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    flowOutputSubmitted = self->_flowOutputSubmitted;
    self->_flowOutputSubmitted = 0;

  }
}

- (void)setResultCandidate:(id)a3
{
  ORCHSchemaORCHResultCandidateReceived *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;

  v4 = (ORCHSchemaORCHResultCandidateReceived *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 107;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = v4;

}

- (ORCHSchemaORCHResultCandidateReceived)resultCandidate
{
  if (self->_whichEvent_Type == 107)
    return self->_resultCandidate;
  else
    return (ORCHSchemaORCHResultCandidateReceived *)0;
}

- (void)deleteResultCandidate
{
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    resultCandidate = self->_resultCandidate;
    self->_resultCandidate = 0;

  }
}

- (void)setResultSelected:(id)a3
{
  ORCHSchemaORCHResultSelected *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHResultSelected *resultSelected;

  v4 = (ORCHSchemaORCHResultSelected *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 108;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  resultSelected = self->_resultSelected;
  self->_resultSelected = v4;

}

- (ORCHSchemaORCHResultSelected)resultSelected
{
  if (self->_whichEvent_Type == 108)
    return self->_resultSelected;
  else
    return (ORCHSchemaORCHResultSelected *)0;
}

- (void)deleteResultSelected
{
  ORCHSchemaORCHResultSelected *resultSelected;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    resultSelected = self->_resultSelected;
    self->_resultSelected = 0;

  }
}

- (void)setContextSubmissionMessage:(id)a3
{
  ORCHSchemaORCHConversationContextSubmitted *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;

  v4 = (ORCHSchemaORCHConversationContextSubmitted *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 109;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = v4;

}

- (ORCHSchemaORCHConversationContextSubmitted)contextSubmissionMessage
{
  if (self->_whichEvent_Type == 109)
    return self->_contextSubmissionMessage;
  else
    return (ORCHSchemaORCHConversationContextSubmitted *)0;
}

- (void)deleteContextSubmissionMessage
{
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    contextSubmissionMessage = self->_contextSubmissionMessage;
    self->_contextSubmissionMessage = 0;

  }
}

- (void)setAvailableAssets:(id)a3
{
  ORCHSchemaORCHAssetsReported *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHAssetsReported *availableAssets;

  v4 = (ORCHSchemaORCHAssetsReported *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 110;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  availableAssets = self->_availableAssets;
  self->_availableAssets = v4;

}

- (ORCHSchemaORCHAssetsReported)availableAssets
{
  if (self->_whichEvent_Type == 110)
    return self->_availableAssets;
  else
    return (ORCHSchemaORCHAssetsReported *)0;
}

- (void)deleteAvailableAssets
{
  ORCHSchemaORCHAssetsReported *availableAssets;

  if (self->_whichEvent_Type == 110)
  {
    self->_whichEvent_Type = 0;
    availableAssets = self->_availableAssets;
    self->_availableAssets = 0;

  }
}

- (void)setOrchDeviceDynamicContext:(id)a3
{
  ORCHSchemaORCHDeviceDynamicContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;

  v4 = (ORCHSchemaORCHDeviceDynamicContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 111;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = v4;

}

- (ORCHSchemaORCHDeviceDynamicContext)orchDeviceDynamicContext
{
  if (self->_whichEvent_Type == 111)
    return self->_orchDeviceDynamicContext;
  else
    return (ORCHSchemaORCHDeviceDynamicContext *)0;
}

- (void)deleteOrchDeviceDynamicContext
{
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;

  if (self->_whichEvent_Type == 111)
  {
    self->_whichEvent_Type = 0;
    orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
    self->_orchDeviceDynamicContext = 0;

  }
}

- (void)setPommesBridgeContext:(id)a3
{
  ORCHSchemaORCHPommesBridgeContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;

  v4 = (ORCHSchemaORCHPommesBridgeContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 112;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = v4;

}

- (ORCHSchemaORCHPommesBridgeContext)pommesBridgeContext
{
  if (self->_whichEvent_Type == 112)
    return self->_pommesBridgeContext;
  else
    return (ORCHSchemaORCHPommesBridgeContext *)0;
}

- (void)deletePommesBridgeContext
{
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;

  if (self->_whichEvent_Type == 112)
  {
    self->_whichEvent_Type = 0;
    pommesBridgeContext = self->_pommesBridgeContext;
    self->_pommesBridgeContext = 0;

  }
}

- (void)setMuxBridgeContext:(id)a3
{
  ORCHSchemaORCHMUXBridgeContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;

  v4 = (ORCHSchemaORCHMUXBridgeContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 113;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = v4;

}

- (ORCHSchemaORCHMUXBridgeContext)muxBridgeContext
{
  if (self->_whichEvent_Type == 113)
    return self->_muxBridgeContext;
  else
    return (ORCHSchemaORCHMUXBridgeContext *)0;
}

- (void)deleteMuxBridgeContext
{
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;

  if (self->_whichEvent_Type == 113)
  {
    self->_whichEvent_Type = 0;
    muxBridgeContext = self->_muxBridgeContext;
    self->_muxBridgeContext = 0;

  }
}

- (void)setMultiUserResultCandidate:(id)a3
{
  ORCHSchemaORCHMultiUserResultCandidateReceived *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;

  v4 = (ORCHSchemaORCHMultiUserResultCandidateReceived *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 114;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = v4;

}

- (ORCHSchemaORCHMultiUserResultCandidateReceived)multiUserResultCandidate
{
  if (self->_whichEvent_Type == 114)
    return self->_multiUserResultCandidate;
  else
    return (ORCHSchemaORCHMultiUserResultCandidateReceived *)0;
}

- (void)deleteMultiUserResultCandidate
{
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;

  if (self->_whichEvent_Type == 114)
  {
    self->_whichEvent_Type = 0;
    multiUserResultCandidate = self->_multiUserResultCandidate;
    self->_multiUserResultCandidate = 0;

  }
}

- (void)setMultiUserResultSelected:(id)a3
{
  ORCHSchemaORCHMultiUserResultCandidateSelected *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;

  v4 = (ORCHSchemaORCHMultiUserResultCandidateSelected *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 115;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = v4;

}

- (ORCHSchemaORCHMultiUserResultCandidateSelected)multiUserResultSelected
{
  if (self->_whichEvent_Type == 115)
    return self->_multiUserResultSelected;
  else
    return (ORCHSchemaORCHMultiUserResultCandidateSelected *)0;
}

- (void)deleteMultiUserResultSelected
{
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;

  if (self->_whichEvent_Type == 115)
  {
    self->_whichEvent_Type = 0;
    multiUserResultSelected = self->_multiUserResultSelected;
    self->_multiUserResultSelected = 0;

  }
}

- (void)setAceCommandContext:(id)a3
{
  ORCHSchemaORCHAceCommandContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;

  v4 = (ORCHSchemaORCHAceCommandContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 116;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = v4;

}

- (ORCHSchemaORCHAceCommandContext)aceCommandContext
{
  if (self->_whichEvent_Type == 116)
    return self->_aceCommandContext;
  else
    return (ORCHSchemaORCHAceCommandContext *)0;
}

- (void)deleteAceCommandContext
{
  ORCHSchemaORCHAceCommandContext *aceCommandContext;

  if (self->_whichEvent_Type == 116)
  {
    self->_whichEvent_Type = 0;
    aceCommandContext = self->_aceCommandContext;
    self->_aceCommandContext = 0;

  }
}

- (void)setTrpFinalized:(id)a3
{
  ORCHSchemaORCHTRPFinalized *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHTRPFinalized *trpFinalized;

  v4 = (ORCHSchemaORCHTRPFinalized *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 117;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = v4;

}

- (ORCHSchemaORCHTRPFinalized)trpFinalized
{
  if (self->_whichEvent_Type == 117)
    return self->_trpFinalized;
  else
    return (ORCHSchemaORCHTRPFinalized *)0;
}

- (void)deleteTrpFinalized
{
  ORCHSchemaORCHTRPFinalized *trpFinalized;

  if (self->_whichEvent_Type == 117)
  {
    self->_whichEvent_Type = 0;
    trpFinalized = self->_trpFinalized;
    self->_trpFinalized = 0;

  }
}

- (void)setRequestMitigated:(id)a3
{
  ORCHSchemaORCHRequestMitigated *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHRequestMitigated *requestMitigated;

  v4 = (ORCHSchemaORCHRequestMitigated *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 118;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = v4;

}

- (ORCHSchemaORCHRequestMitigated)requestMitigated
{
  if (self->_whichEvent_Type == 118)
    return self->_requestMitigated;
  else
    return (ORCHSchemaORCHRequestMitigated *)0;
}

- (void)deleteRequestMitigated
{
  ORCHSchemaORCHRequestMitigated *requestMitigated;

  if (self->_whichEvent_Type == 118)
  {
    self->_whichEvent_Type = 0;
    requestMitigated = self->_requestMitigated;
    self->_requestMitigated = 0;

  }
}

- (void)setNlv3ServerFallbackDeprecated:(id)a3
{
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;

  v4 = (ORCHSchemaORCHNLV3ServerFallbackDeprecated *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 119;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = v4;

}

- (ORCHSchemaORCHNLV3ServerFallbackDeprecated)nlv3ServerFallbackDeprecated
{
  if (self->_whichEvent_Type == 119)
    return self->_nlv3ServerFallbackDeprecated;
  else
    return (ORCHSchemaORCHNLV3ServerFallbackDeprecated *)0;
}

- (void)deleteNlv3ServerFallbackDeprecated
{
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;

  if (self->_whichEvent_Type == 119)
  {
    self->_whichEvent_Type = 0;
    nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
    self->_nlv3ServerFallbackDeprecated = 0;

  }
}

- (void)setUiActivationContext:(id)a3
{
  ORCHSchemaORCHUIActivationContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;

  v4 = (ORCHSchemaORCHUIActivationContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 120;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = v4;

}

- (ORCHSchemaORCHUIActivationContext)uiActivationContext
{
  if (self->_whichEvent_Type == 120)
    return self->_uiActivationContext;
  else
    return (ORCHSchemaORCHUIActivationContext *)0;
}

- (void)deleteUiActivationContext
{
  ORCHSchemaORCHUIActivationContext *uiActivationContext;

  if (self->_whichEvent_Type == 120)
  {
    self->_whichEvent_Type = 0;
    uiActivationContext = self->_uiActivationContext;
    self->_uiActivationContext = 0;

  }
}

- (void)setTrpCandidateReceived:(id)a3
{
  ORCHSchemaORCHTRPCandidateReceived *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;

  v4 = (ORCHSchemaORCHTRPCandidateReceived *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 121;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = v4;

}

- (ORCHSchemaORCHTRPCandidateReceived)trpCandidateReceived
{
  if (self->_whichEvent_Type == 121)
    return self->_trpCandidateReceived;
  else
    return (ORCHSchemaORCHTRPCandidateReceived *)0;
}

- (void)deleteTrpCandidateReceived
{
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;

  if (self->_whichEvent_Type == 121)
  {
    self->_whichEvent_Type = 0;
    trpCandidateReceived = self->_trpCandidateReceived;
    self->_trpCandidateReceived = 0;

  }
}

- (void)setIdentityBridgeRequestContext:(id)a3
{
  ORCHSchemaORCHIdentityBridgeRequestContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;

  v4 = (ORCHSchemaORCHIdentityBridgeRequestContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 122;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = v4;

}

- (ORCHSchemaORCHIdentityBridgeRequestContext)identityBridgeRequestContext
{
  if (self->_whichEvent_Type == 122)
    return self->_identityBridgeRequestContext;
  else
    return (ORCHSchemaORCHIdentityBridgeRequestContext *)0;
}

- (void)deleteIdentityBridgeRequestContext
{
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;

  if (self->_whichEvent_Type == 122)
  {
    self->_whichEvent_Type = 0;
    identityBridgeRequestContext = self->_identityBridgeRequestContext;
    self->_identityBridgeRequestContext = 0;

  }
}

- (void)setAssetSetsReported:(id)a3
{
  ORCHSchemaORCHAssetSetsReported *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;

  v4 = (ORCHSchemaORCHAssetSetsReported *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 123;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = v4;

}

- (ORCHSchemaORCHAssetSetsReported)assetSetsReported
{
  if (self->_whichEvent_Type == 123)
    return self->_assetSetsReported;
  else
    return (ORCHSchemaORCHAssetSetsReported *)0;
}

- (void)deleteAssetSetsReported
{
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;

  if (self->_whichEvent_Type == 123)
  {
    self->_whichEvent_Type = 0;
    assetSetsReported = self->_assetSetsReported;
    self->_assetSetsReported = 0;

  }
}

- (void)setCandidateRequestContext:(id)a3
{
  ORCHSchemaORCHCandidateRequestContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;

  v4 = (ORCHSchemaORCHCandidateRequestContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 124;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = v4;

}

- (ORCHSchemaORCHCandidateRequestContext)candidateRequestContext
{
  if (self->_whichEvent_Type == 124)
    return self->_candidateRequestContext;
  else
    return (ORCHSchemaORCHCandidateRequestContext *)0;
}

- (void)deleteCandidateRequestContext
{
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;

  if (self->_whichEvent_Type == 124)
  {
    self->_whichEvent_Type = 0;
    candidateRequestContext = self->_candidateRequestContext;
    self->_candidateRequestContext = 0;

  }
}

- (void)setPowerContextPolicyReported:(id)a3
{
  ORCHSchemaORCHPowerContextPolicyReported *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;

  v4 = (ORCHSchemaORCHPowerContextPolicyReported *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 125;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = v4;

}

- (ORCHSchemaORCHPowerContextPolicyReported)powerContextPolicyReported
{
  if (self->_whichEvent_Type == 125)
    return self->_powerContextPolicyReported;
  else
    return (ORCHSchemaORCHPowerContextPolicyReported *)0;
}

- (void)deletePowerContextPolicyReported
{
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;

  if (self->_whichEvent_Type == 125)
  {
    self->_whichEvent_Type = 0;
    powerContextPolicyReported = self->_powerContextPolicyReported;
    self->_powerContextPolicyReported = 0;

  }
}

- (void)setExecuteOnRemoteRequestContext:(id)a3
{
  ORCHSchemaORCHExecuteOnRemoteRequestContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;

  v4 = (ORCHSchemaORCHExecuteOnRemoteRequestContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 126;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = v4;

}

- (ORCHSchemaORCHExecuteOnRemoteRequestContext)executeOnRemoteRequestContext
{
  if (self->_whichEvent_Type == 126)
    return self->_executeOnRemoteRequestContext;
  else
    return (ORCHSchemaORCHExecuteOnRemoteRequestContext *)0;
}

- (void)deleteExecuteOnRemoteRequestContext
{
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;

  if (self->_whichEvent_Type == 126)
  {
    self->_whichEvent_Type = 0;
    executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
    self->_executeOnRemoteRequestContext = 0;

  }
}

- (void)setAssistantdLaunchMetadataReported:(id)a3
{
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;

  v4 = (ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 127;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = v4;

}

- (ORCHSchemaORCHAssistantDaemonLaunchMetadataReported)assistantdLaunchMetadataReported
{
  if (self->_whichEvent_Type == 127)
    return self->_assistantdLaunchMetadataReported;
  else
    return (ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *)0;
}

- (void)deleteAssistantdLaunchMetadataReported
{
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;

  if (self->_whichEvent_Type == 127)
  {
    self->_whichEvent_Type = 0;
    assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
    self->_assistantdLaunchMetadataReported = 0;

  }
}

- (void)setIntelligenceFlowQuerySent:(id)a3
{
  ORCHSchemaORCHIntelligenceFlowQuerySent *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;

  v4 = (ORCHSchemaORCHIntelligenceFlowQuerySent *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  self->_whichEvent_Type = (unint64_t)(v4 != 0) << 7;
  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = v4;

}

- (ORCHSchemaORCHIntelligenceFlowQuerySent)intelligenceFlowQuerySent
{
  if (self->_whichEvent_Type == 128)
    return self->_intelligenceFlowQuerySent;
  else
    return (ORCHSchemaORCHIntelligenceFlowQuerySent *)0;
}

- (void)deleteIntelligenceFlowQuerySent
{
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;

  if (self->_whichEvent_Type == 128)
  {
    self->_whichEvent_Type = 0;
    intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
    self->_intelligenceFlowQuerySent = 0;

  }
}

- (void)setSubRequestContext:(id)a3
{
  ORCHSchemaORCHSubRequestContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHSubRequestContext *subRequestContext;

  v4 = (ORCHSchemaORCHSubRequestContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 129;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = v4;

}

- (ORCHSchemaORCHSubRequestContext)subRequestContext
{
  if (self->_whichEvent_Type == 129)
    return self->_subRequestContext;
  else
    return (ORCHSchemaORCHSubRequestContext *)0;
}

- (void)deleteSubRequestContext
{
  ORCHSchemaORCHSubRequestContext *subRequestContext;

  if (self->_whichEvent_Type == 129)
  {
    self->_whichEvent_Type = 0;
    subRequestContext = self->_subRequestContext;
    self->_subRequestContext = 0;

  }
}

- (void)setRouterRewrittenUtterance:(id)a3
{
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;

  v4 = (ORCHSchemaNLRouterRewrittenUtteranceTier1 *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 130;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = v4;

}

- (ORCHSchemaNLRouterRewrittenUtteranceTier1)routerRewrittenUtterance
{
  if (self->_whichEvent_Type == 130)
    return self->_routerRewrittenUtterance;
  else
    return (ORCHSchemaNLRouterRewrittenUtteranceTier1 *)0;
}

- (void)deleteRouterRewrittenUtterance
{
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;

  if (self->_whichEvent_Type == 130)
  {
    self->_whichEvent_Type = 0;
    routerRewrittenUtterance = self->_routerRewrittenUtterance;
    self->_routerRewrittenUtterance = 0;

  }
}

- (void)setNlRouterBridgeContext:(id)a3
{
  ORCHSchemaORCHNLRouterBridgeContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;

  v4 = (ORCHSchemaORCHNLRouterBridgeContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 131;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = v4;

}

- (ORCHSchemaORCHNLRouterBridgeContext)nlRouterBridgeContext
{
  if (self->_whichEvent_Type == 131)
    return self->_nlRouterBridgeContext;
  else
    return (ORCHSchemaORCHNLRouterBridgeContext *)0;
}

- (void)deleteNlRouterBridgeContext
{
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;

  if (self->_whichEvent_Type == 131)
  {
    self->_whichEvent_Type = 0;
    nlRouterBridgeContext = self->_nlRouterBridgeContext;
    self->_nlRouterBridgeContext = 0;

  }
}

- (void)setShimToolContext:(id)a3
{
  ORCHSchemaORCHShimToolContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHShimToolContext *shimToolContext;

  v4 = (ORCHSchemaORCHShimToolContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 132;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = v4;

}

- (ORCHSchemaORCHShimToolContext)shimToolContext
{
  if (self->_whichEvent_Type == 132)
    return self->_shimToolContext;
  else
    return (ORCHSchemaORCHShimToolContext *)0;
}

- (void)deleteShimToolContext
{
  ORCHSchemaORCHShimToolContext *shimToolContext;

  if (self->_whichEvent_Type == 132)
  {
    self->_whichEvent_Type = 0;
    shimToolContext = self->_shimToolContext;
    self->_shimToolContext = 0;

  }
}

- (void)setSubRequestFallback:(id)a3
{
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;

  v4 = (ORCHSchemaORCHIntelligenceFlowSubRequestFallback *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 133;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = v4;

}

- (ORCHSchemaORCHIntelligenceFlowSubRequestFallback)subRequestFallback
{
  if (self->_whichEvent_Type == 133)
    return self->_subRequestFallback;
  else
    return (ORCHSchemaORCHIntelligenceFlowSubRequestFallback *)0;
}

- (void)deleteSubRequestFallback
{
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;

  if (self->_whichEvent_Type == 133)
  {
    self->_whichEvent_Type = 0;
    subRequestFallback = self->_subRequestFallback;
    self->_subRequestFallback = 0;

  }
}

- (void)setNlRouterBridgeSubComponentContext:(id)a3
{
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;
  unint64_t v39;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;

  v4 = (ORCHSchemaORCHNLRouterBridgeSubComponentContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = 0;

  v39 = 134;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = v4;

}

- (ORCHSchemaORCHNLRouterBridgeSubComponentContext)nlRouterBridgeSubComponentContext
{
  if (self->_whichEvent_Type == 134)
    return self->_nlRouterBridgeSubComponentContext;
  else
    return (ORCHSchemaORCHNLRouterBridgeSubComponentContext *)0;
}

- (void)deleteNlRouterBridgeSubComponentContext
{
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;

  if (self->_whichEvent_Type == 134)
  {
    self->_whichEvent_Type = 0;
    nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
    self->_nlRouterBridgeSubComponentContext = 0;

  }
}

- (void)setUnsupportedLanguageDetected:(id)a3
{
  ORCHSchemaORCHUnsupportedLanguageDetected *v4;
  ORCHSchemaORCHRequestContext *requestContext;
  ORCHSchemaORCHASRBridgeContext *asrBridgeContext;
  ORCHSchemaORCHCDMBridgeContext *cdmBridgeContext;
  ORCHSchemaORCHExecutionBridgeContext *executionBridgeContext;
  ORCHSchemaORCHServerFallbackContext *serverFallbackContext;
  ORCHSchemaORCHFlowOutputSubmitted *flowOutputSubmitted;
  ORCHSchemaORCHResultCandidateReceived *resultCandidate;
  ORCHSchemaORCHResultSelected *resultSelected;
  ORCHSchemaORCHConversationContextSubmitted *contextSubmissionMessage;
  ORCHSchemaORCHAssetsReported *availableAssets;
  ORCHSchemaORCHDeviceDynamicContext *orchDeviceDynamicContext;
  ORCHSchemaORCHPommesBridgeContext *pommesBridgeContext;
  ORCHSchemaORCHMUXBridgeContext *muxBridgeContext;
  ORCHSchemaORCHMultiUserResultCandidateReceived *multiUserResultCandidate;
  ORCHSchemaORCHMultiUserResultCandidateSelected *multiUserResultSelected;
  ORCHSchemaORCHAceCommandContext *aceCommandContext;
  ORCHSchemaORCHTRPFinalized *trpFinalized;
  ORCHSchemaORCHRequestMitigated *requestMitigated;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *nlv3ServerFallbackDeprecated;
  ORCHSchemaORCHUIActivationContext *uiActivationContext;
  ORCHSchemaORCHTRPCandidateReceived *trpCandidateReceived;
  ORCHSchemaORCHIdentityBridgeRequestContext *identityBridgeRequestContext;
  ORCHSchemaORCHAssetSetsReported *assetSetsReported;
  ORCHSchemaORCHCandidateRequestContext *candidateRequestContext;
  ORCHSchemaORCHPowerContextPolicyReported *powerContextPolicyReported;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *executeOnRemoteRequestContext;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *assistantdLaunchMetadataReported;
  ORCHSchemaORCHIntelligenceFlowQuerySent *intelligenceFlowQuerySent;
  ORCHSchemaORCHSubRequestContext *subRequestContext;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *routerRewrittenUtterance;
  ORCHSchemaORCHNLRouterBridgeContext *nlRouterBridgeContext;
  ORCHSchemaORCHShimToolContext *shimToolContext;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *subRequestFallback;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *nlRouterBridgeSubComponentContext;
  unint64_t v39;
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;

  v4 = (ORCHSchemaORCHUnsupportedLanguageDetected *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  asrBridgeContext = self->_asrBridgeContext;
  self->_asrBridgeContext = 0;

  cdmBridgeContext = self->_cdmBridgeContext;
  self->_cdmBridgeContext = 0;

  executionBridgeContext = self->_executionBridgeContext;
  self->_executionBridgeContext = 0;

  serverFallbackContext = self->_serverFallbackContext;
  self->_serverFallbackContext = 0;

  flowOutputSubmitted = self->_flowOutputSubmitted;
  self->_flowOutputSubmitted = 0;

  resultCandidate = self->_resultCandidate;
  self->_resultCandidate = 0;

  resultSelected = self->_resultSelected;
  self->_resultSelected = 0;

  contextSubmissionMessage = self->_contextSubmissionMessage;
  self->_contextSubmissionMessage = 0;

  availableAssets = self->_availableAssets;
  self->_availableAssets = 0;

  orchDeviceDynamicContext = self->_orchDeviceDynamicContext;
  self->_orchDeviceDynamicContext = 0;

  pommesBridgeContext = self->_pommesBridgeContext;
  self->_pommesBridgeContext = 0;

  muxBridgeContext = self->_muxBridgeContext;
  self->_muxBridgeContext = 0;

  multiUserResultCandidate = self->_multiUserResultCandidate;
  self->_multiUserResultCandidate = 0;

  multiUserResultSelected = self->_multiUserResultSelected;
  self->_multiUserResultSelected = 0;

  aceCommandContext = self->_aceCommandContext;
  self->_aceCommandContext = 0;

  trpFinalized = self->_trpFinalized;
  self->_trpFinalized = 0;

  requestMitigated = self->_requestMitigated;
  self->_requestMitigated = 0;

  nlv3ServerFallbackDeprecated = self->_nlv3ServerFallbackDeprecated;
  self->_nlv3ServerFallbackDeprecated = 0;

  uiActivationContext = self->_uiActivationContext;
  self->_uiActivationContext = 0;

  trpCandidateReceived = self->_trpCandidateReceived;
  self->_trpCandidateReceived = 0;

  identityBridgeRequestContext = self->_identityBridgeRequestContext;
  self->_identityBridgeRequestContext = 0;

  assetSetsReported = self->_assetSetsReported;
  self->_assetSetsReported = 0;

  candidateRequestContext = self->_candidateRequestContext;
  self->_candidateRequestContext = 0;

  powerContextPolicyReported = self->_powerContextPolicyReported;
  self->_powerContextPolicyReported = 0;

  executeOnRemoteRequestContext = self->_executeOnRemoteRequestContext;
  self->_executeOnRemoteRequestContext = 0;

  assistantdLaunchMetadataReported = self->_assistantdLaunchMetadataReported;
  self->_assistantdLaunchMetadataReported = 0;

  intelligenceFlowQuerySent = self->_intelligenceFlowQuerySent;
  self->_intelligenceFlowQuerySent = 0;

  subRequestContext = self->_subRequestContext;
  self->_subRequestContext = 0;

  routerRewrittenUtterance = self->_routerRewrittenUtterance;
  self->_routerRewrittenUtterance = 0;

  nlRouterBridgeContext = self->_nlRouterBridgeContext;
  self->_nlRouterBridgeContext = 0;

  shimToolContext = self->_shimToolContext;
  self->_shimToolContext = 0;

  subRequestFallback = self->_subRequestFallback;
  self->_subRequestFallback = 0;

  nlRouterBridgeSubComponentContext = self->_nlRouterBridgeSubComponentContext;
  self->_nlRouterBridgeSubComponentContext = 0;

  v39 = 135;
  if (!v4)
    v39 = 0;
  self->_whichEvent_Type = v39;
  unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
  self->_unsupportedLanguageDetected = v4;

}

- (ORCHSchemaORCHUnsupportedLanguageDetected)unsupportedLanguageDetected
{
  if (self->_whichEvent_Type == 135)
    return self->_unsupportedLanguageDetected;
  else
    return (ORCHSchemaORCHUnsupportedLanguageDetected *)0;
}

- (void)deleteUnsupportedLanguageDetected
{
  ORCHSchemaORCHUnsupportedLanguageDetected *unsupportedLanguageDetected;

  if (self->_whichEvent_Type == 135)
  {
    self->_whichEvent_Type = 0;
    unsupportedLanguageDetected = self->_unsupportedLanguageDetected;
    self->_unsupportedLanguageDetected = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHClientEventReadFrom(self, (uint64_t)a3);
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
  id v78;

  v78 = a3;
  -[ORCHSchemaORCHClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ORCHSchemaORCHClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent resourceUtilizationMetadata](self, "resourceUtilizationMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ORCHSchemaORCHClientEvent resourceUtilizationMetadata](self, "resourceUtilizationMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent requestContext](self, "requestContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ORCHSchemaORCHClientEvent requestContext](self, "requestContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent asrBridgeContext](self, "asrBridgeContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ORCHSchemaORCHClientEvent asrBridgeContext](self, "asrBridgeContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent cdmBridgeContext](self, "cdmBridgeContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ORCHSchemaORCHClientEvent cdmBridgeContext](self, "cdmBridgeContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent executionBridgeContext](self, "executionBridgeContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ORCHSchemaORCHClientEvent executionBridgeContext](self, "executionBridgeContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent serverFallbackContext](self, "serverFallbackContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[ORCHSchemaORCHClientEvent serverFallbackContext](self, "serverFallbackContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent flowOutputSubmitted](self, "flowOutputSubmitted");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[ORCHSchemaORCHClientEvent flowOutputSubmitted](self, "flowOutputSubmitted");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent resultCandidate](self, "resultCandidate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[ORCHSchemaORCHClientEvent resultCandidate](self, "resultCandidate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent resultSelected](self, "resultSelected");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[ORCHSchemaORCHClientEvent resultSelected](self, "resultSelected");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent contextSubmissionMessage](self, "contextSubmissionMessage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[ORCHSchemaORCHClientEvent contextSubmissionMessage](self, "contextSubmissionMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent availableAssets](self, "availableAssets");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[ORCHSchemaORCHClientEvent availableAssets](self, "availableAssets");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent orchDeviceDynamicContext](self, "orchDeviceDynamicContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[ORCHSchemaORCHClientEvent orchDeviceDynamicContext](self, "orchDeviceDynamicContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent pommesBridgeContext](self, "pommesBridgeContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[ORCHSchemaORCHClientEvent pommesBridgeContext](self, "pommesBridgeContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent muxBridgeContext](self, "muxBridgeContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[ORCHSchemaORCHClientEvent muxBridgeContext](self, "muxBridgeContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent multiUserResultCandidate](self, "multiUserResultCandidate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[ORCHSchemaORCHClientEvent multiUserResultCandidate](self, "multiUserResultCandidate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent multiUserResultSelected](self, "multiUserResultSelected");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[ORCHSchemaORCHClientEvent multiUserResultSelected](self, "multiUserResultSelected");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent aceCommandContext](self, "aceCommandContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[ORCHSchemaORCHClientEvent aceCommandContext](self, "aceCommandContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent trpFinalized](self, "trpFinalized");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[ORCHSchemaORCHClientEvent trpFinalized](self, "trpFinalized");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent requestMitigated](self, "requestMitigated");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[ORCHSchemaORCHClientEvent requestMitigated](self, "requestMitigated");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent nlv3ServerFallbackDeprecated](self, "nlv3ServerFallbackDeprecated");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[ORCHSchemaORCHClientEvent nlv3ServerFallbackDeprecated](self, "nlv3ServerFallbackDeprecated");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent uiActivationContext](self, "uiActivationContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[ORCHSchemaORCHClientEvent uiActivationContext](self, "uiActivationContext");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent trpCandidateReceived](self, "trpCandidateReceived");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[ORCHSchemaORCHClientEvent trpCandidateReceived](self, "trpCandidateReceived");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent identityBridgeRequestContext](self, "identityBridgeRequestContext");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[ORCHSchemaORCHClientEvent identityBridgeRequestContext](self, "identityBridgeRequestContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent assetSetsReported](self, "assetSetsReported");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[ORCHSchemaORCHClientEvent assetSetsReported](self, "assetSetsReported");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent candidateRequestContext](self, "candidateRequestContext");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[ORCHSchemaORCHClientEvent candidateRequestContext](self, "candidateRequestContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent powerContextPolicyReported](self, "powerContextPolicyReported");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[ORCHSchemaORCHClientEvent powerContextPolicyReported](self, "powerContextPolicyReported");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent executeOnRemoteRequestContext](self, "executeOnRemoteRequestContext");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    -[ORCHSchemaORCHClientEvent executeOnRemoteRequestContext](self, "executeOnRemoteRequestContext");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent assistantdLaunchMetadataReported](self, "assistantdLaunchMetadataReported");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    -[ORCHSchemaORCHClientEvent assistantdLaunchMetadataReported](self, "assistantdLaunchMetadataReported");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent intelligenceFlowQuerySent](self, "intelligenceFlowQuerySent");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[ORCHSchemaORCHClientEvent intelligenceFlowQuerySent](self, "intelligenceFlowQuerySent");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent subRequestContext](self, "subRequestContext");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[ORCHSchemaORCHClientEvent subRequestContext](self, "subRequestContext");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent routerRewrittenUtterance](self, "routerRewrittenUtterance");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    -[ORCHSchemaORCHClientEvent routerRewrittenUtterance](self, "routerRewrittenUtterance");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent nlRouterBridgeContext](self, "nlRouterBridgeContext");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    -[ORCHSchemaORCHClientEvent nlRouterBridgeContext](self, "nlRouterBridgeContext");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent shimToolContext](self, "shimToolContext");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[ORCHSchemaORCHClientEvent shimToolContext](self, "shimToolContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent subRequestFallback](self, "subRequestFallback");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    -[ORCHSchemaORCHClientEvent subRequestFallback](self, "subRequestFallback");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent nlRouterBridgeSubComponentContext](self, "nlRouterBridgeSubComponentContext");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    -[ORCHSchemaORCHClientEvent nlRouterBridgeSubComponentContext](self, "nlRouterBridgeSubComponentContext");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHClientEvent unsupportedLanguageDetected](self, "unsupportedLanguageDetected");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    -[ORCHSchemaORCHClientEvent unsupportedLanguageDetected](self, "unsupportedLanguageDetected");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v192;
  BOOL v193;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_188;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_188;
  -[ORCHSchemaORCHClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ORCHSchemaORCHClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent resourceUtilizationMetadata](self, "resourceUtilizationMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceUtilizationMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent resourceUtilizationMetadata](self, "resourceUtilizationMetadata");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ORCHSchemaORCHClientEvent resourceUtilizationMetadata](self, "resourceUtilizationMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourceUtilizationMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent requestContext](self, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent requestContext](self, "requestContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[ORCHSchemaORCHClientEvent requestContext](self, "requestContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent asrBridgeContext](self, "asrBridgeContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asrBridgeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent asrBridgeContext](self, "asrBridgeContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[ORCHSchemaORCHClientEvent asrBridgeContext](self, "asrBridgeContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asrBridgeContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent cdmBridgeContext](self, "cdmBridgeContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmBridgeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent cdmBridgeContext](self, "cdmBridgeContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[ORCHSchemaORCHClientEvent cdmBridgeContext](self, "cdmBridgeContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmBridgeContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent executionBridgeContext](self, "executionBridgeContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executionBridgeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent executionBridgeContext](self, "executionBridgeContext");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[ORCHSchemaORCHClientEvent executionBridgeContext](self, "executionBridgeContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executionBridgeContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent serverFallbackContext](self, "serverFallbackContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverFallbackContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent serverFallbackContext](self, "serverFallbackContext");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[ORCHSchemaORCHClientEvent serverFallbackContext](self, "serverFallbackContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverFallbackContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent flowOutputSubmitted](self, "flowOutputSubmitted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowOutputSubmitted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent flowOutputSubmitted](self, "flowOutputSubmitted");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[ORCHSchemaORCHClientEvent flowOutputSubmitted](self, "flowOutputSubmitted");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowOutputSubmitted");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent resultCandidate](self, "resultCandidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultCandidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent resultCandidate](self, "resultCandidate");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[ORCHSchemaORCHClientEvent resultCandidate](self, "resultCandidate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultCandidate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent resultSelected](self, "resultSelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultSelected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent resultSelected](self, "resultSelected");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[ORCHSchemaORCHClientEvent resultSelected](self, "resultSelected");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultSelected");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent contextSubmissionMessage](self, "contextSubmissionMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextSubmissionMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent contextSubmissionMessage](self, "contextSubmissionMessage");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[ORCHSchemaORCHClientEvent contextSubmissionMessage](self, "contextSubmissionMessage");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextSubmissionMessage");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent availableAssets](self, "availableAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent availableAssets](self, "availableAssets");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[ORCHSchemaORCHClientEvent availableAssets](self, "availableAssets");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availableAssets");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent orchDeviceDynamicContext](self, "orchDeviceDynamicContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orchDeviceDynamicContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent orchDeviceDynamicContext](self, "orchDeviceDynamicContext");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[ORCHSchemaORCHClientEvent orchDeviceDynamicContext](self, "orchDeviceDynamicContext");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orchDeviceDynamicContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent pommesBridgeContext](self, "pommesBridgeContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pommesBridgeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent pommesBridgeContext](self, "pommesBridgeContext");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[ORCHSchemaORCHClientEvent pommesBridgeContext](self, "pommesBridgeContext");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pommesBridgeContext");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent muxBridgeContext](self, "muxBridgeContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "muxBridgeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent muxBridgeContext](self, "muxBridgeContext");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[ORCHSchemaORCHClientEvent muxBridgeContext](self, "muxBridgeContext");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "muxBridgeContext");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent multiUserResultCandidate](self, "multiUserResultCandidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiUserResultCandidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent multiUserResultCandidate](self, "multiUserResultCandidate");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[ORCHSchemaORCHClientEvent multiUserResultCandidate](self, "multiUserResultCandidate");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiUserResultCandidate");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent multiUserResultSelected](self, "multiUserResultSelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiUserResultSelected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent multiUserResultSelected](self, "multiUserResultSelected");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[ORCHSchemaORCHClientEvent multiUserResultSelected](self, "multiUserResultSelected");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiUserResultSelected");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent aceCommandContext](self, "aceCommandContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceCommandContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent aceCommandContext](self, "aceCommandContext");
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)v93;
    -[ORCHSchemaORCHClientEvent aceCommandContext](self, "aceCommandContext");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceCommandContext");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v95, "isEqual:", v96);

    if (!v97)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent trpFinalized](self, "trpFinalized");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpFinalized");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent trpFinalized](self, "trpFinalized");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    -[ORCHSchemaORCHClientEvent trpFinalized](self, "trpFinalized");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trpFinalized");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "isEqual:", v101);

    if (!v102)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent requestMitigated](self, "requestMitigated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestMitigated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent requestMitigated](self, "requestMitigated");
  v103 = objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    v104 = (void *)v103;
    -[ORCHSchemaORCHClientEvent requestMitigated](self, "requestMitigated");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestMitigated");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v105, "isEqual:", v106);

    if (!v107)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent nlv3ServerFallbackDeprecated](self, "nlv3ServerFallbackDeprecated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlv3ServerFallbackDeprecated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent nlv3ServerFallbackDeprecated](self, "nlv3ServerFallbackDeprecated");
  v108 = objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    v109 = (void *)v108;
    -[ORCHSchemaORCHClientEvent nlv3ServerFallbackDeprecated](self, "nlv3ServerFallbackDeprecated");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlv3ServerFallbackDeprecated");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v110, "isEqual:", v111);

    if (!v112)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent uiActivationContext](self, "uiActivationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiActivationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent uiActivationContext](self, "uiActivationContext");
  v113 = objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    v114 = (void *)v113;
    -[ORCHSchemaORCHClientEvent uiActivationContext](self, "uiActivationContext");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiActivationContext");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v115, "isEqual:", v116);

    if (!v117)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent trpCandidateReceived](self, "trpCandidateReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpCandidateReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent trpCandidateReceived](self, "trpCandidateReceived");
  v118 = objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = (void *)v118;
    -[ORCHSchemaORCHClientEvent trpCandidateReceived](self, "trpCandidateReceived");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trpCandidateReceived");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v120, "isEqual:", v121);

    if (!v122)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent identityBridgeRequestContext](self, "identityBridgeRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityBridgeRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent identityBridgeRequestContext](self, "identityBridgeRequestContext");
  v123 = objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    v124 = (void *)v123;
    -[ORCHSchemaORCHClientEvent identityBridgeRequestContext](self, "identityBridgeRequestContext");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identityBridgeRequestContext");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v125, "isEqual:", v126);

    if (!v127)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent assetSetsReported](self, "assetSetsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent assetSetsReported](self, "assetSetsReported");
  v128 = objc_claimAutoreleasedReturnValue();
  if (v128)
  {
    v129 = (void *)v128;
    -[ORCHSchemaORCHClientEvent assetSetsReported](self, "assetSetsReported");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSetsReported");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v130, "isEqual:", v131);

    if (!v132)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent candidateRequestContext](self, "candidateRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent candidateRequestContext](self, "candidateRequestContext");
  v133 = objc_claimAutoreleasedReturnValue();
  if (v133)
  {
    v134 = (void *)v133;
    -[ORCHSchemaORCHClientEvent candidateRequestContext](self, "candidateRequestContext");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidateRequestContext");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v135, "isEqual:", v136);

    if (!v137)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent powerContextPolicyReported](self, "powerContextPolicyReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "powerContextPolicyReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent powerContextPolicyReported](self, "powerContextPolicyReported");
  v138 = objc_claimAutoreleasedReturnValue();
  if (v138)
  {
    v139 = (void *)v138;
    -[ORCHSchemaORCHClientEvent powerContextPolicyReported](self, "powerContextPolicyReported");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "powerContextPolicyReported");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v140, "isEqual:", v141);

    if (!v142)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent executeOnRemoteRequestContext](self, "executeOnRemoteRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeOnRemoteRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent executeOnRemoteRequestContext](self, "executeOnRemoteRequestContext");
  v143 = objc_claimAutoreleasedReturnValue();
  if (v143)
  {
    v144 = (void *)v143;
    -[ORCHSchemaORCHClientEvent executeOnRemoteRequestContext](self, "executeOnRemoteRequestContext");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeOnRemoteRequestContext");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = objc_msgSend(v145, "isEqual:", v146);

    if (!v147)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent assistantdLaunchMetadataReported](self, "assistantdLaunchMetadataReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantdLaunchMetadataReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent assistantdLaunchMetadataReported](self, "assistantdLaunchMetadataReported");
  v148 = objc_claimAutoreleasedReturnValue();
  if (v148)
  {
    v149 = (void *)v148;
    -[ORCHSchemaORCHClientEvent assistantdLaunchMetadataReported](self, "assistantdLaunchMetadataReported");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantdLaunchMetadataReported");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = objc_msgSend(v150, "isEqual:", v151);

    if (!v152)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent intelligenceFlowQuerySent](self, "intelligenceFlowQuerySent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intelligenceFlowQuerySent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent intelligenceFlowQuerySent](self, "intelligenceFlowQuerySent");
  v153 = objc_claimAutoreleasedReturnValue();
  if (v153)
  {
    v154 = (void *)v153;
    -[ORCHSchemaORCHClientEvent intelligenceFlowQuerySent](self, "intelligenceFlowQuerySent");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intelligenceFlowQuerySent");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = objc_msgSend(v155, "isEqual:", v156);

    if (!v157)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent subRequestContext](self, "subRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent subRequestContext](self, "subRequestContext");
  v158 = objc_claimAutoreleasedReturnValue();
  if (v158)
  {
    v159 = (void *)v158;
    -[ORCHSchemaORCHClientEvent subRequestContext](self, "subRequestContext");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestContext");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = objc_msgSend(v160, "isEqual:", v161);

    if (!v162)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent routerRewrittenUtterance](self, "routerRewrittenUtterance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routerRewrittenUtterance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent routerRewrittenUtterance](self, "routerRewrittenUtterance");
  v163 = objc_claimAutoreleasedReturnValue();
  if (v163)
  {
    v164 = (void *)v163;
    -[ORCHSchemaORCHClientEvent routerRewrittenUtterance](self, "routerRewrittenUtterance");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "routerRewrittenUtterance");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = objc_msgSend(v165, "isEqual:", v166);

    if (!v167)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent nlRouterBridgeContext](self, "nlRouterBridgeContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlRouterBridgeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent nlRouterBridgeContext](self, "nlRouterBridgeContext");
  v168 = objc_claimAutoreleasedReturnValue();
  if (v168)
  {
    v169 = (void *)v168;
    -[ORCHSchemaORCHClientEvent nlRouterBridgeContext](self, "nlRouterBridgeContext");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlRouterBridgeContext");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = objc_msgSend(v170, "isEqual:", v171);

    if (!v172)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent shimToolContext](self, "shimToolContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shimToolContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent shimToolContext](self, "shimToolContext");
  v173 = objc_claimAutoreleasedReturnValue();
  if (v173)
  {
    v174 = (void *)v173;
    -[ORCHSchemaORCHClientEvent shimToolContext](self, "shimToolContext");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shimToolContext");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = objc_msgSend(v175, "isEqual:", v176);

    if (!v177)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent subRequestFallback](self, "subRequestFallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestFallback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent subRequestFallback](self, "subRequestFallback");
  v178 = objc_claimAutoreleasedReturnValue();
  if (v178)
  {
    v179 = (void *)v178;
    -[ORCHSchemaORCHClientEvent subRequestFallback](self, "subRequestFallback");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestFallback");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = objc_msgSend(v180, "isEqual:", v181);

    if (!v182)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent nlRouterBridgeSubComponentContext](self, "nlRouterBridgeSubComponentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlRouterBridgeSubComponentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_187;
  -[ORCHSchemaORCHClientEvent nlRouterBridgeSubComponentContext](self, "nlRouterBridgeSubComponentContext");
  v183 = objc_claimAutoreleasedReturnValue();
  if (v183)
  {
    v184 = (void *)v183;
    -[ORCHSchemaORCHClientEvent nlRouterBridgeSubComponentContext](self, "nlRouterBridgeSubComponentContext");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlRouterBridgeSubComponentContext");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = objc_msgSend(v185, "isEqual:", v186);

    if (!v187)
      goto LABEL_188;
  }
  else
  {

  }
  -[ORCHSchemaORCHClientEvent unsupportedLanguageDetected](self, "unsupportedLanguageDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsupportedLanguageDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ORCHSchemaORCHClientEvent unsupportedLanguageDetected](self, "unsupportedLanguageDetected");
    v188 = objc_claimAutoreleasedReturnValue();
    if (!v188)
    {

LABEL_191:
      v193 = 1;
      goto LABEL_189;
    }
    v189 = (void *)v188;
    -[ORCHSchemaORCHClientEvent unsupportedLanguageDetected](self, "unsupportedLanguageDetected");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unsupportedLanguageDetected");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = objc_msgSend(v190, "isEqual:", v191);

    if ((v192 & 1) != 0)
      goto LABEL_191;
  }
  else
  {
LABEL_187:

  }
LABEL_188:
  v193 = 0;
LABEL_189:

  return v193;
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

  v3 = -[ORCHSchemaORCHClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[ORCHSchemaORCHResourceUtilizationMetadata hash](self->_resourceUtilizationMetadata, "hash") ^ v3;
  v5 = -[ORCHSchemaORCHRequestContext hash](self->_requestContext, "hash");
  v6 = v4 ^ v5 ^ -[ORCHSchemaORCHASRBridgeContext hash](self->_asrBridgeContext, "hash");
  v7 = -[ORCHSchemaORCHCDMBridgeContext hash](self->_cdmBridgeContext, "hash");
  v8 = v7 ^ -[ORCHSchemaORCHExecutionBridgeContext hash](self->_executionBridgeContext, "hash");
  v9 = v6 ^ v8 ^ -[ORCHSchemaORCHServerFallbackContext hash](self->_serverFallbackContext, "hash");
  v10 = -[ORCHSchemaORCHFlowOutputSubmitted hash](self->_flowOutputSubmitted, "hash");
  v11 = v10 ^ -[ORCHSchemaORCHResultCandidateReceived hash](self->_resultCandidate, "hash");
  v12 = v11 ^ -[ORCHSchemaORCHResultSelected hash](self->_resultSelected, "hash");
  v13 = v9 ^ v12 ^ -[ORCHSchemaORCHConversationContextSubmitted hash](self->_contextSubmissionMessage, "hash");
  v14 = -[ORCHSchemaORCHAssetsReported hash](self->_availableAssets, "hash");
  v15 = v14 ^ -[ORCHSchemaORCHDeviceDynamicContext hash](self->_orchDeviceDynamicContext, "hash");
  v16 = v15 ^ -[ORCHSchemaORCHPommesBridgeContext hash](self->_pommesBridgeContext, "hash");
  v17 = v16 ^ -[ORCHSchemaORCHMUXBridgeContext hash](self->_muxBridgeContext, "hash");
  v18 = v13 ^ v17 ^ -[ORCHSchemaORCHMultiUserResultCandidateReceived hash](self->_multiUserResultCandidate, "hash");
  v19 = -[ORCHSchemaORCHMultiUserResultCandidateSelected hash](self->_multiUserResultSelected, "hash");
  v20 = v19 ^ -[ORCHSchemaORCHAceCommandContext hash](self->_aceCommandContext, "hash");
  v21 = v20 ^ -[ORCHSchemaORCHTRPFinalized hash](self->_trpFinalized, "hash");
  v22 = v21 ^ -[ORCHSchemaORCHRequestMitigated hash](self->_requestMitigated, "hash");
  v23 = v22 ^ -[ORCHSchemaORCHNLV3ServerFallbackDeprecated hash](self->_nlv3ServerFallbackDeprecated, "hash");
  v24 = v18 ^ v23 ^ -[ORCHSchemaORCHUIActivationContext hash](self->_uiActivationContext, "hash");
  v25 = -[ORCHSchemaORCHTRPCandidateReceived hash](self->_trpCandidateReceived, "hash");
  v26 = v25 ^ -[ORCHSchemaORCHIdentityBridgeRequestContext hash](self->_identityBridgeRequestContext, "hash");
  v27 = v26 ^ -[ORCHSchemaORCHAssetSetsReported hash](self->_assetSetsReported, "hash");
  v28 = v27 ^ -[ORCHSchemaORCHCandidateRequestContext hash](self->_candidateRequestContext, "hash");
  v29 = v28 ^ -[ORCHSchemaORCHPowerContextPolicyReported hash](self->_powerContextPolicyReported, "hash");
  v30 = v29 ^ -[ORCHSchemaORCHExecuteOnRemoteRequestContext hash](self->_executeOnRemoteRequestContext, "hash");
  v31 = v24 ^ v30 ^ -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported hash](self->_assistantdLaunchMetadataReported, "hash");
  v32 = -[ORCHSchemaORCHIntelligenceFlowQuerySent hash](self->_intelligenceFlowQuerySent, "hash");
  v33 = v32 ^ -[ORCHSchemaORCHSubRequestContext hash](self->_subRequestContext, "hash");
  v34 = v33 ^ -[ORCHSchemaNLRouterRewrittenUtteranceTier1 hash](self->_routerRewrittenUtterance, "hash");
  v35 = v34 ^ -[ORCHSchemaORCHNLRouterBridgeContext hash](self->_nlRouterBridgeContext, "hash");
  v36 = v35 ^ -[ORCHSchemaORCHShimToolContext hash](self->_shimToolContext, "hash");
  v37 = v36 ^ -[ORCHSchemaORCHIntelligenceFlowSubRequestFallback hash](self->_subRequestFallback, "hash");
  v38 = v37 ^ -[ORCHSchemaORCHNLRouterBridgeSubComponentContext hash](self->_nlRouterBridgeSubComponentContext, "hash");
  return v31 ^ v38 ^ -[ORCHSchemaORCHUnsupportedLanguageDetected hash](self->_unsupportedLanguageDetected, "hash");
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
  id v115;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_aceCommandContext)
  {
    -[ORCHSchemaORCHClientEvent aceCommandContext](self, "aceCommandContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("aceCommandContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("aceCommandContext"));

    }
  }
  if (self->_asrBridgeContext)
  {
    -[ORCHSchemaORCHClientEvent asrBridgeContext](self, "asrBridgeContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("asrBridgeContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("asrBridgeContext"));

    }
  }
  if (self->_assetSetsReported)
  {
    -[ORCHSchemaORCHClientEvent assetSetsReported](self, "assetSetsReported");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("assetSetsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("assetSetsReported"));

    }
  }
  if (self->_assistantdLaunchMetadataReported)
  {
    -[ORCHSchemaORCHClientEvent assistantdLaunchMetadataReported](self, "assistantdLaunchMetadataReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("assistantdLaunchMetadataReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("assistantdLaunchMetadataReported"));

    }
  }
  if (self->_availableAssets)
  {
    -[ORCHSchemaORCHClientEvent availableAssets](self, "availableAssets");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("availableAssets"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("availableAssets"));

    }
  }
  if (self->_candidateRequestContext)
  {
    -[ORCHSchemaORCHClientEvent candidateRequestContext](self, "candidateRequestContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("candidateRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("candidateRequestContext"));

    }
  }
  if (self->_cdmBridgeContext)
  {
    -[ORCHSchemaORCHClientEvent cdmBridgeContext](self, "cdmBridgeContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("cdmBridgeContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("cdmBridgeContext"));

    }
  }
  if (self->_contextSubmissionMessage)
  {
    -[ORCHSchemaORCHClientEvent contextSubmissionMessage](self, "contextSubmissionMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("contextSubmissionMessage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("contextSubmissionMessage"));

    }
  }
  if (self->_eventMetadata)
  {
    -[ORCHSchemaORCHClientEvent eventMetadata](self, "eventMetadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("eventMetadata"));

    }
  }
  if (self->_executeOnRemoteRequestContext)
  {
    -[ORCHSchemaORCHClientEvent executeOnRemoteRequestContext](self, "executeOnRemoteRequestContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("executeOnRemoteRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("executeOnRemoteRequestContext"));

    }
  }
  if (self->_executionBridgeContext)
  {
    -[ORCHSchemaORCHClientEvent executionBridgeContext](self, "executionBridgeContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("executionBridgeContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("executionBridgeContext"));

    }
  }
  if (self->_flowOutputSubmitted)
  {
    -[ORCHSchemaORCHClientEvent flowOutputSubmitted](self, "flowOutputSubmitted");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("flowOutputSubmitted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("flowOutputSubmitted"));

    }
  }
  if (self->_identityBridgeRequestContext)
  {
    -[ORCHSchemaORCHClientEvent identityBridgeRequestContext](self, "identityBridgeRequestContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("identityBridgeRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("identityBridgeRequestContext"));

    }
  }
  if (self->_intelligenceFlowQuerySent)
  {
    -[ORCHSchemaORCHClientEvent intelligenceFlowQuerySent](self, "intelligenceFlowQuerySent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("intelligenceFlowQuerySent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("intelligenceFlowQuerySent"));

    }
  }
  if (self->_multiUserResultCandidate)
  {
    -[ORCHSchemaORCHClientEvent multiUserResultCandidate](self, "multiUserResultCandidate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("multiUserResultCandidate"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("multiUserResultCandidate"));

    }
  }
  if (self->_multiUserResultSelected)
  {
    -[ORCHSchemaORCHClientEvent multiUserResultSelected](self, "multiUserResultSelected");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("multiUserResultSelected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("multiUserResultSelected"));

    }
  }
  if (self->_muxBridgeContext)
  {
    -[ORCHSchemaORCHClientEvent muxBridgeContext](self, "muxBridgeContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("muxBridgeContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("muxBridgeContext"));

    }
  }
  if (self->_nlRouterBridgeContext)
  {
    -[ORCHSchemaORCHClientEvent nlRouterBridgeContext](self, "nlRouterBridgeContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("nlRouterBridgeContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("nlRouterBridgeContext"));

    }
  }
  if (self->_nlRouterBridgeSubComponentContext)
  {
    -[ORCHSchemaORCHClientEvent nlRouterBridgeSubComponentContext](self, "nlRouterBridgeSubComponentContext");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("nlRouterBridgeSubComponentContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("nlRouterBridgeSubComponentContext"));

    }
  }
  if (self->_nlv3ServerFallbackDeprecated)
  {
    -[ORCHSchemaORCHClientEvent nlv3ServerFallbackDeprecated](self, "nlv3ServerFallbackDeprecated");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dictionaryRepresentation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("nlv3ServerFallbackDeprecated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("nlv3ServerFallbackDeprecated"));

    }
  }
  if (self->_orchDeviceDynamicContext)
  {
    -[ORCHSchemaORCHClientEvent orchDeviceDynamicContext](self, "orchDeviceDynamicContext");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dictionaryRepresentation");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("orchDeviceDynamicContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("orchDeviceDynamicContext"));

    }
  }
  if (self->_pommesBridgeContext)
  {
    -[ORCHSchemaORCHClientEvent pommesBridgeContext](self, "pommesBridgeContext");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("pommesBridgeContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("pommesBridgeContext"));

    }
  }
  if (self->_powerContextPolicyReported)
  {
    -[ORCHSchemaORCHClientEvent powerContextPolicyReported](self, "powerContextPolicyReported");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "dictionaryRepresentation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("powerContextPolicyReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("powerContextPolicyReported"));

    }
  }
  if (self->_requestContext)
  {
    -[ORCHSchemaORCHClientEvent requestContext](self, "requestContext");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("requestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("requestContext"));

    }
  }
  if (self->_requestMitigated)
  {
    -[ORCHSchemaORCHClientEvent requestMitigated](self, "requestMitigated");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "dictionaryRepresentation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("requestMitigated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("requestMitigated"));

    }
  }
  if (self->_resourceUtilizationMetadata)
  {
    -[ORCHSchemaORCHClientEvent resourceUtilizationMetadata](self, "resourceUtilizationMetadata");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "dictionaryRepresentation");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("resourceUtilizationMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("resourceUtilizationMetadata"));

    }
  }
  if (self->_resultCandidate)
  {
    -[ORCHSchemaORCHClientEvent resultCandidate](self, "resultCandidate");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "dictionaryRepresentation");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (v83)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("resultCandidate"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("resultCandidate"));

    }
  }
  if (self->_resultSelected)
  {
    -[ORCHSchemaORCHClientEvent resultSelected](self, "resultSelected");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "dictionaryRepresentation");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("resultSelected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("resultSelected"));

    }
  }
  if (self->_routerRewrittenUtterance)
  {
    -[ORCHSchemaORCHClientEvent routerRewrittenUtterance](self, "routerRewrittenUtterance");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "dictionaryRepresentation");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("routerRewrittenUtterance"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("routerRewrittenUtterance"));

    }
  }
  if (self->_serverFallbackContext)
  {
    -[ORCHSchemaORCHClientEvent serverFallbackContext](self, "serverFallbackContext");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "dictionaryRepresentation");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("serverFallbackContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("serverFallbackContext"));

    }
  }
  if (self->_shimToolContext)
  {
    -[ORCHSchemaORCHClientEvent shimToolContext](self, "shimToolContext");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "dictionaryRepresentation");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("shimToolContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("shimToolContext"));

    }
  }
  if (self->_subRequestContext)
  {
    -[ORCHSchemaORCHClientEvent subRequestContext](self, "subRequestContext");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "dictionaryRepresentation");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("subRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("subRequestContext"));

    }
  }
  if (self->_subRequestFallback)
  {
    -[ORCHSchemaORCHClientEvent subRequestFallback](self, "subRequestFallback");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "dictionaryRepresentation");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v101)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("subRequestFallback"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v102, CFSTR("subRequestFallback"));

    }
  }
  if (self->_trpCandidateReceived)
  {
    -[ORCHSchemaORCHClientEvent trpCandidateReceived](self, "trpCandidateReceived");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "dictionaryRepresentation");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v104)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v104, CFSTR("trpCandidateReceived"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("trpCandidateReceived"));

    }
  }
  if (self->_trpFinalized)
  {
    -[ORCHSchemaORCHClientEvent trpFinalized](self, "trpFinalized");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "dictionaryRepresentation");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (v107)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v107, CFSTR("trpFinalized"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("trpFinalized"));

    }
  }
  if (self->_uiActivationContext)
  {
    -[ORCHSchemaORCHClientEvent uiActivationContext](self, "uiActivationContext");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "dictionaryRepresentation");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (v110)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v110, CFSTR("uiActivationContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v111, CFSTR("uiActivationContext"));

    }
  }
  if (self->_unsupportedLanguageDetected)
  {
    -[ORCHSchemaORCHClientEvent unsupportedLanguageDetected](self, "unsupportedLanguageDetected");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "dictionaryRepresentation");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (v113)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v113, CFSTR("unsupportedLanguageDetected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v114, CFSTR("unsupportedLanguageDetected"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v115 = v3;

  return v115;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHClientEvent)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHClientEvent *v5;
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
    self = -[ORCHSchemaORCHClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHClientEvent)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHClientEvent *v5;
  uint64_t v6;
  ORCHSchemaORCHClientEventMetadata *v7;
  uint64_t v8;
  ORCHSchemaORCHResourceUtilizationMetadata *v9;
  uint64_t v10;
  ORCHSchemaORCHRequestContext *v11;
  uint64_t v12;
  ORCHSchemaORCHASRBridgeContext *v13;
  uint64_t v14;
  ORCHSchemaORCHCDMBridgeContext *v15;
  uint64_t v16;
  ORCHSchemaORCHExecutionBridgeContext *v17;
  uint64_t v18;
  ORCHSchemaORCHServerFallbackContext *v19;
  uint64_t v20;
  ORCHSchemaORCHFlowOutputSubmitted *v21;
  uint64_t v22;
  ORCHSchemaORCHResultCandidateReceived *v23;
  uint64_t v24;
  ORCHSchemaORCHResultSelected *v25;
  uint64_t v26;
  ORCHSchemaORCHConversationContextSubmitted *v27;
  uint64_t v28;
  ORCHSchemaORCHAssetsReported *v29;
  uint64_t v30;
  ORCHSchemaORCHDeviceDynamicContext *v31;
  uint64_t v32;
  ORCHSchemaORCHPommesBridgeContext *v33;
  uint64_t v34;
  ORCHSchemaORCHMUXBridgeContext *v35;
  uint64_t v36;
  ORCHSchemaORCHMultiUserResultCandidateReceived *v37;
  uint64_t v38;
  ORCHSchemaORCHMultiUserResultCandidateSelected *v39;
  uint64_t v40;
  ORCHSchemaORCHAceCommandContext *v41;
  uint64_t v42;
  ORCHSchemaORCHTRPFinalized *v43;
  uint64_t v44;
  ORCHSchemaORCHRequestMitigated *v45;
  uint64_t v46;
  ORCHSchemaORCHNLV3ServerFallbackDeprecated *v47;
  uint64_t v48;
  ORCHSchemaORCHUIActivationContext *v49;
  uint64_t v50;
  ORCHSchemaORCHTRPCandidateReceived *v51;
  uint64_t v52;
  ORCHSchemaORCHIdentityBridgeRequestContext *v53;
  uint64_t v54;
  ORCHSchemaORCHAssetSetsReported *v55;
  uint64_t v56;
  ORCHSchemaORCHCandidateRequestContext *v57;
  uint64_t v58;
  ORCHSchemaORCHPowerContextPolicyReported *v59;
  uint64_t v60;
  ORCHSchemaORCHExecuteOnRemoteRequestContext *v61;
  uint64_t v62;
  ORCHSchemaORCHAssistantDaemonLaunchMetadataReported *v63;
  uint64_t v64;
  ORCHSchemaORCHIntelligenceFlowQuerySent *v65;
  void *v66;
  ORCHSchemaORCHSubRequestContext *v67;
  void *v68;
  ORCHSchemaNLRouterRewrittenUtteranceTier1 *v69;
  void *v70;
  ORCHSchemaORCHNLRouterBridgeContext *v71;
  void *v72;
  ORCHSchemaORCHShimToolContext *v73;
  void *v74;
  ORCHSchemaORCHIntelligenceFlowSubRequestFallback *v75;
  void *v76;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *v77;
  void *v78;
  ORCHSchemaORCHUnsupportedLanguageDetected *v79;
  ORCHSchemaORCHClientEvent *v80;
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
  objc_super v112;

  v4 = a3;
  v112.receiver = self;
  v112.super_class = (Class)ORCHSchemaORCHClientEvent;
  v5 = -[ORCHSchemaORCHClientEvent init](&v112, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ORCHSchemaORCHClientEventMetadata initWithDictionary:]([ORCHSchemaORCHClientEventMetadata alloc], "initWithDictionary:", v6);
      -[ORCHSchemaORCHClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resourceUtilizationMetadata"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ORCHSchemaORCHResourceUtilizationMetadata initWithDictionary:]([ORCHSchemaORCHResourceUtilizationMetadata alloc], "initWithDictionary:", v8);
      -[ORCHSchemaORCHClientEvent setResourceUtilizationMetadata:](v5, "setResourceUtilizationMetadata:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ORCHSchemaORCHRequestContext initWithDictionary:]([ORCHSchemaORCHRequestContext alloc], "initWithDictionary:", v10);
      -[ORCHSchemaORCHClientEvent setRequestContext:](v5, "setRequestContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrBridgeContext"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ORCHSchemaORCHASRBridgeContext initWithDictionary:]([ORCHSchemaORCHASRBridgeContext alloc], "initWithDictionary:", v12);
      -[ORCHSchemaORCHClientEvent setAsrBridgeContext:](v5, "setAsrBridgeContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmBridgeContext"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[ORCHSchemaORCHCDMBridgeContext initWithDictionary:]([ORCHSchemaORCHCDMBridgeContext alloc], "initWithDictionary:", v14);
      -[ORCHSchemaORCHClientEvent setCdmBridgeContext:](v5, "setCdmBridgeContext:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionBridgeContext"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[ORCHSchemaORCHExecutionBridgeContext initWithDictionary:]([ORCHSchemaORCHExecutionBridgeContext alloc], "initWithDictionary:", v16);
      -[ORCHSchemaORCHClientEvent setExecutionBridgeContext:](v5, "setExecutionBridgeContext:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverFallbackContext"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v111 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[ORCHSchemaORCHServerFallbackContext initWithDictionary:]([ORCHSchemaORCHServerFallbackContext alloc], "initWithDictionary:", v18);
      -[ORCHSchemaORCHClientEvent setServerFallbackContext:](v5, "setServerFallbackContext:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowOutputSubmitted"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v110 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[ORCHSchemaORCHFlowOutputSubmitted initWithDictionary:]([ORCHSchemaORCHFlowOutputSubmitted alloc], "initWithDictionary:", v20);
      -[ORCHSchemaORCHClientEvent setFlowOutputSubmitted:](v5, "setFlowOutputSubmitted:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultCandidate"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v109 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[ORCHSchemaORCHResultCandidateReceived initWithDictionary:]([ORCHSchemaORCHResultCandidateReceived alloc], "initWithDictionary:", v22);
      -[ORCHSchemaORCHClientEvent setResultCandidate:](v5, "setResultCandidate:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultSelected"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v108 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[ORCHSchemaORCHResultSelected initWithDictionary:]([ORCHSchemaORCHResultSelected alloc], "initWithDictionary:", v24);
      -[ORCHSchemaORCHClientEvent setResultSelected:](v5, "setResultSelected:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextSubmissionMessage"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v107 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[ORCHSchemaORCHConversationContextSubmitted initWithDictionary:]([ORCHSchemaORCHConversationContextSubmitted alloc], "initWithDictionary:", v26);
      -[ORCHSchemaORCHClientEvent setContextSubmissionMessage:](v5, "setContextSubmissionMessage:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("availableAssets"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v106 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[ORCHSchemaORCHAssetsReported initWithDictionary:]([ORCHSchemaORCHAssetsReported alloc], "initWithDictionary:", v28);
      -[ORCHSchemaORCHClientEvent setAvailableAssets:](v5, "setAvailableAssets:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orchDeviceDynamicContext"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v105 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[ORCHSchemaORCHDeviceDynamicContext initWithDictionary:]([ORCHSchemaORCHDeviceDynamicContext alloc], "initWithDictionary:", v30);
      -[ORCHSchemaORCHClientEvent setOrchDeviceDynamicContext:](v5, "setOrchDeviceDynamicContext:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pommesBridgeContext"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v104 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[ORCHSchemaORCHPommesBridgeContext initWithDictionary:]([ORCHSchemaORCHPommesBridgeContext alloc], "initWithDictionary:", v32);
      -[ORCHSchemaORCHClientEvent setPommesBridgeContext:](v5, "setPommesBridgeContext:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("muxBridgeContext"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v103 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[ORCHSchemaORCHMUXBridgeContext initWithDictionary:]([ORCHSchemaORCHMUXBridgeContext alloc], "initWithDictionary:", v34);
      -[ORCHSchemaORCHClientEvent setMuxBridgeContext:](v5, "setMuxBridgeContext:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multiUserResultCandidate"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v102 = (void *)v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[ORCHSchemaORCHMultiUserResultCandidateReceived initWithDictionary:]([ORCHSchemaORCHMultiUserResultCandidateReceived alloc], "initWithDictionary:", v36);
      -[ORCHSchemaORCHClientEvent setMultiUserResultCandidate:](v5, "setMultiUserResultCandidate:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multiUserResultSelected"));
    v38 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v101 = (void *)v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[ORCHSchemaORCHMultiUserResultCandidateSelected initWithDictionary:]([ORCHSchemaORCHMultiUserResultCandidateSelected alloc], "initWithDictionary:", v38);
      -[ORCHSchemaORCHClientEvent setMultiUserResultSelected:](v5, "setMultiUserResultSelected:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aceCommandContext"));
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v100 = (void *)v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[ORCHSchemaORCHAceCommandContext initWithDictionary:]([ORCHSchemaORCHAceCommandContext alloc], "initWithDictionary:", v40);
      -[ORCHSchemaORCHClientEvent setAceCommandContext:](v5, "setAceCommandContext:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpFinalized"));
    v42 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v99 = (void *)v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[ORCHSchemaORCHTRPFinalized initWithDictionary:]([ORCHSchemaORCHTRPFinalized alloc], "initWithDictionary:", v42);
      -[ORCHSchemaORCHClientEvent setTrpFinalized:](v5, "setTrpFinalized:", v43);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestMitigated"));
    v44 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v98 = (void *)v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[ORCHSchemaORCHRequestMitigated initWithDictionary:]([ORCHSchemaORCHRequestMitigated alloc], "initWithDictionary:", v44);
      -[ORCHSchemaORCHClientEvent setRequestMitigated:](v5, "setRequestMitigated:", v45);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlv3ServerFallbackDeprecated"));
    v46 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v97 = (void *)v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[ORCHSchemaORCHNLV3ServerFallbackDeprecated initWithDictionary:]([ORCHSchemaORCHNLV3ServerFallbackDeprecated alloc], "initWithDictionary:", v46);
      -[ORCHSchemaORCHClientEvent setNlv3ServerFallbackDeprecated:](v5, "setNlv3ServerFallbackDeprecated:", v47);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uiActivationContext"));
    v48 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v96 = (void *)v48;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[ORCHSchemaORCHUIActivationContext initWithDictionary:]([ORCHSchemaORCHUIActivationContext alloc], "initWithDictionary:", v48);
      -[ORCHSchemaORCHClientEvent setUiActivationContext:](v5, "setUiActivationContext:", v49);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpCandidateReceived"));
    v50 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v95 = (void *)v50;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = -[ORCHSchemaORCHTRPCandidateReceived initWithDictionary:]([ORCHSchemaORCHTRPCandidateReceived alloc], "initWithDictionary:", v50);
      -[ORCHSchemaORCHClientEvent setTrpCandidateReceived:](v5, "setTrpCandidateReceived:", v51);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identityBridgeRequestContext"));
    v52 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v94 = (void *)v52;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = -[ORCHSchemaORCHIdentityBridgeRequestContext initWithDictionary:]([ORCHSchemaORCHIdentityBridgeRequestContext alloc], "initWithDictionary:", v52);
      -[ORCHSchemaORCHClientEvent setIdentityBridgeRequestContext:](v5, "setIdentityBridgeRequestContext:", v53);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSetsReported"));
    v54 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v93 = (void *)v54;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = -[ORCHSchemaORCHAssetSetsReported initWithDictionary:]([ORCHSchemaORCHAssetSetsReported alloc], "initWithDictionary:", v54);
      -[ORCHSchemaORCHClientEvent setAssetSetsReported:](v5, "setAssetSetsReported:", v55);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidateRequestContext"));
    v56 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v92 = (void *)v56;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = -[ORCHSchemaORCHCandidateRequestContext initWithDictionary:]([ORCHSchemaORCHCandidateRequestContext alloc], "initWithDictionary:", v56);
      -[ORCHSchemaORCHClientEvent setCandidateRequestContext:](v5, "setCandidateRequestContext:", v57);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("powerContextPolicyReported"));
    v58 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v91 = (void *)v58;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = -[ORCHSchemaORCHPowerContextPolicyReported initWithDictionary:]([ORCHSchemaORCHPowerContextPolicyReported alloc], "initWithDictionary:", v58);
      -[ORCHSchemaORCHClientEvent setPowerContextPolicyReported:](v5, "setPowerContextPolicyReported:", v59);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executeOnRemoteRequestContext"));
    v60 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v90 = (void *)v60;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = -[ORCHSchemaORCHExecuteOnRemoteRequestContext initWithDictionary:]([ORCHSchemaORCHExecuteOnRemoteRequestContext alloc], "initWithDictionary:", v60);
      -[ORCHSchemaORCHClientEvent setExecuteOnRemoteRequestContext:](v5, "setExecuteOnRemoteRequestContext:", v61);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantdLaunchMetadataReported"));
    v62 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = (void *)v62;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = -[ORCHSchemaORCHAssistantDaemonLaunchMetadataReported initWithDictionary:]([ORCHSchemaORCHAssistantDaemonLaunchMetadataReported alloc], "initWithDictionary:", v62);
      -[ORCHSchemaORCHClientEvent setAssistantdLaunchMetadataReported:](v5, "setAssistantdLaunchMetadataReported:", v63);

    }
    v84 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intelligenceFlowQuerySent"));
    v64 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = -[ORCHSchemaORCHIntelligenceFlowQuerySent initWithDictionary:]([ORCHSchemaORCHIntelligenceFlowQuerySent alloc], "initWithDictionary:", v64);
      -[ORCHSchemaORCHClientEvent setIntelligenceFlowQuerySent:](v5, "setIntelligenceFlowQuerySent:", v65);

    }
    v82 = (void *)v64;
    v83 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestContext"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = -[ORCHSchemaORCHSubRequestContext initWithDictionary:]([ORCHSchemaORCHSubRequestContext alloc], "initWithDictionary:", v66);
      -[ORCHSchemaORCHClientEvent setSubRequestContext:](v5, "setSubRequestContext:", v67);

    }
    v88 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("routerRewrittenUtterance"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = -[ORCHSchemaNLRouterRewrittenUtteranceTier1 initWithDictionary:]([ORCHSchemaNLRouterRewrittenUtteranceTier1 alloc], "initWithDictionary:", v68);
      -[ORCHSchemaORCHClientEvent setRouterRewrittenUtterance:](v5, "setRouterRewrittenUtterance:", v69);

    }
    v87 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlRouterBridgeContext"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v71 = -[ORCHSchemaORCHNLRouterBridgeContext initWithDictionary:]([ORCHSchemaORCHNLRouterBridgeContext alloc], "initWithDictionary:", v70);
      -[ORCHSchemaORCHClientEvent setNlRouterBridgeContext:](v5, "setNlRouterBridgeContext:", v71);

    }
    v86 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shimToolContext"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v73 = -[ORCHSchemaORCHShimToolContext initWithDictionary:]([ORCHSchemaORCHShimToolContext alloc], "initWithDictionary:", v72);
      -[ORCHSchemaORCHClientEvent setShimToolContext:](v5, "setShimToolContext:", v73);

    }
    v85 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestFallback"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v75 = -[ORCHSchemaORCHIntelligenceFlowSubRequestFallback initWithDictionary:]([ORCHSchemaORCHIntelligenceFlowSubRequestFallback alloc], "initWithDictionary:", v74);
      -[ORCHSchemaORCHClientEvent setSubRequestFallback:](v5, "setSubRequestFallback:", v75);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlRouterBridgeSubComponentContext"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = -[ORCHSchemaORCHNLRouterBridgeSubComponentContext initWithDictionary:]([ORCHSchemaORCHNLRouterBridgeSubComponentContext alloc], "initWithDictionary:", v76);
      -[ORCHSchemaORCHClientEvent setNlRouterBridgeSubComponentContext:](v5, "setNlRouterBridgeSubComponentContext:", v77);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unsupportedLanguageDetected"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v79 = -[ORCHSchemaORCHUnsupportedLanguageDetected initWithDictionary:]([ORCHSchemaORCHUnsupportedLanguageDetected alloc], "initWithDictionary:", v78);
      -[ORCHSchemaORCHClientEvent setUnsupportedLanguageDetected:](v5, "setUnsupportedLanguageDetected:", v79);

    }
    v80 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ORCHSchemaORCHClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (ORCHSchemaORCHResourceUtilizationMetadata)resourceUtilizationMetadata
{
  return self->_resourceUtilizationMetadata;
}

- (void)setResourceUtilizationMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_resourceUtilizationMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setHasResourceUtilizationMetadata:(BOOL)a3
{
  self->_hasResourceUtilizationMetadata = a3;
}

- (BOOL)hasRequestContext
{
  return self->_hasRequestContext;
}

- (void)setHasRequestContext:(BOOL)a3
{
  self->_hasRequestContext = a3;
}

- (BOOL)hasAsrBridgeContext
{
  return self->_hasAsrBridgeContext;
}

- (void)setHasAsrBridgeContext:(BOOL)a3
{
  self->_hasAsrBridgeContext = a3;
}

- (BOOL)hasCdmBridgeContext
{
  return self->_hasCdmBridgeContext;
}

- (void)setHasCdmBridgeContext:(BOOL)a3
{
  self->_hasCdmBridgeContext = a3;
}

- (BOOL)hasExecutionBridgeContext
{
  return self->_hasExecutionBridgeContext;
}

- (void)setHasExecutionBridgeContext:(BOOL)a3
{
  self->_hasExecutionBridgeContext = a3;
}

- (BOOL)hasServerFallbackContext
{
  return self->_hasServerFallbackContext;
}

- (void)setHasServerFallbackContext:(BOOL)a3
{
  self->_hasServerFallbackContext = a3;
}

- (BOOL)hasFlowOutputSubmitted
{
  return self->_hasFlowOutputSubmitted;
}

- (void)setHasFlowOutputSubmitted:(BOOL)a3
{
  self->_hasFlowOutputSubmitted = a3;
}

- (BOOL)hasResultCandidate
{
  return self->_hasResultCandidate;
}

- (void)setHasResultCandidate:(BOOL)a3
{
  self->_hasResultCandidate = a3;
}

- (BOOL)hasResultSelected
{
  return self->_hasResultSelected;
}

- (void)setHasResultSelected:(BOOL)a3
{
  self->_hasResultSelected = a3;
}

- (BOOL)hasContextSubmissionMessage
{
  return self->_hasContextSubmissionMessage;
}

- (void)setHasContextSubmissionMessage:(BOOL)a3
{
  self->_hasContextSubmissionMessage = a3;
}

- (BOOL)hasAvailableAssets
{
  return self->_hasAvailableAssets;
}

- (void)setHasAvailableAssets:(BOOL)a3
{
  self->_hasAvailableAssets = a3;
}

- (BOOL)hasOrchDeviceDynamicContext
{
  return self->_hasOrchDeviceDynamicContext;
}

- (void)setHasOrchDeviceDynamicContext:(BOOL)a3
{
  self->_hasOrchDeviceDynamicContext = a3;
}

- (BOOL)hasPommesBridgeContext
{
  return self->_hasPommesBridgeContext;
}

- (void)setHasPommesBridgeContext:(BOOL)a3
{
  self->_hasPommesBridgeContext = a3;
}

- (BOOL)hasMuxBridgeContext
{
  return self->_hasMuxBridgeContext;
}

- (void)setHasMuxBridgeContext:(BOOL)a3
{
  self->_hasMuxBridgeContext = a3;
}

- (BOOL)hasMultiUserResultCandidate
{
  return self->_hasMultiUserResultCandidate;
}

- (void)setHasMultiUserResultCandidate:(BOOL)a3
{
  self->_hasMultiUserResultCandidate = a3;
}

- (BOOL)hasMultiUserResultSelected
{
  return self->_hasMultiUserResultSelected;
}

- (void)setHasMultiUserResultSelected:(BOOL)a3
{
  self->_hasMultiUserResultSelected = a3;
}

- (BOOL)hasAceCommandContext
{
  return self->_hasAceCommandContext;
}

- (void)setHasAceCommandContext:(BOOL)a3
{
  self->_hasAceCommandContext = a3;
}

- (BOOL)hasTrpFinalized
{
  return self->_hasTrpFinalized;
}

- (void)setHasTrpFinalized:(BOOL)a3
{
  self->_hasTrpFinalized = a3;
}

- (BOOL)hasRequestMitigated
{
  return self->_hasRequestMitigated;
}

- (void)setHasRequestMitigated:(BOOL)a3
{
  self->_hasRequestMitigated = a3;
}

- (BOOL)hasNlv3ServerFallbackDeprecated
{
  return self->_hasNlv3ServerFallbackDeprecated;
}

- (void)setHasNlv3ServerFallbackDeprecated:(BOOL)a3
{
  self->_hasNlv3ServerFallbackDeprecated = a3;
}

- (BOOL)hasUiActivationContext
{
  return self->_hasUiActivationContext;
}

- (void)setHasUiActivationContext:(BOOL)a3
{
  self->_hasUiActivationContext = a3;
}

- (BOOL)hasTrpCandidateReceived
{
  return self->_hasTrpCandidateReceived;
}

- (void)setHasTrpCandidateReceived:(BOOL)a3
{
  self->_hasTrpCandidateReceived = a3;
}

- (BOOL)hasIdentityBridgeRequestContext
{
  return self->_hasIdentityBridgeRequestContext;
}

- (void)setHasIdentityBridgeRequestContext:(BOOL)a3
{
  self->_hasIdentityBridgeRequestContext = a3;
}

- (BOOL)hasAssetSetsReported
{
  return self->_hasAssetSetsReported;
}

- (void)setHasAssetSetsReported:(BOOL)a3
{
  self->_hasAssetSetsReported = a3;
}

- (BOOL)hasCandidateRequestContext
{
  return self->_hasCandidateRequestContext;
}

- (void)setHasCandidateRequestContext:(BOOL)a3
{
  self->_hasCandidateRequestContext = a3;
}

- (BOOL)hasPowerContextPolicyReported
{
  return self->_hasPowerContextPolicyReported;
}

- (void)setHasPowerContextPolicyReported:(BOOL)a3
{
  self->_hasPowerContextPolicyReported = a3;
}

- (BOOL)hasExecuteOnRemoteRequestContext
{
  return self->_hasExecuteOnRemoteRequestContext;
}

- (void)setHasExecuteOnRemoteRequestContext:(BOOL)a3
{
  self->_hasExecuteOnRemoteRequestContext = a3;
}

- (BOOL)hasAssistantdLaunchMetadataReported
{
  return self->_hasAssistantdLaunchMetadataReported;
}

- (void)setHasAssistantdLaunchMetadataReported:(BOOL)a3
{
  self->_hasAssistantdLaunchMetadataReported = a3;
}

- (BOOL)hasIntelligenceFlowQuerySent
{
  return self->_hasIntelligenceFlowQuerySent;
}

- (void)setHasIntelligenceFlowQuerySent:(BOOL)a3
{
  self->_hasIntelligenceFlowQuerySent = a3;
}

- (BOOL)hasSubRequestContext
{
  return self->_hasSubRequestContext;
}

- (void)setHasSubRequestContext:(BOOL)a3
{
  self->_hasSubRequestContext = a3;
}

- (BOOL)hasRouterRewrittenUtterance
{
  return self->_hasRouterRewrittenUtterance;
}

- (void)setHasRouterRewrittenUtterance:(BOOL)a3
{
  self->_hasRouterRewrittenUtterance = a3;
}

- (BOOL)hasNlRouterBridgeContext
{
  return self->_hasNlRouterBridgeContext;
}

- (void)setHasNlRouterBridgeContext:(BOOL)a3
{
  self->_hasNlRouterBridgeContext = a3;
}

- (BOOL)hasShimToolContext
{
  return self->_hasShimToolContext;
}

- (void)setHasShimToolContext:(BOOL)a3
{
  self->_hasShimToolContext = a3;
}

- (BOOL)hasSubRequestFallback
{
  return self->_hasSubRequestFallback;
}

- (void)setHasSubRequestFallback:(BOOL)a3
{
  self->_hasSubRequestFallback = a3;
}

- (BOOL)hasNlRouterBridgeSubComponentContext
{
  return self->_hasNlRouterBridgeSubComponentContext;
}

- (void)setHasNlRouterBridgeSubComponentContext:(BOOL)a3
{
  self->_hasNlRouterBridgeSubComponentContext = a3;
}

- (BOOL)hasUnsupportedLanguageDetected
{
  return self->_hasUnsupportedLanguageDetected;
}

- (void)setHasUnsupportedLanguageDetected:(BOOL)a3
{
  self->_hasUnsupportedLanguageDetected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsupportedLanguageDetected, 0);
  objc_storeStrong((id *)&self->_nlRouterBridgeSubComponentContext, 0);
  objc_storeStrong((id *)&self->_subRequestFallback, 0);
  objc_storeStrong((id *)&self->_shimToolContext, 0);
  objc_storeStrong((id *)&self->_nlRouterBridgeContext, 0);
  objc_storeStrong((id *)&self->_routerRewrittenUtterance, 0);
  objc_storeStrong((id *)&self->_subRequestContext, 0);
  objc_storeStrong((id *)&self->_intelligenceFlowQuerySent, 0);
  objc_storeStrong((id *)&self->_assistantdLaunchMetadataReported, 0);
  objc_storeStrong((id *)&self->_executeOnRemoteRequestContext, 0);
  objc_storeStrong((id *)&self->_powerContextPolicyReported, 0);
  objc_storeStrong((id *)&self->_candidateRequestContext, 0);
  objc_storeStrong((id *)&self->_assetSetsReported, 0);
  objc_storeStrong((id *)&self->_identityBridgeRequestContext, 0);
  objc_storeStrong((id *)&self->_trpCandidateReceived, 0);
  objc_storeStrong((id *)&self->_uiActivationContext, 0);
  objc_storeStrong((id *)&self->_nlv3ServerFallbackDeprecated, 0);
  objc_storeStrong((id *)&self->_requestMitigated, 0);
  objc_storeStrong((id *)&self->_trpFinalized, 0);
  objc_storeStrong((id *)&self->_aceCommandContext, 0);
  objc_storeStrong((id *)&self->_multiUserResultSelected, 0);
  objc_storeStrong((id *)&self->_multiUserResultCandidate, 0);
  objc_storeStrong((id *)&self->_muxBridgeContext, 0);
  objc_storeStrong((id *)&self->_pommesBridgeContext, 0);
  objc_storeStrong((id *)&self->_orchDeviceDynamicContext, 0);
  objc_storeStrong((id *)&self->_availableAssets, 0);
  objc_storeStrong((id *)&self->_contextSubmissionMessage, 0);
  objc_storeStrong((id *)&self->_resultSelected, 0);
  objc_storeStrong((id *)&self->_resultCandidate, 0);
  objc_storeStrong((id *)&self->_flowOutputSubmitted, 0);
  objc_storeStrong((id *)&self->_serverFallbackContext, 0);
  objc_storeStrong((id *)&self->_executionBridgeContext, 0);
  objc_storeStrong((id *)&self->_cdmBridgeContext, 0);
  objc_storeStrong((id *)&self->_asrBridgeContext, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_resourceUtilizationMetadata, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 19;
}

@end
