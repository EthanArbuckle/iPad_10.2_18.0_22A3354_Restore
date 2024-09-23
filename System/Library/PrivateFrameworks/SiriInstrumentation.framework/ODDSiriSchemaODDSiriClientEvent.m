@implementation ODDSiriSchemaODDSiriClientEvent

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
  v61.super_class = (Class)ODDSiriSchemaODDSiriClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v61, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDSiriClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDSiriClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[ODDSiriSchemaODDSiriClientEvent deviceSegmentsReported](self, "deviceSegmentsReported");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDSiriClientEvent deleteDeviceSegmentsReported](self, "deleteDeviceSegmentsReported");
  -[ODDSiriSchemaODDSiriClientEvent deviceCohortsReported](self, "deviceCohortsReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ODDSiriSchemaODDSiriClientEvent deleteDeviceCohortsReported](self, "deleteDeviceCohortsReported");
  -[ODDSiriSchemaODDSiriClientEvent assistantDeviceDigestReported](self, "assistantDeviceDigestReported");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ODDSiriSchemaODDSiriClientEvent deleteAssistantDeviceDigestReported](self, "deleteAssistantDeviceDigestReported");
  -[ODDSiriSchemaODDSiriClientEvent dictationDeviceDigestReported](self, "dictationDeviceDigestReported");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[ODDSiriSchemaODDSiriClientEvent deleteDictationDeviceDigestReported](self, "deleteDictationDeviceDigestReported");
  -[ODDSiriSchemaODDSiriClientEvent siriAccountInformation](self, "siriAccountInformation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[ODDSiriSchemaODDSiriClientEvent deleteSiriAccountInformation](self, "deleteSiriAccountInformation");
  -[ODDSiriSchemaODDSiriClientEvent assistantExperimentDigestReported](self, "assistantExperimentDigestReported");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[ODDSiriSchemaODDSiriClientEvent deleteAssistantExperimentDigestReported](self, "deleteAssistantExperimentDigestReported");
  -[ODDSiriSchemaODDSiriClientEvent assistantDiagnosticAndUsageOptInDigestReported](self, "assistantDiagnosticAndUsageOptInDigestReported");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[ODDSiriSchemaODDSiriClientEvent deleteAssistantDiagnosticAndUsageOptInDigestReported](self, "deleteAssistantDiagnosticAndUsageOptInDigestReported");
  -[ODDSiriSchemaODDSiriClientEvent iOSDevicePropertiesReported](self, "iOSDevicePropertiesReported");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[ODDSiriSchemaODDSiriClientEvent deleteIOSDevicePropertiesReported](self, "deleteIOSDevicePropertiesReported");
  -[ODDSiriSchemaODDSiriClientEvent watchOSDevicePropertiesReported](self, "watchOSDevicePropertiesReported");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[ODDSiriSchemaODDSiriClientEvent deleteWatchOSDevicePropertiesReported](self, "deleteWatchOSDevicePropertiesReported");
  -[ODDSiriSchemaODDSiriClientEvent tvOSDevicePropertiesReported](self, "tvOSDevicePropertiesReported");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[ODDSiriSchemaODDSiriClientEvent deleteTvOSDevicePropertiesReported](self, "deleteTvOSDevicePropertiesReported");
  -[ODDSiriSchemaODDSiriClientEvent macOSDevicePropertiesReported](self, "macOSDevicePropertiesReported");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "applySensitiveConditionsPolicy:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "suppressMessage");

  if (v41)
    -[ODDSiriSchemaODDSiriClientEvent deleteMacOSDevicePropertiesReported](self, "deleteMacOSDevicePropertiesReported");
  -[ODDSiriSchemaODDSiriClientEvent visionOSDevicePropertiesReported](self, "visionOSDevicePropertiesReported");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applySensitiveConditionsPolicy:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "suppressMessage");

  if (v44)
    -[ODDSiriSchemaODDSiriClientEvent deleteVisionOSDevicePropertiesReported](self, "deleteVisionOSDevicePropertiesReported");
  -[ODDSiriSchemaODDSiriClientEvent assistantCarPlayDigestReported](self, "assistantCarPlayDigestReported");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "applySensitiveConditionsPolicy:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "suppressMessage");

  if (v47)
    -[ODDSiriSchemaODDSiriClientEvent deleteAssistantCarPlayDigestReported](self, "deleteAssistantCarPlayDigestReported");
  -[ODDSiriSchemaODDSiriClientEvent requestsWithoutAssetsDigestReported](self, "requestsWithoutAssetsDigestReported");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "applySensitiveConditionsPolicy:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "suppressMessage");

  if (v50)
    -[ODDSiriSchemaODDSiriClientEvent deleteRequestsWithoutAssetsDigestReported](self, "deleteRequestsWithoutAssetsDigestReported");
  -[ODDSiriSchemaODDSiriClientEvent assetAvailabilityFromBootDigestReported](self, "assetAvailabilityFromBootDigestReported");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "applySensitiveConditionsPolicy:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "suppressMessage");

  if (v53)
    -[ODDSiriSchemaODDSiriClientEvent deleteAssetAvailabilityFromBootDigestReported](self, "deleteAssetAvailabilityFromBootDigestReported");
  -[ODDSiriSchemaODDSiriClientEvent assetSetStatusDigestReported](self, "assetSetStatusDigestReported");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "applySensitiveConditionsPolicy:", v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "suppressMessage");

  if (v56)
    -[ODDSiriSchemaODDSiriClientEvent deleteAssetSetStatusDigestReported](self, "deleteAssetSetStatusDigestReported");
  -[ODDSiriSchemaODDSiriClientEvent executionMetadataReported](self, "executionMetadataReported");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "applySensitiveConditionsPolicy:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "suppressMessage");

  if (v59)
    -[ODDSiriSchemaODDSiriClientEvent deleteExecutionMetadataReported](self, "deleteExecutionMetadataReported");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[ODDSiriSchemaODDSiriClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 10 > 0x10)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562A2D8[v3 - 10]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 10 > 0x10)
    return 0;
  else
    return off_1E562A360[a3 - 10];
}

- (int)clockIsolationLevel
{
  if (-[ODDSiriSchemaODDSiriClientEvent whichEvent_Type](self, "whichEvent_Type") - 10 >= 0x11)
    return 1;
  else
    return 2;
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[ODDSiriSchemaODDSiriClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 10 > 0x10)
    return CFSTR("com.apple.aiml.siri.odd.ODDSiriClientEvent");
  else
    return off_1E563BB38[v2 - 10];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[ODDSiriSchemaODDSiriClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setDeviceSegmentsReported:(id)a3
{
  ODDSiriSchemaODDDeviceSegmentsReported *v4;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;

  v4 = (ODDSiriSchemaODDDeviceSegmentsReported *)a3;
  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 10;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = v4;

}

- (ODDSiriSchemaODDDeviceSegmentsReported)deviceSegmentsReported
{
  if (self->_whichEvent_Type == 10)
    return self->_deviceSegmentsReported;
  else
    return (ODDSiriSchemaODDDeviceSegmentsReported *)0;
}

- (void)deleteDeviceSegmentsReported
{
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;

  if (self->_whichEvent_Type == 10)
  {
    self->_whichEvent_Type = 0;
    deviceSegmentsReported = self->_deviceSegmentsReported;
    self->_deviceSegmentsReported = 0;

  }
}

- (void)setDeviceCohortsReported:(id)a3
{
  ODDSiriSchemaODDDeviceCohortsReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;

  v4 = (ODDSiriSchemaODDDeviceCohortsReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 11;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = v4;

}

- (ODDSiriSchemaODDDeviceCohortsReported)deviceCohortsReported
{
  if (self->_whichEvent_Type == 11)
    return self->_deviceCohortsReported;
  else
    return (ODDSiriSchemaODDDeviceCohortsReported *)0;
}

- (void)deleteDeviceCohortsReported
{
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;

  if (self->_whichEvent_Type == 11)
  {
    self->_whichEvent_Type = 0;
    deviceCohortsReported = self->_deviceCohortsReported;
    self->_deviceCohortsReported = 0;

  }
}

- (void)setAssistantDeviceDigestReported:(id)a3
{
  ODDSiriSchemaODDAssistantDeviceDigestsReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;

  v4 = (ODDSiriSchemaODDAssistantDeviceDigestsReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 12;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = v4;

}

- (ODDSiriSchemaODDAssistantDeviceDigestsReported)assistantDeviceDigestReported
{
  if (self->_whichEvent_Type == 12)
    return self->_assistantDeviceDigestReported;
  else
    return (ODDSiriSchemaODDAssistantDeviceDigestsReported *)0;
}

- (void)deleteAssistantDeviceDigestReported
{
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;

  if (self->_whichEvent_Type == 12)
  {
    self->_whichEvent_Type = 0;
    assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
    self->_assistantDeviceDigestReported = 0;

  }
}

- (void)setDictationDeviceDigestReported:(id)a3
{
  ODDSiriSchemaODDDictationDeviceDigestsReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;

  v4 = (ODDSiriSchemaODDDictationDeviceDigestsReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 13;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = v4;

}

- (ODDSiriSchemaODDDictationDeviceDigestsReported)dictationDeviceDigestReported
{
  if (self->_whichEvent_Type == 13)
    return self->_dictationDeviceDigestReported;
  else
    return (ODDSiriSchemaODDDictationDeviceDigestsReported *)0;
}

- (void)deleteDictationDeviceDigestReported
{
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;

  if (self->_whichEvent_Type == 13)
  {
    self->_whichEvent_Type = 0;
    dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
    self->_dictationDeviceDigestReported = 0;

  }
}

- (void)setSiriAccountInformation:(id)a3
{
  ODDSiriSchemaODDSiriAccountInformation *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;

  v4 = (ODDSiriSchemaODDSiriAccountInformation *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 14;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = v4;

}

- (ODDSiriSchemaODDSiriAccountInformation)siriAccountInformation
{
  if (self->_whichEvent_Type == 14)
    return self->_siriAccountInformation;
  else
    return (ODDSiriSchemaODDSiriAccountInformation *)0;
}

- (void)deleteSiriAccountInformation
{
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;

  if (self->_whichEvent_Type == 14)
  {
    self->_whichEvent_Type = 0;
    siriAccountInformation = self->_siriAccountInformation;
    self->_siriAccountInformation = 0;

  }
}

- (void)setAssistantExperimentDigestReported:(id)a3
{
  ODDSiriSchemaODDAssistantExperimentDigestsReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;

  v4 = (ODDSiriSchemaODDAssistantExperimentDigestsReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 15;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = v4;

}

- (ODDSiriSchemaODDAssistantExperimentDigestsReported)assistantExperimentDigestReported
{
  if (self->_whichEvent_Type == 15)
    return self->_assistantExperimentDigestReported;
  else
    return (ODDSiriSchemaODDAssistantExperimentDigestsReported *)0;
}

- (void)deleteAssistantExperimentDigestReported
{
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;

  if (self->_whichEvent_Type == 15)
  {
    self->_whichEvent_Type = 0;
    assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
    self->_assistantExperimentDigestReported = 0;

  }
}

- (void)setAssistantDiagnosticAndUsageOptInDigestReported:(id)a3
{
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;

  v4 = (ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  self->_whichEvent_Type = 16 * (v4 != 0);
  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = v4;

}

- (ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported)assistantDiagnosticAndUsageOptInDigestReported
{
  if (self->_whichEvent_Type == 16)
    return self->_assistantDiagnosticAndUsageOptInDigestReported;
  else
    return (ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *)0;
}

- (void)deleteAssistantDiagnosticAndUsageOptInDigestReported
{
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;

  if (self->_whichEvent_Type == 16)
  {
    self->_whichEvent_Type = 0;
    assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
    self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  }
}

- (void)setIOSDevicePropertiesReported:(id)a3
{
  ODDSiriSchemaODDiOSDevicePropertiesReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;

  v4 = (ODDSiriSchemaODDiOSDevicePropertiesReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 17;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = v4;

}

- (ODDSiriSchemaODDiOSDevicePropertiesReported)iOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 17)
    return self->_iOSDevicePropertiesReported;
  else
    return (ODDSiriSchemaODDiOSDevicePropertiesReported *)0;
}

- (void)deleteIOSDevicePropertiesReported
{
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;

  if (self->_whichEvent_Type == 17)
  {
    self->_whichEvent_Type = 0;
    iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
    self->_iOSDevicePropertiesReported = 0;

  }
}

- (void)setWatchOSDevicePropertiesReported:(id)a3
{
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;

  v4 = (ODDSiriSchemaODDwatchOSDevicePropertiesReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 18;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = v4;

}

- (ODDSiriSchemaODDwatchOSDevicePropertiesReported)watchOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 18)
    return self->_watchOSDevicePropertiesReported;
  else
    return (ODDSiriSchemaODDwatchOSDevicePropertiesReported *)0;
}

- (void)deleteWatchOSDevicePropertiesReported
{
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;

  if (self->_whichEvent_Type == 18)
  {
    self->_whichEvent_Type = 0;
    watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
    self->_watchOSDevicePropertiesReported = 0;

  }
}

- (void)setTvOSDevicePropertiesReported:(id)a3
{
  ODDSiriSchemaODDtvOSDevicePropertiesReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;

  v4 = (ODDSiriSchemaODDtvOSDevicePropertiesReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 19;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = v4;

}

- (ODDSiriSchemaODDtvOSDevicePropertiesReported)tvOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 19)
    return self->_tvOSDevicePropertiesReported;
  else
    return (ODDSiriSchemaODDtvOSDevicePropertiesReported *)0;
}

- (void)deleteTvOSDevicePropertiesReported
{
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;

  if (self->_whichEvent_Type == 19)
  {
    self->_whichEvent_Type = 0;
    tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
    self->_tvOSDevicePropertiesReported = 0;

  }
}

- (void)setMacOSDevicePropertiesReported:(id)a3
{
  ODDSiriSchemaODDmacOSDevicePropertiesReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;

  v4 = (ODDSiriSchemaODDmacOSDevicePropertiesReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 20;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = v4;

}

- (ODDSiriSchemaODDmacOSDevicePropertiesReported)macOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 20)
    return self->_macOSDevicePropertiesReported;
  else
    return (ODDSiriSchemaODDmacOSDevicePropertiesReported *)0;
}

- (void)deleteMacOSDevicePropertiesReported
{
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;

  if (self->_whichEvent_Type == 20)
  {
    self->_whichEvent_Type = 0;
    macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
    self->_macOSDevicePropertiesReported = 0;

  }
}

- (void)setVisionOSDevicePropertiesReported:(id)a3
{
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;

  v4 = (ODDSiriSchemaODDvisionOSDevicePropertiesReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 21;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = v4;

}

- (ODDSiriSchemaODDvisionOSDevicePropertiesReported)visionOSDevicePropertiesReported
{
  if (self->_whichEvent_Type == 21)
    return self->_visionOSDevicePropertiesReported;
  else
    return (ODDSiriSchemaODDvisionOSDevicePropertiesReported *)0;
}

- (void)deleteVisionOSDevicePropertiesReported
{
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;

  if (self->_whichEvent_Type == 21)
  {
    self->_whichEvent_Type = 0;
    visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
    self->_visionOSDevicePropertiesReported = 0;

  }
}

- (void)setAssistantCarPlayDigestReported:(id)a3
{
  ODDSiriSchemaODDAssistantCarPlayDigestReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;

  v4 = (ODDSiriSchemaODDAssistantCarPlayDigestReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 22;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = v4;

}

- (ODDSiriSchemaODDAssistantCarPlayDigestReported)assistantCarPlayDigestReported
{
  if (self->_whichEvent_Type == 22)
    return self->_assistantCarPlayDigestReported;
  else
    return (ODDSiriSchemaODDAssistantCarPlayDigestReported *)0;
}

- (void)deleteAssistantCarPlayDigestReported
{
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;

  if (self->_whichEvent_Type == 22)
  {
    self->_whichEvent_Type = 0;
    assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
    self->_assistantCarPlayDigestReported = 0;

  }
}

- (void)setRequestsWithoutAssetsDigestReported:(id)a3
{
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;

  v4 = (ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 23;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = v4;

}

- (ODDSiriSchemaODDRequestsWithoutAssetsDigestReported)requestsWithoutAssetsDigestReported
{
  if (self->_whichEvent_Type == 23)
    return self->_requestsWithoutAssetsDigestReported;
  else
    return (ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *)0;
}

- (void)deleteRequestsWithoutAssetsDigestReported
{
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;

  if (self->_whichEvent_Type == 23)
  {
    self->_whichEvent_Type = 0;
    requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
    self->_requestsWithoutAssetsDigestReported = 0;

  }
}

- (void)setAssetAvailabilityFromBootDigestReported:(id)a3
{
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;

  v4 = (ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 24;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = v4;

}

- (ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported)assetAvailabilityFromBootDigestReported
{
  if (self->_whichEvent_Type == 24)
    return self->_assetAvailabilityFromBootDigestReported;
  else
    return (ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *)0;
}

- (void)deleteAssetAvailabilityFromBootDigestReported
{
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;

  if (self->_whichEvent_Type == 24)
  {
    self->_whichEvent_Type = 0;
    assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
    self->_assetAvailabilityFromBootDigestReported = 0;

  }
}

- (void)setAssetSetStatusDigestReported:(id)a3
{
  ODDSiriSchemaODDAssetSetStatusDigestReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;
  unint64_t v21;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;

  v4 = (ODDSiriSchemaODDAssetSetStatusDigestReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = 0;

  v21 = 25;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = v4;

}

- (ODDSiriSchemaODDAssetSetStatusDigestReported)assetSetStatusDigestReported
{
  if (self->_whichEvent_Type == 25)
    return self->_assetSetStatusDigestReported;
  else
    return (ODDSiriSchemaODDAssetSetStatusDigestReported *)0;
}

- (void)deleteAssetSetStatusDigestReported
{
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;

  if (self->_whichEvent_Type == 25)
  {
    self->_whichEvent_Type = 0;
    assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
    self->_assetSetStatusDigestReported = 0;

  }
}

- (void)setExecutionMetadataReported:(id)a3
{
  ODDSiriSchemaODDExecutionMetadataReported *v4;
  ODDSiriSchemaODDDeviceSegmentsReported *deviceSegmentsReported;
  ODDSiriSchemaODDDeviceCohortsReported *deviceCohortsReported;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *assistantDeviceDigestReported;
  ODDSiriSchemaODDDictationDeviceDigestsReported *dictationDeviceDigestReported;
  ODDSiriSchemaODDSiriAccountInformation *siriAccountInformation;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *assistantExperimentDigestReported;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *assistantDiagnosticAndUsageOptInDigestReported;
  ODDSiriSchemaODDiOSDevicePropertiesReported *iOSDevicePropertiesReported;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *watchOSDevicePropertiesReported;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *tvOSDevicePropertiesReported;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *macOSDevicePropertiesReported;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *visionOSDevicePropertiesReported;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *assistantCarPlayDigestReported;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *requestsWithoutAssetsDigestReported;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *assetAvailabilityFromBootDigestReported;
  ODDSiriSchemaODDAssetSetStatusDigestReported *assetSetStatusDigestReported;
  unint64_t v21;
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;

  v4 = (ODDSiriSchemaODDExecutionMetadataReported *)a3;
  deviceSegmentsReported = self->_deviceSegmentsReported;
  self->_deviceSegmentsReported = 0;

  deviceCohortsReported = self->_deviceCohortsReported;
  self->_deviceCohortsReported = 0;

  assistantDeviceDigestReported = self->_assistantDeviceDigestReported;
  self->_assistantDeviceDigestReported = 0;

  dictationDeviceDigestReported = self->_dictationDeviceDigestReported;
  self->_dictationDeviceDigestReported = 0;

  siriAccountInformation = self->_siriAccountInformation;
  self->_siriAccountInformation = 0;

  assistantExperimentDigestReported = self->_assistantExperimentDigestReported;
  self->_assistantExperimentDigestReported = 0;

  assistantDiagnosticAndUsageOptInDigestReported = self->_assistantDiagnosticAndUsageOptInDigestReported;
  self->_assistantDiagnosticAndUsageOptInDigestReported = 0;

  iOSDevicePropertiesReported = self->_iOSDevicePropertiesReported;
  self->_iOSDevicePropertiesReported = 0;

  watchOSDevicePropertiesReported = self->_watchOSDevicePropertiesReported;
  self->_watchOSDevicePropertiesReported = 0;

  tvOSDevicePropertiesReported = self->_tvOSDevicePropertiesReported;
  self->_tvOSDevicePropertiesReported = 0;

  macOSDevicePropertiesReported = self->_macOSDevicePropertiesReported;
  self->_macOSDevicePropertiesReported = 0;

  visionOSDevicePropertiesReported = self->_visionOSDevicePropertiesReported;
  self->_visionOSDevicePropertiesReported = 0;

  assistantCarPlayDigestReported = self->_assistantCarPlayDigestReported;
  self->_assistantCarPlayDigestReported = 0;

  requestsWithoutAssetsDigestReported = self->_requestsWithoutAssetsDigestReported;
  self->_requestsWithoutAssetsDigestReported = 0;

  assetAvailabilityFromBootDigestReported = self->_assetAvailabilityFromBootDigestReported;
  self->_assetAvailabilityFromBootDigestReported = 0;

  assetSetStatusDigestReported = self->_assetSetStatusDigestReported;
  self->_assetSetStatusDigestReported = 0;

  v21 = 26;
  if (!v4)
    v21 = 0;
  self->_whichEvent_Type = v21;
  executionMetadataReported = self->_executionMetadataReported;
  self->_executionMetadataReported = v4;

}

- (ODDSiriSchemaODDExecutionMetadataReported)executionMetadataReported
{
  if (self->_whichEvent_Type == 26)
    return self->_executionMetadataReported;
  else
    return (ODDSiriSchemaODDExecutionMetadataReported *)0;
}

- (void)deleteExecutionMetadataReported
{
  ODDSiriSchemaODDExecutionMetadataReported *executionMetadataReported;

  if (self->_whichEvent_Type == 26)
  {
    self->_whichEvent_Type = 0;
    executionMetadataReported = self->_executionMetadataReported;
    self->_executionMetadataReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDSiriClientEventReadFrom(self, (uint64_t)a3);
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
  -[ODDSiriSchemaODDSiriClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDSiriClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent deviceSegmentsReported](self, "deviceSegmentsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODDSiriSchemaODDSiriClientEvent deviceSegmentsReported](self, "deviceSegmentsReported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent deviceCohortsReported](self, "deviceCohortsReported");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ODDSiriSchemaODDSiriClientEvent deviceCohortsReported](self, "deviceCohortsReported");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent assistantDeviceDigestReported](self, "assistantDeviceDigestReported");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ODDSiriSchemaODDSiriClientEvent assistantDeviceDigestReported](self, "assistantDeviceDigestReported");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent dictationDeviceDigestReported](self, "dictationDeviceDigestReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ODDSiriSchemaODDSiriClientEvent dictationDeviceDigestReported](self, "dictationDeviceDigestReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent siriAccountInformation](self, "siriAccountInformation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ODDSiriSchemaODDSiriClientEvent siriAccountInformation](self, "siriAccountInformation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent assistantExperimentDigestReported](self, "assistantExperimentDigestReported");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[ODDSiriSchemaODDSiriClientEvent assistantExperimentDigestReported](self, "assistantExperimentDigestReported");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent assistantDiagnosticAndUsageOptInDigestReported](self, "assistantDiagnosticAndUsageOptInDigestReported");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[ODDSiriSchemaODDSiriClientEvent assistantDiagnosticAndUsageOptInDigestReported](self, "assistantDiagnosticAndUsageOptInDigestReported");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent iOSDevicePropertiesReported](self, "iOSDevicePropertiesReported");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[ODDSiriSchemaODDSiriClientEvent iOSDevicePropertiesReported](self, "iOSDevicePropertiesReported");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent watchOSDevicePropertiesReported](self, "watchOSDevicePropertiesReported");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[ODDSiriSchemaODDSiriClientEvent watchOSDevicePropertiesReported](self, "watchOSDevicePropertiesReported");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent tvOSDevicePropertiesReported](self, "tvOSDevicePropertiesReported");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[ODDSiriSchemaODDSiriClientEvent tvOSDevicePropertiesReported](self, "tvOSDevicePropertiesReported");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent macOSDevicePropertiesReported](self, "macOSDevicePropertiesReported");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[ODDSiriSchemaODDSiriClientEvent macOSDevicePropertiesReported](self, "macOSDevicePropertiesReported");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent visionOSDevicePropertiesReported](self, "visionOSDevicePropertiesReported");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[ODDSiriSchemaODDSiriClientEvent visionOSDevicePropertiesReported](self, "visionOSDevicePropertiesReported");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent assistantCarPlayDigestReported](self, "assistantCarPlayDigestReported");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[ODDSiriSchemaODDSiriClientEvent assistantCarPlayDigestReported](self, "assistantCarPlayDigestReported");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent requestsWithoutAssetsDigestReported](self, "requestsWithoutAssetsDigestReported");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[ODDSiriSchemaODDSiriClientEvent requestsWithoutAssetsDigestReported](self, "requestsWithoutAssetsDigestReported");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent assetAvailabilityFromBootDigestReported](self, "assetAvailabilityFromBootDigestReported");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[ODDSiriSchemaODDSiriClientEvent assetAvailabilityFromBootDigestReported](self, "assetAvailabilityFromBootDigestReported");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent assetSetStatusDigestReported](self, "assetSetStatusDigestReported");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[ODDSiriSchemaODDSiriClientEvent assetSetStatusDigestReported](self, "assetSetStatusDigestReported");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDSiriClientEvent executionMetadataReported](self, "executionMetadataReported");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[ODDSiriSchemaODDSiriClientEvent executionMetadataReported](self, "executionMetadataReported");
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
  -[ODDSiriSchemaODDSiriClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODDSiriSchemaODDSiriClientEvent eventMetadata](self, "eventMetadata");
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
  -[ODDSiriSchemaODDSiriClientEvent deviceSegmentsReported](self, "deviceSegmentsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceSegmentsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent deviceSegmentsReported](self, "deviceSegmentsReported");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ODDSiriSchemaODDSiriClientEvent deviceSegmentsReported](self, "deviceSegmentsReported");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceSegmentsReported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent deviceCohortsReported](self, "deviceCohortsReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceCohortsReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent deviceCohortsReported](self, "deviceCohortsReported");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[ODDSiriSchemaODDSiriClientEvent deviceCohortsReported](self, "deviceCohortsReported");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceCohortsReported");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent assistantDeviceDigestReported](self, "assistantDeviceDigestReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDeviceDigestReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent assistantDeviceDigestReported](self, "assistantDeviceDigestReported");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[ODDSiriSchemaODDSiriClientEvent assistantDeviceDigestReported](self, "assistantDeviceDigestReported");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDeviceDigestReported");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent dictationDeviceDigestReported](self, "dictationDeviceDigestReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictationDeviceDigestReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent dictationDeviceDigestReported](self, "dictationDeviceDigestReported");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[ODDSiriSchemaODDSiriClientEvent dictationDeviceDigestReported](self, "dictationDeviceDigestReported");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictationDeviceDigestReported");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent siriAccountInformation](self, "siriAccountInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriAccountInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent siriAccountInformation](self, "siriAccountInformation");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[ODDSiriSchemaODDSiriClientEvent siriAccountInformation](self, "siriAccountInformation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriAccountInformation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent assistantExperimentDigestReported](self, "assistantExperimentDigestReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantExperimentDigestReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent assistantExperimentDigestReported](self, "assistantExperimentDigestReported");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[ODDSiriSchemaODDSiriClientEvent assistantExperimentDigestReported](self, "assistantExperimentDigestReported");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantExperimentDigestReported");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent assistantDiagnosticAndUsageOptInDigestReported](self, "assistantDiagnosticAndUsageOptInDigestReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDiagnosticAndUsageOptInDigestReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent assistantDiagnosticAndUsageOptInDigestReported](self, "assistantDiagnosticAndUsageOptInDigestReported");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[ODDSiriSchemaODDSiriClientEvent assistantDiagnosticAndUsageOptInDigestReported](self, "assistantDiagnosticAndUsageOptInDigestReported");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDiagnosticAndUsageOptInDigestReported");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent iOSDevicePropertiesReported](self, "iOSDevicePropertiesReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iOSDevicePropertiesReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent iOSDevicePropertiesReported](self, "iOSDevicePropertiesReported");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[ODDSiriSchemaODDSiriClientEvent iOSDevicePropertiesReported](self, "iOSDevicePropertiesReported");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iOSDevicePropertiesReported");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent watchOSDevicePropertiesReported](self, "watchOSDevicePropertiesReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchOSDevicePropertiesReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent watchOSDevicePropertiesReported](self, "watchOSDevicePropertiesReported");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[ODDSiriSchemaODDSiriClientEvent watchOSDevicePropertiesReported](self, "watchOSDevicePropertiesReported");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchOSDevicePropertiesReported");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent tvOSDevicePropertiesReported](self, "tvOSDevicePropertiesReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tvOSDevicePropertiesReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent tvOSDevicePropertiesReported](self, "tvOSDevicePropertiesReported");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[ODDSiriSchemaODDSiriClientEvent tvOSDevicePropertiesReported](self, "tvOSDevicePropertiesReported");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvOSDevicePropertiesReported");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent macOSDevicePropertiesReported](self, "macOSDevicePropertiesReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "macOSDevicePropertiesReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent macOSDevicePropertiesReported](self, "macOSDevicePropertiesReported");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[ODDSiriSchemaODDSiriClientEvent macOSDevicePropertiesReported](self, "macOSDevicePropertiesReported");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "macOSDevicePropertiesReported");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent visionOSDevicePropertiesReported](self, "visionOSDevicePropertiesReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visionOSDevicePropertiesReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent visionOSDevicePropertiesReported](self, "visionOSDevicePropertiesReported");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[ODDSiriSchemaODDSiriClientEvent visionOSDevicePropertiesReported](self, "visionOSDevicePropertiesReported");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visionOSDevicePropertiesReported");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent assistantCarPlayDigestReported](self, "assistantCarPlayDigestReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantCarPlayDigestReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent assistantCarPlayDigestReported](self, "assistantCarPlayDigestReported");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[ODDSiriSchemaODDSiriClientEvent assistantCarPlayDigestReported](self, "assistantCarPlayDigestReported");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantCarPlayDigestReported");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent requestsWithoutAssetsDigestReported](self, "requestsWithoutAssetsDigestReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestsWithoutAssetsDigestReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent requestsWithoutAssetsDigestReported](self, "requestsWithoutAssetsDigestReported");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[ODDSiriSchemaODDSiriClientEvent requestsWithoutAssetsDigestReported](self, "requestsWithoutAssetsDigestReported");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestsWithoutAssetsDigestReported");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent assetAvailabilityFromBootDigestReported](self, "assetAvailabilityFromBootDigestReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetAvailabilityFromBootDigestReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent assetAvailabilityFromBootDigestReported](self, "assetAvailabilityFromBootDigestReported");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[ODDSiriSchemaODDSiriClientEvent assetAvailabilityFromBootDigestReported](self, "assetAvailabilityFromBootDigestReported");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetAvailabilityFromBootDigestReported");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent assetSetStatusDigestReported](self, "assetSetStatusDigestReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetStatusDigestReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_92;
  -[ODDSiriSchemaODDSiriClientEvent assetSetStatusDigestReported](self, "assetSetStatusDigestReported");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[ODDSiriSchemaODDSiriClientEvent assetSetStatusDigestReported](self, "assetSetStatusDigestReported");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSetStatusDigestReported");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_93;
  }
  else
  {

  }
  -[ODDSiriSchemaODDSiriClientEvent executionMetadataReported](self, "executionMetadataReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executionMetadataReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ODDSiriSchemaODDSiriClientEvent executionMetadataReported](self, "executionMetadataReported");
    v93 = objc_claimAutoreleasedReturnValue();
    if (!v93)
    {

LABEL_96:
      v98 = 1;
      goto LABEL_94;
    }
    v94 = (void *)v93;
    -[ODDSiriSchemaODDSiriClientEvent executionMetadataReported](self, "executionMetadataReported");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executionMetadataReported");
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

  v3 = -[ODDSiriSchemaODDClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[ODDSiriSchemaODDDeviceSegmentsReported hash](self->_deviceSegmentsReported, "hash") ^ v3;
  v5 = -[ODDSiriSchemaODDDeviceCohortsReported hash](self->_deviceCohortsReported, "hash");
  v6 = v4 ^ v5 ^ -[ODDSiriSchemaODDAssistantDeviceDigestsReported hash](self->_assistantDeviceDigestReported, "hash");
  v7 = -[ODDSiriSchemaODDDictationDeviceDigestsReported hash](self->_dictationDeviceDigestReported, "hash");
  v8 = v7 ^ -[ODDSiriSchemaODDSiriAccountInformation hash](self->_siriAccountInformation, "hash");
  v9 = v6 ^ v8 ^ -[ODDSiriSchemaODDAssistantExperimentDigestsReported hash](self->_assistantExperimentDigestReported, "hash");
  v10 = -[ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported hash](self->_assistantDiagnosticAndUsageOptInDigestReported, "hash");
  v11 = v10 ^ -[ODDSiriSchemaODDiOSDevicePropertiesReported hash](self->_iOSDevicePropertiesReported, "hash");
  v12 = v11 ^ -[ODDSiriSchemaODDwatchOSDevicePropertiesReported hash](self->_watchOSDevicePropertiesReported, "hash");
  v13 = v9 ^ v12 ^ -[ODDSiriSchemaODDtvOSDevicePropertiesReported hash](self->_tvOSDevicePropertiesReported, "hash");
  v14 = -[ODDSiriSchemaODDmacOSDevicePropertiesReported hash](self->_macOSDevicePropertiesReported, "hash");
  v15 = v14 ^ -[ODDSiriSchemaODDvisionOSDevicePropertiesReported hash](self->_visionOSDevicePropertiesReported, "hash");
  v16 = v15 ^ -[ODDSiriSchemaODDAssistantCarPlayDigestReported hash](self->_assistantCarPlayDigestReported, "hash");
  v17 = v16 ^ -[ODDSiriSchemaODDRequestsWithoutAssetsDigestReported hash](self->_requestsWithoutAssetsDigestReported, "hash");
  v18 = v13 ^ v17 ^ -[ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported hash](self->_assetAvailabilityFromBootDigestReported, "hash");
  v19 = -[ODDSiriSchemaODDAssetSetStatusDigestReported hash](self->_assetSetStatusDigestReported, "hash");
  return v18 ^ v19 ^ -[ODDSiriSchemaODDExecutionMetadataReported hash](self->_executionMetadataReported, "hash");
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
  if (self->_assetAvailabilityFromBootDigestReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent assetAvailabilityFromBootDigestReported](self, "assetAvailabilityFromBootDigestReported");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetAvailabilityFromBootDigestReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("assetAvailabilityFromBootDigestReported"));

    }
  }
  if (self->_assetSetStatusDigestReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent assetSetStatusDigestReported](self, "assetSetStatusDigestReported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("assetSetStatusDigestReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("assetSetStatusDigestReported"));

    }
  }
  if (self->_assistantCarPlayDigestReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent assistantCarPlayDigestReported](self, "assistantCarPlayDigestReported");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("assistantCarPlayDigestReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("assistantCarPlayDigestReported"));

    }
  }
  if (self->_assistantDeviceDigestReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent assistantDeviceDigestReported](self, "assistantDeviceDigestReported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("assistantDeviceDigestReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("assistantDeviceDigestReported"));

    }
  }
  if (self->_assistantDiagnosticAndUsageOptInDigestReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent assistantDiagnosticAndUsageOptInDigestReported](self, "assistantDiagnosticAndUsageOptInDigestReported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("assistantDiagnosticAndUsageOptInDigestReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("assistantDiagnosticAndUsageOptInDigestReported"));

    }
  }
  if (self->_assistantExperimentDigestReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent assistantExperimentDigestReported](self, "assistantExperimentDigestReported");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("assistantExperimentDigestReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("assistantExperimentDigestReported"));

    }
  }
  if (self->_deviceCohortsReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent deviceCohortsReported](self, "deviceCohortsReported");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("deviceCohortsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("deviceCohortsReported"));

    }
  }
  if (self->_deviceSegmentsReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent deviceSegmentsReported](self, "deviceSegmentsReported");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("deviceSegmentsReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("deviceSegmentsReported"));

    }
  }
  if (self->_dictationDeviceDigestReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent dictationDeviceDigestReported](self, "dictationDeviceDigestReported");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("dictationDeviceDigestReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("dictationDeviceDigestReported"));

    }
  }
  if (self->_eventMetadata)
  {
    -[ODDSiriSchemaODDSiriClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_executionMetadataReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent executionMetadataReported](self, "executionMetadataReported");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("executionMetadataReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("executionMetadataReported"));

    }
  }
  if (self->_iOSDevicePropertiesReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent iOSDevicePropertiesReported](self, "iOSDevicePropertiesReported");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("iOSDevicePropertiesReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("iOSDevicePropertiesReported"));

    }
  }
  if (self->_macOSDevicePropertiesReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent macOSDevicePropertiesReported](self, "macOSDevicePropertiesReported");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("macOSDevicePropertiesReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("macOSDevicePropertiesReported"));

    }
  }
  if (self->_requestsWithoutAssetsDigestReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent requestsWithoutAssetsDigestReported](self, "requestsWithoutAssetsDigestReported");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("requestsWithoutAssetsDigestReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("requestsWithoutAssetsDigestReported"));

    }
  }
  if (self->_siriAccountInformation)
  {
    -[ODDSiriSchemaODDSiriClientEvent siriAccountInformation](self, "siriAccountInformation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("siriAccountInformation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("siriAccountInformation"));

    }
  }
  if (self->_tvOSDevicePropertiesReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent tvOSDevicePropertiesReported](self, "tvOSDevicePropertiesReported");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("tvOSDevicePropertiesReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("tvOSDevicePropertiesReported"));

    }
  }
  if (self->_visionOSDevicePropertiesReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent visionOSDevicePropertiesReported](self, "visionOSDevicePropertiesReported");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("visionOSDevicePropertiesReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("visionOSDevicePropertiesReported"));

    }
  }
  if (self->_watchOSDevicePropertiesReported)
  {
    -[ODDSiriSchemaODDSiriClientEvent watchOSDevicePropertiesReported](self, "watchOSDevicePropertiesReported");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("watchOSDevicePropertiesReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("watchOSDevicePropertiesReported"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDSiriClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDSiriClientEvent)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDSiriClientEvent *v5;
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
    self = -[ODDSiriSchemaODDSiriClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDSiriClientEvent)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDSiriClientEvent *v5;
  uint64_t v6;
  ODDSiriSchemaODDClientEventMetadata *v7;
  uint64_t v8;
  ODDSiriSchemaODDDeviceSegmentsReported *v9;
  uint64_t v10;
  ODDSiriSchemaODDDeviceCohortsReported *v11;
  uint64_t v12;
  ODDSiriSchemaODDAssistantDeviceDigestsReported *v13;
  uint64_t v14;
  ODDSiriSchemaODDDictationDeviceDigestsReported *v15;
  uint64_t v16;
  ODDSiriSchemaODDSiriAccountInformation *v17;
  uint64_t v18;
  ODDSiriSchemaODDAssistantExperimentDigestsReported *v19;
  uint64_t v20;
  ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported *v21;
  uint64_t v22;
  ODDSiriSchemaODDiOSDevicePropertiesReported *v23;
  uint64_t v24;
  ODDSiriSchemaODDwatchOSDevicePropertiesReported *v25;
  uint64_t v26;
  ODDSiriSchemaODDtvOSDevicePropertiesReported *v27;
  void *v28;
  ODDSiriSchemaODDmacOSDevicePropertiesReported *v29;
  void *v30;
  ODDSiriSchemaODDvisionOSDevicePropertiesReported *v31;
  void *v32;
  ODDSiriSchemaODDAssistantCarPlayDigestReported *v33;
  void *v34;
  ODDSiriSchemaODDRequestsWithoutAssetsDigestReported *v35;
  void *v36;
  ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported *v37;
  void *v38;
  ODDSiriSchemaODDAssetSetStatusDigestReported *v39;
  void *v40;
  ODDSiriSchemaODDExecutionMetadataReported *v41;
  ODDSiriSchemaODDSiriClientEvent *v42;
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
  v55.super_class = (Class)ODDSiriSchemaODDSiriClientEvent;
  v5 = -[ODDSiriSchemaODDSiriClientEvent init](&v55, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDClientEventMetadata initWithDictionary:]([ODDSiriSchemaODDClientEventMetadata alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDSiriClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceSegmentsReported"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ODDSiriSchemaODDDeviceSegmentsReported initWithDictionary:]([ODDSiriSchemaODDDeviceSegmentsReported alloc], "initWithDictionary:", v8);
      -[ODDSiriSchemaODDSiriClientEvent setDeviceSegmentsReported:](v5, "setDeviceSegmentsReported:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceCohortsReported"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ODDSiriSchemaODDDeviceCohortsReported initWithDictionary:]([ODDSiriSchemaODDDeviceCohortsReported alloc], "initWithDictionary:", v10);
      -[ODDSiriSchemaODDSiriClientEvent setDeviceCohortsReported:](v5, "setDeviceCohortsReported:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDeviceDigestReported"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ODDSiriSchemaODDAssistantDeviceDigestsReported initWithDictionary:]([ODDSiriSchemaODDAssistantDeviceDigestsReported alloc], "initWithDictionary:", v12);
      -[ODDSiriSchemaODDSiriClientEvent setAssistantDeviceDigestReported:](v5, "setAssistantDeviceDigestReported:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationDeviceDigestReported"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[ODDSiriSchemaODDDictationDeviceDigestsReported initWithDictionary:]([ODDSiriSchemaODDDictationDeviceDigestsReported alloc], "initWithDictionary:", v14);
      -[ODDSiriSchemaODDSiriClientEvent setDictationDeviceDigestReported:](v5, "setDictationDeviceDigestReported:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriAccountInformation"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[ODDSiriSchemaODDSiriAccountInformation initWithDictionary:]([ODDSiriSchemaODDSiriAccountInformation alloc], "initWithDictionary:", v16);
      -[ODDSiriSchemaODDSiriClientEvent setSiriAccountInformation:](v5, "setSiriAccountInformation:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantExperimentDigestReported"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[ODDSiriSchemaODDAssistantExperimentDigestsReported initWithDictionary:]([ODDSiriSchemaODDAssistantExperimentDigestsReported alloc], "initWithDictionary:", v18);
      -[ODDSiriSchemaODDSiriClientEvent setAssistantExperimentDigestReported:](v5, "setAssistantExperimentDigestReported:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDiagnosticAndUsageOptInDigestReported"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported initWithDictionary:]([ODDSiriSchemaODDAssistantDiagnosticAndUsageOptInDigestsReported alloc], "initWithDictionary:", v20);
      -[ODDSiriSchemaODDSiriClientEvent setAssistantDiagnosticAndUsageOptInDigestReported:](v5, "setAssistantDiagnosticAndUsageOptInDigestReported:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iOSDevicePropertiesReported"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v52 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[ODDSiriSchemaODDiOSDevicePropertiesReported initWithDictionary:]([ODDSiriSchemaODDiOSDevicePropertiesReported alloc], "initWithDictionary:", v22);
      -[ODDSiriSchemaODDSiriClientEvent setIOSDevicePropertiesReported:](v5, "setIOSDevicePropertiesReported:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchOSDevicePropertiesReported"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[ODDSiriSchemaODDwatchOSDevicePropertiesReported initWithDictionary:]([ODDSiriSchemaODDwatchOSDevicePropertiesReported alloc], "initWithDictionary:", v24);
      -[ODDSiriSchemaODDSiriClientEvent setWatchOSDevicePropertiesReported:](v5, "setWatchOSDevicePropertiesReported:", v25);

    }
    v49 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tvOSDevicePropertiesReported"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[ODDSiriSchemaODDtvOSDevicePropertiesReported initWithDictionary:]([ODDSiriSchemaODDtvOSDevicePropertiesReported alloc], "initWithDictionary:", v26);
      -[ODDSiriSchemaODDSiriClientEvent setTvOSDevicePropertiesReported:](v5, "setTvOSDevicePropertiesReported:", v27);

    }
    v44 = (void *)v26;
    v48 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("macOSDevicePropertiesReported"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[ODDSiriSchemaODDmacOSDevicePropertiesReported initWithDictionary:]([ODDSiriSchemaODDmacOSDevicePropertiesReported alloc], "initWithDictionary:", v28);
      -[ODDSiriSchemaODDSiriClientEvent setMacOSDevicePropertiesReported:](v5, "setMacOSDevicePropertiesReported:", v29);

    }
    v47 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("visionOSDevicePropertiesReported"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[ODDSiriSchemaODDvisionOSDevicePropertiesReported initWithDictionary:]([ODDSiriSchemaODDvisionOSDevicePropertiesReported alloc], "initWithDictionary:", v30);
      -[ODDSiriSchemaODDSiriClientEvent setVisionOSDevicePropertiesReported:](v5, "setVisionOSDevicePropertiesReported:", v31);

    }
    v46 = (void *)v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantCarPlayDigestReported"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[ODDSiriSchemaODDAssistantCarPlayDigestReported initWithDictionary:]([ODDSiriSchemaODDAssistantCarPlayDigestReported alloc], "initWithDictionary:", v32);
      -[ODDSiriSchemaODDSiriClientEvent setAssistantCarPlayDigestReported:](v5, "setAssistantCarPlayDigestReported:", v33);

    }
    v45 = (void *)v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestsWithoutAssetsDigestReported"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[ODDSiriSchemaODDRequestsWithoutAssetsDigestReported initWithDictionary:]([ODDSiriSchemaODDRequestsWithoutAssetsDigestReported alloc], "initWithDictionary:", v34);
      -[ODDSiriSchemaODDSiriClientEvent setRequestsWithoutAssetsDigestReported:](v5, "setRequestsWithoutAssetsDigestReported:", v35);

    }
    v50 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetAvailabilityFromBootDigestReported"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported initWithDictionary:]([ODDSiriSchemaODDAssetAvailabilityFromBootDigestReported alloc], "initWithDictionary:", v36);
      -[ODDSiriSchemaODDSiriClientEvent setAssetAvailabilityFromBootDigestReported:](v5, "setAssetAvailabilityFromBootDigestReported:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSetStatusDigestReported"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[ODDSiriSchemaODDAssetSetStatusDigestReported initWithDictionary:]([ODDSiriSchemaODDAssetSetStatusDigestReported alloc], "initWithDictionary:", v38);
      -[ODDSiriSchemaODDSiriClientEvent setAssetSetStatusDigestReported:](v5, "setAssetSetStatusDigestReported:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionMetadataReported"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[ODDSiriSchemaODDExecutionMetadataReported initWithDictionary:]([ODDSiriSchemaODDExecutionMetadataReported alloc], "initWithDictionary:", v40);
      -[ODDSiriSchemaODDSiriClientEvent setExecutionMetadataReported:](v5, "setExecutionMetadataReported:", v41);

    }
    v42 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ODDSiriSchemaODDClientEventMetadata)eventMetadata
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

- (BOOL)hasDeviceSegmentsReported
{
  return self->_hasDeviceSegmentsReported;
}

- (void)setHasDeviceSegmentsReported:(BOOL)a3
{
  self->_hasDeviceSegmentsReported = a3;
}

- (BOOL)hasDeviceCohortsReported
{
  return self->_hasDeviceCohortsReported;
}

- (void)setHasDeviceCohortsReported:(BOOL)a3
{
  self->_hasDeviceCohortsReported = a3;
}

- (BOOL)hasAssistantDeviceDigestReported
{
  return self->_hasAssistantDeviceDigestReported;
}

- (void)setHasAssistantDeviceDigestReported:(BOOL)a3
{
  self->_hasAssistantDeviceDigestReported = a3;
}

- (BOOL)hasDictationDeviceDigestReported
{
  return self->_hasDictationDeviceDigestReported;
}

- (void)setHasDictationDeviceDigestReported:(BOOL)a3
{
  self->_hasDictationDeviceDigestReported = a3;
}

- (BOOL)hasSiriAccountInformation
{
  return self->_hasSiriAccountInformation;
}

- (void)setHasSiriAccountInformation:(BOOL)a3
{
  self->_hasSiriAccountInformation = a3;
}

- (BOOL)hasAssistantExperimentDigestReported
{
  return self->_hasAssistantExperimentDigestReported;
}

- (void)setHasAssistantExperimentDigestReported:(BOOL)a3
{
  self->_hasAssistantExperimentDigestReported = a3;
}

- (BOOL)hasAssistantDiagnosticAndUsageOptInDigestReported
{
  return self->_hasAssistantDiagnosticAndUsageOptInDigestReported;
}

- (void)setHasAssistantDiagnosticAndUsageOptInDigestReported:(BOOL)a3
{
  self->_hasAssistantDiagnosticAndUsageOptInDigestReported = a3;
}

- (BOOL)hasIOSDevicePropertiesReported
{
  return self->_hasIOSDevicePropertiesReported;
}

- (void)setHasIOSDevicePropertiesReported:(BOOL)a3
{
  self->_hasIOSDevicePropertiesReported = a3;
}

- (BOOL)hasWatchOSDevicePropertiesReported
{
  return self->_hasWatchOSDevicePropertiesReported;
}

- (void)setHasWatchOSDevicePropertiesReported:(BOOL)a3
{
  self->_hasWatchOSDevicePropertiesReported = a3;
}

- (BOOL)hasTvOSDevicePropertiesReported
{
  return self->_hasTvOSDevicePropertiesReported;
}

- (void)setHasTvOSDevicePropertiesReported:(BOOL)a3
{
  self->_hasTvOSDevicePropertiesReported = a3;
}

- (BOOL)hasMacOSDevicePropertiesReported
{
  return self->_hasMacOSDevicePropertiesReported;
}

- (void)setHasMacOSDevicePropertiesReported:(BOOL)a3
{
  self->_hasMacOSDevicePropertiesReported = a3;
}

- (BOOL)hasVisionOSDevicePropertiesReported
{
  return self->_hasVisionOSDevicePropertiesReported;
}

- (void)setHasVisionOSDevicePropertiesReported:(BOOL)a3
{
  self->_hasVisionOSDevicePropertiesReported = a3;
}

- (BOOL)hasAssistantCarPlayDigestReported
{
  return self->_hasAssistantCarPlayDigestReported;
}

- (void)setHasAssistantCarPlayDigestReported:(BOOL)a3
{
  self->_hasAssistantCarPlayDigestReported = a3;
}

- (BOOL)hasRequestsWithoutAssetsDigestReported
{
  return self->_hasRequestsWithoutAssetsDigestReported;
}

- (void)setHasRequestsWithoutAssetsDigestReported:(BOOL)a3
{
  self->_hasRequestsWithoutAssetsDigestReported = a3;
}

- (BOOL)hasAssetAvailabilityFromBootDigestReported
{
  return self->_hasAssetAvailabilityFromBootDigestReported;
}

- (void)setHasAssetAvailabilityFromBootDigestReported:(BOOL)a3
{
  self->_hasAssetAvailabilityFromBootDigestReported = a3;
}

- (BOOL)hasAssetSetStatusDigestReported
{
  return self->_hasAssetSetStatusDigestReported;
}

- (void)setHasAssetSetStatusDigestReported:(BOOL)a3
{
  self->_hasAssetSetStatusDigestReported = a3;
}

- (BOOL)hasExecutionMetadataReported
{
  return self->_hasExecutionMetadataReported;
}

- (void)setHasExecutionMetadataReported:(BOOL)a3
{
  self->_hasExecutionMetadataReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionMetadataReported, 0);
  objc_storeStrong((id *)&self->_assetSetStatusDigestReported, 0);
  objc_storeStrong((id *)&self->_assetAvailabilityFromBootDigestReported, 0);
  objc_storeStrong((id *)&self->_requestsWithoutAssetsDigestReported, 0);
  objc_storeStrong((id *)&self->_assistantCarPlayDigestReported, 0);
  objc_storeStrong((id *)&self->_visionOSDevicePropertiesReported, 0);
  objc_storeStrong((id *)&self->_macOSDevicePropertiesReported, 0);
  objc_storeStrong((id *)&self->_tvOSDevicePropertiesReported, 0);
  objc_storeStrong((id *)&self->_watchOSDevicePropertiesReported, 0);
  objc_storeStrong((id *)&self->_iOSDevicePropertiesReported, 0);
  objc_storeStrong((id *)&self->_assistantDiagnosticAndUsageOptInDigestReported, 0);
  objc_storeStrong((id *)&self->_assistantExperimentDigestReported, 0);
  objc_storeStrong((id *)&self->_siriAccountInformation, 0);
  objc_storeStrong((id *)&self->_dictationDeviceDigestReported, 0);
  objc_storeStrong((id *)&self->_assistantDeviceDigestReported, 0);
  objc_storeStrong((id *)&self->_deviceCohortsReported, 0);
  objc_storeStrong((id *)&self->_deviceSegmentsReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 81;
}

@end
