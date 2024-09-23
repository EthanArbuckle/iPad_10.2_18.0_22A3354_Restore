@implementation NLXSchemaNLXClientEvent

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaNLXClientEventReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[NLXSchemaNLXClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 0x28)
    return CFSTR("com.apple.aiml.siri.nlx.NLXClientEvent");
  else
    return off_1E56321D0[v2 - 101];
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (int)getAnyEventType
{
  return 18;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
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
  id v88;

  v88 = a3;
  -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmServiceContext](self, "cdmServiceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NLXSchemaNLXClientEvent cdmServiceContext](self, "cdmServiceContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmRequestContext](self, "cdmRequestContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NLXSchemaNLXClientEvent cdmRequestContext](self, "cdmRequestContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent nlxDeviceFixedContext](self, "nlxDeviceFixedContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NLXSchemaNLXClientEvent nlxDeviceFixedContext](self, "nlxDeviceFixedContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmMatchingSpanEnded](self, "cdmMatchingSpanEnded");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NLXSchemaNLXClientEvent cdmMatchingSpanEnded](self, "cdmMatchingSpanEnded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmUsoGraphTier1](self, "cdmUsoGraphTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NLXSchemaNLXClientEvent cdmUsoGraphTier1](self, "cdmUsoGraphTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmMatchingSpanTier1](self, "cdmMatchingSpanTier1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NLXSchemaNLXClientEvent cdmMatchingSpanTier1](self, "cdmMatchingSpanTier1");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent nlxLegacyNLContextTier1](self, "nlxLegacyNLContextTier1");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[NLXSchemaNLXClientEvent nlxLegacyNLContextTier1](self, "nlxLegacyNLContextTier1");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmDelegatedUserDialogActTier1](self, "cdmDelegatedUserDialogActTier1");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[NLXSchemaNLXClientEvent cdmDelegatedUserDialogActTier1](self, "cdmDelegatedUserDialogActTier1");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmSystemDialogActTier1](self, "cdmSystemDialogActTier1");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[NLXSchemaNLXClientEvent cdmSystemDialogActTier1](self, "cdmSystemDialogActTier1");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmTokenizationEnded](self, "cdmTokenizationEnded");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[NLXSchemaNLXClientEvent cdmTokenizationEnded](self, "cdmTokenizationEnded");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmContextUpdateEnded](self, "cdmContextUpdateEnded");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[NLXSchemaNLXClientEvent cdmContextUpdateEnded](self, "cdmContextUpdateEnded");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent marrsRepetitionDetectionContext](self, "marrsRepetitionDetectionContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[NLXSchemaNLXClientEvent marrsRepetitionDetectionContext](self, "marrsRepetitionDetectionContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent marrsQueryRewriteContext](self, "marrsQueryRewriteContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[NLXSchemaNLXClientEvent marrsQueryRewriteContext](self, "marrsQueryRewriteContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent marrsQueryRewriteEvaluatedTier1](self, "marrsQueryRewriteEvaluatedTier1");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[NLXSchemaNLXClientEvent marrsQueryRewriteEvaluatedTier1](self, "marrsQueryRewriteEvaluatedTier1");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmMatchingSpanEndedTier1](self, "cdmMatchingSpanEndedTier1");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[NLXSchemaNLXClientEvent cdmMatchingSpanEndedTier1](self, "cdmMatchingSpanEndedTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent nlxCurareContext](self, "nlxCurareContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[NLXSchemaNLXClientEvent nlxCurareContext](self, "nlxCurareContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent marrsMentionDetectorEnded](self, "marrsMentionDetectorEnded");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[NLXSchemaNLXClientEvent marrsMentionDetectorEnded](self, "marrsMentionDetectorEnded");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent marrsMentionDetectorEndedTier1](self, "marrsMentionDetectorEndedTier1");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[NLXSchemaNLXClientEvent marrsMentionDetectorEndedTier1](self, "marrsMentionDetectorEndedTier1");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent marrsMentionResolverEnded](self, "marrsMentionResolverEnded");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[NLXSchemaNLXClientEvent marrsMentionResolverEnded](self, "marrsMentionResolverEnded");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent marrsMentionResolverEndedTier1](self, "marrsMentionResolverEndedTier1");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[NLXSchemaNLXClientEvent marrsMentionResolverEndedTier1](self, "marrsMentionResolverEndedTier1");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmClientSetupContext](self, "cdmClientSetupContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[NLXSchemaNLXClientEvent cdmClientSetupContext](self, "cdmClientSetupContext");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmAllServicesSetupContext](self, "cdmAllServicesSetupContext");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[NLXSchemaNLXClientEvent cdmAllServicesSetupContext](self, "cdmAllServicesSetupContext");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptContext](self, "cdmSingleServiceSetupAttemptContext");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptContext](self, "cdmSingleServiceSetupAttemptContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptFailed](self, "cdmSingleServiceSetupAttemptFailed");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptFailed](self, "cdmSingleServiceSetupAttemptFailed");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmSpanMatcherContext](self, "cdmSpanMatcherContext");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[NLXSchemaNLXClientEvent cdmSpanMatcherContext](self, "cdmSpanMatcherContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEnded](self, "marrsContextualSpanMatcherEnded");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEnded](self, "marrsContextualSpanMatcherEnded");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEndedTier1](self, "marrsContextualSpanMatcherEndedTier1");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEndedTier1](self, "marrsContextualSpanMatcherEndedTier1");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmXpcEventProcessingContext](self, "cdmXpcEventProcessingContext");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    -[NLXSchemaNLXClientEvent cdmXpcEventProcessingContext](self, "cdmXpcEventProcessingContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmAssetSetupContext](self, "cdmAssetSetupContext");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[NLXSchemaNLXClientEvent cdmAssetSetupContext](self, "cdmAssetSetupContext");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmSetupMissingAssetsDetected](self, "cdmSetupMissingAssetsDetected");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[NLXSchemaNLXClientEvent cdmSetupMissingAssetsDetected](self, "cdmSetupMissingAssetsDetected");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmClientWarmupContext](self, "cdmClientWarmupContext");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    -[NLXSchemaNLXClientEvent cdmClientWarmupContext](self, "cdmClientWarmupContext");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmAllServicesWarmupContext](self, "cdmAllServicesWarmupContext");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    -[NLXSchemaNLXClientEvent cdmAllServicesWarmupContext](self, "cdmAllServicesWarmupContext");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptContext](self, "cdmSingleServiceWarmupAttemptContext");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptContext](self, "cdmSingleServiceWarmupAttemptContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptFailed](self, "cdmSingleServiceWarmupAttemptFailed");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptFailed](self, "cdmSingleServiceWarmupAttemptFailed");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmAssetsReported](self, "cdmAssetsReported");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    -[NLXSchemaNLXClientEvent cdmAssetsReported](self, "cdmAssetsReported");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent ssuUserRequestContext](self, "ssuUserRequestContext");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    -[NLXSchemaNLXClientEvent ssuUserRequestContext](self, "ssuUserRequestContext");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent ssuBackgroundRequestContext](self, "ssuBackgroundRequestContext");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    -[NLXSchemaNLXClientEvent ssuBackgroundRequestContext](self, "ssuBackgroundRequestContext");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmServiceHandleMetricsReported](self, "cdmServiceHandleMetricsReported");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    -[NLXSchemaNLXClientEvent cdmServiceHandleMetricsReported](self, "cdmServiceHandleMetricsReported");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmServiceSetupMetricsReported](self, "cdmServiceSetupMetricsReported");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    -[NLXSchemaNLXClientEvent cdmServiceSetupMetricsReported](self, "cdmServiceSetupMetricsReported");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent milAssetAcquisitionContext](self, "milAssetAcquisitionContext");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    -[NLXSchemaNLXClientEvent milAssetAcquisitionContext](self, "milAssetAcquisitionContext");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaNLXClientEvent cdmSetupLink](self, "cdmSetupLink");
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    -[NLXSchemaNLXClientEvent cdmSetupLink](self, "cdmSetupLink");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (NLXSchemaNLXClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdmSetupLink, 0);
  objc_storeStrong((id *)&self->_milAssetAcquisitionContext, 0);
  objc_storeStrong((id *)&self->_cdmServiceSetupMetricsReported, 0);
  objc_storeStrong((id *)&self->_cdmServiceHandleMetricsReported, 0);
  objc_storeStrong((id *)&self->_ssuBackgroundRequestContext, 0);
  objc_storeStrong((id *)&self->_ssuUserRequestContext, 0);
  objc_storeStrong((id *)&self->_cdmAssetsReported, 0);
  objc_storeStrong((id *)&self->_cdmSingleServiceWarmupAttemptFailed, 0);
  objc_storeStrong((id *)&self->_cdmSingleServiceWarmupAttemptContext, 0);
  objc_storeStrong((id *)&self->_cdmAllServicesWarmupContext, 0);
  objc_storeStrong((id *)&self->_cdmClientWarmupContext, 0);
  objc_storeStrong((id *)&self->_cdmSetupMissingAssetsDetected, 0);
  objc_storeStrong((id *)&self->_cdmAssetSetupContext, 0);
  objc_storeStrong((id *)&self->_cdmXpcEventProcessingContext, 0);
  objc_storeStrong((id *)&self->_marrsContextualSpanMatcherEndedTier1, 0);
  objc_storeStrong((id *)&self->_marrsContextualSpanMatcherEnded, 0);
  objc_storeStrong((id *)&self->_cdmSpanMatcherContext, 0);
  objc_storeStrong((id *)&self->_cdmSingleServiceSetupAttemptFailed, 0);
  objc_storeStrong((id *)&self->_cdmSingleServiceSetupAttemptContext, 0);
  objc_storeStrong((id *)&self->_cdmAllServicesSetupContext, 0);
  objc_storeStrong((id *)&self->_cdmClientSetupContext, 0);
  objc_storeStrong((id *)&self->_marrsMentionResolverEndedTier1, 0);
  objc_storeStrong((id *)&self->_marrsMentionResolverEnded, 0);
  objc_storeStrong((id *)&self->_marrsMentionDetectorEndedTier1, 0);
  objc_storeStrong((id *)&self->_marrsMentionDetectorEnded, 0);
  objc_storeStrong((id *)&self->_nlxCurareContext, 0);
  objc_storeStrong((id *)&self->_cdmMatchingSpanEndedTier1, 0);
  objc_storeStrong((id *)&self->_marrsQueryRewriteEvaluatedTier1, 0);
  objc_storeStrong((id *)&self->_marrsQueryRewriteContext, 0);
  objc_storeStrong((id *)&self->_marrsRepetitionDetectionContext, 0);
  objc_storeStrong((id *)&self->_cdmContextUpdateEnded, 0);
  objc_storeStrong((id *)&self->_cdmTokenizationEnded, 0);
  objc_storeStrong((id *)&self->_cdmSystemDialogActTier1, 0);
  objc_storeStrong((id *)&self->_cdmDelegatedUserDialogActTier1, 0);
  objc_storeStrong((id *)&self->_nlxLegacyNLContextTier1, 0);
  objc_storeStrong((id *)&self->_cdmMatchingSpanTier1, 0);
  objc_storeStrong((id *)&self->_cdmUsoGraphTier1, 0);
  objc_storeStrong((id *)&self->_cdmMatchingSpanEnded, 0);
  objc_storeStrong((id *)&self->_nlxDeviceFixedContext, 0);
  objc_storeStrong((id *)&self->_cdmRequestContext, 0);
  objc_storeStrong((id *)&self->_cdmServiceContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (NLXSchemaCDMXPCEventProcessingContext)cdmXpcEventProcessingContext
{
  if (self->_whichEvent_Type == 128)
    return self->_cdmXpcEventProcessingContext;
  else
    return (NLXSchemaCDMXPCEventProcessingContext *)0;
}

- (NLXSchemaCDMClientSetupContext)cdmClientSetupContext
{
  if (self->_whichEvent_Type == 121)
    return self->_cdmClientSetupContext;
  else
    return (NLXSchemaCDMClientSetupContext *)0;
}

- (NLXSchemaCDMAllServicesWarmupContext)cdmAllServicesWarmupContext
{
  if (self->_whichEvent_Type == 132)
    return self->_cdmAllServicesWarmupContext;
  else
    return (NLXSchemaCDMAllServicesWarmupContext *)0;
}

- (NLXSchemaCDMAllServicesSetupContext)cdmAllServicesSetupContext
{
  if (self->_whichEvent_Type == 122)
    return self->_cdmAllServicesSetupContext;
  else
    return (NLXSchemaCDMAllServicesSetupContext *)0;
}

- (NLXSchemaCDMAssetSetupContext)cdmAssetSetupContext
{
  if (self->_whichEvent_Type == 129)
    return self->_cdmAssetSetupContext;
  else
    return (NLXSchemaCDMAssetSetupContext *)0;
}

- (NLXSchemaCDMServiceSetupMetricsReported)cdmServiceSetupMetricsReported
{
  if (self->_whichEvent_Type == 139)
    return self->_cdmServiceSetupMetricsReported;
  else
    return (NLXSchemaCDMServiceSetupMetricsReported *)0;
}

- (NLXSchemaSSUUserRequestContext)ssuUserRequestContext
{
  if (self->_whichEvent_Type == 136)
    return self->_ssuUserRequestContext;
  else
    return (NLXSchemaSSUUserRequestContext *)0;
}

- (NLXSchemaSSUBackgroundUpdateContext)ssuBackgroundRequestContext
{
  if (self->_whichEvent_Type == 137)
    return self->_ssuBackgroundRequestContext;
  else
    return (NLXSchemaSSUBackgroundUpdateContext *)0;
}

- (NLXSchemaNLXLegacyNLContextTier1)nlxLegacyNLContextTier1
{
  if (self->_whichEvent_Type == 107)
    return self->_nlxLegacyNLContextTier1;
  else
    return (NLXSchemaNLXLegacyNLContextTier1 *)0;
}

- (NLXSchemaNLXDeviceFixedContext)nlxDeviceFixedContext
{
  if (self->_whichEvent_Type == 103)
    return self->_nlxDeviceFixedContext;
  else
    return (NLXSchemaNLXDeviceFixedContext *)0;
}

- (NLXSchemaNLXCurareContext)nlxCurareContext
{
  if (self->_whichEvent_Type == 116)
    return self->_nlxCurareContext;
  else
    return (NLXSchemaNLXCurareContext *)0;
}

- (NLXSchemaMILAssetAcquisitionContext)milAssetAcquisitionContext
{
  if (self->_whichEvent_Type == 140)
    return self->_milAssetAcquisitionContext;
  else
    return (NLXSchemaMILAssetAcquisitionContext *)0;
}

- (NLXSchemaMARRSRepetitionDetectionContext)marrsRepetitionDetectionContext
{
  if (self->_whichEvent_Type == 112)
    return self->_marrsRepetitionDetectionContext;
  else
    return (NLXSchemaMARRSRepetitionDetectionContext *)0;
}

- (NLXSchemaMARRSQueryRewriteEvaluatedTier1)marrsQueryRewriteEvaluatedTier1
{
  if (self->_whichEvent_Type == 114)
    return self->_marrsQueryRewriteEvaluatedTier1;
  else
    return (NLXSchemaMARRSQueryRewriteEvaluatedTier1 *)0;
}

- (NLXSchemaMARRSQueryRewriteContext)marrsQueryRewriteContext
{
  if (self->_whichEvent_Type == 113)
    return self->_marrsQueryRewriteContext;
  else
    return (NLXSchemaMARRSQueryRewriteContext *)0;
}

- (NLXSchemaMARRSMentionResolverEnded)marrsMentionResolverEnded
{
  if (self->_whichEvent_Type == 119)
    return self->_marrsMentionResolverEnded;
  else
    return (NLXSchemaMARRSMentionResolverEnded *)0;
}

- (NLXSchemaMARRSMentionResolverEndedTier1)marrsMentionResolverEndedTier1
{
  if (self->_whichEvent_Type == 120)
    return self->_marrsMentionResolverEndedTier1;
  else
    return (NLXSchemaMARRSMentionResolverEndedTier1 *)0;
}

- (NLXSchemaMARRSMentionDetectorEnded)marrsMentionDetectorEnded
{
  if (self->_whichEvent_Type == 117)
    return self->_marrsMentionDetectorEnded;
  else
    return (NLXSchemaMARRSMentionDetectorEnded *)0;
}

- (NLXSchemaMARRSMentionDetectorEndedTier1)marrsMentionDetectorEndedTier1
{
  if (self->_whichEvent_Type == 118)
    return self->_marrsMentionDetectorEndedTier1;
  else
    return (NLXSchemaMARRSMentionDetectorEndedTier1 *)0;
}

- (NLXSchemaMARRSContextualSpanMatcherEnded)marrsContextualSpanMatcherEnded
{
  if (self->_whichEvent_Type == 126)
    return self->_marrsContextualSpanMatcherEnded;
  else
    return (NLXSchemaMARRSContextualSpanMatcherEnded *)0;
}

- (NLXSchemaMARRSContextualSpanMatcherEndedTier1)marrsContextualSpanMatcherEndedTier1
{
  if (self->_whichEvent_Type == 127)
    return self->_marrsContextualSpanMatcherEndedTier1;
  else
    return (NLXSchemaMARRSContextualSpanMatcherEndedTier1 *)0;
}

- (NLXSchemaCDMUsoGraphTier1)cdmUsoGraphTier1
{
  if (self->_whichEvent_Type == 105)
    return self->_cdmUsoGraphTier1;
  else
    return (NLXSchemaCDMUsoGraphTier1 *)0;
}

- (NLXSchemaCDMTokenizationEnded)cdmTokenizationEnded
{
  if (self->_whichEvent_Type == 110)
    return self->_cdmTokenizationEnded;
  else
    return (NLXSchemaCDMTokenizationEnded *)0;
}

- (NLXSchemaCDMSystemDialogActTier1)cdmSystemDialogActTier1
{
  if (self->_whichEvent_Type == 109)
    return self->_cdmSystemDialogActTier1;
  else
    return (NLXSchemaCDMSystemDialogActTier1 *)0;
}

- (NLXSchemaCDMSpanMatcherContext)cdmSpanMatcherContext
{
  if (self->_whichEvent_Type == 125)
    return self->_cdmSpanMatcherContext;
  else
    return (NLXSchemaCDMSpanMatcherContext *)0;
}

- (NLXSchemaCDMSingleServiceWarmupAttemptFailed)cdmSingleServiceWarmupAttemptFailed
{
  if (self->_whichEvent_Type == 134)
    return self->_cdmSingleServiceWarmupAttemptFailed;
  else
    return (NLXSchemaCDMSingleServiceWarmupAttemptFailed *)0;
}

- (NLXSchemaCDMSingleServiceWarmupAttemptContext)cdmSingleServiceWarmupAttemptContext
{
  if (self->_whichEvent_Type == 133)
    return self->_cdmSingleServiceWarmupAttemptContext;
  else
    return (NLXSchemaCDMSingleServiceWarmupAttemptContext *)0;
}

- (NLXSchemaCDMSingleServiceSetupAttemptFailed)cdmSingleServiceSetupAttemptFailed
{
  if (self->_whichEvent_Type == 124)
    return self->_cdmSingleServiceSetupAttemptFailed;
  else
    return (NLXSchemaCDMSingleServiceSetupAttemptFailed *)0;
}

- (NLXSchemaCDMSingleServiceSetupAttemptContext)cdmSingleServiceSetupAttemptContext
{
  if (self->_whichEvent_Type == 123)
    return self->_cdmSingleServiceSetupAttemptContext;
  else
    return (NLXSchemaCDMSingleServiceSetupAttemptContext *)0;
}

- (NLXSchemaCDMSetupMissingAssetsDetected)cdmSetupMissingAssetsDetected
{
  if (self->_whichEvent_Type == 130)
    return self->_cdmSetupMissingAssetsDetected;
  else
    return (NLXSchemaCDMSetupMissingAssetsDetected *)0;
}

- (NLXSchemaCDMSetupLink)cdmSetupLink
{
  if (self->_whichEvent_Type == 141)
    return self->_cdmSetupLink;
  else
    return (NLXSchemaCDMSetupLink *)0;
}

- (NLXSchemaCDMServiceHandleMetricsReported)cdmServiceHandleMetricsReported
{
  if (self->_whichEvent_Type == 138)
    return self->_cdmServiceHandleMetricsReported;
  else
    return (NLXSchemaCDMServiceHandleMetricsReported *)0;
}

- (NLXSchemaCDMServiceContext)cdmServiceContext
{
  if (self->_whichEvent_Type == 101)
    return self->_cdmServiceContext;
  else
    return (NLXSchemaCDMServiceContext *)0;
}

- (NLXSchemaCDMRequestContext)cdmRequestContext
{
  if (self->_whichEvent_Type == 102)
    return self->_cdmRequestContext;
  else
    return (NLXSchemaCDMRequestContext *)0;
}

- (NLXSchemaCDMMatchingSpanTier1)cdmMatchingSpanTier1
{
  if (self->_whichEvent_Type == 106)
    return self->_cdmMatchingSpanTier1;
  else
    return (NLXSchemaCDMMatchingSpanTier1 *)0;
}

- (NLXSchemaCDMMatchingSpanEnded)cdmMatchingSpanEnded
{
  if (self->_whichEvent_Type == 104)
    return self->_cdmMatchingSpanEnded;
  else
    return (NLXSchemaCDMMatchingSpanEnded *)0;
}

- (NLXSchemaCDMMatchingSpanEndedTier1)cdmMatchingSpanEndedTier1
{
  if (self->_whichEvent_Type == 115)
    return self->_cdmMatchingSpanEndedTier1;
  else
    return (NLXSchemaCDMMatchingSpanEndedTier1 *)0;
}

- (NLXSchemaCDMDelegatedUserDialogActTier1)cdmDelegatedUserDialogActTier1
{
  if (self->_whichEvent_Type == 108)
    return self->_cdmDelegatedUserDialogActTier1;
  else
    return (NLXSchemaCDMDelegatedUserDialogActTier1 *)0;
}

- (NLXSchemaCDMContextUpdateEnded)cdmContextUpdateEnded
{
  if (self->_whichEvent_Type == 111)
    return self->_cdmContextUpdateEnded;
  else
    return (NLXSchemaCDMContextUpdateEnded *)0;
}

- (NLXSchemaCDMClientWarmupContext)cdmClientWarmupContext
{
  if (self->_whichEvent_Type == 131)
    return self->_cdmClientWarmupContext;
  else
    return (NLXSchemaCDMClientWarmupContext *)0;
}

- (NLXSchemaCDMAssetsReported)cdmAssetsReported
{
  if (self->_whichEvent_Type == 135)
    return self->_cdmAssetsReported;
  else
    return (NLXSchemaCDMAssetsReported *)0;
}

- (void)setCdmAssetSetupContext:(id)a3
{
  NLXSchemaCDMAssetSetupContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;

  v4 = (NLXSchemaCDMAssetSetupContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 129;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = v4;

}

- (void)setCdmClientSetupContext:(id)a3
{
  NLXSchemaCDMClientSetupContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;

  v4 = (NLXSchemaCDMClientSetupContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 121;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = v4;

}

- (void)setCdmAllServicesWarmupContext:(id)a3
{
  NLXSchemaCDMAllServicesWarmupContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;

  v4 = (NLXSchemaCDMAllServicesWarmupContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 132;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = v4;

}

- (void)setCdmAllServicesSetupContext:(id)a3
{
  NLXSchemaCDMAllServicesSetupContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;

  v4 = (NLXSchemaCDMAllServicesSetupContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 122;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = v4;

}

- (void)setCdmServiceSetupMetricsReported:(id)a3
{
  NLXSchemaCDMServiceSetupMetricsReported *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;

  v4 = (NLXSchemaCDMServiceSetupMetricsReported *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 139;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = v4;

}

- (void)setCdmAssetsReported:(id)a3
{
  NLXSchemaCDMAssetsReported *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;

  v4 = (NLXSchemaCDMAssetsReported *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 135;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = v4;

}

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

  -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nlId");
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
  -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
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
  -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
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

  -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nlId");
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
    LODWORD(v9) = 7;
  }
  else
  {
LABEL_5:
    -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
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
      -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
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
  id v132;
  objc_super v134;

  v4 = a3;
  v134.receiver = self;
  v134.super_class = (Class)NLXSchemaNLXClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v134, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[NLXSchemaNLXClientEvent deleteCdmUsoGraphTier1](self, "deleteCdmUsoGraphTier1");
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanTier1](self, "deleteCdmMatchingSpanTier1");
    -[NLXSchemaNLXClientEvent deleteNlxLegacyNLContextTier1](self, "deleteNlxLegacyNLContextTier1");
    -[NLXSchemaNLXClientEvent deleteCdmDelegatedUserDialogActTier1](self, "deleteCdmDelegatedUserDialogActTier1");
    -[NLXSchemaNLXClientEvent deleteCdmSystemDialogActTier1](self, "deleteCdmSystemDialogActTier1");
    -[NLXSchemaNLXClientEvent deleteCdmTokenizationEnded](self, "deleteCdmTokenizationEnded");
    -[NLXSchemaNLXClientEvent deleteMarrsQueryRewriteEvaluatedTier1](self, "deleteMarrsQueryRewriteEvaluatedTier1");
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanEndedTier1](self, "deleteCdmMatchingSpanEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsMentionDetectorEndedTier1](self, "deleteMarrsMentionDetectorEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsMentionResolverEndedTier1](self, "deleteMarrsMentionResolverEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsContextualSpanMatcherEndedTier1](self, "deleteMarrsContextualSpanMatcherEndedTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[NLXSchemaNLXClientEvent deleteCdmUsoGraphTier1](self, "deleteCdmUsoGraphTier1");
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanTier1](self, "deleteCdmMatchingSpanTier1");
    -[NLXSchemaNLXClientEvent deleteNlxLegacyNLContextTier1](self, "deleteNlxLegacyNLContextTier1");
    -[NLXSchemaNLXClientEvent deleteCdmDelegatedUserDialogActTier1](self, "deleteCdmDelegatedUserDialogActTier1");
    -[NLXSchemaNLXClientEvent deleteCdmSystemDialogActTier1](self, "deleteCdmSystemDialogActTier1");
    -[NLXSchemaNLXClientEvent deleteCdmTokenizationEnded](self, "deleteCdmTokenizationEnded");
    -[NLXSchemaNLXClientEvent deleteMarrsQueryRewriteEvaluatedTier1](self, "deleteMarrsQueryRewriteEvaluatedTier1");
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanEndedTier1](self, "deleteCdmMatchingSpanEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsMentionDetectorEndedTier1](self, "deleteMarrsMentionDetectorEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsMentionResolverEndedTier1](self, "deleteMarrsMentionResolverEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsContextualSpanMatcherEndedTier1](self, "deleteMarrsContextualSpanMatcherEndedTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[NLXSchemaNLXClientEvent deleteCdmUsoGraphTier1](self, "deleteCdmUsoGraphTier1");
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanTier1](self, "deleteCdmMatchingSpanTier1");
    -[NLXSchemaNLXClientEvent deleteNlxLegacyNLContextTier1](self, "deleteNlxLegacyNLContextTier1");
    -[NLXSchemaNLXClientEvent deleteCdmDelegatedUserDialogActTier1](self, "deleteCdmDelegatedUserDialogActTier1");
    -[NLXSchemaNLXClientEvent deleteCdmSystemDialogActTier1](self, "deleteCdmSystemDialogActTier1");
    -[NLXSchemaNLXClientEvent deleteCdmTokenizationEnded](self, "deleteCdmTokenizationEnded");
    -[NLXSchemaNLXClientEvent deleteMarrsQueryRewriteEvaluatedTier1](self, "deleteMarrsQueryRewriteEvaluatedTier1");
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanEndedTier1](self, "deleteCdmMatchingSpanEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsMentionDetectorEndedTier1](self, "deleteMarrsMentionDetectorEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsMentionResolverEndedTier1](self, "deleteMarrsMentionResolverEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsContextualSpanMatcherEndedTier1](self, "deleteMarrsContextualSpanMatcherEndedTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[NLXSchemaNLXClientEvent deleteCdmUsoGraphTier1](self, "deleteCdmUsoGraphTier1");
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanTier1](self, "deleteCdmMatchingSpanTier1");
    -[NLXSchemaNLXClientEvent deleteNlxLegacyNLContextTier1](self, "deleteNlxLegacyNLContextTier1");
    -[NLXSchemaNLXClientEvent deleteCdmDelegatedUserDialogActTier1](self, "deleteCdmDelegatedUserDialogActTier1");
    -[NLXSchemaNLXClientEvent deleteCdmSystemDialogActTier1](self, "deleteCdmSystemDialogActTier1");
    -[NLXSchemaNLXClientEvent deleteCdmTokenizationEnded](self, "deleteCdmTokenizationEnded");
    -[NLXSchemaNLXClientEvent deleteMarrsQueryRewriteEvaluatedTier1](self, "deleteMarrsQueryRewriteEvaluatedTier1");
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanEndedTier1](self, "deleteCdmMatchingSpanEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsMentionDetectorEndedTier1](self, "deleteMarrsMentionDetectorEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsMentionResolverEndedTier1](self, "deleteMarrsMentionResolverEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsContextualSpanMatcherEndedTier1](self, "deleteMarrsContextualSpanMatcherEndedTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[NLXSchemaNLXClientEvent deleteCdmUsoGraphTier1](self, "deleteCdmUsoGraphTier1");
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanTier1](self, "deleteCdmMatchingSpanTier1");
    -[NLXSchemaNLXClientEvent deleteNlxLegacyNLContextTier1](self, "deleteNlxLegacyNLContextTier1");
    -[NLXSchemaNLXClientEvent deleteCdmDelegatedUserDialogActTier1](self, "deleteCdmDelegatedUserDialogActTier1");
    -[NLXSchemaNLXClientEvent deleteCdmSystemDialogActTier1](self, "deleteCdmSystemDialogActTier1");
    -[NLXSchemaNLXClientEvent deleteCdmTokenizationEnded](self, "deleteCdmTokenizationEnded");
    -[NLXSchemaNLXClientEvent deleteMarrsQueryRewriteEvaluatedTier1](self, "deleteMarrsQueryRewriteEvaluatedTier1");
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanEndedTier1](self, "deleteCdmMatchingSpanEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsMentionDetectorEndedTier1](self, "deleteMarrsMentionDetectorEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsMentionResolverEndedTier1](self, "deleteMarrsMentionResolverEndedTier1");
    -[NLXSchemaNLXClientEvent deleteMarrsContextualSpanMatcherEndedTier1](self, "deleteMarrsContextualSpanMatcherEndedTier1");
  }
  -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaNLXClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[NLXSchemaNLXClientEvent cdmServiceContext](self, "cdmServiceContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLXSchemaNLXClientEvent deleteCdmServiceContext](self, "deleteCdmServiceContext");
  -[NLXSchemaNLXClientEvent cdmRequestContext](self, "cdmRequestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[NLXSchemaNLXClientEvent deleteCdmRequestContext](self, "deleteCdmRequestContext");
  -[NLXSchemaNLXClientEvent nlxDeviceFixedContext](self, "nlxDeviceFixedContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[NLXSchemaNLXClientEvent deleteNlxDeviceFixedContext](self, "deleteNlxDeviceFixedContext");
  -[NLXSchemaNLXClientEvent cdmMatchingSpanEnded](self, "cdmMatchingSpanEnded");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanEnded](self, "deleteCdmMatchingSpanEnded");
  -[NLXSchemaNLXClientEvent cdmUsoGraphTier1](self, "cdmUsoGraphTier1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[NLXSchemaNLXClientEvent deleteCdmUsoGraphTier1](self, "deleteCdmUsoGraphTier1");
  -[NLXSchemaNLXClientEvent cdmMatchingSpanTier1](self, "cdmMatchingSpanTier1");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanTier1](self, "deleteCdmMatchingSpanTier1");
  -[NLXSchemaNLXClientEvent nlxLegacyNLContextTier1](self, "nlxLegacyNLContextTier1");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[NLXSchemaNLXClientEvent deleteNlxLegacyNLContextTier1](self, "deleteNlxLegacyNLContextTier1");
  -[NLXSchemaNLXClientEvent cdmDelegatedUserDialogActTier1](self, "cdmDelegatedUserDialogActTier1");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[NLXSchemaNLXClientEvent deleteCdmDelegatedUserDialogActTier1](self, "deleteCdmDelegatedUserDialogActTier1");
  -[NLXSchemaNLXClientEvent cdmSystemDialogActTier1](self, "cdmSystemDialogActTier1");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[NLXSchemaNLXClientEvent deleteCdmSystemDialogActTier1](self, "deleteCdmSystemDialogActTier1");
  -[NLXSchemaNLXClientEvent cdmTokenizationEnded](self, "cdmTokenizationEnded");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[NLXSchemaNLXClientEvent deleteCdmTokenizationEnded](self, "deleteCdmTokenizationEnded");
  -[NLXSchemaNLXClientEvent cdmContextUpdateEnded](self, "cdmContextUpdateEnded");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[NLXSchemaNLXClientEvent deleteCdmContextUpdateEnded](self, "deleteCdmContextUpdateEnded");
  -[NLXSchemaNLXClientEvent marrsRepetitionDetectionContext](self, "marrsRepetitionDetectionContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[NLXSchemaNLXClientEvent deleteMarrsRepetitionDetectionContext](self, "deleteMarrsRepetitionDetectionContext");
  -[NLXSchemaNLXClientEvent marrsQueryRewriteContext](self, "marrsQueryRewriteContext");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[NLXSchemaNLXClientEvent deleteMarrsQueryRewriteContext](self, "deleteMarrsQueryRewriteContext");
  -[NLXSchemaNLXClientEvent marrsQueryRewriteEvaluatedTier1](self, "marrsQueryRewriteEvaluatedTier1");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[NLXSchemaNLXClientEvent deleteMarrsQueryRewriteEvaluatedTier1](self, "deleteMarrsQueryRewriteEvaluatedTier1");
  -[NLXSchemaNLXClientEvent cdmMatchingSpanEndedTier1](self, "cdmMatchingSpanEndedTier1");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[NLXSchemaNLXClientEvent deleteCdmMatchingSpanEndedTier1](self, "deleteCdmMatchingSpanEndedTier1");
  -[NLXSchemaNLXClientEvent nlxCurareContext](self, "nlxCurareContext");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[NLXSchemaNLXClientEvent deleteNlxCurareContext](self, "deleteNlxCurareContext");
  -[NLXSchemaNLXClientEvent marrsMentionDetectorEnded](self, "marrsMentionDetectorEnded");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applySensitiveConditionsPolicy:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "suppressMessage");

  if (v59)
    -[NLXSchemaNLXClientEvent deleteMarrsMentionDetectorEnded](self, "deleteMarrsMentionDetectorEnded");
  -[NLXSchemaNLXClientEvent marrsMentionDetectorEndedTier1](self, "marrsMentionDetectorEndedTier1");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "applySensitiveConditionsPolicy:", v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "suppressMessage");

  if (v62)
    -[NLXSchemaNLXClientEvent deleteMarrsMentionDetectorEndedTier1](self, "deleteMarrsMentionDetectorEndedTier1");
  -[NLXSchemaNLXClientEvent marrsMentionResolverEnded](self, "marrsMentionResolverEnded");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "applySensitiveConditionsPolicy:", v4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "suppressMessage");

  if (v65)
    -[NLXSchemaNLXClientEvent deleteMarrsMentionResolverEnded](self, "deleteMarrsMentionResolverEnded");
  -[NLXSchemaNLXClientEvent marrsMentionResolverEndedTier1](self, "marrsMentionResolverEndedTier1");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "applySensitiveConditionsPolicy:", v4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "suppressMessage");

  if (v68)
    -[NLXSchemaNLXClientEvent deleteMarrsMentionResolverEndedTier1](self, "deleteMarrsMentionResolverEndedTier1");
  -[NLXSchemaNLXClientEvent cdmClientSetupContext](self, "cdmClientSetupContext");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "applySensitiveConditionsPolicy:", v4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "suppressMessage");

  if (v71)
    -[NLXSchemaNLXClientEvent deleteCdmClientSetupContext](self, "deleteCdmClientSetupContext");
  -[NLXSchemaNLXClientEvent cdmAllServicesSetupContext](self, "cdmAllServicesSetupContext");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "applySensitiveConditionsPolicy:", v4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "suppressMessage");

  if (v74)
    -[NLXSchemaNLXClientEvent deleteCdmAllServicesSetupContext](self, "deleteCdmAllServicesSetupContext");
  -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptContext](self, "cdmSingleServiceSetupAttemptContext");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "applySensitiveConditionsPolicy:", v4);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "suppressMessage");

  if (v77)
    -[NLXSchemaNLXClientEvent deleteCdmSingleServiceSetupAttemptContext](self, "deleteCdmSingleServiceSetupAttemptContext");
  -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptFailed](self, "cdmSingleServiceSetupAttemptFailed");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "applySensitiveConditionsPolicy:", v4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "suppressMessage");

  if (v80)
    -[NLXSchemaNLXClientEvent deleteCdmSingleServiceSetupAttemptFailed](self, "deleteCdmSingleServiceSetupAttemptFailed");
  -[NLXSchemaNLXClientEvent cdmSpanMatcherContext](self, "cdmSpanMatcherContext");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "applySensitiveConditionsPolicy:", v4);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "suppressMessage");

  if (v83)
    -[NLXSchemaNLXClientEvent deleteCdmSpanMatcherContext](self, "deleteCdmSpanMatcherContext");
  -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEnded](self, "marrsContextualSpanMatcherEnded");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "applySensitiveConditionsPolicy:", v4);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "suppressMessage");

  if (v86)
    -[NLXSchemaNLXClientEvent deleteMarrsContextualSpanMatcherEnded](self, "deleteMarrsContextualSpanMatcherEnded");
  -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEndedTier1](self, "marrsContextualSpanMatcherEndedTier1");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "applySensitiveConditionsPolicy:", v4);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "suppressMessage");

  if (v89)
    -[NLXSchemaNLXClientEvent deleteMarrsContextualSpanMatcherEndedTier1](self, "deleteMarrsContextualSpanMatcherEndedTier1");
  -[NLXSchemaNLXClientEvent cdmXpcEventProcessingContext](self, "cdmXpcEventProcessingContext");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "applySensitiveConditionsPolicy:", v4);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "suppressMessage");

  if (v92)
    -[NLXSchemaNLXClientEvent deleteCdmXpcEventProcessingContext](self, "deleteCdmXpcEventProcessingContext");
  -[NLXSchemaNLXClientEvent cdmAssetSetupContext](self, "cdmAssetSetupContext");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "applySensitiveConditionsPolicy:", v4);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "suppressMessage");

  if (v95)
    -[NLXSchemaNLXClientEvent deleteCdmAssetSetupContext](self, "deleteCdmAssetSetupContext");
  -[NLXSchemaNLXClientEvent cdmSetupMissingAssetsDetected](self, "cdmSetupMissingAssetsDetected");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "applySensitiveConditionsPolicy:", v4);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "suppressMessage");

  if (v98)
    -[NLXSchemaNLXClientEvent deleteCdmSetupMissingAssetsDetected](self, "deleteCdmSetupMissingAssetsDetected");
  -[NLXSchemaNLXClientEvent cdmClientWarmupContext](self, "cdmClientWarmupContext");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "applySensitiveConditionsPolicy:", v4);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "suppressMessage");

  if (v101)
    -[NLXSchemaNLXClientEvent deleteCdmClientWarmupContext](self, "deleteCdmClientWarmupContext");
  -[NLXSchemaNLXClientEvent cdmAllServicesWarmupContext](self, "cdmAllServicesWarmupContext");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "applySensitiveConditionsPolicy:", v4);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "suppressMessage");

  if (v104)
    -[NLXSchemaNLXClientEvent deleteCdmAllServicesWarmupContext](self, "deleteCdmAllServicesWarmupContext");
  -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptContext](self, "cdmSingleServiceWarmupAttemptContext");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "applySensitiveConditionsPolicy:", v4);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "suppressMessage");

  if (v107)
    -[NLXSchemaNLXClientEvent deleteCdmSingleServiceWarmupAttemptContext](self, "deleteCdmSingleServiceWarmupAttemptContext");
  -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptFailed](self, "cdmSingleServiceWarmupAttemptFailed");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "applySensitiveConditionsPolicy:", v4);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "suppressMessage");

  if (v110)
    -[NLXSchemaNLXClientEvent deleteCdmSingleServiceWarmupAttemptFailed](self, "deleteCdmSingleServiceWarmupAttemptFailed");
  -[NLXSchemaNLXClientEvent cdmAssetsReported](self, "cdmAssetsReported");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "applySensitiveConditionsPolicy:", v4);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v112, "suppressMessage");

  if (v113)
    -[NLXSchemaNLXClientEvent deleteCdmAssetsReported](self, "deleteCdmAssetsReported");
  -[NLXSchemaNLXClientEvent ssuUserRequestContext](self, "ssuUserRequestContext");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "applySensitiveConditionsPolicy:", v4);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "suppressMessage");

  if (v116)
    -[NLXSchemaNLXClientEvent deleteSsuUserRequestContext](self, "deleteSsuUserRequestContext");
  -[NLXSchemaNLXClientEvent ssuBackgroundRequestContext](self, "ssuBackgroundRequestContext");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "applySensitiveConditionsPolicy:", v4);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v118, "suppressMessage");

  if (v119)
    -[NLXSchemaNLXClientEvent deleteSsuBackgroundRequestContext](self, "deleteSsuBackgroundRequestContext");
  -[NLXSchemaNLXClientEvent cdmServiceHandleMetricsReported](self, "cdmServiceHandleMetricsReported");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "applySensitiveConditionsPolicy:", v4);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(v121, "suppressMessage");

  if (v122)
    -[NLXSchemaNLXClientEvent deleteCdmServiceHandleMetricsReported](self, "deleteCdmServiceHandleMetricsReported");
  -[NLXSchemaNLXClientEvent cdmServiceSetupMetricsReported](self, "cdmServiceSetupMetricsReported");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "applySensitiveConditionsPolicy:", v4);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v124, "suppressMessage");

  if (v125)
    -[NLXSchemaNLXClientEvent deleteCdmServiceSetupMetricsReported](self, "deleteCdmServiceSetupMetricsReported");
  -[NLXSchemaNLXClientEvent milAssetAcquisitionContext](self, "milAssetAcquisitionContext");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "applySensitiveConditionsPolicy:", v4);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(v127, "suppressMessage");

  if (v128)
    -[NLXSchemaNLXClientEvent deleteMilAssetAcquisitionContext](self, "deleteMilAssetAcquisitionContext");
  -[NLXSchemaNLXClientEvent cdmSetupLink](self, "cdmSetupLink");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "applySensitiveConditionsPolicy:", v4);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v130, "suppressMessage");

  if (v131)
    -[NLXSchemaNLXClientEvent deleteCdmSetupLink](self, "deleteCdmSetupLink");
  v132 = v5;

  return v132;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[NLXSchemaNLXClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 0x28)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562A048[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0x28)
    return 0;
  else
    return off_1E562A190[a3 - 101];
}

- (void)deleteEventMetadata
{
  -[NLXSchemaNLXClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setCdmServiceContext:(id)a3
{
  NLXSchemaCDMServiceContext *v4;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMServiceContext *cdmServiceContext;

  v4 = (NLXSchemaCDMServiceContext *)a3;
  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 101;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = v4;

}

- (void)deleteCdmServiceContext
{
  NLXSchemaCDMServiceContext *cdmServiceContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    cdmServiceContext = self->_cdmServiceContext;
    self->_cdmServiceContext = 0;

  }
}

- (void)setCdmRequestContext:(id)a3
{
  NLXSchemaCDMRequestContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMRequestContext *cdmRequestContext;

  v4 = (NLXSchemaCDMRequestContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 102;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = v4;

}

- (void)deleteCdmRequestContext
{
  NLXSchemaCDMRequestContext *cdmRequestContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    cdmRequestContext = self->_cdmRequestContext;
    self->_cdmRequestContext = 0;

  }
}

- (void)setNlxDeviceFixedContext:(id)a3
{
  NLXSchemaNLXDeviceFixedContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;

  v4 = (NLXSchemaNLXDeviceFixedContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 103;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = v4;

}

- (void)deleteNlxDeviceFixedContext
{
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
    self->_nlxDeviceFixedContext = 0;

  }
}

- (void)setCdmMatchingSpanEnded:(id)a3
{
  NLXSchemaCDMMatchingSpanEnded *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;

  v4 = (NLXSchemaCDMMatchingSpanEnded *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 104;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = v4;

}

- (void)deleteCdmMatchingSpanEnded
{
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
    self->_cdmMatchingSpanEnded = 0;

  }
}

- (void)setCdmUsoGraphTier1:(id)a3
{
  NLXSchemaCDMUsoGraphTier1 *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;

  v4 = (NLXSchemaCDMUsoGraphTier1 *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 105;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = v4;

}

- (void)deleteCdmUsoGraphTier1
{
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
    self->_cdmUsoGraphTier1 = 0;

  }
}

- (void)setCdmMatchingSpanTier1:(id)a3
{
  NLXSchemaCDMMatchingSpanTier1 *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;

  v4 = (NLXSchemaCDMMatchingSpanTier1 *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 106;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = v4;

}

- (void)deleteCdmMatchingSpanTier1
{
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
    self->_cdmMatchingSpanTier1 = 0;

  }
}

- (void)setNlxLegacyNLContextTier1:(id)a3
{
  NLXSchemaNLXLegacyNLContextTier1 *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;

  v4 = (NLXSchemaNLXLegacyNLContextTier1 *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 107;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = v4;

}

- (void)deleteNlxLegacyNLContextTier1
{
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
    self->_nlxLegacyNLContextTier1 = 0;

  }
}

- (void)setCdmDelegatedUserDialogActTier1:(id)a3
{
  NLXSchemaCDMDelegatedUserDialogActTier1 *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;

  v4 = (NLXSchemaCDMDelegatedUserDialogActTier1 *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 108;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = v4;

}

- (void)deleteCdmDelegatedUserDialogActTier1
{
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
    self->_cdmDelegatedUserDialogActTier1 = 0;

  }
}

- (void)setCdmSystemDialogActTier1:(id)a3
{
  NLXSchemaCDMSystemDialogActTier1 *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;

  v4 = (NLXSchemaCDMSystemDialogActTier1 *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 109;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = v4;

}

- (void)deleteCdmSystemDialogActTier1
{
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
    self->_cdmSystemDialogActTier1 = 0;

  }
}

- (void)setCdmTokenizationEnded:(id)a3
{
  NLXSchemaCDMTokenizationEnded *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;

  v4 = (NLXSchemaCDMTokenizationEnded *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 110;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = v4;

}

- (void)deleteCdmTokenizationEnded
{
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;

  if (self->_whichEvent_Type == 110)
  {
    self->_whichEvent_Type = 0;
    cdmTokenizationEnded = self->_cdmTokenizationEnded;
    self->_cdmTokenizationEnded = 0;

  }
}

- (void)setCdmContextUpdateEnded:(id)a3
{
  NLXSchemaCDMContextUpdateEnded *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;

  v4 = (NLXSchemaCDMContextUpdateEnded *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 111;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = v4;

}

- (void)deleteCdmContextUpdateEnded
{
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;

  if (self->_whichEvent_Type == 111)
  {
    self->_whichEvent_Type = 0;
    cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
    self->_cdmContextUpdateEnded = 0;

  }
}

- (void)setMarrsRepetitionDetectionContext:(id)a3
{
  NLXSchemaMARRSRepetitionDetectionContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;

  v4 = (NLXSchemaMARRSRepetitionDetectionContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 112;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = v4;

}

- (void)deleteMarrsRepetitionDetectionContext
{
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;

  if (self->_whichEvent_Type == 112)
  {
    self->_whichEvent_Type = 0;
    marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
    self->_marrsRepetitionDetectionContext = 0;

  }
}

- (void)setMarrsQueryRewriteContext:(id)a3
{
  NLXSchemaMARRSQueryRewriteContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;

  v4 = (NLXSchemaMARRSQueryRewriteContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 113;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = v4;

}

- (void)deleteMarrsQueryRewriteContext
{
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;

  if (self->_whichEvent_Type == 113)
  {
    self->_whichEvent_Type = 0;
    marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
    self->_marrsQueryRewriteContext = 0;

  }
}

- (void)setMarrsQueryRewriteEvaluatedTier1:(id)a3
{
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;

  v4 = (NLXSchemaMARRSQueryRewriteEvaluatedTier1 *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 114;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = v4;

}

- (void)deleteMarrsQueryRewriteEvaluatedTier1
{
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;

  if (self->_whichEvent_Type == 114)
  {
    self->_whichEvent_Type = 0;
    marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
    self->_marrsQueryRewriteEvaluatedTier1 = 0;

  }
}

- (void)setCdmMatchingSpanEndedTier1:(id)a3
{
  NLXSchemaCDMMatchingSpanEndedTier1 *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;

  v4 = (NLXSchemaCDMMatchingSpanEndedTier1 *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 115;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = v4;

}

- (void)deleteCdmMatchingSpanEndedTier1
{
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;

  if (self->_whichEvent_Type == 115)
  {
    self->_whichEvent_Type = 0;
    cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
    self->_cdmMatchingSpanEndedTier1 = 0;

  }
}

- (void)setNlxCurareContext:(id)a3
{
  NLXSchemaNLXCurareContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaNLXCurareContext *nlxCurareContext;

  v4 = (NLXSchemaNLXCurareContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 116;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = v4;

}

- (void)deleteNlxCurareContext
{
  NLXSchemaNLXCurareContext *nlxCurareContext;

  if (self->_whichEvent_Type == 116)
  {
    self->_whichEvent_Type = 0;
    nlxCurareContext = self->_nlxCurareContext;
    self->_nlxCurareContext = 0;

  }
}

- (void)setMarrsMentionDetectorEnded:(id)a3
{
  NLXSchemaMARRSMentionDetectorEnded *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;

  v4 = (NLXSchemaMARRSMentionDetectorEnded *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 117;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = v4;

}

- (void)deleteMarrsMentionDetectorEnded
{
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;

  if (self->_whichEvent_Type == 117)
  {
    self->_whichEvent_Type = 0;
    marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
    self->_marrsMentionDetectorEnded = 0;

  }
}

- (void)setMarrsMentionDetectorEndedTier1:(id)a3
{
  NLXSchemaMARRSMentionDetectorEndedTier1 *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;

  v4 = (NLXSchemaMARRSMentionDetectorEndedTier1 *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 118;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = v4;

}

- (void)deleteMarrsMentionDetectorEndedTier1
{
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;

  if (self->_whichEvent_Type == 118)
  {
    self->_whichEvent_Type = 0;
    marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
    self->_marrsMentionDetectorEndedTier1 = 0;

  }
}

- (void)setMarrsMentionResolverEnded:(id)a3
{
  NLXSchemaMARRSMentionResolverEnded *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;

  v4 = (NLXSchemaMARRSMentionResolverEnded *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 119;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = v4;

}

- (void)deleteMarrsMentionResolverEnded
{
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;

  if (self->_whichEvent_Type == 119)
  {
    self->_whichEvent_Type = 0;
    marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
    self->_marrsMentionResolverEnded = 0;

  }
}

- (void)setMarrsMentionResolverEndedTier1:(id)a3
{
  NLXSchemaMARRSMentionResolverEndedTier1 *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;

  v4 = (NLXSchemaMARRSMentionResolverEndedTier1 *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 120;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = v4;

}

- (void)deleteMarrsMentionResolverEndedTier1
{
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;

  if (self->_whichEvent_Type == 120)
  {
    self->_whichEvent_Type = 0;
    marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
    self->_marrsMentionResolverEndedTier1 = 0;

  }
}

- (void)deleteCdmClientSetupContext
{
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;

  if (self->_whichEvent_Type == 121)
  {
    self->_whichEvent_Type = 0;
    cdmClientSetupContext = self->_cdmClientSetupContext;
    self->_cdmClientSetupContext = 0;

  }
}

- (void)deleteCdmAllServicesSetupContext
{
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;

  if (self->_whichEvent_Type == 122)
  {
    self->_whichEvent_Type = 0;
    cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
    self->_cdmAllServicesSetupContext = 0;

  }
}

- (void)setCdmSingleServiceSetupAttemptContext:(id)a3
{
  NLXSchemaCDMSingleServiceSetupAttemptContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;

  v4 = (NLXSchemaCDMSingleServiceSetupAttemptContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 123;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = v4;

}

- (void)deleteCdmSingleServiceSetupAttemptContext
{
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;

  if (self->_whichEvent_Type == 123)
  {
    self->_whichEvent_Type = 0;
    cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
    self->_cdmSingleServiceSetupAttemptContext = 0;

  }
}

- (void)setCdmSingleServiceSetupAttemptFailed:(id)a3
{
  NLXSchemaCDMSingleServiceSetupAttemptFailed *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;

  v4 = (NLXSchemaCDMSingleServiceSetupAttemptFailed *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 124;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = v4;

}

- (void)deleteCdmSingleServiceSetupAttemptFailed
{
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;

  if (self->_whichEvent_Type == 124)
  {
    self->_whichEvent_Type = 0;
    cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
    self->_cdmSingleServiceSetupAttemptFailed = 0;

  }
}

- (void)setCdmSpanMatcherContext:(id)a3
{
  NLXSchemaCDMSpanMatcherContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;

  v4 = (NLXSchemaCDMSpanMatcherContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 125;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = v4;

}

- (void)deleteCdmSpanMatcherContext
{
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;

  if (self->_whichEvent_Type == 125)
  {
    self->_whichEvent_Type = 0;
    cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
    self->_cdmSpanMatcherContext = 0;

  }
}

- (void)setMarrsContextualSpanMatcherEnded:(id)a3
{
  NLXSchemaMARRSContextualSpanMatcherEnded *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;

  v4 = (NLXSchemaMARRSContextualSpanMatcherEnded *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 126;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = v4;

}

- (void)deleteMarrsContextualSpanMatcherEnded
{
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;

  if (self->_whichEvent_Type == 126)
  {
    self->_whichEvent_Type = 0;
    marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
    self->_marrsContextualSpanMatcherEnded = 0;

  }
}

- (void)setMarrsContextualSpanMatcherEndedTier1:(id)a3
{
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;

  v4 = (NLXSchemaMARRSContextualSpanMatcherEndedTier1 *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 127;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = v4;

}

- (void)deleteMarrsContextualSpanMatcherEndedTier1
{
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;

  if (self->_whichEvent_Type == 127)
  {
    self->_whichEvent_Type = 0;
    marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
    self->_marrsContextualSpanMatcherEndedTier1 = 0;

  }
}

- (void)setCdmXpcEventProcessingContext:(id)a3
{
  NLXSchemaCDMXPCEventProcessingContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;

  v4 = (NLXSchemaCDMXPCEventProcessingContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  self->_whichEvent_Type = (unint64_t)(v4 != 0) << 7;
  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = v4;

}

- (void)deleteCdmXpcEventProcessingContext
{
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;

  if (self->_whichEvent_Type == 128)
  {
    self->_whichEvent_Type = 0;
    cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
    self->_cdmXpcEventProcessingContext = 0;

  }
}

- (void)deleteCdmAssetSetupContext
{
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;

  if (self->_whichEvent_Type == 129)
  {
    self->_whichEvent_Type = 0;
    cdmAssetSetupContext = self->_cdmAssetSetupContext;
    self->_cdmAssetSetupContext = 0;

  }
}

- (void)setCdmSetupMissingAssetsDetected:(id)a3
{
  NLXSchemaCDMSetupMissingAssetsDetected *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;

  v4 = (NLXSchemaCDMSetupMissingAssetsDetected *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 130;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = v4;

}

- (void)deleteCdmSetupMissingAssetsDetected
{
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;

  if (self->_whichEvent_Type == 130)
  {
    self->_whichEvent_Type = 0;
    cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
    self->_cdmSetupMissingAssetsDetected = 0;

  }
}

- (void)setCdmClientWarmupContext:(id)a3
{
  NLXSchemaCDMClientWarmupContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;

  v4 = (NLXSchemaCDMClientWarmupContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 131;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = v4;

}

- (void)deleteCdmClientWarmupContext
{
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;

  if (self->_whichEvent_Type == 131)
  {
    self->_whichEvent_Type = 0;
    cdmClientWarmupContext = self->_cdmClientWarmupContext;
    self->_cdmClientWarmupContext = 0;

  }
}

- (void)deleteCdmAllServicesWarmupContext
{
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;

  if (self->_whichEvent_Type == 132)
  {
    self->_whichEvent_Type = 0;
    cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
    self->_cdmAllServicesWarmupContext = 0;

  }
}

- (void)setCdmSingleServiceWarmupAttemptContext:(id)a3
{
  NLXSchemaCDMSingleServiceWarmupAttemptContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;

  v4 = (NLXSchemaCDMSingleServiceWarmupAttemptContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 133;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = v4;

}

- (void)deleteCdmSingleServiceWarmupAttemptContext
{
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;

  if (self->_whichEvent_Type == 133)
  {
    self->_whichEvent_Type = 0;
    cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
    self->_cdmSingleServiceWarmupAttemptContext = 0;

  }
}

- (void)setCdmSingleServiceWarmupAttemptFailed:(id)a3
{
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;

  v4 = (NLXSchemaCDMSingleServiceWarmupAttemptFailed *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 134;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = v4;

}

- (void)deleteCdmSingleServiceWarmupAttemptFailed
{
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;

  if (self->_whichEvent_Type == 134)
  {
    self->_whichEvent_Type = 0;
    cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
    self->_cdmSingleServiceWarmupAttemptFailed = 0;

  }
}

- (void)deleteCdmAssetsReported
{
  NLXSchemaCDMAssetsReported *cdmAssetsReported;

  if (self->_whichEvent_Type == 135)
  {
    self->_whichEvent_Type = 0;
    cdmAssetsReported = self->_cdmAssetsReported;
    self->_cdmAssetsReported = 0;

  }
}

- (void)setSsuUserRequestContext:(id)a3
{
  NLXSchemaSSUUserRequestContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;

  v4 = (NLXSchemaSSUUserRequestContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 136;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = v4;

}

- (void)deleteSsuUserRequestContext
{
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;

  if (self->_whichEvent_Type == 136)
  {
    self->_whichEvent_Type = 0;
    ssuUserRequestContext = self->_ssuUserRequestContext;
    self->_ssuUserRequestContext = 0;

  }
}

- (void)setSsuBackgroundRequestContext:(id)a3
{
  NLXSchemaSSUBackgroundUpdateContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;

  v4 = (NLXSchemaSSUBackgroundUpdateContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 137;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = v4;

}

- (void)deleteSsuBackgroundRequestContext
{
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;

  if (self->_whichEvent_Type == 137)
  {
    self->_whichEvent_Type = 0;
    ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
    self->_ssuBackgroundRequestContext = 0;

  }
}

- (void)setCdmServiceHandleMetricsReported:(id)a3
{
  NLXSchemaCDMServiceHandleMetricsReported *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;

  v4 = (NLXSchemaCDMServiceHandleMetricsReported *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 138;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = v4;

}

- (void)deleteCdmServiceHandleMetricsReported
{
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;

  if (self->_whichEvent_Type == 138)
  {
    self->_whichEvent_Type = 0;
    cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
    self->_cdmServiceHandleMetricsReported = 0;

  }
}

- (void)deleteCdmServiceSetupMetricsReported
{
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;

  if (self->_whichEvent_Type == 139)
  {
    self->_whichEvent_Type = 0;
    cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
    self->_cdmServiceSetupMetricsReported = 0;

  }
}

- (void)setMilAssetAcquisitionContext:(id)a3
{
  NLXSchemaMILAssetAcquisitionContext *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaCDMSetupLink *cdmSetupLink;
  unint64_t v45;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;

  v4 = (NLXSchemaMILAssetAcquisitionContext *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = 0;

  v45 = 140;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = v4;

}

- (void)deleteMilAssetAcquisitionContext
{
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;

  if (self->_whichEvent_Type == 140)
  {
    self->_whichEvent_Type = 0;
    milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
    self->_milAssetAcquisitionContext = 0;

  }
}

- (void)setCdmSetupLink:(id)a3
{
  NLXSchemaCDMSetupLink *v4;
  NLXSchemaCDMServiceContext *cdmServiceContext;
  NLXSchemaCDMRequestContext *cdmRequestContext;
  NLXSchemaNLXDeviceFixedContext *nlxDeviceFixedContext;
  NLXSchemaCDMMatchingSpanEnded *cdmMatchingSpanEnded;
  NLXSchemaCDMUsoGraphTier1 *cdmUsoGraphTier1;
  NLXSchemaCDMMatchingSpanTier1 *cdmMatchingSpanTier1;
  NLXSchemaNLXLegacyNLContextTier1 *nlxLegacyNLContextTier1;
  NLXSchemaCDMDelegatedUserDialogActTier1 *cdmDelegatedUserDialogActTier1;
  NLXSchemaCDMSystemDialogActTier1 *cdmSystemDialogActTier1;
  NLXSchemaCDMTokenizationEnded *cdmTokenizationEnded;
  NLXSchemaCDMContextUpdateEnded *cdmContextUpdateEnded;
  NLXSchemaMARRSRepetitionDetectionContext *marrsRepetitionDetectionContext;
  NLXSchemaMARRSQueryRewriteContext *marrsQueryRewriteContext;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *marrsQueryRewriteEvaluatedTier1;
  NLXSchemaCDMMatchingSpanEndedTier1 *cdmMatchingSpanEndedTier1;
  NLXSchemaNLXCurareContext *nlxCurareContext;
  NLXSchemaMARRSMentionDetectorEnded *marrsMentionDetectorEnded;
  NLXSchemaMARRSMentionDetectorEndedTier1 *marrsMentionDetectorEndedTier1;
  NLXSchemaMARRSMentionResolverEnded *marrsMentionResolverEnded;
  NLXSchemaMARRSMentionResolverEndedTier1 *marrsMentionResolverEndedTier1;
  NLXSchemaCDMClientSetupContext *cdmClientSetupContext;
  NLXSchemaCDMAllServicesSetupContext *cdmAllServicesSetupContext;
  NLXSchemaCDMSingleServiceSetupAttemptContext *cdmSingleServiceSetupAttemptContext;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *cdmSingleServiceSetupAttemptFailed;
  NLXSchemaCDMSpanMatcherContext *cdmSpanMatcherContext;
  NLXSchemaMARRSContextualSpanMatcherEnded *marrsContextualSpanMatcherEnded;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *marrsContextualSpanMatcherEndedTier1;
  NLXSchemaCDMXPCEventProcessingContext *cdmXpcEventProcessingContext;
  NLXSchemaCDMAssetSetupContext *cdmAssetSetupContext;
  NLXSchemaCDMSetupMissingAssetsDetected *cdmSetupMissingAssetsDetected;
  NLXSchemaCDMClientWarmupContext *cdmClientWarmupContext;
  NLXSchemaCDMAllServicesWarmupContext *cdmAllServicesWarmupContext;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *cdmSingleServiceWarmupAttemptContext;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *cdmSingleServiceWarmupAttemptFailed;
  NLXSchemaCDMAssetsReported *cdmAssetsReported;
  NLXSchemaSSUUserRequestContext *ssuUserRequestContext;
  NLXSchemaSSUBackgroundUpdateContext *ssuBackgroundRequestContext;
  NLXSchemaCDMServiceHandleMetricsReported *cdmServiceHandleMetricsReported;
  NLXSchemaCDMServiceSetupMetricsReported *cdmServiceSetupMetricsReported;
  NLXSchemaMILAssetAcquisitionContext *milAssetAcquisitionContext;
  unint64_t v45;
  NLXSchemaCDMSetupLink *cdmSetupLink;

  v4 = (NLXSchemaCDMSetupLink *)a3;
  cdmServiceContext = self->_cdmServiceContext;
  self->_cdmServiceContext = 0;

  cdmRequestContext = self->_cdmRequestContext;
  self->_cdmRequestContext = 0;

  nlxDeviceFixedContext = self->_nlxDeviceFixedContext;
  self->_nlxDeviceFixedContext = 0;

  cdmMatchingSpanEnded = self->_cdmMatchingSpanEnded;
  self->_cdmMatchingSpanEnded = 0;

  cdmUsoGraphTier1 = self->_cdmUsoGraphTier1;
  self->_cdmUsoGraphTier1 = 0;

  cdmMatchingSpanTier1 = self->_cdmMatchingSpanTier1;
  self->_cdmMatchingSpanTier1 = 0;

  nlxLegacyNLContextTier1 = self->_nlxLegacyNLContextTier1;
  self->_nlxLegacyNLContextTier1 = 0;

  cdmDelegatedUserDialogActTier1 = self->_cdmDelegatedUserDialogActTier1;
  self->_cdmDelegatedUserDialogActTier1 = 0;

  cdmSystemDialogActTier1 = self->_cdmSystemDialogActTier1;
  self->_cdmSystemDialogActTier1 = 0;

  cdmTokenizationEnded = self->_cdmTokenizationEnded;
  self->_cdmTokenizationEnded = 0;

  cdmContextUpdateEnded = self->_cdmContextUpdateEnded;
  self->_cdmContextUpdateEnded = 0;

  marrsRepetitionDetectionContext = self->_marrsRepetitionDetectionContext;
  self->_marrsRepetitionDetectionContext = 0;

  marrsQueryRewriteContext = self->_marrsQueryRewriteContext;
  self->_marrsQueryRewriteContext = 0;

  marrsQueryRewriteEvaluatedTier1 = self->_marrsQueryRewriteEvaluatedTier1;
  self->_marrsQueryRewriteEvaluatedTier1 = 0;

  cdmMatchingSpanEndedTier1 = self->_cdmMatchingSpanEndedTier1;
  self->_cdmMatchingSpanEndedTier1 = 0;

  nlxCurareContext = self->_nlxCurareContext;
  self->_nlxCurareContext = 0;

  marrsMentionDetectorEnded = self->_marrsMentionDetectorEnded;
  self->_marrsMentionDetectorEnded = 0;

  marrsMentionDetectorEndedTier1 = self->_marrsMentionDetectorEndedTier1;
  self->_marrsMentionDetectorEndedTier1 = 0;

  marrsMentionResolverEnded = self->_marrsMentionResolverEnded;
  self->_marrsMentionResolverEnded = 0;

  marrsMentionResolverEndedTier1 = self->_marrsMentionResolverEndedTier1;
  self->_marrsMentionResolverEndedTier1 = 0;

  cdmClientSetupContext = self->_cdmClientSetupContext;
  self->_cdmClientSetupContext = 0;

  cdmAllServicesSetupContext = self->_cdmAllServicesSetupContext;
  self->_cdmAllServicesSetupContext = 0;

  cdmSingleServiceSetupAttemptContext = self->_cdmSingleServiceSetupAttemptContext;
  self->_cdmSingleServiceSetupAttemptContext = 0;

  cdmSingleServiceSetupAttemptFailed = self->_cdmSingleServiceSetupAttemptFailed;
  self->_cdmSingleServiceSetupAttemptFailed = 0;

  cdmSpanMatcherContext = self->_cdmSpanMatcherContext;
  self->_cdmSpanMatcherContext = 0;

  marrsContextualSpanMatcherEnded = self->_marrsContextualSpanMatcherEnded;
  self->_marrsContextualSpanMatcherEnded = 0;

  marrsContextualSpanMatcherEndedTier1 = self->_marrsContextualSpanMatcherEndedTier1;
  self->_marrsContextualSpanMatcherEndedTier1 = 0;

  cdmXpcEventProcessingContext = self->_cdmXpcEventProcessingContext;
  self->_cdmXpcEventProcessingContext = 0;

  cdmAssetSetupContext = self->_cdmAssetSetupContext;
  self->_cdmAssetSetupContext = 0;

  cdmSetupMissingAssetsDetected = self->_cdmSetupMissingAssetsDetected;
  self->_cdmSetupMissingAssetsDetected = 0;

  cdmClientWarmupContext = self->_cdmClientWarmupContext;
  self->_cdmClientWarmupContext = 0;

  cdmAllServicesWarmupContext = self->_cdmAllServicesWarmupContext;
  self->_cdmAllServicesWarmupContext = 0;

  cdmSingleServiceWarmupAttemptContext = self->_cdmSingleServiceWarmupAttemptContext;
  self->_cdmSingleServiceWarmupAttemptContext = 0;

  cdmSingleServiceWarmupAttemptFailed = self->_cdmSingleServiceWarmupAttemptFailed;
  self->_cdmSingleServiceWarmupAttemptFailed = 0;

  cdmAssetsReported = self->_cdmAssetsReported;
  self->_cdmAssetsReported = 0;

  ssuUserRequestContext = self->_ssuUserRequestContext;
  self->_ssuUserRequestContext = 0;

  ssuBackgroundRequestContext = self->_ssuBackgroundRequestContext;
  self->_ssuBackgroundRequestContext = 0;

  cdmServiceHandleMetricsReported = self->_cdmServiceHandleMetricsReported;
  self->_cdmServiceHandleMetricsReported = 0;

  cdmServiceSetupMetricsReported = self->_cdmServiceSetupMetricsReported;
  self->_cdmServiceSetupMetricsReported = 0;

  milAssetAcquisitionContext = self->_milAssetAcquisitionContext;
  self->_milAssetAcquisitionContext = 0;

  v45 = 141;
  if (!v4)
    v45 = 0;
  self->_whichEvent_Type = v45;
  cdmSetupLink = self->_cdmSetupLink;
  self->_cdmSetupLink = v4;

}

- (void)deleteCdmSetupLink
{
  NLXSchemaCDMSetupLink *cdmSetupLink;

  if (self->_whichEvent_Type == 141)
  {
    self->_whichEvent_Type = 0;
    cdmSetupLink = self->_cdmSetupLink;
    self->_cdmSetupLink = 0;

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
  char v217;
  BOOL v218;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_213;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_213;
  -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmServiceContext](self, "cdmServiceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmServiceContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmServiceContext](self, "cdmServiceContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[NLXSchemaNLXClientEvent cdmServiceContext](self, "cdmServiceContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmServiceContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmRequestContext](self, "cdmRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmRequestContext](self, "cdmRequestContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[NLXSchemaNLXClientEvent cdmRequestContext](self, "cdmRequestContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmRequestContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent nlxDeviceFixedContext](self, "nlxDeviceFixedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlxDeviceFixedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent nlxDeviceFixedContext](self, "nlxDeviceFixedContext");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[NLXSchemaNLXClientEvent nlxDeviceFixedContext](self, "nlxDeviceFixedContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlxDeviceFixedContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmMatchingSpanEnded](self, "cdmMatchingSpanEnded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmMatchingSpanEnded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmMatchingSpanEnded](self, "cdmMatchingSpanEnded");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[NLXSchemaNLXClientEvent cdmMatchingSpanEnded](self, "cdmMatchingSpanEnded");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmMatchingSpanEnded");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmUsoGraphTier1](self, "cdmUsoGraphTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmUsoGraphTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmUsoGraphTier1](self, "cdmUsoGraphTier1");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[NLXSchemaNLXClientEvent cdmUsoGraphTier1](self, "cdmUsoGraphTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmUsoGraphTier1");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmMatchingSpanTier1](self, "cdmMatchingSpanTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmMatchingSpanTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmMatchingSpanTier1](self, "cdmMatchingSpanTier1");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[NLXSchemaNLXClientEvent cdmMatchingSpanTier1](self, "cdmMatchingSpanTier1");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmMatchingSpanTier1");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent nlxLegacyNLContextTier1](self, "nlxLegacyNLContextTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlxLegacyNLContextTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent nlxLegacyNLContextTier1](self, "nlxLegacyNLContextTier1");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[NLXSchemaNLXClientEvent nlxLegacyNLContextTier1](self, "nlxLegacyNLContextTier1");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlxLegacyNLContextTier1");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmDelegatedUserDialogActTier1](self, "cdmDelegatedUserDialogActTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmDelegatedUserDialogActTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmDelegatedUserDialogActTier1](self, "cdmDelegatedUserDialogActTier1");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[NLXSchemaNLXClientEvent cdmDelegatedUserDialogActTier1](self, "cdmDelegatedUserDialogActTier1");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmDelegatedUserDialogActTier1");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmSystemDialogActTier1](self, "cdmSystemDialogActTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmSystemDialogActTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmSystemDialogActTier1](self, "cdmSystemDialogActTier1");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[NLXSchemaNLXClientEvent cdmSystemDialogActTier1](self, "cdmSystemDialogActTier1");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmSystemDialogActTier1");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmTokenizationEnded](self, "cdmTokenizationEnded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmTokenizationEnded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmTokenizationEnded](self, "cdmTokenizationEnded");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[NLXSchemaNLXClientEvent cdmTokenizationEnded](self, "cdmTokenizationEnded");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmTokenizationEnded");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmContextUpdateEnded](self, "cdmContextUpdateEnded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmContextUpdateEnded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmContextUpdateEnded](self, "cdmContextUpdateEnded");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[NLXSchemaNLXClientEvent cdmContextUpdateEnded](self, "cdmContextUpdateEnded");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmContextUpdateEnded");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent marrsRepetitionDetectionContext](self, "marrsRepetitionDetectionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marrsRepetitionDetectionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent marrsRepetitionDetectionContext](self, "marrsRepetitionDetectionContext");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[NLXSchemaNLXClientEvent marrsRepetitionDetectionContext](self, "marrsRepetitionDetectionContext");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "marrsRepetitionDetectionContext");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent marrsQueryRewriteContext](self, "marrsQueryRewriteContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marrsQueryRewriteContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent marrsQueryRewriteContext](self, "marrsQueryRewriteContext");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[NLXSchemaNLXClientEvent marrsQueryRewriteContext](self, "marrsQueryRewriteContext");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "marrsQueryRewriteContext");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent marrsQueryRewriteEvaluatedTier1](self, "marrsQueryRewriteEvaluatedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marrsQueryRewriteEvaluatedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent marrsQueryRewriteEvaluatedTier1](self, "marrsQueryRewriteEvaluatedTier1");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[NLXSchemaNLXClientEvent marrsQueryRewriteEvaluatedTier1](self, "marrsQueryRewriteEvaluatedTier1");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "marrsQueryRewriteEvaluatedTier1");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmMatchingSpanEndedTier1](self, "cdmMatchingSpanEndedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmMatchingSpanEndedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmMatchingSpanEndedTier1](self, "cdmMatchingSpanEndedTier1");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[NLXSchemaNLXClientEvent cdmMatchingSpanEndedTier1](self, "cdmMatchingSpanEndedTier1");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmMatchingSpanEndedTier1");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent nlxCurareContext](self, "nlxCurareContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlxCurareContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent nlxCurareContext](self, "nlxCurareContext");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[NLXSchemaNLXClientEvent nlxCurareContext](self, "nlxCurareContext");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlxCurareContext");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent marrsMentionDetectorEnded](self, "marrsMentionDetectorEnded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marrsMentionDetectorEnded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent marrsMentionDetectorEnded](self, "marrsMentionDetectorEnded");
  v93 = objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)v93;
    -[NLXSchemaNLXClientEvent marrsMentionDetectorEnded](self, "marrsMentionDetectorEnded");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "marrsMentionDetectorEnded");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v95, "isEqual:", v96);

    if (!v97)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent marrsMentionDetectorEndedTier1](self, "marrsMentionDetectorEndedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marrsMentionDetectorEndedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent marrsMentionDetectorEndedTier1](self, "marrsMentionDetectorEndedTier1");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    -[NLXSchemaNLXClientEvent marrsMentionDetectorEndedTier1](self, "marrsMentionDetectorEndedTier1");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "marrsMentionDetectorEndedTier1");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "isEqual:", v101);

    if (!v102)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent marrsMentionResolverEnded](self, "marrsMentionResolverEnded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marrsMentionResolverEnded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent marrsMentionResolverEnded](self, "marrsMentionResolverEnded");
  v103 = objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    v104 = (void *)v103;
    -[NLXSchemaNLXClientEvent marrsMentionResolverEnded](self, "marrsMentionResolverEnded");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "marrsMentionResolverEnded");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v105, "isEqual:", v106);

    if (!v107)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent marrsMentionResolverEndedTier1](self, "marrsMentionResolverEndedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marrsMentionResolverEndedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent marrsMentionResolverEndedTier1](self, "marrsMentionResolverEndedTier1");
  v108 = objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    v109 = (void *)v108;
    -[NLXSchemaNLXClientEvent marrsMentionResolverEndedTier1](self, "marrsMentionResolverEndedTier1");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "marrsMentionResolverEndedTier1");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v110, "isEqual:", v111);

    if (!v112)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmClientSetupContext](self, "cdmClientSetupContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmClientSetupContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmClientSetupContext](self, "cdmClientSetupContext");
  v113 = objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    v114 = (void *)v113;
    -[NLXSchemaNLXClientEvent cdmClientSetupContext](self, "cdmClientSetupContext");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmClientSetupContext");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v115, "isEqual:", v116);

    if (!v117)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmAllServicesSetupContext](self, "cdmAllServicesSetupContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmAllServicesSetupContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmAllServicesSetupContext](self, "cdmAllServicesSetupContext");
  v118 = objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = (void *)v118;
    -[NLXSchemaNLXClientEvent cdmAllServicesSetupContext](self, "cdmAllServicesSetupContext");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmAllServicesSetupContext");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v120, "isEqual:", v121);

    if (!v122)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptContext](self, "cdmSingleServiceSetupAttemptContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmSingleServiceSetupAttemptContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptContext](self, "cdmSingleServiceSetupAttemptContext");
  v123 = objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    v124 = (void *)v123;
    -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptContext](self, "cdmSingleServiceSetupAttemptContext");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmSingleServiceSetupAttemptContext");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v125, "isEqual:", v126);

    if (!v127)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptFailed](self, "cdmSingleServiceSetupAttemptFailed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmSingleServiceSetupAttemptFailed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptFailed](self, "cdmSingleServiceSetupAttemptFailed");
  v128 = objc_claimAutoreleasedReturnValue();
  if (v128)
  {
    v129 = (void *)v128;
    -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptFailed](self, "cdmSingleServiceSetupAttemptFailed");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmSingleServiceSetupAttemptFailed");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v130, "isEqual:", v131);

    if (!v132)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmSpanMatcherContext](self, "cdmSpanMatcherContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmSpanMatcherContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmSpanMatcherContext](self, "cdmSpanMatcherContext");
  v133 = objc_claimAutoreleasedReturnValue();
  if (v133)
  {
    v134 = (void *)v133;
    -[NLXSchemaNLXClientEvent cdmSpanMatcherContext](self, "cdmSpanMatcherContext");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmSpanMatcherContext");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v135, "isEqual:", v136);

    if (!v137)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEnded](self, "marrsContextualSpanMatcherEnded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marrsContextualSpanMatcherEnded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEnded](self, "marrsContextualSpanMatcherEnded");
  v138 = objc_claimAutoreleasedReturnValue();
  if (v138)
  {
    v139 = (void *)v138;
    -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEnded](self, "marrsContextualSpanMatcherEnded");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "marrsContextualSpanMatcherEnded");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v140, "isEqual:", v141);

    if (!v142)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEndedTier1](self, "marrsContextualSpanMatcherEndedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "marrsContextualSpanMatcherEndedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEndedTier1](self, "marrsContextualSpanMatcherEndedTier1");
  v143 = objc_claimAutoreleasedReturnValue();
  if (v143)
  {
    v144 = (void *)v143;
    -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEndedTier1](self, "marrsContextualSpanMatcherEndedTier1");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "marrsContextualSpanMatcherEndedTier1");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = objc_msgSend(v145, "isEqual:", v146);

    if (!v147)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmXpcEventProcessingContext](self, "cdmXpcEventProcessingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmXpcEventProcessingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmXpcEventProcessingContext](self, "cdmXpcEventProcessingContext");
  v148 = objc_claimAutoreleasedReturnValue();
  if (v148)
  {
    v149 = (void *)v148;
    -[NLXSchemaNLXClientEvent cdmXpcEventProcessingContext](self, "cdmXpcEventProcessingContext");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmXpcEventProcessingContext");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = objc_msgSend(v150, "isEqual:", v151);

    if (!v152)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmAssetSetupContext](self, "cdmAssetSetupContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmAssetSetupContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmAssetSetupContext](self, "cdmAssetSetupContext");
  v153 = objc_claimAutoreleasedReturnValue();
  if (v153)
  {
    v154 = (void *)v153;
    -[NLXSchemaNLXClientEvent cdmAssetSetupContext](self, "cdmAssetSetupContext");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmAssetSetupContext");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = objc_msgSend(v155, "isEqual:", v156);

    if (!v157)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmSetupMissingAssetsDetected](self, "cdmSetupMissingAssetsDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmSetupMissingAssetsDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmSetupMissingAssetsDetected](self, "cdmSetupMissingAssetsDetected");
  v158 = objc_claimAutoreleasedReturnValue();
  if (v158)
  {
    v159 = (void *)v158;
    -[NLXSchemaNLXClientEvent cdmSetupMissingAssetsDetected](self, "cdmSetupMissingAssetsDetected");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmSetupMissingAssetsDetected");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = objc_msgSend(v160, "isEqual:", v161);

    if (!v162)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmClientWarmupContext](self, "cdmClientWarmupContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmClientWarmupContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmClientWarmupContext](self, "cdmClientWarmupContext");
  v163 = objc_claimAutoreleasedReturnValue();
  if (v163)
  {
    v164 = (void *)v163;
    -[NLXSchemaNLXClientEvent cdmClientWarmupContext](self, "cdmClientWarmupContext");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmClientWarmupContext");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = objc_msgSend(v165, "isEqual:", v166);

    if (!v167)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmAllServicesWarmupContext](self, "cdmAllServicesWarmupContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmAllServicesWarmupContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmAllServicesWarmupContext](self, "cdmAllServicesWarmupContext");
  v168 = objc_claimAutoreleasedReturnValue();
  if (v168)
  {
    v169 = (void *)v168;
    -[NLXSchemaNLXClientEvent cdmAllServicesWarmupContext](self, "cdmAllServicesWarmupContext");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmAllServicesWarmupContext");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = objc_msgSend(v170, "isEqual:", v171);

    if (!v172)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptContext](self, "cdmSingleServiceWarmupAttemptContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmSingleServiceWarmupAttemptContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptContext](self, "cdmSingleServiceWarmupAttemptContext");
  v173 = objc_claimAutoreleasedReturnValue();
  if (v173)
  {
    v174 = (void *)v173;
    -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptContext](self, "cdmSingleServiceWarmupAttemptContext");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmSingleServiceWarmupAttemptContext");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = objc_msgSend(v175, "isEqual:", v176);

    if (!v177)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptFailed](self, "cdmSingleServiceWarmupAttemptFailed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmSingleServiceWarmupAttemptFailed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptFailed](self, "cdmSingleServiceWarmupAttemptFailed");
  v178 = objc_claimAutoreleasedReturnValue();
  if (v178)
  {
    v179 = (void *)v178;
    -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptFailed](self, "cdmSingleServiceWarmupAttemptFailed");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmSingleServiceWarmupAttemptFailed");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = objc_msgSend(v180, "isEqual:", v181);

    if (!v182)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmAssetsReported](self, "cdmAssetsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmAssetsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmAssetsReported](self, "cdmAssetsReported");
  v183 = objc_claimAutoreleasedReturnValue();
  if (v183)
  {
    v184 = (void *)v183;
    -[NLXSchemaNLXClientEvent cdmAssetsReported](self, "cdmAssetsReported");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmAssetsReported");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = objc_msgSend(v185, "isEqual:", v186);

    if (!v187)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent ssuUserRequestContext](self, "ssuUserRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ssuUserRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent ssuUserRequestContext](self, "ssuUserRequestContext");
  v188 = objc_claimAutoreleasedReturnValue();
  if (v188)
  {
    v189 = (void *)v188;
    -[NLXSchemaNLXClientEvent ssuUserRequestContext](self, "ssuUserRequestContext");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ssuUserRequestContext");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = objc_msgSend(v190, "isEqual:", v191);

    if (!v192)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent ssuBackgroundRequestContext](self, "ssuBackgroundRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ssuBackgroundRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent ssuBackgroundRequestContext](self, "ssuBackgroundRequestContext");
  v193 = objc_claimAutoreleasedReturnValue();
  if (v193)
  {
    v194 = (void *)v193;
    -[NLXSchemaNLXClientEvent ssuBackgroundRequestContext](self, "ssuBackgroundRequestContext");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ssuBackgroundRequestContext");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = objc_msgSend(v195, "isEqual:", v196);

    if (!v197)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmServiceHandleMetricsReported](self, "cdmServiceHandleMetricsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmServiceHandleMetricsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmServiceHandleMetricsReported](self, "cdmServiceHandleMetricsReported");
  v198 = objc_claimAutoreleasedReturnValue();
  if (v198)
  {
    v199 = (void *)v198;
    -[NLXSchemaNLXClientEvent cdmServiceHandleMetricsReported](self, "cdmServiceHandleMetricsReported");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmServiceHandleMetricsReported");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = objc_msgSend(v200, "isEqual:", v201);

    if (!v202)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmServiceSetupMetricsReported](self, "cdmServiceSetupMetricsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmServiceSetupMetricsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent cdmServiceSetupMetricsReported](self, "cdmServiceSetupMetricsReported");
  v203 = objc_claimAutoreleasedReturnValue();
  if (v203)
  {
    v204 = (void *)v203;
    -[NLXSchemaNLXClientEvent cdmServiceSetupMetricsReported](self, "cdmServiceSetupMetricsReported");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmServiceSetupMetricsReported");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = objc_msgSend(v205, "isEqual:", v206);

    if (!v207)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent milAssetAcquisitionContext](self, "milAssetAcquisitionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "milAssetAcquisitionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_212;
  -[NLXSchemaNLXClientEvent milAssetAcquisitionContext](self, "milAssetAcquisitionContext");
  v208 = objc_claimAutoreleasedReturnValue();
  if (v208)
  {
    v209 = (void *)v208;
    -[NLXSchemaNLXClientEvent milAssetAcquisitionContext](self, "milAssetAcquisitionContext");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "milAssetAcquisitionContext");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = objc_msgSend(v210, "isEqual:", v211);

    if (!v212)
      goto LABEL_213;
  }
  else
  {

  }
  -[NLXSchemaNLXClientEvent cdmSetupLink](self, "cdmSetupLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdmSetupLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[NLXSchemaNLXClientEvent cdmSetupLink](self, "cdmSetupLink");
    v213 = objc_claimAutoreleasedReturnValue();
    if (!v213)
    {

LABEL_216:
      v218 = 1;
      goto LABEL_214;
    }
    v214 = (void *)v213;
    -[NLXSchemaNLXClientEvent cdmSetupLink](self, "cdmSetupLink");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdmSetupLink");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = objc_msgSend(v215, "isEqual:", v216);

    if ((v217 & 1) != 0)
      goto LABEL_216;
  }
  else
  {
LABEL_212:

  }
LABEL_213:
  v218 = 0;
LABEL_214:

  return v218;
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

  v3 = -[NLXSchemaNLXClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[NLXSchemaCDMServiceContext hash](self->_cdmServiceContext, "hash") ^ v3;
  v5 = -[NLXSchemaCDMRequestContext hash](self->_cdmRequestContext, "hash");
  v6 = v4 ^ v5 ^ -[NLXSchemaNLXDeviceFixedContext hash](self->_nlxDeviceFixedContext, "hash");
  v7 = -[NLXSchemaCDMMatchingSpanEnded hash](self->_cdmMatchingSpanEnded, "hash");
  v8 = v7 ^ -[NLXSchemaCDMUsoGraphTier1 hash](self->_cdmUsoGraphTier1, "hash");
  v9 = v6 ^ v8 ^ -[NLXSchemaCDMMatchingSpanTier1 hash](self->_cdmMatchingSpanTier1, "hash");
  v10 = -[NLXSchemaNLXLegacyNLContextTier1 hash](self->_nlxLegacyNLContextTier1, "hash");
  v11 = v10 ^ -[NLXSchemaCDMDelegatedUserDialogActTier1 hash](self->_cdmDelegatedUserDialogActTier1, "hash");
  v12 = v11 ^ -[NLXSchemaCDMSystemDialogActTier1 hash](self->_cdmSystemDialogActTier1, "hash");
  v13 = v9 ^ v12 ^ -[NLXSchemaCDMTokenizationEnded hash](self->_cdmTokenizationEnded, "hash");
  v14 = -[NLXSchemaCDMContextUpdateEnded hash](self->_cdmContextUpdateEnded, "hash");
  v15 = v14 ^ -[NLXSchemaMARRSRepetitionDetectionContext hash](self->_marrsRepetitionDetectionContext, "hash");
  v16 = v15 ^ -[NLXSchemaMARRSQueryRewriteContext hash](self->_marrsQueryRewriteContext, "hash");
  v17 = v16 ^ -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 hash](self->_marrsQueryRewriteEvaluatedTier1, "hash");
  v18 = v13 ^ v17 ^ -[NLXSchemaCDMMatchingSpanEndedTier1 hash](self->_cdmMatchingSpanEndedTier1, "hash");
  v19 = -[NLXSchemaNLXCurareContext hash](self->_nlxCurareContext, "hash");
  v20 = v19 ^ -[NLXSchemaMARRSMentionDetectorEnded hash](self->_marrsMentionDetectorEnded, "hash");
  v21 = v20 ^ -[NLXSchemaMARRSMentionDetectorEndedTier1 hash](self->_marrsMentionDetectorEndedTier1, "hash");
  v22 = v21 ^ -[NLXSchemaMARRSMentionResolverEnded hash](self->_marrsMentionResolverEnded, "hash");
  v23 = v22 ^ -[NLXSchemaMARRSMentionResolverEndedTier1 hash](self->_marrsMentionResolverEndedTier1, "hash");
  v24 = v18 ^ v23 ^ -[NLXSchemaCDMClientSetupContext hash](self->_cdmClientSetupContext, "hash");
  v25 = -[NLXSchemaCDMAllServicesSetupContext hash](self->_cdmAllServicesSetupContext, "hash");
  v26 = v25 ^ -[NLXSchemaCDMSingleServiceSetupAttemptContext hash](self->_cdmSingleServiceSetupAttemptContext, "hash");
  v27 = v26 ^ -[NLXSchemaCDMSingleServiceSetupAttemptFailed hash](self->_cdmSingleServiceSetupAttemptFailed, "hash");
  v28 = v27 ^ -[NLXSchemaCDMSpanMatcherContext hash](self->_cdmSpanMatcherContext, "hash");
  v29 = v28 ^ -[NLXSchemaMARRSContextualSpanMatcherEnded hash](self->_marrsContextualSpanMatcherEnded, "hash");
  v30 = v29 ^ -[NLXSchemaMARRSContextualSpanMatcherEndedTier1 hash](self->_marrsContextualSpanMatcherEndedTier1, "hash");
  v31 = v24 ^ v30 ^ -[NLXSchemaCDMXPCEventProcessingContext hash](self->_cdmXpcEventProcessingContext, "hash");
  v32 = -[NLXSchemaCDMAssetSetupContext hash](self->_cdmAssetSetupContext, "hash");
  v33 = v32 ^ -[NLXSchemaCDMSetupMissingAssetsDetected hash](self->_cdmSetupMissingAssetsDetected, "hash");
  v34 = v33 ^ -[NLXSchemaCDMClientWarmupContext hash](self->_cdmClientWarmupContext, "hash");
  v35 = v34 ^ -[NLXSchemaCDMAllServicesWarmupContext hash](self->_cdmAllServicesWarmupContext, "hash");
  v36 = v35 ^ -[NLXSchemaCDMSingleServiceWarmupAttemptContext hash](self->_cdmSingleServiceWarmupAttemptContext, "hash");
  v37 = v36 ^ -[NLXSchemaCDMSingleServiceWarmupAttemptFailed hash](self->_cdmSingleServiceWarmupAttemptFailed, "hash");
  v38 = v37 ^ -[NLXSchemaCDMAssetsReported hash](self->_cdmAssetsReported, "hash");
  v39 = v31 ^ v38 ^ -[NLXSchemaSSUUserRequestContext hash](self->_ssuUserRequestContext, "hash");
  v40 = -[NLXSchemaSSUBackgroundUpdateContext hash](self->_ssuBackgroundRequestContext, "hash");
  v41 = v40 ^ -[NLXSchemaCDMServiceHandleMetricsReported hash](self->_cdmServiceHandleMetricsReported, "hash");
  v42 = v41 ^ -[NLXSchemaCDMServiceSetupMetricsReported hash](self->_cdmServiceSetupMetricsReported, "hash");
  v43 = v42 ^ -[NLXSchemaMILAssetAcquisitionContext hash](self->_milAssetAcquisitionContext, "hash");
  return v39 ^ v43 ^ -[NLXSchemaCDMSetupLink hash](self->_cdmSetupLink, "hash");
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
  id v130;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cdmAllServicesSetupContext)
  {
    -[NLXSchemaNLXClientEvent cdmAllServicesSetupContext](self, "cdmAllServicesSetupContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cdmAllServicesSetupContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cdmAllServicesSetupContext"));

    }
  }
  if (self->_cdmAllServicesWarmupContext)
  {
    -[NLXSchemaNLXClientEvent cdmAllServicesWarmupContext](self, "cdmAllServicesWarmupContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("cdmAllServicesWarmupContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("cdmAllServicesWarmupContext"));

    }
  }
  if (self->_cdmAssetSetupContext)
  {
    -[NLXSchemaNLXClientEvent cdmAssetSetupContext](self, "cdmAssetSetupContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("cdmAssetSetupContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("cdmAssetSetupContext"));

    }
  }
  if (self->_cdmAssetsReported)
  {
    -[NLXSchemaNLXClientEvent cdmAssetsReported](self, "cdmAssetsReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("cdmAssetsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("cdmAssetsReported"));

    }
  }
  if (self->_cdmClientSetupContext)
  {
    -[NLXSchemaNLXClientEvent cdmClientSetupContext](self, "cdmClientSetupContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("cdmClientSetupContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("cdmClientSetupContext"));

    }
  }
  if (self->_cdmClientWarmupContext)
  {
    -[NLXSchemaNLXClientEvent cdmClientWarmupContext](self, "cdmClientWarmupContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("cdmClientWarmupContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("cdmClientWarmupContext"));

    }
  }
  if (self->_cdmContextUpdateEnded)
  {
    -[NLXSchemaNLXClientEvent cdmContextUpdateEnded](self, "cdmContextUpdateEnded");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("cdmContextUpdateEnded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("cdmContextUpdateEnded"));

    }
  }
  if (self->_cdmDelegatedUserDialogActTier1)
  {
    -[NLXSchemaNLXClientEvent cdmDelegatedUserDialogActTier1](self, "cdmDelegatedUserDialogActTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("cdmDelegatedUserDialogActTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("cdmDelegatedUserDialogActTier1"));

    }
  }
  if (self->_cdmMatchingSpanEnded)
  {
    -[NLXSchemaNLXClientEvent cdmMatchingSpanEnded](self, "cdmMatchingSpanEnded");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("cdmMatchingSpanEnded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("cdmMatchingSpanEnded"));

    }
  }
  if (self->_cdmMatchingSpanEndedTier1)
  {
    -[NLXSchemaNLXClientEvent cdmMatchingSpanEndedTier1](self, "cdmMatchingSpanEndedTier1");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("cdmMatchingSpanEndedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("cdmMatchingSpanEndedTier1"));

    }
  }
  if (self->_cdmMatchingSpanTier1)
  {
    -[NLXSchemaNLXClientEvent cdmMatchingSpanTier1](self, "cdmMatchingSpanTier1");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("cdmMatchingSpanTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("cdmMatchingSpanTier1"));

    }
  }
  if (self->_cdmRequestContext)
  {
    -[NLXSchemaNLXClientEvent cdmRequestContext](self, "cdmRequestContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("cdmRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("cdmRequestContext"));

    }
  }
  if (self->_cdmServiceContext)
  {
    -[NLXSchemaNLXClientEvent cdmServiceContext](self, "cdmServiceContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("cdmServiceContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("cdmServiceContext"));

    }
  }
  if (self->_cdmServiceHandleMetricsReported)
  {
    -[NLXSchemaNLXClientEvent cdmServiceHandleMetricsReported](self, "cdmServiceHandleMetricsReported");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("cdmServiceHandleMetricsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("cdmServiceHandleMetricsReported"));

    }
  }
  if (self->_cdmServiceSetupMetricsReported)
  {
    -[NLXSchemaNLXClientEvent cdmServiceSetupMetricsReported](self, "cdmServiceSetupMetricsReported");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("cdmServiceSetupMetricsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("cdmServiceSetupMetricsReported"));

    }
  }
  if (self->_cdmSetupLink)
  {
    -[NLXSchemaNLXClientEvent cdmSetupLink](self, "cdmSetupLink");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("cdmSetupLink"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("cdmSetupLink"));

    }
  }
  if (self->_cdmSetupMissingAssetsDetected)
  {
    -[NLXSchemaNLXClientEvent cdmSetupMissingAssetsDetected](self, "cdmSetupMissingAssetsDetected");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("cdmSetupMissingAssetsDetected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("cdmSetupMissingAssetsDetected"));

    }
  }
  if (self->_cdmSingleServiceSetupAttemptContext)
  {
    -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptContext](self, "cdmSingleServiceSetupAttemptContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("cdmSingleServiceSetupAttemptContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("cdmSingleServiceSetupAttemptContext"));

    }
  }
  if (self->_cdmSingleServiceSetupAttemptFailed)
  {
    -[NLXSchemaNLXClientEvent cdmSingleServiceSetupAttemptFailed](self, "cdmSingleServiceSetupAttemptFailed");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("cdmSingleServiceSetupAttemptFailed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("cdmSingleServiceSetupAttemptFailed"));

    }
  }
  if (self->_cdmSingleServiceWarmupAttemptContext)
  {
    -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptContext](self, "cdmSingleServiceWarmupAttemptContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dictionaryRepresentation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("cdmSingleServiceWarmupAttemptContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("cdmSingleServiceWarmupAttemptContext"));

    }
  }
  if (self->_cdmSingleServiceWarmupAttemptFailed)
  {
    -[NLXSchemaNLXClientEvent cdmSingleServiceWarmupAttemptFailed](self, "cdmSingleServiceWarmupAttemptFailed");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dictionaryRepresentation");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("cdmSingleServiceWarmupAttemptFailed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("cdmSingleServiceWarmupAttemptFailed"));

    }
  }
  if (self->_cdmSpanMatcherContext)
  {
    -[NLXSchemaNLXClientEvent cdmSpanMatcherContext](self, "cdmSpanMatcherContext");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("cdmSpanMatcherContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("cdmSpanMatcherContext"));

    }
  }
  if (self->_cdmSystemDialogActTier1)
  {
    -[NLXSchemaNLXClientEvent cdmSystemDialogActTier1](self, "cdmSystemDialogActTier1");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "dictionaryRepresentation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("cdmSystemDialogActTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("cdmSystemDialogActTier1"));

    }
  }
  if (self->_cdmTokenizationEnded)
  {
    -[NLXSchemaNLXClientEvent cdmTokenizationEnded](self, "cdmTokenizationEnded");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("cdmTokenizationEnded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("cdmTokenizationEnded"));

    }
  }
  if (self->_cdmUsoGraphTier1)
  {
    -[NLXSchemaNLXClientEvent cdmUsoGraphTier1](self, "cdmUsoGraphTier1");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "dictionaryRepresentation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("cdmUsoGraphTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("cdmUsoGraphTier1"));

    }
  }
  if (self->_cdmXpcEventProcessingContext)
  {
    -[NLXSchemaNLXClientEvent cdmXpcEventProcessingContext](self, "cdmXpcEventProcessingContext");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "dictionaryRepresentation");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("cdmXpcEventProcessingContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("cdmXpcEventProcessingContext"));

    }
  }
  if (self->_eventMetadata)
  {
    -[NLXSchemaNLXClientEvent eventMetadata](self, "eventMetadata");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "dictionaryRepresentation");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (v83)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("eventMetadata"));

    }
  }
  if (self->_marrsContextualSpanMatcherEnded)
  {
    -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEnded](self, "marrsContextualSpanMatcherEnded");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "dictionaryRepresentation");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("marrsContextualSpanMatcherEnded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("marrsContextualSpanMatcherEnded"));

    }
  }
  if (self->_marrsContextualSpanMatcherEndedTier1)
  {
    -[NLXSchemaNLXClientEvent marrsContextualSpanMatcherEndedTier1](self, "marrsContextualSpanMatcherEndedTier1");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "dictionaryRepresentation");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("marrsContextualSpanMatcherEndedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("marrsContextualSpanMatcherEndedTier1"));

    }
  }
  if (self->_marrsMentionDetectorEnded)
  {
    -[NLXSchemaNLXClientEvent marrsMentionDetectorEnded](self, "marrsMentionDetectorEnded");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "dictionaryRepresentation");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("marrsMentionDetectorEnded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("marrsMentionDetectorEnded"));

    }
  }
  if (self->_marrsMentionDetectorEndedTier1)
  {
    -[NLXSchemaNLXClientEvent marrsMentionDetectorEndedTier1](self, "marrsMentionDetectorEndedTier1");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "dictionaryRepresentation");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("marrsMentionDetectorEndedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("marrsMentionDetectorEndedTier1"));

    }
  }
  if (self->_marrsMentionResolverEnded)
  {
    -[NLXSchemaNLXClientEvent marrsMentionResolverEnded](self, "marrsMentionResolverEnded");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "dictionaryRepresentation");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("marrsMentionResolverEnded"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("marrsMentionResolverEnded"));

    }
  }
  if (self->_marrsMentionResolverEndedTier1)
  {
    -[NLXSchemaNLXClientEvent marrsMentionResolverEndedTier1](self, "marrsMentionResolverEndedTier1");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "dictionaryRepresentation");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v101)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("marrsMentionResolverEndedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v102, CFSTR("marrsMentionResolverEndedTier1"));

    }
  }
  if (self->_marrsQueryRewriteContext)
  {
    -[NLXSchemaNLXClientEvent marrsQueryRewriteContext](self, "marrsQueryRewriteContext");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "dictionaryRepresentation");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v104)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v104, CFSTR("marrsQueryRewriteContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("marrsQueryRewriteContext"));

    }
  }
  if (self->_marrsQueryRewriteEvaluatedTier1)
  {
    -[NLXSchemaNLXClientEvent marrsQueryRewriteEvaluatedTier1](self, "marrsQueryRewriteEvaluatedTier1");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "dictionaryRepresentation");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (v107)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v107, CFSTR("marrsQueryRewriteEvaluatedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("marrsQueryRewriteEvaluatedTier1"));

    }
  }
  if (self->_marrsRepetitionDetectionContext)
  {
    -[NLXSchemaNLXClientEvent marrsRepetitionDetectionContext](self, "marrsRepetitionDetectionContext");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "dictionaryRepresentation");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (v110)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v110, CFSTR("marrsRepetitionDetectionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v111, CFSTR("marrsRepetitionDetectionContext"));

    }
  }
  if (self->_milAssetAcquisitionContext)
  {
    -[NLXSchemaNLXClientEvent milAssetAcquisitionContext](self, "milAssetAcquisitionContext");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "dictionaryRepresentation");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (v113)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v113, CFSTR("milAssetAcquisitionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v114, CFSTR("milAssetAcquisitionContext"));

    }
  }
  if (self->_nlxCurareContext)
  {
    -[NLXSchemaNLXClientEvent nlxCurareContext](self, "nlxCurareContext");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "dictionaryRepresentation");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (v116)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v116, CFSTR("nlxCurareContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v117, CFSTR("nlxCurareContext"));

    }
  }
  if (self->_nlxDeviceFixedContext)
  {
    -[NLXSchemaNLXClientEvent nlxDeviceFixedContext](self, "nlxDeviceFixedContext");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "dictionaryRepresentation");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (v119)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v119, CFSTR("nlxDeviceFixedContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v120, CFSTR("nlxDeviceFixedContext"));

    }
  }
  if (self->_nlxLegacyNLContextTier1)
  {
    -[NLXSchemaNLXClientEvent nlxLegacyNLContextTier1](self, "nlxLegacyNLContextTier1");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "dictionaryRepresentation");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (v122)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v122, CFSTR("nlxLegacyNLContextTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v123, CFSTR("nlxLegacyNLContextTier1"));

    }
  }
  if (self->_ssuBackgroundRequestContext)
  {
    -[NLXSchemaNLXClientEvent ssuBackgroundRequestContext](self, "ssuBackgroundRequestContext");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "dictionaryRepresentation");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if (v125)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v125, CFSTR("ssuBackgroundRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v126, CFSTR("ssuBackgroundRequestContext"));

    }
  }
  if (self->_ssuUserRequestContext)
  {
    -[NLXSchemaNLXClientEvent ssuUserRequestContext](self, "ssuUserRequestContext");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "dictionaryRepresentation");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    if (v128)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v128, CFSTR("ssuUserRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v129, CFSTR("ssuUserRequestContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v130 = v3;

  return v130;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaNLXClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaNLXClientEvent)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaNLXClientEvent *v5;
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
    self = -[NLXSchemaNLXClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaNLXClientEvent)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaNLXClientEvent *v5;
  uint64_t v6;
  NLXSchemaNLXClientEventMetadata *v7;
  uint64_t v8;
  NLXSchemaCDMServiceContext *v9;
  uint64_t v10;
  NLXSchemaCDMRequestContext *v11;
  uint64_t v12;
  NLXSchemaNLXDeviceFixedContext *v13;
  uint64_t v14;
  NLXSchemaCDMMatchingSpanEnded *v15;
  uint64_t v16;
  NLXSchemaCDMUsoGraphTier1 *v17;
  uint64_t v18;
  NLXSchemaCDMMatchingSpanTier1 *v19;
  uint64_t v20;
  NLXSchemaNLXLegacyNLContextTier1 *v21;
  uint64_t v22;
  NLXSchemaCDMDelegatedUserDialogActTier1 *v23;
  uint64_t v24;
  NLXSchemaCDMSystemDialogActTier1 *v25;
  uint64_t v26;
  NLXSchemaCDMTokenizationEnded *v27;
  uint64_t v28;
  NLXSchemaCDMContextUpdateEnded *v29;
  uint64_t v30;
  NLXSchemaMARRSRepetitionDetectionContext *v31;
  uint64_t v32;
  NLXSchemaMARRSQueryRewriteContext *v33;
  uint64_t v34;
  NLXSchemaMARRSQueryRewriteEvaluatedTier1 *v35;
  uint64_t v36;
  NLXSchemaCDMMatchingSpanEndedTier1 *v37;
  uint64_t v38;
  NLXSchemaNLXCurareContext *v39;
  uint64_t v40;
  NLXSchemaMARRSMentionDetectorEnded *v41;
  uint64_t v42;
  NLXSchemaMARRSMentionDetectorEndedTier1 *v43;
  uint64_t v44;
  NLXSchemaMARRSMentionResolverEnded *v45;
  uint64_t v46;
  NLXSchemaMARRSMentionResolverEndedTier1 *v47;
  uint64_t v48;
  NLXSchemaCDMClientSetupContext *v49;
  uint64_t v50;
  NLXSchemaCDMAllServicesSetupContext *v51;
  uint64_t v52;
  NLXSchemaCDMSingleServiceSetupAttemptContext *v53;
  uint64_t v54;
  NLXSchemaCDMSingleServiceSetupAttemptFailed *v55;
  uint64_t v56;
  NLXSchemaCDMSpanMatcherContext *v57;
  uint64_t v58;
  NLXSchemaMARRSContextualSpanMatcherEnded *v59;
  uint64_t v60;
  NLXSchemaMARRSContextualSpanMatcherEndedTier1 *v61;
  uint64_t v62;
  NLXSchemaCDMXPCEventProcessingContext *v63;
  uint64_t v64;
  NLXSchemaCDMAssetSetupContext *v65;
  uint64_t v66;
  NLXSchemaCDMSetupMissingAssetsDetected *v67;
  uint64_t v68;
  NLXSchemaCDMClientWarmupContext *v69;
  uint64_t v70;
  NLXSchemaCDMAllServicesWarmupContext *v71;
  uint64_t v72;
  NLXSchemaCDMSingleServiceWarmupAttemptContext *v73;
  uint64_t v74;
  NLXSchemaCDMSingleServiceWarmupAttemptFailed *v75;
  void *v76;
  NLXSchemaCDMAssetsReported *v77;
  void *v78;
  NLXSchemaSSUUserRequestContext *v79;
  void *v80;
  NLXSchemaSSUBackgroundUpdateContext *v81;
  void *v82;
  NLXSchemaCDMServiceHandleMetricsReported *v83;
  void *v84;
  NLXSchemaCDMServiceSetupMetricsReported *v85;
  void *v86;
  NLXSchemaMILAssetAcquisitionContext *v87;
  void *v88;
  NLXSchemaCDMSetupLink *v89;
  NLXSchemaNLXClientEvent *v90;
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
  objc_super v127;

  v4 = a3;
  v127.receiver = self;
  v127.super_class = (Class)NLXSchemaNLXClientEvent;
  v5 = -[NLXSchemaNLXClientEvent init](&v127, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NLXSchemaNLXClientEventMetadata initWithDictionary:]([NLXSchemaNLXClientEventMetadata alloc], "initWithDictionary:", v6);
      -[NLXSchemaNLXClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmServiceContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[NLXSchemaCDMServiceContext initWithDictionary:]([NLXSchemaCDMServiceContext alloc], "initWithDictionary:", v8);
      -[NLXSchemaNLXClientEvent setCdmServiceContext:](v5, "setCdmServiceContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmRequestContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[NLXSchemaCDMRequestContext initWithDictionary:]([NLXSchemaCDMRequestContext alloc], "initWithDictionary:", v10);
      -[NLXSchemaNLXClientEvent setCdmRequestContext:](v5, "setCdmRequestContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlxDeviceFixedContext"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[NLXSchemaNLXDeviceFixedContext initWithDictionary:]([NLXSchemaNLXDeviceFixedContext alloc], "initWithDictionary:", v12);
      -[NLXSchemaNLXClientEvent setNlxDeviceFixedContext:](v5, "setNlxDeviceFixedContext:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmMatchingSpanEnded"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[NLXSchemaCDMMatchingSpanEnded initWithDictionary:]([NLXSchemaCDMMatchingSpanEnded alloc], "initWithDictionary:", v14);
      -[NLXSchemaNLXClientEvent setCdmMatchingSpanEnded:](v5, "setCdmMatchingSpanEnded:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmUsoGraphTier1"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[NLXSchemaCDMUsoGraphTier1 initWithDictionary:]([NLXSchemaCDMUsoGraphTier1 alloc], "initWithDictionary:", v16);
      -[NLXSchemaNLXClientEvent setCdmUsoGraphTier1:](v5, "setCdmUsoGraphTier1:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmMatchingSpanTier1"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v126 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[NLXSchemaCDMMatchingSpanTier1 initWithDictionary:]([NLXSchemaCDMMatchingSpanTier1 alloc], "initWithDictionary:", v18);
      -[NLXSchemaNLXClientEvent setCdmMatchingSpanTier1:](v5, "setCdmMatchingSpanTier1:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlxLegacyNLContextTier1"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v125 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[NLXSchemaNLXLegacyNLContextTier1 initWithDictionary:]([NLXSchemaNLXLegacyNLContextTier1 alloc], "initWithDictionary:", v20);
      -[NLXSchemaNLXClientEvent setNlxLegacyNLContextTier1:](v5, "setNlxLegacyNLContextTier1:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmDelegatedUserDialogActTier1"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v124 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[NLXSchemaCDMDelegatedUserDialogActTier1 initWithDictionary:]([NLXSchemaCDMDelegatedUserDialogActTier1 alloc], "initWithDictionary:", v22);
      -[NLXSchemaNLXClientEvent setCdmDelegatedUserDialogActTier1:](v5, "setCdmDelegatedUserDialogActTier1:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmSystemDialogActTier1"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v123 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[NLXSchemaCDMSystemDialogActTier1 initWithDictionary:]([NLXSchemaCDMSystemDialogActTier1 alloc], "initWithDictionary:", v24);
      -[NLXSchemaNLXClientEvent setCdmSystemDialogActTier1:](v5, "setCdmSystemDialogActTier1:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmTokenizationEnded"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v122 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[NLXSchemaCDMTokenizationEnded initWithDictionary:]([NLXSchemaCDMTokenizationEnded alloc], "initWithDictionary:", v26);
      -[NLXSchemaNLXClientEvent setCdmTokenizationEnded:](v5, "setCdmTokenizationEnded:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmContextUpdateEnded"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v121 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[NLXSchemaCDMContextUpdateEnded initWithDictionary:]([NLXSchemaCDMContextUpdateEnded alloc], "initWithDictionary:", v28);
      -[NLXSchemaNLXClientEvent setCdmContextUpdateEnded:](v5, "setCdmContextUpdateEnded:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("marrsRepetitionDetectionContext"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v120 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[NLXSchemaMARRSRepetitionDetectionContext initWithDictionary:]([NLXSchemaMARRSRepetitionDetectionContext alloc], "initWithDictionary:", v30);
      -[NLXSchemaNLXClientEvent setMarrsRepetitionDetectionContext:](v5, "setMarrsRepetitionDetectionContext:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("marrsQueryRewriteContext"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v119 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[NLXSchemaMARRSQueryRewriteContext initWithDictionary:]([NLXSchemaMARRSQueryRewriteContext alloc], "initWithDictionary:", v32);
      -[NLXSchemaNLXClientEvent setMarrsQueryRewriteContext:](v5, "setMarrsQueryRewriteContext:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("marrsQueryRewriteEvaluatedTier1"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v118 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[NLXSchemaMARRSQueryRewriteEvaluatedTier1 initWithDictionary:]([NLXSchemaMARRSQueryRewriteEvaluatedTier1 alloc], "initWithDictionary:", v34);
      -[NLXSchemaNLXClientEvent setMarrsQueryRewriteEvaluatedTier1:](v5, "setMarrsQueryRewriteEvaluatedTier1:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmMatchingSpanEndedTier1"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v117 = (void *)v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[NLXSchemaCDMMatchingSpanEndedTier1 initWithDictionary:]([NLXSchemaCDMMatchingSpanEndedTier1 alloc], "initWithDictionary:", v36);
      -[NLXSchemaNLXClientEvent setCdmMatchingSpanEndedTier1:](v5, "setCdmMatchingSpanEndedTier1:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlxCurareContext"));
    v38 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v116 = (void *)v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[NLXSchemaNLXCurareContext initWithDictionary:]([NLXSchemaNLXCurareContext alloc], "initWithDictionary:", v38);
      -[NLXSchemaNLXClientEvent setNlxCurareContext:](v5, "setNlxCurareContext:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("marrsMentionDetectorEnded"));
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v115 = (void *)v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[NLXSchemaMARRSMentionDetectorEnded initWithDictionary:]([NLXSchemaMARRSMentionDetectorEnded alloc], "initWithDictionary:", v40);
      -[NLXSchemaNLXClientEvent setMarrsMentionDetectorEnded:](v5, "setMarrsMentionDetectorEnded:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("marrsMentionDetectorEndedTier1"));
    v42 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v114 = (void *)v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = -[NLXSchemaMARRSMentionDetectorEndedTier1 initWithDictionary:]([NLXSchemaMARRSMentionDetectorEndedTier1 alloc], "initWithDictionary:", v42);
      -[NLXSchemaNLXClientEvent setMarrsMentionDetectorEndedTier1:](v5, "setMarrsMentionDetectorEndedTier1:", v43);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("marrsMentionResolverEnded"));
    v44 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v113 = (void *)v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[NLXSchemaMARRSMentionResolverEnded initWithDictionary:]([NLXSchemaMARRSMentionResolverEnded alloc], "initWithDictionary:", v44);
      -[NLXSchemaNLXClientEvent setMarrsMentionResolverEnded:](v5, "setMarrsMentionResolverEnded:", v45);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("marrsMentionResolverEndedTier1"));
    v46 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v112 = (void *)v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[NLXSchemaMARRSMentionResolverEndedTier1 initWithDictionary:]([NLXSchemaMARRSMentionResolverEndedTier1 alloc], "initWithDictionary:", v46);
      -[NLXSchemaNLXClientEvent setMarrsMentionResolverEndedTier1:](v5, "setMarrsMentionResolverEndedTier1:", v47);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmClientSetupContext"));
    v48 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v111 = (void *)v48;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[NLXSchemaCDMClientSetupContext initWithDictionary:]([NLXSchemaCDMClientSetupContext alloc], "initWithDictionary:", v48);
      -[NLXSchemaNLXClientEvent setCdmClientSetupContext:](v5, "setCdmClientSetupContext:", v49);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmAllServicesSetupContext"));
    v50 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v110 = (void *)v50;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = -[NLXSchemaCDMAllServicesSetupContext initWithDictionary:]([NLXSchemaCDMAllServicesSetupContext alloc], "initWithDictionary:", v50);
      -[NLXSchemaNLXClientEvent setCdmAllServicesSetupContext:](v5, "setCdmAllServicesSetupContext:", v51);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmSingleServiceSetupAttemptContext"));
    v52 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v109 = (void *)v52;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = -[NLXSchemaCDMSingleServiceSetupAttemptContext initWithDictionary:]([NLXSchemaCDMSingleServiceSetupAttemptContext alloc], "initWithDictionary:", v52);
      -[NLXSchemaNLXClientEvent setCdmSingleServiceSetupAttemptContext:](v5, "setCdmSingleServiceSetupAttemptContext:", v53);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmSingleServiceSetupAttemptFailed"));
    v54 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v108 = (void *)v54;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = -[NLXSchemaCDMSingleServiceSetupAttemptFailed initWithDictionary:]([NLXSchemaCDMSingleServiceSetupAttemptFailed alloc], "initWithDictionary:", v54);
      -[NLXSchemaNLXClientEvent setCdmSingleServiceSetupAttemptFailed:](v5, "setCdmSingleServiceSetupAttemptFailed:", v55);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmSpanMatcherContext"));
    v56 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v107 = (void *)v56;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = -[NLXSchemaCDMSpanMatcherContext initWithDictionary:]([NLXSchemaCDMSpanMatcherContext alloc], "initWithDictionary:", v56);
      -[NLXSchemaNLXClientEvent setCdmSpanMatcherContext:](v5, "setCdmSpanMatcherContext:", v57);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("marrsContextualSpanMatcherEnded"));
    v58 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v106 = (void *)v58;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = -[NLXSchemaMARRSContextualSpanMatcherEnded initWithDictionary:]([NLXSchemaMARRSContextualSpanMatcherEnded alloc], "initWithDictionary:", v58);
      -[NLXSchemaNLXClientEvent setMarrsContextualSpanMatcherEnded:](v5, "setMarrsContextualSpanMatcherEnded:", v59);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("marrsContextualSpanMatcherEndedTier1"));
    v60 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v105 = (void *)v60;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = -[NLXSchemaMARRSContextualSpanMatcherEndedTier1 initWithDictionary:]([NLXSchemaMARRSContextualSpanMatcherEndedTier1 alloc], "initWithDictionary:", v60);
      -[NLXSchemaNLXClientEvent setMarrsContextualSpanMatcherEndedTier1:](v5, "setMarrsContextualSpanMatcherEndedTier1:", v61);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmXpcEventProcessingContext"));
    v62 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v104 = (void *)v62;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = -[NLXSchemaCDMXPCEventProcessingContext initWithDictionary:]([NLXSchemaCDMXPCEventProcessingContext alloc], "initWithDictionary:", v62);
      -[NLXSchemaNLXClientEvent setCdmXpcEventProcessingContext:](v5, "setCdmXpcEventProcessingContext:", v63);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmAssetSetupContext"));
    v64 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v103 = (void *)v64;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = -[NLXSchemaCDMAssetSetupContext initWithDictionary:]([NLXSchemaCDMAssetSetupContext alloc], "initWithDictionary:", v64);
      -[NLXSchemaNLXClientEvent setCdmAssetSetupContext:](v5, "setCdmAssetSetupContext:", v65);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmSetupMissingAssetsDetected"));
    v66 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v102 = (void *)v66;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = -[NLXSchemaCDMSetupMissingAssetsDetected initWithDictionary:]([NLXSchemaCDMSetupMissingAssetsDetected alloc], "initWithDictionary:", v66);
      -[NLXSchemaNLXClientEvent setCdmSetupMissingAssetsDetected:](v5, "setCdmSetupMissingAssetsDetected:", v67);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmClientWarmupContext"));
    v68 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v101 = (void *)v68;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = -[NLXSchemaCDMClientWarmupContext initWithDictionary:]([NLXSchemaCDMClientWarmupContext alloc], "initWithDictionary:", v68);
      -[NLXSchemaNLXClientEvent setCdmClientWarmupContext:](v5, "setCdmClientWarmupContext:", v69);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmAllServicesWarmupContext"));
    v70 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v100 = (void *)v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v71 = -[NLXSchemaCDMAllServicesWarmupContext initWithDictionary:]([NLXSchemaCDMAllServicesWarmupContext alloc], "initWithDictionary:", v70);
      -[NLXSchemaNLXClientEvent setCdmAllServicesWarmupContext:](v5, "setCdmAllServicesWarmupContext:", v71);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmSingleServiceWarmupAttemptContext"));
    v72 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v99 = (void *)v72;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v73 = -[NLXSchemaCDMSingleServiceWarmupAttemptContext initWithDictionary:]([NLXSchemaCDMSingleServiceWarmupAttemptContext alloc], "initWithDictionary:", v72);
      -[NLXSchemaNLXClientEvent setCdmSingleServiceWarmupAttemptContext:](v5, "setCdmSingleServiceWarmupAttemptContext:", v73);

    }
    v97 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmSingleServiceWarmupAttemptFailed"));
    v74 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v75 = -[NLXSchemaCDMSingleServiceWarmupAttemptFailed initWithDictionary:]([NLXSchemaCDMSingleServiceWarmupAttemptFailed alloc], "initWithDictionary:", v74);
      -[NLXSchemaNLXClientEvent setCdmSingleServiceWarmupAttemptFailed:](v5, "setCdmSingleServiceWarmupAttemptFailed:", v75);

    }
    v96 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmAssetsReported"), v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = -[NLXSchemaCDMAssetsReported initWithDictionary:]([NLXSchemaCDMAssetsReported alloc], "initWithDictionary:", v76);
      -[NLXSchemaNLXClientEvent setCdmAssetsReported:](v5, "setCdmAssetsReported:", v77);

    }
    v95 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ssuUserRequestContext"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v79 = -[NLXSchemaSSUUserRequestContext initWithDictionary:]([NLXSchemaSSUUserRequestContext alloc], "initWithDictionary:", v78);
      -[NLXSchemaNLXClientEvent setSsuUserRequestContext:](v5, "setSsuUserRequestContext:", v79);

    }
    v94 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ssuBackgroundRequestContext"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v81 = -[NLXSchemaSSUBackgroundUpdateContext initWithDictionary:]([NLXSchemaSSUBackgroundUpdateContext alloc], "initWithDictionary:", v80);
      -[NLXSchemaNLXClientEvent setSsuBackgroundRequestContext:](v5, "setSsuBackgroundRequestContext:", v81);

    }
    v93 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmServiceHandleMetricsReported"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v83 = -[NLXSchemaCDMServiceHandleMetricsReported initWithDictionary:]([NLXSchemaCDMServiceHandleMetricsReported alloc], "initWithDictionary:", v82);
      -[NLXSchemaNLXClientEvent setCdmServiceHandleMetricsReported:](v5, "setCdmServiceHandleMetricsReported:", v83);

    }
    v98 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmServiceSetupMetricsReported"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v85 = -[NLXSchemaCDMServiceSetupMetricsReported initWithDictionary:]([NLXSchemaCDMServiceSetupMetricsReported alloc], "initWithDictionary:", v84);
      -[NLXSchemaNLXClientEvent setCdmServiceSetupMetricsReported:](v5, "setCdmServiceSetupMetricsReported:", v85);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("milAssetAcquisitionContext"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v87 = -[NLXSchemaMILAssetAcquisitionContext initWithDictionary:]([NLXSchemaMILAssetAcquisitionContext alloc], "initWithDictionary:", v86);
      -[NLXSchemaNLXClientEvent setMilAssetAcquisitionContext:](v5, "setMilAssetAcquisitionContext:", v87);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdmSetupLink"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v89 = -[NLXSchemaCDMSetupLink initWithDictionary:]([NLXSchemaCDMSetupLink alloc], "initWithDictionary:", v88);
      -[NLXSchemaNLXClientEvent setCdmSetupLink:](v5, "setCdmSetupLink:", v89);

    }
    v90 = v5;

  }
  return v5;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasCdmServiceContext
{
  return self->_hasCdmServiceContext;
}

- (void)setHasCdmServiceContext:(BOOL)a3
{
  self->_hasCdmServiceContext = a3;
}

- (BOOL)hasCdmRequestContext
{
  return self->_hasCdmRequestContext;
}

- (void)setHasCdmRequestContext:(BOOL)a3
{
  self->_hasCdmRequestContext = a3;
}

- (BOOL)hasNlxDeviceFixedContext
{
  return self->_hasNlxDeviceFixedContext;
}

- (void)setHasNlxDeviceFixedContext:(BOOL)a3
{
  self->_hasNlxDeviceFixedContext = a3;
}

- (BOOL)hasCdmMatchingSpanEnded
{
  return self->_hasCdmMatchingSpanEnded;
}

- (void)setHasCdmMatchingSpanEnded:(BOOL)a3
{
  self->_hasCdmMatchingSpanEnded = a3;
}

- (BOOL)hasCdmUsoGraphTier1
{
  return self->_hasCdmUsoGraphTier1;
}

- (void)setHasCdmUsoGraphTier1:(BOOL)a3
{
  self->_hasCdmUsoGraphTier1 = a3;
}

- (BOOL)hasCdmMatchingSpanTier1
{
  return self->_hasCdmMatchingSpanTier1;
}

- (void)setHasCdmMatchingSpanTier1:(BOOL)a3
{
  self->_hasCdmMatchingSpanTier1 = a3;
}

- (BOOL)hasNlxLegacyNLContextTier1
{
  return self->_hasNlxLegacyNLContextTier1;
}

- (void)setHasNlxLegacyNLContextTier1:(BOOL)a3
{
  self->_hasNlxLegacyNLContextTier1 = a3;
}

- (BOOL)hasCdmDelegatedUserDialogActTier1
{
  return self->_hasCdmDelegatedUserDialogActTier1;
}

- (void)setHasCdmDelegatedUserDialogActTier1:(BOOL)a3
{
  self->_hasCdmDelegatedUserDialogActTier1 = a3;
}

- (BOOL)hasCdmSystemDialogActTier1
{
  return self->_hasCdmSystemDialogActTier1;
}

- (void)setHasCdmSystemDialogActTier1:(BOOL)a3
{
  self->_hasCdmSystemDialogActTier1 = a3;
}

- (BOOL)hasCdmTokenizationEnded
{
  return self->_hasCdmTokenizationEnded;
}

- (void)setHasCdmTokenizationEnded:(BOOL)a3
{
  self->_hasCdmTokenizationEnded = a3;
}

- (BOOL)hasCdmContextUpdateEnded
{
  return self->_hasCdmContextUpdateEnded;
}

- (void)setHasCdmContextUpdateEnded:(BOOL)a3
{
  self->_hasCdmContextUpdateEnded = a3;
}

- (BOOL)hasMarrsRepetitionDetectionContext
{
  return self->_hasMarrsRepetitionDetectionContext;
}

- (void)setHasMarrsRepetitionDetectionContext:(BOOL)a3
{
  self->_hasMarrsRepetitionDetectionContext = a3;
}

- (BOOL)hasMarrsQueryRewriteContext
{
  return self->_hasMarrsQueryRewriteContext;
}

- (void)setHasMarrsQueryRewriteContext:(BOOL)a3
{
  self->_hasMarrsQueryRewriteContext = a3;
}

- (BOOL)hasMarrsQueryRewriteEvaluatedTier1
{
  return self->_hasMarrsQueryRewriteEvaluatedTier1;
}

- (void)setHasMarrsQueryRewriteEvaluatedTier1:(BOOL)a3
{
  self->_hasMarrsQueryRewriteEvaluatedTier1 = a3;
}

- (BOOL)hasCdmMatchingSpanEndedTier1
{
  return self->_hasCdmMatchingSpanEndedTier1;
}

- (void)setHasCdmMatchingSpanEndedTier1:(BOOL)a3
{
  self->_hasCdmMatchingSpanEndedTier1 = a3;
}

- (BOOL)hasNlxCurareContext
{
  return self->_hasNlxCurareContext;
}

- (void)setHasNlxCurareContext:(BOOL)a3
{
  self->_hasNlxCurareContext = a3;
}

- (BOOL)hasMarrsMentionDetectorEnded
{
  return self->_hasMarrsMentionDetectorEnded;
}

- (void)setHasMarrsMentionDetectorEnded:(BOOL)a3
{
  self->_hasMarrsMentionDetectorEnded = a3;
}

- (BOOL)hasMarrsMentionDetectorEndedTier1
{
  return self->_hasMarrsMentionDetectorEndedTier1;
}

- (void)setHasMarrsMentionDetectorEndedTier1:(BOOL)a3
{
  self->_hasMarrsMentionDetectorEndedTier1 = a3;
}

- (BOOL)hasMarrsMentionResolverEnded
{
  return self->_hasMarrsMentionResolverEnded;
}

- (void)setHasMarrsMentionResolverEnded:(BOOL)a3
{
  self->_hasMarrsMentionResolverEnded = a3;
}

- (BOOL)hasMarrsMentionResolverEndedTier1
{
  return self->_hasMarrsMentionResolverEndedTier1;
}

- (void)setHasMarrsMentionResolverEndedTier1:(BOOL)a3
{
  self->_hasMarrsMentionResolverEndedTier1 = a3;
}

- (BOOL)hasCdmClientSetupContext
{
  return self->_hasCdmClientSetupContext;
}

- (void)setHasCdmClientSetupContext:(BOOL)a3
{
  self->_hasCdmClientSetupContext = a3;
}

- (BOOL)hasCdmAllServicesSetupContext
{
  return self->_hasCdmAllServicesSetupContext;
}

- (void)setHasCdmAllServicesSetupContext:(BOOL)a3
{
  self->_hasCdmAllServicesSetupContext = a3;
}

- (BOOL)hasCdmSingleServiceSetupAttemptContext
{
  return self->_hasCdmSingleServiceSetupAttemptContext;
}

- (void)setHasCdmSingleServiceSetupAttemptContext:(BOOL)a3
{
  self->_hasCdmSingleServiceSetupAttemptContext = a3;
}

- (BOOL)hasCdmSingleServiceSetupAttemptFailed
{
  return self->_hasCdmSingleServiceSetupAttemptFailed;
}

- (void)setHasCdmSingleServiceSetupAttemptFailed:(BOOL)a3
{
  self->_hasCdmSingleServiceSetupAttemptFailed = a3;
}

- (BOOL)hasCdmSpanMatcherContext
{
  return self->_hasCdmSpanMatcherContext;
}

- (void)setHasCdmSpanMatcherContext:(BOOL)a3
{
  self->_hasCdmSpanMatcherContext = a3;
}

- (BOOL)hasMarrsContextualSpanMatcherEnded
{
  return self->_hasMarrsContextualSpanMatcherEnded;
}

- (void)setHasMarrsContextualSpanMatcherEnded:(BOOL)a3
{
  self->_hasMarrsContextualSpanMatcherEnded = a3;
}

- (BOOL)hasMarrsContextualSpanMatcherEndedTier1
{
  return self->_hasMarrsContextualSpanMatcherEndedTier1;
}

- (void)setHasMarrsContextualSpanMatcherEndedTier1:(BOOL)a3
{
  self->_hasMarrsContextualSpanMatcherEndedTier1 = a3;
}

- (BOOL)hasCdmXpcEventProcessingContext
{
  return self->_hasCdmXpcEventProcessingContext;
}

- (void)setHasCdmXpcEventProcessingContext:(BOOL)a3
{
  self->_hasCdmXpcEventProcessingContext = a3;
}

- (BOOL)hasCdmAssetSetupContext
{
  return self->_hasCdmAssetSetupContext;
}

- (void)setHasCdmAssetSetupContext:(BOOL)a3
{
  self->_hasCdmAssetSetupContext = a3;
}

- (BOOL)hasCdmSetupMissingAssetsDetected
{
  return self->_hasCdmSetupMissingAssetsDetected;
}

- (void)setHasCdmSetupMissingAssetsDetected:(BOOL)a3
{
  self->_hasCdmSetupMissingAssetsDetected = a3;
}

- (BOOL)hasCdmClientWarmupContext
{
  return self->_hasCdmClientWarmupContext;
}

- (void)setHasCdmClientWarmupContext:(BOOL)a3
{
  self->_hasCdmClientWarmupContext = a3;
}

- (BOOL)hasCdmAllServicesWarmupContext
{
  return self->_hasCdmAllServicesWarmupContext;
}

- (void)setHasCdmAllServicesWarmupContext:(BOOL)a3
{
  self->_hasCdmAllServicesWarmupContext = a3;
}

- (BOOL)hasCdmSingleServiceWarmupAttemptContext
{
  return self->_hasCdmSingleServiceWarmupAttemptContext;
}

- (void)setHasCdmSingleServiceWarmupAttemptContext:(BOOL)a3
{
  self->_hasCdmSingleServiceWarmupAttemptContext = a3;
}

- (BOOL)hasCdmSingleServiceWarmupAttemptFailed
{
  return self->_hasCdmSingleServiceWarmupAttemptFailed;
}

- (void)setHasCdmSingleServiceWarmupAttemptFailed:(BOOL)a3
{
  self->_hasCdmSingleServiceWarmupAttemptFailed = a3;
}

- (BOOL)hasCdmAssetsReported
{
  return self->_hasCdmAssetsReported;
}

- (void)setHasCdmAssetsReported:(BOOL)a3
{
  self->_hasCdmAssetsReported = a3;
}

- (BOOL)hasSsuUserRequestContext
{
  return self->_hasSsuUserRequestContext;
}

- (void)setHasSsuUserRequestContext:(BOOL)a3
{
  self->_hasSsuUserRequestContext = a3;
}

- (BOOL)hasSsuBackgroundRequestContext
{
  return self->_hasSsuBackgroundRequestContext;
}

- (void)setHasSsuBackgroundRequestContext:(BOOL)a3
{
  self->_hasSsuBackgroundRequestContext = a3;
}

- (BOOL)hasCdmServiceHandleMetricsReported
{
  return self->_hasCdmServiceHandleMetricsReported;
}

- (void)setHasCdmServiceHandleMetricsReported:(BOOL)a3
{
  self->_hasCdmServiceHandleMetricsReported = a3;
}

- (BOOL)hasCdmServiceSetupMetricsReported
{
  return self->_hasCdmServiceSetupMetricsReported;
}

- (void)setHasCdmServiceSetupMetricsReported:(BOOL)a3
{
  self->_hasCdmServiceSetupMetricsReported = a3;
}

- (BOOL)hasMilAssetAcquisitionContext
{
  return self->_hasMilAssetAcquisitionContext;
}

- (void)setHasMilAssetAcquisitionContext:(BOOL)a3
{
  self->_hasMilAssetAcquisitionContext = a3;
}

- (BOOL)hasCdmSetupLink
{
  return self->_hasCdmSetupLink;
}

- (void)setHasCdmSetupLink:(BOOL)a3
{
  self->_hasCdmSetupLink = a3;
}

@end
