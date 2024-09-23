@implementation SiriNLUSELFLogUtils

+ (id)createCDMAssetsReportedLog:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  SiriInstrumentationEventContainer *v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D99BA0]);
  objc_msgSend(v7, "setAssets:", v5);
  v8 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v8, "setEventMetadata:", v6);
  objc_msgSend(v8, "setCdmAssetsReported:", v7);
  v9 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v9, "setMainEvent:", v8);

  return v9;
}

+ (id)createCDMClientSetupEndedLog:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  SiriInstrumentationEventContainer *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D99BB0]);
  objc_msgSend(v4, "setExists:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0D99BA8]);
  objc_msgSend(v5, "setEnded:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v6, "setEventMetadata:", v3);
  objc_msgSend(v6, "setCdmClientSetupContext:", v5);
  v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v7, "setMainEvent:", v6);

  return v7;
}

+ (id)createCDMAllServicesWarmupStartedLog:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  SiriInstrumentationEventContainer *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D99B78]);
  objc_msgSend(v4, "setExists:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0D99B60]);
  objc_msgSend(v5, "setStartedOrChanged:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v6, "setEventMetadata:", v3);
  objc_msgSend(v6, "setCdmAllServicesWarmupContext:", v5);
  v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v7, "setMainEvent:", v6);

  return v7;
}

+ (id)createCDMAllServicesSetupStartedLog:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  SiriInstrumentationEventContainer *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D99B58]);
  objc_msgSend(v4, "setExists:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0D99B40]);
  objc_msgSend(v5, "setStartedOrChanged:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v6, "setEventMetadata:", v3);
  objc_msgSend(v6, "setCdmAllServicesSetupContext:", v5);
  v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v7, "setMainEvent:", v6);

  return v7;
}

+ (id)createCDMAssetSetupStartedLog:(id)a3 serviceTypes:(id)a4 metadata:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  SiriInstrumentationEventContainer *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D99B98]);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(v10, "addServices:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14++), "intValue", (_QWORD)v20));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0D99B80]);
  objc_msgSend(v15, "setStartedOrChanged:", v10);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v7);
  objc_msgSend(v15, "setContextId:", v16);

  v17 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v17, "setEventMetadata:", v9);
  objc_msgSend(v17, "setCdmAssetSetupContext:", v15);
  v18 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v18, "setMainEvent:", v17);

  return v18;
}

+ (id)createCDMClientSetupStartedLog:(id)a3 cdmServiceGraphName:(int)a4
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  SiriInstrumentationEventContainer *v9;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0D99BC0]);
  objc_msgSend(v6, "setServiceGraphName:", v4);
  v7 = objc_alloc_init(MEMORY[0x1E0D99BA8]);
  objc_msgSend(v7, "setStartedOrChanged:", v6);
  v8 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v8, "setEventMetadata:", v5);
  objc_msgSend(v8, "setCdmClientSetupContext:", v7);
  v9 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v9, "setMainEvent:", v8);

  return v9;
}

+ (id)createCDMAssetSetupEndedLog:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  SiriInstrumentationEventContainer *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D99B88]);
  objc_msgSend(v7, "setExists:", 1);
  v8 = objc_alloc_init(MEMORY[0x1E0D99B80]);
  objc_msgSend(v8, "setEnded:", v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v5);
  objc_msgSend(v8, "setContextId:", v9);

  v10 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v10, "setEventMetadata:", v6);
  objc_msgSend(v10, "setCdmAssetSetupContext:", v8);
  v11 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v11, "setMainEvent:", v10);

  return v11;
}

+ (id)createNLXClientEventMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithResultCandidateId:(id)a5 andWithRequester:(int *)a6
{
  objc_msgSend(a1, "createNLXClientEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithSubRequestId:andWithResultCandidateId:andWithRequester:", a3, a4, 0, 0, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)convertUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8[1] = objc_msgSend(v3, "highInt", objc_msgSend(v3, "lowInt"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v8);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)createCDMAllServicesWarmupEndedLog:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  SiriInstrumentationEventContainer *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D99B68]);
  objc_msgSend(v4, "setExists:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0D99B60]);
  objc_msgSend(v5, "setEnded:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v6, "setEventMetadata:", v3);
  objc_msgSend(v6, "setCdmAllServicesWarmupContext:", v5);
  v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v7, "setMainEvent:", v6);

  return v7;
}

+ (id)createCDMAllServicesSetupEndedLog:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  SiriInstrumentationEventContainer *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D99B48]);
  objc_msgSend(v4, "setExists:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0D99B40]);
  objc_msgSend(v5, "setEnded:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v6, "setEventMetadata:", v3);
  objc_msgSend(v6, "setCdmAllServicesSetupContext:", v5);
  v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v7, "setMainEvent:", v6);

  return v7;
}

+ (int)convertComponentInvocationSource:(int)a3
{
  if ((a3 - 1) >= 5)
    return 0;
  else
    return a3;
}

+ (void)populateEventsWithMetadata:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setEventMetadata:", v6, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

+ (id)createNLXClientEventMetadataWithNlId:(id)a3 andWithTrpId:(id)a4 andWithRequestId:(id)a5 andWithSubRequestId:(id)a6 andWithResultCandidateId:(id)a7 andWithRequester:(int *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = objc_alloc_init(MEMORY[0x1E0D99E30]);
  +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNlId:", v19);

  +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTrpId:", v20);

  +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRequestId:", v21);

  +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSubRequestId:", v22);

  objc_msgSend(v18, "setResultCandidateId:", v17);
  objc_msgSend(v18, "setComponentInvocationSource:", +[SiriNLUSELFLogUtils convertComponentInvocationSource:](SiriNLUSELFLogUtils, "convertComponentInvocationSource:", *a8));

  return v18;
}

+ (id)createNLXRequestLinkWithTarget:(int)a3 andTargetId:(id)a4 metadata:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0D9A488]);
  v10 = objc_alloc_init(MEMORY[0x1E0D9A498]);
  objc_msgSend(v10, "setComponent:", 7);
  objc_msgSend(v8, "nlId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUuid:", v11);

  objc_msgSend(v9, "setSource:", v10);
  v12 = objc_alloc_init(MEMORY[0x1E0D9A498]);
  objc_msgSend(v12, "setComponent:", v6);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v7);
  objc_msgSend(v12, "setUuid:", v13);

  objc_msgSend(v9, "setTarget:", v12);
  return v9;
}

+ (id)createNLXCurareContext:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  SiriInstrumentationEventContainer *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D99E38]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v5);
  objc_msgSend(v7, "setCurareId:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v9, "setNlxCurareContext:", v7);
  objc_msgSend(v9, "setEventMetadata:", v6);
  v10 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v10, "setMainEvent:", v9);

  return v10;
}

+ (id)createCDMRequestStartedLog:(id)a3 metadata:(id)a4 cdmServiceGraphName:(int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  id v9;
  SiriInstrumentationEventContainer *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v5 = *(_QWORD *)&a5;
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0D99C78]);
  v10 = objc_alloc_init(SiriInstrumentationEventContainer);
  if (v7)
  {
    objc_msgSend(v7, "currentTurnInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertTurnInput:](SiriNLUSELFLogUtils, "convertTurnInput:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "requestId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v7, "requestId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasLoggableUserId");

      if (v15)
      {
        objc_msgSend(v7, "requestId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "loggableUserId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setLoggableSharedUserId:", v17);

      }
    }
    if (v12)
    {
      objc_msgSend(v12, "mainItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCurrentTurnInput:", v18);

      objc_msgSend(v12, "tier1Events");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "copy");
      -[SiriInstrumentationEventContainer setTier1Events:](v10, "setTier1Events:", v20);

      -[SiriInstrumentationEventContainer tier1Events](v10, "tier1Events");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils populateEventsWithMetadata:metadata:](SiriNLUSELFLogUtils, "populateEventsWithMetadata:metadata:", v21, v8);

    }
  }
  objc_msgSend(v9, "setServiceGraphName:", v5);
  v22 = objc_alloc_init(MEMORY[0x1E0D99C60]);
  objc_msgSend(v22, "setStartedOrChanged:", v9);
  v23 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v23, "setEventMetadata:", v8);
  objc_msgSend(v23, "setCdmRequestContext:", v22);
  -[SiriInstrumentationEventContainer setMainEvent:](v10, "setMainEvent:", v23);

  return v10;
}

+ (id)createCDMRequestEndedLog:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  SiriInstrumentationEventContainer *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v27 = a4;
  v29 = objc_alloc_init(MEMORY[0x1E0D99C68]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v28)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v28, "parses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v35;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v6);
          +[SiriNLUSELFLogUtils convertUserParse:](SiriNLUSELFLogUtils, "convertUserParse:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "mainItem");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addParses:", v12);

            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            objc_msgSend(v11, "tier1Events");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v31;
              do
              {
                v16 = 0;
                do
                {
                  if (*(_QWORD *)v31 != v15)
                    objc_enumerationMutation(v13);
                  objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v16++));
                }
                while (v14 != v16);
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              }
              while (v14);
            }

          }
          ++v9;
        }
        while (v9 != v7);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v7);
    }

    objc_msgSend(v28, "languageVariantResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (!v18)
    {
      objc_msgSend(v28, "languageVariantResult");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertLvcResult:](SiriNLUSELFLogUtils, "convertLvcResult:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setLanguageVariantClassifierResult:", v20);

    }
  }
  v21 = objc_alloc_init(MEMORY[0x1E0D99C60]);
  objc_msgSend(v21, "setEnded:", v29);
  v22 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v22, "setEventMetadata:", v27);
  objc_msgSend(v22, "setCdmRequestContext:", v21);
  v23 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v23, "setMainEvent:", v22);
  v24 = (void *)objc_msgSend(v5, "copy");
  -[SiriInstrumentationEventContainer setTier1Events:](v23, "setTier1Events:", v24);

  -[SiriInstrumentationEventContainer tier1Events](v23, "tier1Events");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[SiriNLUSELFLogUtils populateEventsWithMetadata:metadata:](SiriNLUSELFLogUtils, "populateEventsWithMetadata:metadata:", v25, v27);

  return v23;
}

+ (id)createCDMRequestFailedLog:(int)a3 metadata:(id)a4
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  SiriInstrumentationEventContainer *v9;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0D99C70]);
  objc_msgSend(v6, "setCode:", v4);
  v7 = objc_alloc_init(MEMORY[0x1E0D99C60]);
  objc_msgSend(v7, "setFailed:", v6);
  v8 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v8, "setEventMetadata:", v5);
  objc_msgSend(v8, "setCdmRequestContext:", v7);
  v9 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v9, "setMainEvent:", v8);

  return v9;
}

+ (id)createCDMRequestFailedLog:(int)a3 errorDomainString:(id)a4 errorCode:(int)a5 metadata:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  SiriInstrumentationEventContainer *v14;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0D99C70]);
  objc_msgSend(v11, "setCode:", v8);
  objc_msgSend(v11, "setErrorDomain:", +[SiriNLUSELFLogUtils getErrorDomain:](SiriNLUSELFLogUtils, "getErrorDomain:", v9));
  objc_msgSend(v11, "setErrorCode:", v7);
  v12 = objc_alloc_init(MEMORY[0x1E0D99C60]);
  objc_msgSend(v12, "setFailed:", v11);
  v13 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v13, "setEventMetadata:", v10);
  objc_msgSend(v13, "setCdmRequestContext:", v12);
  v14 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v14, "setMainEvent:", v13);

  return v14;
}

+ (id)createCDMClientSetupFailedLog:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  SiriInstrumentationEventContainer *v11;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0D99BB8]);
  objc_msgSend(v8, "setErrorDomain:", v6);
  objc_msgSend(v8, "setErrorCode:", v5);
  v9 = objc_alloc_init(MEMORY[0x1E0D99BA8]);
  objc_msgSend(v9, "setFailed:", v8);
  v10 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v10, "setEventMetadata:", v7);
  objc_msgSend(v10, "setCdmClientSetupContext:", v9);
  v11 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v11, "setMainEvent:", v10);

  return v11;
}

+ (id)createCDMAllServicesSetupFailedLog:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  SiriInstrumentationEventContainer *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D99B50]);
  objc_msgSend(v4, "setExists:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0D99B40]);
  objc_msgSend(v5, "setFailed:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v6, "setEventMetadata:", v3);
  objc_msgSend(v6, "setCdmAllServicesSetupContext:", v5);
  v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v7, "setMainEvent:", v6);

  return v7;
}

+ (id)createCDMClientWarmupStartedLog:(id)a3 cdmServiceGraphName:(int)a4
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  SiriInstrumentationEventContainer *v9;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0D99BE0]);
  objc_msgSend(v6, "setServiceGraphName:", v4);
  v7 = objc_alloc_init(MEMORY[0x1E0D99BC8]);
  objc_msgSend(v7, "setStartedOrChanged:", v6);
  v8 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v8, "setEventMetadata:", v5);
  objc_msgSend(v8, "setCdmClientWarmupContext:", v7);
  v9 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v9, "setMainEvent:", v8);

  return v9;
}

+ (id)createCDMClientWarmupEndedLog:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  SiriInstrumentationEventContainer *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D99BD0]);
  objc_msgSend(v4, "setExists:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0D99BC8]);
  objc_msgSend(v5, "setEnded:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v6, "setEventMetadata:", v3);
  objc_msgSend(v6, "setCdmClientWarmupContext:", v5);
  v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v7, "setMainEvent:", v6);

  return v7;
}

+ (id)createCDMClientWarmupFailedLog:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  SiriInstrumentationEventContainer *v11;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0D99BD8]);
  objc_msgSend(v8, "setErrorDomain:", v6);
  objc_msgSend(v8, "setErrorCode:", v5);
  v9 = objc_alloc_init(MEMORY[0x1E0D99BC8]);
  objc_msgSend(v9, "setFailed:", v8);
  v10 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v10, "setEventMetadata:", v7);
  objc_msgSend(v10, "setCdmClientWarmupContext:", v9);
  v11 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v11, "setMainEvent:", v10);

  return v11;
}

+ (id)createCDMAllServicesWarmupFailedLog:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  SiriInstrumentationEventContainer *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D99B70]);
  objc_msgSend(v4, "setExists:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0D99B60]);
  objc_msgSend(v5, "setFailed:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v6, "setEventMetadata:", v3);
  objc_msgSend(v6, "setCdmAllServicesWarmupContext:", v5);
  v7 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v7, "setMainEvent:", v6);

  return v7;
}

+ (id)createCDMAssetSetupFailedLog:(id)a3 errorDomain:(int)a4 errorCode:(unsigned int)a5 metadata:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  SiriInstrumentationEventContainer *v15;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0D99B90]);
  objc_msgSend(v11, "setErrorDomain:", v8);
  objc_msgSend(v11, "setErrorCode:", v7);
  v12 = objc_alloc_init(MEMORY[0x1E0D99B80]);
  objc_msgSend(v12, "setFailed:", v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v9);
  objc_msgSend(v12, "setContextId:", v13);

  v14 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v14, "setEventMetadata:", v10);
  objc_msgSend(v14, "setCdmAssetSetupContext:", v12);
  v15 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v15, "setMainEvent:", v14);

  return v15;
}

+ (id)createCDMSetupMissingAssetsDetectedLog:(id)a3 services:(id)a4 metadata:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  SiriInstrumentationEventContainer *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D99C80]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v7);
  objc_msgSend(v10, "setContextId:", v11);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(v10, "addServicesMissingAsset:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15++), "intValue", (_QWORD)v19));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v16, "setEventMetadata:", v9);
  objc_msgSend(v16, "setCdmSetupMissingAssetsDetected:", v10);
  v17 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v17, "setMainEvent:", v16);

  return v17;
}

+ (id)createMatchingSpanEndedLog:(id)a3 spanMatchResponse:(id)a4 metadata:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  SiriInstrumentationEventContainer *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v7 = a4;
  v32 = a5;
  if (v7)
  {
    v33 = objc_alloc_init(MEMORY[0x1E0D99C20]);
    if (v31)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v31);
      objc_msgSend(v33, "setContextId:", v8);

    }
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = objc_alloc_init(MEMORY[0x1E0D99C28]);
    v11 = objc_alloc(MEMORY[0x1E0D9A500]);
    v12 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    v13 = objc_msgSend(v11, "initWithNSUUID:", v12);

    v30 = (void *)v13;
    objc_msgSend(v33, "setLinkId:", v13);
    objc_msgSend(v10, "setLinkId:", v13);
    for (i = 0; objc_msgSend(v7, "matchingSpansCount") > i; ++i)
    {
      objc_msgSend(v7, "matchingSpansAtIndex:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertMatchingSpan:](SiriNLUSELFLogUtils, "convertMatchingSpan:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v16, "mainItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addMatchingSpans:", v17);

        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v16, "tier1Events");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v35;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v35 != v20)
                objc_enumerationMutation(v18);
              objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v21++));
            }
            while (v19 != v21);
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v19);
        }

      }
      objc_msgSend(v7, "matchingSpansAtIndex:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertMatchingSpanTier1:](SiriNLUSELFLogUtils, "convertMatchingSpanTier1:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addMatchingSpans:", v23);
    }
    v24 = objc_alloc_init(MEMORY[0x1E0D99E28]);
    objc_msgSend(v24, "setEventMetadata:", v32);
    objc_msgSend(v24, "setCdmMatchingSpanEndedTier1:", v10);
    objc_msgSend(v9, "addObject:", v24);
    v25 = objc_alloc_init(MEMORY[0x1E0D99E28]);
    objc_msgSend(v25, "setEventMetadata:", v32);
    objc_msgSend(v25, "setCdmMatchingSpanEnded:", v33);
    v26 = objc_alloc_init(SiriInstrumentationEventContainer);
    -[SiriInstrumentationEventContainer setMainEvent:](v26, "setMainEvent:", v25);
    v27 = (void *)objc_msgSend(v9, "copy");
    -[SiriInstrumentationEventContainer setTier1Events:](v26, "setTier1Events:", v27);

    -[SiriInstrumentationEventContainer tier1Events](v26, "tier1Events");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils populateEventsWithMetadata:metadata:](SiriNLUSELFLogUtils, "populateEventsWithMetadata:metadata:", v28, v32);

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (id)createTokenizationEndedLog:(id)a3 tokenizationResponse:(id)a4 metadata:(id)a5
{
  +[SiriNLUSELFLogUtils createTokenizationEndedLog:tokenizationResponse:tokenizationInputType:metadata:](SiriNLUSELFLogUtils, "createTokenizationEndedLog:tokenizationResponse:tokenizationInputType:metadata:", a3, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)createTokenizationEndedLog:(id)a3 tokenizationResponse:(id)a4 tokenizationInputType:(int)a5 metadata:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  SiriInstrumentationEventContainer *v17;

  v7 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v10)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D99CE8]);
    if (v9)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v9);
      objc_msgSend(v12, "setContextId:", v13);

    }
    objc_msgSend(v10, "tokenChain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertTokenChain:](SiriNLUSELFLogUtils, "convertTokenChain:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTokenChains:", v15);

    objc_msgSend(v12, "setInputType:", v7);
    v16 = objc_alloc_init(MEMORY[0x1E0D99E28]);
    objc_msgSend(v16, "setEventMetadata:", v11);
    objc_msgSend(v16, "setCdmTokenizationEnded:", v12);
    v17 = objc_alloc_init(SiriInstrumentationEventContainer);
    -[SiriInstrumentationEventContainer setMainEvent:](v17, "setMainEvent:", v16);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)createMultiHypoTokenizationEndedLog:(id)a3 tokenizationResponses:(id)a4 tokenizationInputType:(int)a5 metadata:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  SiriInstrumentationEventContainer *v19;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v7 = *(_QWORD *)&a5;
  v28 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v9 = a4;
  v21 = a6;
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D99CE8]);
    if (v22)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v22);
      objc_msgSend(v10, "setContextId:", v11);

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v24;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "tokenChain", v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[SiriNLUSELFLogUtils convertTokenChain:](SiriNLUSELFLogUtils, "convertTokenChain:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addTokenChains:", v17);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    objc_msgSend(v10, "setInputType:", v7);
    v18 = objc_alloc_init(MEMORY[0x1E0D99E28]);
    objc_msgSend(v18, "setEventMetadata:", v21);
    objc_msgSend(v18, "setCdmTokenizationEnded:", v10);
    v19 = objc_alloc_init(SiriInstrumentationEventContainer);
    -[SiriInstrumentationEventContainer setMainEvent:](v19, "setMainEvent:", v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)createContextUpdateEndedLog:(id)a3 contextUpdateResponse:(id)a4 metadata:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  unint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  SiriInstrumentationEventContainer *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v7 = a4;
  v25 = a5;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D99BE8]);
    if (v24)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v24);
      objc_msgSend(v8, "setContextId:", v9);

    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; objc_msgSend(v7, "reformedTurnInputBundlesCount", v24) > i; ++i)
    {
      objc_msgSend(v7, "reformedTurnInputBundlesAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertReformedTurnInputBundle:](SiriNLUSELFLogUtils, "convertReformedTurnInputBundle:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v13, "mainItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addReformedTurnInputBundles:", v14);

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v13, "tier1Events");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v27;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v27 != v17)
                objc_enumerationMutation(v15);
              objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v18++));
            }
            while (v16 != v18);
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v16);
        }

      }
    }
    v19 = objc_alloc_init(MEMORY[0x1E0D99E28]);
    objc_msgSend(v19, "setEventMetadata:", v25);
    objc_msgSend(v19, "setCdmContextUpdateEnded:", v8);
    v20 = objc_alloc_init(SiriInstrumentationEventContainer);
    -[SiriInstrumentationEventContainer setMainEvent:](v20, "setMainEvent:", v19);
    v21 = (void *)objc_msgSend(v10, "copy");
    -[SiriInstrumentationEventContainer setTier1Events:](v20, "setTier1Events:", v21);

    -[SiriInstrumentationEventContainer tier1Events](v20, "tier1Events");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils populateEventsWithMetadata:metadata:](SiriNLUSELFLogUtils, "populateEventsWithMetadata:metadata:", v22, v25);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)createCdmXpcEventProcessingStartedLog:(id)a3 xpcType:(int)a4 xpcSystemEventType:(int)a5 serviceName:(int)a6 metadata:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  SiriInstrumentationEventContainer *v17;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = a7;
  v13 = objc_alloc_init(MEMORY[0x1E0D99D70]);
  objc_msgSend(v13, "setXpcType:", v10);
  objc_msgSend(v13, "setXpcSystemEventType:", v9);
  objc_msgSend(v13, "setServiceName:", v8);
  v14 = objc_alloc_init(MEMORY[0x1E0D99D58]);
  objc_msgSend(v14, "setStartedOrChanged:", v13);
  if (v11)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v11);
    objc_msgSend(v14, "setContextId:", v15);

  }
  v16 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v16, "setEventMetadata:", v12);
  objc_msgSend(v16, "setCdmXpcEventProcessingContext:", v14);
  v17 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v17, "setMainEvent:", v16);

  return v17;
}

+ (id)createCdmXpcEventProcessingEndedLog:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  SiriInstrumentationEventContainer *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D99D60]);
  objc_msgSend(v7, "setExists:", 1);
  v8 = objc_alloc_init(MEMORY[0x1E0D99D58]);
  objc_msgSend(v8, "setEnded:", v7);
  if (v5)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v5);
    objc_msgSend(v8, "setContextId:", v9);

  }
  v10 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v10, "setEventMetadata:", v6);
  objc_msgSend(v10, "setCdmXpcEventProcessingContext:", v8);
  v11 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v11, "setMainEvent:", v10);

  return v11;
}

+ (id)createCdmXpcEventProcessingFailedLog:(id)a3 reason:(int)a4 errorCode:(unsigned int)a5 metadata:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  SiriInstrumentationEventContainer *v15;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0D99D68]);
  objc_msgSend(v11, "setReason:", v8);
  objc_msgSend(v11, "setErrorCode:", v7);
  v12 = objc_alloc_init(MEMORY[0x1E0D99D58]);
  objc_msgSend(v12, "setFailed:", v11);
  if (v9)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v9);
    objc_msgSend(v12, "setContextId:", v13);

  }
  v14 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v14, "setEventMetadata:", v10);
  objc_msgSend(v14, "setCdmXpcEventProcessingContext:", v12);
  v15 = objc_alloc_init(SiriInstrumentationEventContainer);
  -[SiriInstrumentationEventContainer setMainEvent:](v15, "setMainEvent:", v14);

  return v15;
}

+ (id)createNLXLegacyNLContextTier1Event:(id)a3 withLinkId:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D99E48]);
    objc_msgSend(v7, "setLinkId:", v6);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v5, "renderedTexts", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
          if (v12 && objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "hasValue"))
          {
            objc_msgSend(v12, "value");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addRenderedTexts:", v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v14 = objc_alloc_init(MEMORY[0x1E0D99E28]);
    objc_msgSend(v14, "setNlxLegacyNLContextTier1:", v7);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)createSystemDialogActTier1Event:(id)a3 withLinkId:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D99C98]);
    objc_msgSend(v7, "setLinkId:", v6);
    if (objc_msgSend(v5, "hasRenderedText"))
    {
      objc_msgSend(v5, "renderedText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRenderedText:", v9);

    }
    v10 = objc_alloc_init(MEMORY[0x1E0D99E28]);
    objc_msgSend(v10, "setCdmSystemDialogActTier1:", v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)createDelegatedUserDialogActTier1Event:(id)a3 withLinkId:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D99C00]);
    objc_msgSend(v7, "setLinkId:", v6);
    if (objc_msgSend(v5, "hasRewrite"))
    {
      objc_msgSend(v5, "rewrite");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "rewriteType");

      if (v9 != 3)
      {
        objc_msgSend(v5, "rewrite");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "rewrittenUtterance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setRewrittenUtterance:", v11);

      }
    }
    v12 = objc_alloc_init(MEMORY[0x1E0D99E28]);
    objc_msgSend(v12, "setCdmDelegatedUserDialogActTier1:", v7);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)convertVersion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D9A508]);
    objc_msgSend(v4, "setMajor:", objc_msgSend(v3, "majorVersion"));
    objc_msgSend(v4, "setMinor:", objc_msgSend(v3, "minorVersion"));
    objc_msgSend(v4, "setPatch:", objc_msgSend(v3, "patchVersion"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertUsoGraph:(id)a3
{
  siri::ontology *v3;
  siri::ontology *v4;
  uint64_t *SharedUsoVocabManager;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  siri::ontology::UsoGraph *v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  sirinluexternal::UsoGraph *v53;
  unint64_t *v54;
  unint64_t v55;
  void *v57;
  siri::ontology *v58;
  void *v59;
  SiriInstrumentationObjectContainer *v60;
  std::__shared_weak_count *v61;
  id v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  id v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  siri::ontology::UsoGraph *v83;
  uint64_t v84;
  std::__shared_weak_count *v85;
  sirinluexternal::UsoGraph *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v3 = (siri::ontology *)a3;
  v4 = v3;
  if (v3)
  {
    v58 = v3;
    SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager(v3);
    v6 = *SharedUsoVocabManager;
    v61 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
    if (v61)
    {
      p_shared_owners = (unint64_t *)&v61->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    +[SiriNLUTypesConverterUtils convertUsoGraphFromObjCToCpp:](SiriNLUTypesConverterUtils, "convertUsoGraphFromObjCToCpp:", v58);
    if (v61)
    {
      v9 = (unint64_t *)&v61->__shared_owners_;
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
      v84 = v6;
      v85 = v61;
      do
        v11 = __ldxr(v9);
      while (__stxr(v11 + 1, v9));
      do
        v12 = __ldaxr(v9);
      while (__stlxr(v12 - 1, v9));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
        std::__shared_weak_count::__release_weak(v61);
      }
    }
    else
    {
      v84 = v6;
      v85 = 0;
    }
    siri::ontology::UsoGraphProtoReader::fromProtobuf((siri::ontology::UsoGraphProtoReader *)&v84, v86, &v83);
    objc_msgSend(MEMORY[0x1E0DA2DE0], "getRedactedGraph:", &v83);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_alloc_init(SiriInstrumentationObjectContainer);
    v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v59)
    {
      objc_msgSend(v59, "redactedList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14
        || (objc_msgSend(v59, "redactedList"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "count") == 0,
            v15,
            v14,
            v16))
      {
        v57 = 0;
      }
      else
      {
        v62 = objc_alloc_init(MEMORY[0x1E0D9A640]);
        v17 = objc_alloc(MEMORY[0x1E0D9A500]);
        v18 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
        v57 = (void *)objc_msgSend(v17, "initWithNSUUID:", v18);

        objc_msgSend(v62, "setLinkId:", v57);
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        objc_msgSend(v59, "redactedList");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
        if (v65)
        {
          v64 = *(_QWORD *)v80;
          do
          {
            for (i = 0; i != v65; ++i)
            {
              if (*(_QWORD *)v80 != v64)
                objc_enumerationMutation(obj);
              v19 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
              v20 = objc_alloc_init(MEMORY[0x1E0D9A638]);
              if (v19)
                objc_msgSend(v19, "usoGraph");
              else
                v78 = 0;
              +[SiriNLUSELFLogUtils getObjCUsoGraphFromOntologyUsoGraph:](SiriNLUSELFLogUtils, "getObjCUsoGraphFromOntologyUsoGraph:", &v78);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v78;
              v78 = 0;
              if (v21)
              {
                v22 = MEMORY[0x1C3BB7050]();
                MEMORY[0x1C3BB720C](v22, 0x10A0C403D23BABBLL);
              }
              v23 = v67;
              if (v67 && objc_msgSend(v67, "nodesCount"))
              {
                objc_msgSend(v67, "nodes");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v67, "nodesCount") - 1);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                +[SiriNLUSELFLogUtils convertUsoNodeDataTier1:index:](SiriNLUSELFLogUtils, "convertUsoNodeDataTier1:index:", v25, objc_msgSend(v19, "index"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setLinkedUsoNodeData:", v26);

                v76 = 0u;
                v77 = 0u;
                v74 = 0u;
                v75 = 0u;
                objc_msgSend(v67, "identifiers");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
                if (v28)
                {
                  v29 = *(_QWORD *)v75;
                  do
                  {
                    for (j = 0; j != v28; ++j)
                    {
                      if (*(_QWORD *)v75 != v29)
                        objc_enumerationMutation(v27);
                      v31 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
                      +[SiriNLUSELFLogUtils convertUsoEntityIdentifierTier1:index:](SiriNLUSELFLogUtils, "convertUsoEntityIdentifierTier1:index:", v31, objc_msgSend(v19, "index"));
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "addLinkedUsoEntityIdentifiers:", v32);

                      +[SiriNLUSELFLogUtils convertUsoEntityIdentifier:index:](SiriNLUSELFLogUtils, "convertUsoEntityIdentifier:index:", v31, objc_msgSend(v19, "index"));
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v68, "addObject:", v33);

                    }
                    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
                  }
                  while (v28);
                }

                v72 = 0u;
                v73 = 0u;
                v70 = 0u;
                v71 = 0u;
                objc_msgSend(v67, "spans");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
                if (v35)
                {
                  v36 = *(_QWORD *)v71;
                  do
                  {
                    for (k = 0; k != v35; ++k)
                    {
                      if (*(_QWORD *)v71 != v36)
                        objc_enumerationMutation(v34);
                      v38 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k);
                      +[SiriNLUSELFLogUtils convertUsoEntitySpanTier1:index:](SiriNLUSELFLogUtils, "convertUsoEntitySpanTier1:index:", v38, objc_msgSend(v19, "index"));
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "addLinkedUsoEntitySpans:", v39);

                      +[SiriNLUSELFLogUtils convertUsoEntitySpan:index:](SiriNLUSELFLogUtils, "convertUsoEntitySpan:index:", v38, objc_msgSend(v19, "index"));
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v13, "addObject:", v40);

                    }
                    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
                  }
                  while (v35);
                }

                v23 = v67;
                objc_msgSend(v62, "addLinkedUsoGraphNodeData:", v20);
              }

            }
            v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
          }
          while (v65);
        }

        v41 = objc_alloc_init(MEMORY[0x1E0D99D50]);
        objc_msgSend(v41, "setUsoGraphTier1:", v62);
        v42 = objc_alloc_init(MEMORY[0x1E0D99E28]);
        objc_msgSend(v42, "setCdmUsoGraphTier1:", v41);
        -[SiriInstrumentationObjectContainer addTier1Event:](v60, "addTier1Event:", v42);

      }
      objc_msgSend(v59, "redactedGraph");
    }
    else
    {
      v57 = 0;
      v69 = 0;
    }
    +[SiriNLUSELFLogUtils getObjCUsoGraphFromOntologyUsoGraph:](SiriNLUSELFLogUtils, "getObjCUsoGraphFromOntologyUsoGraph:", &v69);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v69;
    v69 = 0;
    if (v44)
    {
      v45 = MEMORY[0x1C3BB7050]();
      MEMORY[0x1C3BB720C](v45, 0x10A0C403D23BABBLL);
    }
    +[SiriNLUSELFLogUtils convertNonTier1UsoGraph:identifiers:entitySpans:](SiriNLUSELFLogUtils, "convertNonTier1UsoGraph:identifiers:entitySpans:", v43, v68, v13);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
      objc_msgSend(v46, "setLinkId:", v57);
    -[SiriInstrumentationObjectContainer setMainItem:](v60, "setMainItem:", v47);

    v48 = v83;
    v83 = 0;
    if (v48)
    {
      v49 = MEMORY[0x1C3BB7050]();
      MEMORY[0x1C3BB720C](v49, 0x10A0C403D23BABBLL);
    }
    v50 = v85;
    if (v85)
    {
      v51 = (unint64_t *)&v85->__shared_owners_;
      do
        v52 = __ldaxr(v51);
      while (__stlxr(v52 - 1, v51));
      if (!v52)
      {
        ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
        std::__shared_weak_count::__release_weak(v50);
      }
    }
    v53 = v86;
    v86 = 0;
    if (v53)
      (*(void (**)(sirinluexternal::UsoGraph *))(*(_QWORD *)v53 + 8))(v53);
    v4 = v58;
    if (v61)
    {
      v54 = (unint64_t *)&v61->__shared_owners_;
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
        std::__shared_weak_count::__release_weak(v61);
      }
    }
  }
  else
  {
    v60 = 0;
  }

  return v60;
}

+ (id)convertNonTier1UsoGraph:(id)a3
{
  +[SiriNLUSELFLogUtils convertNonTier1UsoGraph:identifiers:entitySpans:](SiriNLUSELFLogUtils, "convertNonTier1UsoGraph:identifiers:entitySpans:", a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)convertNonTier1UsoGraph:(id)a3 identifiers:(id)a4 entitySpans:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D9A630]);
    objc_msgSend(v7, "version");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertVersion:](SiriNLUSELFLogUtils, "convertVersion:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVersion:", v12);

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    objc_msgSend(v7, "nodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v72;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v72 != v15)
            objc_enumerationMutation(v13);
          +[SiriNLUSELFLogUtils convertUsoNode:](SiriNLUSELFLogUtils, "convertUsoNode:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addNodes:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
      }
      while (v14);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v7, "edges");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v68;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v68 != v20)
            objc_enumerationMutation(v18);
          +[SiriNLUSELFLogUtils convertUsoEdge:](SiriNLUSELFLogUtils, "convertUsoEdge:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v21));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addEdges:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
      }
      while (v19);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend(v7, "alignments");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v64;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v64 != v25)
            objc_enumerationMutation(v23);
          +[SiriNLUSELFLogUtils convertUtteranceAlignment:](SiriNLUSELFLogUtils, "convertUtteranceAlignment:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v26));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addAlignments:", v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
      }
      while (v24);
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v7, "identifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v60;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v60 != v30)
            objc_enumerationMutation(v28);
          +[SiriNLUSELFLogUtils convertUsoEntityIdentifier:](SiriNLUSELFLogUtils, "convertUsoEntityIdentifier:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v31));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addIdentifiers:", v32);

          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
      }
      while (v29);
    }

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v7, "spans");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v56;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v56 != v35)
            objc_enumerationMutation(v33);
          +[SiriNLUSELFLogUtils convertUsoEntitySpan:](SiriNLUSELFLogUtils, "convertUsoEntitySpan:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v36));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addSpans:", v37);

          ++v36;
        }
        while (v34 != v36);
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
      }
      while (v34);
    }

    if (v8)
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v38 = v8;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v76, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v52;
        do
        {
          v41 = 0;
          do
          {
            if (*(_QWORD *)v52 != v40)
              objc_enumerationMutation(v38);
            objc_msgSend(v10, "addIdentifiers:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v41++));
          }
          while (v39 != v41);
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v76, 16);
        }
        while (v39);
      }

    }
    if (v9)
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v42 = v9;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v47, v75, 16);
      if (v43)
      {
        v44 = *(_QWORD *)v48;
        do
        {
          v45 = 0;
          do
          {
            if (*(_QWORD *)v48 != v44)
              objc_enumerationMutation(v42);
            objc_msgSend(v10, "addSpans:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v45++), (_QWORD)v47);
          }
          while (v43 != v45);
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v47, v75, 16);
        }
        while (v43);
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)convertUsoNode:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D9A658]);
    if (objc_msgSend(v3, "hasUsoElementId"))
      objc_msgSend(v4, "setUsoElementId:", objc_msgSend(v3, "usoElementId"));
    if (objc_msgSend(v3, "hasUsoVerbElementId"))
    {
      objc_msgSend(v3, "usoVerbElementId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setUsoVerbElementId:", objc_msgSend(v5, "value"));

    }
    if (objc_msgSend(v3, "hasEntityLabel"))
    {
      objc_msgSend(v3, "entityLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEntityLabel:", v6);

    }
    if (objc_msgSend(v3, "hasVerbLabel"))
    {
      objc_msgSend(v3, "verbLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setVerbLabel:", v7);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertUsoEdge:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D9A5F8]);
    objc_msgSend(v4, "setFromIndex:", objc_msgSend(v3, "fromIndex"));
    objc_msgSend(v4, "setToIndex:", objc_msgSend(v3, "toIndex"));
    if (objc_msgSend(v3, "hasLabel"))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0D9A600]);
      objc_msgSend(v3, "label");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setUsoElementId:", objc_msgSend(v6, "usoElementId"));

      objc_msgSend(v3, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEnumeration:", objc_msgSend(v7, "enumeration"));

      objc_msgSend(v3, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasBaseEdgeLabel");

      if (v9)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0D9A648]);
        objc_msgSend(v3, "label");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "baseEdgeLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:", v13);

        objc_msgSend(v5, "setBaseEdgeLabel:", v10);
      }
      objc_msgSend(v4, "setLabel:", v5);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertUsoEntityIdentifier:(id)a3
{
  +[SiriNLUSELFLogUtils convertUsoEntityIdentifier:index:](SiriNLUSELFLogUtils, "convertUsoEntityIdentifier:index:", a3, -1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)convertUsoEntityIdentifier:(id)a3 index:(int64_t)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D9A608]);
    if (a4 == -1)
      a4 = objc_msgSend(v5, "nodeIndex");
    objc_msgSend(v6, "setNodeIndex:", a4);
    if (objc_msgSend(v5, "hasProbability"))
    {
      objc_msgSend(v5, "probability");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      objc_msgSend(v6, "setProbability:");

    }
    if (objc_msgSend(v5, "hasNamespaceA"))
    {
      objc_msgSend(v5, "namespaceA");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIdentifierNamespace:", v9);

    }
    if (objc_msgSend(v5, "hasSourceComponent"))
      v10 = +[SiriNLUSELFLogUtils convertUSOEntityIdentifierNluComponent:](SiriNLUSELFLogUtils, "convertUSOEntityIdentifierNluComponent:", objc_msgSend(v5, "sourceComponent"));
    else
      v10 = 0;
    objc_msgSend(v6, "setSourceNluComponent:", v10);
    if (objc_msgSend(v5, "hasBackingAppBundleId"))
    {
      objc_msgSend(v5, "backingAppBundleId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackingAppBundleType:", +[SiriNLUSELFLogUtils convertUsoBackingAppBundleType:](SiriNLUSELFLogUtils, "convertUsoBackingAppBundleType:", v11));

    }
    else
    {
      objc_msgSend(v6, "setBackingAppBundleType:", 0);
    }
    if (objc_msgSend(v5, "hasGroupIndex"))
      objc_msgSend(v6, "setGroupIndex:", objc_msgSend(v5, "groupIndex"));
    if (objc_msgSend(v5, "hasInterpretationGroup"))
      objc_msgSend(v6, "setInterpretationGroup:", objc_msgSend(v5, "interpretationGroup"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)convertMatchInfo:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t i;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D9A650]);
    if (objc_msgSend(v3, "hasMatchSignalBitset"))
      objc_msgSend(v4, "setMatchSignalBitset:", objc_msgSend(v3, "matchSignalBitset"));
    if (objc_msgSend(v3, "hasMatchScore"))
    {
      objc_msgSend(v3, "matchScore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      objc_msgSend(v4, "setMatchScore:");

    }
    if (objc_msgSend(v3, "hasMaxTokenCount"))
    {
      objc_msgSend(v3, "maxTokenCount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMaxTokenCount:", objc_msgSend(v6, "value"));

    }
    if (objc_msgSend(v3, "hasMatchedTokenCount"))
    {
      objc_msgSend(v3, "matchedTokenCount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMatchedTokenCount:", objc_msgSend(v7, "value"));

    }
    if (objc_msgSend(v3, "hasMaxStopWordCount"))
    {
      objc_msgSend(v3, "maxStopWordCount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMaxStopWordCount:", objc_msgSend(v8, "value"));

    }
    if (objc_msgSend(v3, "hasMatchedStopWordCount"))
    {
      objc_msgSend(v3, "matchedStopWordCount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMatchedStopWordCount:", objc_msgSend(v9, "value"));

    }
    if (objc_msgSend(v3, "hasEditDistance"))
    {
      objc_msgSend(v3, "editDistance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEditDistance:", objc_msgSend(v10, "value"));

    }
    if (objc_msgSend(v3, "hasMaxAliasCount"))
    {
      objc_msgSend(v3, "maxAliasCount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMaxAliasCount:", objc_msgSend(v11, "value"));

    }
    if ((objc_msgSend(v3, "hasMatchedAliasCount") & 1) != 0)
    {
      objc_msgSend(v3, "matchedAliasCount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMatchedAliasCount:", objc_msgSend(v12, "value"));

    }
    for (i = 0; objc_msgSend(v3, "matchedAliasTypesCount") > i; ++i)
      objc_msgSend(v4, "addMatchedAliasTypes:", +[SiriNLUSELFLogUtils convertMatchInfoAliasType:](SiriNLUSELFLogUtils, "convertMatchInfoAliasType:", objc_msgSend(v3, "matchedAliasTypesAtIndex:", i)));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertUsoEntitySpan:(id)a3
{
  +[SiriNLUSELFLogUtils convertUsoEntitySpan:index:](SiriNLUSELFLogUtils, "convertUsoEntitySpan:index:", a3, -1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)convertUsoEntitySpan:(id)a3 index:(int64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D9A618]);
    if (a4 == -1)
      a4 = objc_msgSend(v5, "nodeIndex");
    objc_msgSend(v6, "setNodeIndex:", a4);
    if (objc_msgSend(v5, "hasSourceComponent"))
      v7 = +[SiriNLUSELFLogUtils convertUSOEntitySpanNluComponent:](SiriNLUSELFLogUtils, "convertUSOEntitySpanNluComponent:", objc_msgSend(v5, "sourceComponent"));
    else
      v7 = 0;
    objc_msgSend(v6, "setSourceComponent:", v7);
    if (objc_msgSend(v5, "hasLabel"))
    {
      objc_msgSend(v5, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLabel:", v9);

    }
    if (objc_msgSend(v5, "hasMatchInfo"))
    {
      objc_msgSend(v5, "matchInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertMatchInfo:](SiriNLUSELFLogUtils, "convertMatchInfo:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMatchInfo:", v11);

    }
    if (objc_msgSend(v5, "hasStartIndex"))
    {
      objc_msgSend(v5, "startIndex");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setStartIndex:", objc_msgSend(v12, "value"));

    }
    if (objc_msgSend(v5, "hasEndIndex"))
    {
      objc_msgSend(v5, "endIndex");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEndIndex:", objc_msgSend(v13, "value"));

    }
    if (objc_msgSend(v5, "hasOriginAppId"))
    {
      objc_msgSend(v5, "originAppId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setOriginAppBundleIdType:", +[SiriNLUSELFLogUtils convertUsoBackingAppBundleType:](SiriNLUSELFLogUtils, "convertUsoBackingAppBundleType:", v15));

    }
    else
    {
      objc_msgSend(v6, "setOriginAppBundleIdType:", 0);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int)convertUsoBackingAppBundleType:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DA2C50]) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DA2C58]) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DA2C40]) & 1) != 0)
    {
      v5 = 3;
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DA2C48]))
    {
      v5 = 4;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertUtteranceAlignment:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D9A670]);
    if (objc_msgSend(v3, "hasAsrHypothesisIndex"))
      objc_msgSend(v4, "setAsrHypothesisIndex:", objc_msgSend(v3, "asrHypothesisIndex"));
    if (objc_msgSend(v3, "hasNodeIndex"))
      objc_msgSend(v4, "setNodeIndex:", objc_msgSend(v3, "nodeIndex"));
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v3, "spans", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          +[SiriNLUSELFLogUtils convertUtteranceSpan:](SiriNLUSELFLogUtils, "convertUtteranceSpan:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addSpans:", v9);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertUtteranceSpan:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D9A678]);
    if (objc_msgSend(v3, "hasStartIndex"))
      objc_msgSend(v4, "setStartIndex:", objc_msgSend(v3, "startIndex"));
    if (objc_msgSend(v3, "hasEndIndex"))
      objc_msgSend(v4, "setEndIndex:", objc_msgSend(v3, "endIndex"));
    if (objc_msgSend(v3, "hasStartUnicodeScalarIndex"))
      objc_msgSend(v4, "setStartUnicodeScalarIndex:", objc_msgSend(v3, "startUnicodeScalarIndex"));
    if (objc_msgSend(v3, "hasEndUnicodeScalarIndex"))
      objc_msgSend(v4, "setEndUnicodeScalarIndex:", objc_msgSend(v3, "endUnicodeScalarIndex"));
    if (objc_msgSend(v3, "hasStartMilliSeconds"))
      objc_msgSend(v4, "setStartMilliseconds:", objc_msgSend(v3, "startMilliSeconds"));
    if (objc_msgSend(v3, "hasEndMilliSeconds"))
      objc_msgSend(v4, "setEndMilliseconds:", objc_msgSend(v3, "endMilliSeconds"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertUsoNodeDataTier1:(id)a3 index:(int64_t)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D9A660]);
    objc_msgSend(v6, "setIndex:", a4);
    if (objc_msgSend(v5, "hasStringPayload"))
    {
      objc_msgSend(v5, "stringPayload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setStringPayload:", v8);

    }
    if (objc_msgSend(v5, "hasIntegerPayload"))
    {
      objc_msgSend(v5, "integerPayload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIntegerPayload:", objc_msgSend(v9, "value"));

    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "normalizedStringPayloads", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(v6, "addNormalizedStringPayloads:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)convertUsoEntityIdentifierTier1:(id)a3 index:(int64_t)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D9A610]);
    objc_msgSend(v6, "setIndex:", a4);
    objc_msgSend(v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:", v7);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)convertUsoEntitySpanTier1:(id)a3 index:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  if (v30)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D9A620]);
    objc_msgSend(v5, "setIndex:", a4);
    if (objc_msgSend(v30, "hasOriginAppId"))
    {
      objc_msgSend(v30, "originAppId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOriginAppId:", v7);

    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v30, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v13 = objc_alloc_init(MEMORY[0x1E0D9A668]);
          objc_msgSend(v12, "key");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setKey:", v14);

          if (objc_msgSend(v12, "hasValueString"))
          {
            objc_msgSend(v12, "valueString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "value");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setValueString:", v16);

          }
          if (objc_msgSend(v12, "hasValueInt"))
          {
            objc_msgSend(v12, "valueInt");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setValueInt:", objc_msgSend(v17, "value"));

          }
          if (objc_msgSend(v12, "hasValueFloat"))
          {
            objc_msgSend(v12, "valueFloat");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "value");
            objc_msgSend(v13, "setValueFloat:");

          }
          objc_msgSend(v5, "addProperties:", v13);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v9);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v30, "alternatives");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          v24 = objc_alloc_init(MEMORY[0x1E0D9A5F0]);
          objc_msgSend(v23, "alternative");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setAlternative:", v25);

          if (objc_msgSend(v23, "hasProbability"))
          {
            objc_msgSend(v23, "probability");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "value");
            objc_msgSend(v24, "setProbability:");

          }
          objc_msgSend(v5, "addAlternatives:", v24);

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v20);
    }

    if (objc_msgSend(v30, "hasOriginEntityId"))
    {
      objc_msgSend(v30, "originEntityId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "value");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOriginEntityId:", v28);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)getObjCUsoGraphFromOntologyUsoGraph:()unique_ptr<siri:(std::default_delete<siri::ontology::UsoGraph>>)a3 :ontology::UsoGraph
{
  siri::ontology::UsoGraphProtoWriter *v3;
  PB::Writer *v4;
  uint64_t v5;
  SIRINLUEXTERNALUsoGraph *v6;
  void *v7;
  SIRINLUEXTERNALUsoGraph *v8;
  void (**v10)(sirinluexternal::UsoGraph *__hidden);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = *(siri::ontology::UsoGraphProtoWriter **)a3.var0.var0;
  if (!*(_QWORD *)a3.var0.var0)
    return 0;
  v10 = &off_1E7BB2398;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  siri::ontology::UsoGraphProtoWriter::toProtobuf(v3, (const sirinluexternal::SemVer **)&v10, (sirinluexternal::UsoGraph *)a3.var0.var0);
  v4 = (PB::Writer *)operator new();
  PB::Writer::Writer(v4);
  sirinluexternal::UsoGraph::writeTo((uint64_t)&v10, v4);
  v5 = *((_QWORD *)v4 + 1);
  v6 = [SIRINLUEXTERNALUsoGraph alloc];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, *(_QWORD *)v4 - *((_QWORD *)v4 + 1), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SIRINLUEXTERNALUsoGraph initWithData:](v6, "initWithData:", v7);

  PB::Writer::~Writer(v4);
  MEMORY[0x1C3BB720C]();
  sirinluexternal::UsoGraph::~UsoGraph((sirinluexternal::UsoGraph *)&v10);
  return v8;
}

+ (id)convertTurnInput:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  SiriInstrumentationObjectContainer *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99CF8]);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v3, "asrOutputs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (v9)
          {
            objc_msgSend(v9, "idA");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addAsrHypothesisIds:", v11);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v6);
    }

    objc_msgSend(v4, "setIsTapToEdit:", objc_msgSend(v3, "tapToEdit"));
    v12 = objc_alloc_init(SiriInstrumentationObjectContainer);
    objc_msgSend(v3, "turnContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertTurnContext:](SiriNLUSELFLogUtils, "convertTurnContext:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "mainItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTurnContext:", v15);

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v14, "tier1Events", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v16);
            -[SiriInstrumentationObjectContainer addTier1Event:](v12, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v17);
      }

    }
    -[SiriInstrumentationObjectContainer setMainItem:](v12, "setMainItem:", v4);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)convertTurnContext:(id)a3
{
  id v3;
  id v4;
  SiriInstrumentationObjectContainer *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    v5 = 0;
    goto LABEL_21;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0D99CF0]);
  v5 = objc_alloc_init(SiriInstrumentationObjectContainer);
  objc_msgSend(v3, "nlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[SiriNLUSELFLogUtils isNlContextPresent:](SiriNLUSELFLogUtils, "isNlContextPresent:", v6);

  if (v7)
  {
    objc_msgSend(v3, "nlContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertNLContext:](SiriNLUSELFLogUtils, "convertNLContext:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "mainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setNlContext:", v10);
LABEL_9:

    }
  }
  else
  {
    objc_msgSend(v3, "legacyNlContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[SiriNLUSELFLogUtils isLegacyNlContextPresent:](SiriNLUSELFLogUtils, "isLegacyNlContextPresent:", v11);

    if (!v12)
    {
      v9 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v3, "legacyNlContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertLegacyNLContext:](SiriNLUSELFLogUtils, "convertLegacyNLContext:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "mainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLegacyNlContext:", v10);
      goto LABEL_9;
    }
  }
LABEL_11:
  -[SiriInstrumentationObjectContainer setMainItem:](v5, "setMainItem:", v4);
  if (v9)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v9, "tier1Events", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v14);
          -[SiriInstrumentationObjectContainer addTier1Event:](v5, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
LABEL_21:

  return v5;
}

+ (BOOL)isNlContextPresent:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  v5 = v3
    && (objc_msgSend(v3, "activeTasksCount")
     || objc_msgSend(v4, "executedTasksCount")
     || objc_msgSend(v4, "systemDialogActsCount"));

  return v5;
}

+ (BOOL)isLegacyNlContextPresent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "dictationPrompt") & 1) == 0
      && (objc_msgSend(v5, "strictPrompt") & 1) == 0
      && (objc_msgSend(v5, "listenAfterSpeaking") & 1) == 0)
    {
      v6 = objc_msgSend(v5, "hasPreviousDomainName");
      if (v6
        && (objc_msgSend(v5, "previousDomainName"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v3, "isEqualToString:", &stru_1E7BB3508) & 1) == 0))
      {

      }
      else
      {
        v7 = objc_msgSend(v5, "renderedTextsCount");
        if (v6)

        if (!v7)
          goto LABEL_10;
      }
    }
    v8 = 1;
    goto LABEL_13;
  }
LABEL_10:
  v8 = 0;
LABEL_13:

  return v8;
}

+ (id)convertNLContext:(id)a3
{
  id v3;
  void *v4;
  SiriInstrumentationObjectContainer *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t ii;
  void *v39;
  id obj;
  id obja;
  id objb;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v39 = v3;
    v5 = objc_alloc_init(SiriInstrumentationObjectContainer);
    v43 = objc_alloc_init(MEMORY[0x1E0D99C40]);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v4, "activeTasks");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v65 != v7)
            objc_enumerationMutation(obj);
          +[SiriNLUSELFLogUtils convertTask:](SiriNLUSELFLogUtils, "convertTask:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            objc_msgSend(v9, "mainItem");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "addActiveTasks:", v11);

            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            objc_msgSend(v10, "tier1Events");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v61;
              do
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v61 != v14)
                    objc_enumerationMutation(v12);
                  -[SiriInstrumentationObjectContainer addTier1Event:](v5, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j));
                }
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
              }
              while (v13);
            }

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      }
      while (v6);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v39, "executedTasks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    obja = v16;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v57 != v18)
            objc_enumerationMutation(obja);
          +[SiriNLUSELFLogUtils convertTask:](SiriNLUSELFLogUtils, "convertTask:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            objc_msgSend(v20, "mainItem");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "addExecutedTasks:", v22);

            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            objc_msgSend(v21, "tier1Events");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
            if (v24)
            {
              v25 = *(_QWORD *)v53;
              do
              {
                for (m = 0; m != v24; ++m)
                {
                  if (*(_QWORD *)v53 != v25)
                    objc_enumerationMutation(v23);
                  -[SiriInstrumentationObjectContainer addTier1Event:](v5, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * m));
                }
                v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
              }
              while (v24);
            }

          }
        }
        v16 = obja;
        v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
      }
      while (v17);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v39, "systemDialogActs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objb = v27;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v69, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v49;
      do
      {
        for (n = 0; n != v28; ++n)
        {
          if (*(_QWORD *)v49 != v29)
            objc_enumerationMutation(objb);
          +[SiriNLUSELFLogUtils convertSystemDialogAct:](SiriNLUSELFLogUtils, "convertSystemDialogAct:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * n));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v31)
          {
            objc_msgSend(v31, "mainItem");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "addSystemDialogActs:", v33);

            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            objc_msgSend(v32, "tier1Events");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v68, 16);
            if (v35)
            {
              v36 = *(_QWORD *)v45;
              do
              {
                for (ii = 0; ii != v35; ++ii)
                {
                  if (*(_QWORD *)v45 != v36)
                    objc_enumerationMutation(v34);
                  -[SiriInstrumentationObjectContainer addTier1Event:](v5, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * ii));
                }
                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v68, 16);
              }
              while (v35);
            }

          }
        }
        v27 = objb;
        v28 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v48, v69, 16);
      }
      while (v28);
    }

    -[SiriInstrumentationObjectContainer setMainItem:](v5, "setMainItem:", v43);
    v4 = v39;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertTask:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  SiriInstrumentationObjectContainer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99CD0]);
    objc_msgSend(v3, "taskId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTaskId:", v6);

    v7 = objc_alloc_init(SiriInstrumentationObjectContainer);
    objc_msgSend(v3, "task");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "mainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTask:", v10);

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v9, "tier1Events", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v11);
            -[SiriInstrumentationObjectContainer addTier1Event:](v7, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

    }
    if (objc_msgSend(v3, "hasScore"))
    {
      objc_msgSend(v3, "score");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "value");
      objc_msgSend(v4, "setScore:");

    }
    -[SiriInstrumentationObjectContainer setMainItem:](v7, "setMainItem:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertLegacyNLContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  SiriInstrumentationObjectContainer *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99E40]);
    objc_msgSend(v4, "setIsDictationPrompt:", objc_msgSend(v3, "dictationPrompt"));
    objc_msgSend(v4, "setIsStrictPrompt:", objc_msgSend(v3, "strictPrompt"));
    objc_msgSend(v3, "previousDomainName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreviousDomainName:", v5);

    objc_msgSend(v4, "setIsListenAfterSpeaking:", objc_msgSend(v3, "listenAfterSpeaking"));
    objc_msgSend(v4, "setLegacyContextSource:", +[SiriNLUSELFLogUtils convertLegacyContextSource:](SiriNLUSELFLogUtils, "convertLegacyContextSource:", objc_msgSend(v3, "legacyContextSource")));
    v6 = objc_alloc(MEMORY[0x1E0D9A500]);
    v7 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    v8 = (void *)objc_msgSend(v6, "initWithNSUUID:", v7);

    objc_msgSend(v4, "setLinkId:", v8);
    v9 = objc_alloc_init(SiriInstrumentationObjectContainer);
    -[SiriInstrumentationObjectContainer setMainItem:](v9, "setMainItem:", v4);
    +[SiriNLUSELFLogUtils createNLXLegacyNLContextTier1Event:withLinkId:](SiriNLUSELFLogUtils, "createNLXLegacyNLContextTier1Event:withLinkId:", v3, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriInstrumentationObjectContainer addTier1Event:](v9, "addTier1Event:", v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)convertSystemDialogAct:(id)a3
{
  id v3;
  id v4;
  SiriInstrumentationObjectContainer *v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  id v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    v5 = 0;
    goto LABEL_32;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0D99C90]);
  v5 = objc_alloc_init(SiriInstrumentationObjectContainer);
  objc_msgSend(v3, "idA");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setId:", v7);

  if (objc_msgSend(v3, "hasPrompted"))
  {
    objc_msgSend(v3, "prompted");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertPrompted:](SiriNLUSELFLogUtils, "convertPrompted:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "mainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPrompted:", v10);
LABEL_21:

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v9, "tier1Events", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v16);
            -[SiriInstrumentationObjectContainer addTier1Event:](v5, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v17);
      }

    }
  }
  else if (objc_msgSend(v3, "hasOffered"))
  {
    objc_msgSend(v3, "offered");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertOffered:](SiriNLUSELFLogUtils, "convertOffered:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "mainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setOffered:", v10);
      goto LABEL_21;
    }
  }
  else if (objc_msgSend(v3, "hasGaveOptions"))
  {
    objc_msgSend(v3, "gaveOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertGaveOptions:](SiriNLUSELFLogUtils, "convertGaveOptions:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "mainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setGaveOptions:", v10);
      goto LABEL_21;
    }
  }
  else if (objc_msgSend(v3, "hasInformed"))
  {
    objc_msgSend(v3, "informed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertInformed:](SiriNLUSELFLogUtils, "convertInformed:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "mainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setInformed:", v10);
      goto LABEL_21;
    }
  }
  else if (objc_msgSend(v3, "hasReportedSuccess"))
  {
    objc_msgSend(v3, "reportedSuccess");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertReportedSuccess:](SiriNLUSELFLogUtils, "convertReportedSuccess:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "mainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setReportedSuccess:", v10);
      goto LABEL_21;
    }
  }
  else if (objc_msgSend(v3, "hasReportedFailure"))
  {
    objc_msgSend(v3, "reportedFailure");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertReportedFailure:](SiriNLUSELFLogUtils, "convertReportedFailure:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "mainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setReportedFailure:", v10);
      goto LABEL_21;
    }
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v3, "hasRenderedText"))
  {
    v20 = objc_alloc(MEMORY[0x1E0D9A500]);
    v21 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    v22 = (void *)objc_msgSend(v20, "initWithNSUUID:", v21);

    objc_msgSend(v4, "setLinkId:", v22);
    +[SiriNLUSELFLogUtils createSystemDialogActTier1Event:withLinkId:](SiriNLUSELFLogUtils, "createSystemDialogActTier1Event:withLinkId:", v3, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriInstrumentationObjectContainer addTier1Event:](v5, "addTier1Event:", v23);

  }
  -[SiriInstrumentationObjectContainer setMainItem:](v5, "setMainItem:", v4);

LABEL_32:
  return v5;
}

+ (id)convertPrompted:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  SiriInstrumentationObjectContainer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99CB8]);
    objc_msgSend(v3, "taskId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTaskId:", v6);

    v7 = objc_alloc_init(SiriInstrumentationObjectContainer);
    objc_msgSend(v3, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "mainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTarget:", v10);

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v9, "tier1Events", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v11);
            -[SiriInstrumentationObjectContainer addTier1Event:](v7, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v12);
      }

    }
    -[SiriInstrumentationObjectContainer setMainItem:](v7, "setMainItem:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertOffered:(id)a3
{
  id v3;
  id v4;
  SiriInstrumentationObjectContainer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99CB0]);
    v5 = objc_alloc_init(SiriInstrumentationObjectContainer);
    objc_msgSend(v3, "offeredAct");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUserDialogAct:](SiriNLUSELFLogUtils, "convertUserDialogAct:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "mainItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setOfferedAct:", v8);

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(v7, "tier1Events", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v9);
            -[SiriInstrumentationObjectContainer addTier1Event:](v5, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v10);
      }

    }
    -[SiriInstrumentationObjectContainer setMainItem:](v5, "setMainItem:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertGaveOptions:(id)a3
{
  SiriInstrumentationObjectContainer *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v16;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  if (v16)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0D99CA0]);
    v3 = objc_alloc_init(SiriInstrumentationObjectContainer);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v16, "choices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v4;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(obj);
          +[SiriNLUSELFLogUtils convertUserDialogAct:](SiriNLUSELFLogUtils, "convertUserDialogAct:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          if (v8)
          {
            objc_msgSend(v8, "mainItem");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addChoices:", v10);

            v21 = 0u;
            v22 = 0u;
            v19 = 0u;
            v20 = 0u;
            objc_msgSend(v9, "tier1Events");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v20;
              do
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v20 != v13)
                    objc_enumerationMutation(v11);
                  -[SiriInstrumentationObjectContainer addTier1Event:](v3, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j));
                }
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
              }
              while (v12);
            }

          }
        }
        v4 = obj;
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v5);
    }

    -[SiriInstrumentationObjectContainer setMainItem:](v3, "setMainItem:", v18);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)convertInformed:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  SiriInstrumentationObjectContainer *v18;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  if (v20)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0D99CA8]);
    objc_msgSend(v20, "taskId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTaskId:", v4);

    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v20, "entities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v7);
          +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v20);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "mainItem");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addEntities:", v13);

            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            objc_msgSend(v12, "tier1Events");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v15)
            {
              v16 = *(_QWORD *)v23;
              do
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v23 != v16)
                    objc_enumerationMutation(v14);
                  objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
                }
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              }
              while (v15);
            }

          }
        }
        v6 = v7;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v8);
    }

    v18 = objc_alloc_init(SiriInstrumentationObjectContainer);
    -[SiriInstrumentationObjectContainer setMainItem:](v18, "setMainItem:", v21);
    -[SiriInstrumentationObjectContainer setTier1Events:](v18, "setTier1Events:", v5);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)convertReportedSuccess:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  SiriInstrumentationObjectContainer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99CC8]);
    objc_msgSend(v3, "taskId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTaskId:", v6);

    v7 = objc_alloc_init(SiriInstrumentationObjectContainer);
    objc_msgSend(v3, "task");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "mainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTask:", v10);

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v9, "tier1Events", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v11);
            -[SiriInstrumentationObjectContainer addTier1Event:](v7, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v12);
      }

    }
    -[SiriInstrumentationObjectContainer setMainItem:](v7, "setMainItem:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertReportedFailure:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  SiriInstrumentationObjectContainer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99CC0]);
    objc_msgSend(v3, "taskId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTaskId:", v6);

    v7 = objc_alloc_init(SiriInstrumentationObjectContainer);
    objc_msgSend(v3, "reason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "mainItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setReason:", v10);

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v9, "tier1Events");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v28 != v13)
              objc_enumerationMutation(v11);
            -[SiriInstrumentationObjectContainer addTier1Event:](v7, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v12);
      }

    }
    objc_msgSend(v3, "task");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "mainItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTask:", v17);

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v16, "tier1Events", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v18);
            -[SiriInstrumentationObjectContainer addTier1Event:](v7, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v19);
      }

    }
    -[SiriInstrumentationObjectContainer setMainItem:](v7, "setMainItem:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertUserParse:(id)a3
{
  void *v3;
  void *v4;
  SiriInstrumentationObjectContainer *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  if (v24)
  {
    v25 = objc_alloc_init(MEMORY[0x1E0D99D20]);
    objc_msgSend(v24, "idA");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setId:", v4);

    v5 = objc_alloc_init(SiriInstrumentationObjectContainer);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v24, "userDialogActs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v6);
          +[SiriNLUSELFLogUtils convertUserDialogAct:](SiriNLUSELFLogUtils, "convertUserDialogAct:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), v24);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "mainItem");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addUserDialogActs:", v12);

            v28 = 0u;
            v29 = 0u;
            v26 = 0u;
            v27 = 0u;
            objc_msgSend(v11, "tier1Events");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v27;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v27 != v15)
                    objc_enumerationMutation(v13);
                  -[SiriInstrumentationObjectContainer addTier1Event:](v5, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              }
              while (v14);
            }

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v7);
    }

    objc_msgSend(v24, "probability");
    objc_msgSend(v25, "setProbability:");
    objc_msgSend(v24, "repetitionResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertRepetitionResult:](SiriNLUSELFLogUtils, "convertRepetitionResult:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRepetitionResult:", v18);

    objc_msgSend(v24, "parser");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertParser:](SiriNLUSELFLogUtils, "convertParser:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setParser:", v20);

    objc_msgSend(v24, "comparableProbability");
    objc_msgSend(v25, "setComparableProbability:");
    objc_msgSend(v24, "correctionOutcome");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertCorrectionOutcome:](SiriNLUSELFLogUtils, "convertCorrectionOutcome:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCorrectionOutcome:", v22);

    -[SiriInstrumentationObjectContainer setMainItem:](v5, "setMainItem:", v25);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertCorrectionOutcome:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99BF0]);
    objc_msgSend(v4, "setCorrectionType:", +[SiriNLUSELFLogUtils convertCDMCorrectionType:](SiriNLUSELFLogUtils, "convertCDMCorrectionType:", objc_msgSend(v3, "type")));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertRepetitionResult:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99C58]);
    objc_msgSend(v4, "setAsrHypothesisIndex:", objc_msgSend(v3, "asrHypothesisIndex"));
    objc_msgSend(v4, "setRepetitionType:", +[SiriNLUSELFLogUtils convertCDMRepetitionType:](SiriNLUSELFLogUtils, "convertCDMRepetitionType:", objc_msgSend(v3, "repetitionType")));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertParser:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99C48]);
    objc_msgSend(v4, "setAlgorithm:", +[SiriNLUSELFLogUtils convertCDMParserAlgorithmType:](SiriNLUSELFLogUtils, "convertCDMParserAlgorithmType:", objc_msgSend(v3, "algorithm")));
    objc_msgSend(v4, "setParserId:", objc_msgSend(v3, "parserId"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertUserDialogAct:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  SiriInstrumentationObjectContainer *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99D18]);
    objc_msgSend(v3, "alignment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUtteranceAlignment:](SiriNLUSELFLogUtils, "convertUtteranceAlignment:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlignment:", v6);

    v7 = objc_alloc_init(SiriInstrumentationObjectContainer);
    if (objc_msgSend(v3, "hasAccepted"))
    {
      objc_msgSend(v3, "accepted");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertAccepted:](SiriNLUSELFLogUtils, "convertAccepted:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAccepted:", v9);

      objc_msgSend(v3, "accepted");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils getReferenceFromAccepted:](SiriNLUSELFLogUtils, "getReferenceFromAccepted:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "hasRejected"))
    {
      objc_msgSend(v3, "rejected");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertRejected:](SiriNLUSELFLogUtils, "convertRejected:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRejected:", v13);

      objc_msgSend(v3, "rejected");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils getReferenceFromRejected:](SiriNLUSELFLogUtils, "getReferenceFromRejected:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "hasCancelled"))
    {
      objc_msgSend(v3, "cancelled");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertCancelled:](SiriNLUSELFLogUtils, "convertCancelled:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCancelled:", v15);

      objc_msgSend(v3, "cancelled");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils getReferenceFromCancelled:](SiriNLUSELFLogUtils, "getReferenceFromCancelled:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "hasWantedToRepeat"))
    {
      objc_msgSend(v3, "wantedToRepeat");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertWantedToRepeat:](SiriNLUSELFLogUtils, "convertWantedToRepeat:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWantedToRepeat:", v17);

      objc_msgSend(v3, "wantedToRepeat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils getReferenceFromWantedToRepeat:](SiriNLUSELFLogUtils, "getReferenceFromWantedToRepeat:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "hasAcknowledged"))
    {
      objc_msgSend(v3, "acknowledged");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertAcknowledged:](SiriNLUSELFLogUtils, "convertAcknowledged:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAcknowledged:", v19);

      objc_msgSend(v3, "acknowledged");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils getReferenceFromAcknowledged:](SiriNLUSELFLogUtils, "getReferenceFromAcknowledged:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "hasWantedToProceed"))
    {
      objc_msgSend(v3, "wantedToProceed");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertWantedToProceed:](SiriNLUSELFLogUtils, "convertWantedToProceed:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWantedToProceed:", v21);

      objc_msgSend(v3, "wantedToProceed");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils getReferenceFromWantedToProceed:](SiriNLUSELFLogUtils, "getReferenceFromWantedToProceed:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "hasWantedToPause"))
    {
      objc_msgSend(v3, "wantedToPause");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertWantedToPause:](SiriNLUSELFLogUtils, "convertWantedToPause:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWantedToPause:", v23);

      objc_msgSend(v3, "wantedToPause");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils getReferenceFromWantedToPause:](SiriNLUSELFLogUtils, "getReferenceFromWantedToPause:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v3, "hasDelegated"))
      {
        objc_msgSend(v3, "delegated");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[SiriNLUSELFLogUtils convertDelegated:](SiriNLUSELFLogUtils, "convertDelegated:", v31);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v26, "mainItem");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setDelegated:", v32);

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v26, "tier1Events");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          if (v34)
          {
            v35 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v44 != v35)
                  objc_enumerationMutation(v33);
                -[SiriInstrumentationObjectContainer addTier1Event:](v7, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
              }
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
            }
            while (v34);
          }

        }
        v24 = 0;
        goto LABEL_25;
      }
      if (!objc_msgSend(v3, "hasUserStatedTask"))
      {
        v24 = 0;
        goto LABEL_26;
      }
      objc_msgSend(v3, "userStatedTask");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertUserStatedTask:](SiriNLUSELFLogUtils, "convertUserStatedTask:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setUserStatedTask:", v38);

      objc_msgSend(v3, "userStatedTask");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils getTaskFromUserStatedTask:](SiriNLUSELFLogUtils, "getTaskFromUserStatedTask:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v11;

    if (!v24)
    {
LABEL_26:
      -[SiriInstrumentationObjectContainer setMainItem:](v7, "setMainItem:", v4);

      goto LABEL_27;
    }
    objc_msgSend(v24, "mainItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReference:", v25);

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v24, "tier1Events", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v40 != v28)
            objc_enumerationMutation(v26);
          -[SiriInstrumentationObjectContainer addTier1Event:](v7, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v27);
    }
LABEL_25:

    goto LABEL_26;
  }
  v7 = 0;
LABEL_27:

  return v7;
}

+ (id)convertAccepted:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99D00]);
    objc_msgSend(v3, "offerId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "offerId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setOfferId:", v7);

    }
    else
    {
      +[SiriNLUSELFLogUtils createAllZeroUUID](SiriNLUSELFLogUtils, "createAllZeroUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setOfferId:", v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertRejected:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99D28]);
    objc_msgSend(v3, "offerId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "offerId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setOfferId:", v7);

    }
    else
    {
      +[SiriNLUSELFLogUtils createAllZeroUUID](SiriNLUSELFLogUtils, "createAllZeroUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setOfferId:", v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertCancelled:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99D10]);
    objc_msgSend(v3, "taskId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "taskId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTaskId:", v7);

    }
    else
    {
      +[SiriNLUSELFLogUtils createAllZeroUUID](SiriNLUSELFLogUtils, "createAllZeroUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTaskId:", v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertWantedToRepeat:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99D48]);
    objc_msgSend(v3, "systemDialogActId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "systemDialogActId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSystemDialogActId:", v7);

    }
    else
    {
      +[SiriNLUSELFLogUtils createAllZeroUUID](SiriNLUSELFLogUtils, "createAllZeroUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSystemDialogActId:", v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertAcknowledged:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99D08]);
    objc_msgSend(v3, "systemDialogActId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "systemDialogActId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSystemDialogActId:", v7);

    }
    else
    {
      +[SiriNLUSELFLogUtils createAllZeroUUID](SiriNLUSELFLogUtils, "createAllZeroUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSystemDialogActId:", v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertWantedToProceed:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99D40]);
    objc_msgSend(v3, "taskId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "taskId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTaskId:", v7);

    }
    else
    {
      +[SiriNLUSELFLogUtils createAllZeroUUID](SiriNLUSELFLogUtils, "createAllZeroUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTaskId:", v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertWantedToPause:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99D38]);
    objc_msgSend(v3, "taskId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "taskId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTaskId:", v7);

    }
    else
    {
      +[SiriNLUSELFLogUtils createAllZeroUUID](SiriNLUSELFLogUtils, "createAllZeroUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTaskId:", v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertDelegated:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v22;
  SiriInstrumentationObjectContainer *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  if (v24)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0D99BF8]);
    objc_msgSend(v22, "setAsrHypothesisIndex:", objc_msgSend(v24, "asrHypothesisIndex"));
    objc_msgSend(v24, "externalParserId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setExternalParserId:", v3);

    v23 = objc_alloc_init(SiriInstrumentationObjectContainer);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v24, "matchingSpans");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v4);
          v11 = 0;
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          while (objc_msgSend(v12, "matcherNamesCount") > v11)
          {
            if (objc_msgSend(v12, "matcherNamesAtIndex:", v11) == 1)
              v5 = (v5 + 1);
            else
              v5 = v5;
            v13 = objc_msgSend(v12, "matcherNamesAtIndex:", v11);
            v14 = objc_msgSend(v12, "matcherNamesAtIndex:", v11);
            if (v13 == 3)
              v6 = (v6 + 1);
            else
              v6 = v6;
            if (v14 == 4)
              v7 = (v7 + 1);
            else
              v7 = v7;
            ++v11;
          }
        }
        v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v8);
    }

    v15 = v22;
    objc_msgSend(v22, "setSiriVocabularySpanCount:", v5);
    objc_msgSend(v22, "setMentionResolverSpanCount:", v6);
    objc_msgSend(v22, "setContextMatcherSpanCount:", v7);
    if (objc_msgSend(v24, "hasRewrite"))
    {
      objc_msgSend(v24, "rewrite");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setRewriteType:", +[SiriNLUSELFLogUtils convertCDMRewriteType:](SiriNLUSELFLogUtils, "convertCDMRewriteType:", objc_msgSend(v16, "rewriteType")));

      v17 = objc_alloc(MEMORY[0x1E0D9A500]);
      v18 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
      v19 = (void *)objc_msgSend(v17, "initWithNSUUID:", v18);

      objc_msgSend(v22, "setLinkId:", v19);
      +[SiriNLUSELFLogUtils createDelegatedUserDialogActTier1Event:withLinkId:](SiriNLUSELFLogUtils, "createDelegatedUserDialogActTier1Event:withLinkId:", v24, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriInstrumentationObjectContainer addTier1Event:](v23, "addTier1Event:", v20);

      v15 = v22;
    }
    -[SiriInstrumentationObjectContainer setMainItem:](v23, "setMainItem:", v15);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)convertUserStatedTask:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D99D30]);
    objc_msgSend(v3, "setExists:", 1);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)getReferenceFromAccepted:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromRejected:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromCancelled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromWantedToRepeat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromAcknowledged:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromWantedToProceed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getReferenceFromWantedToPause:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getTaskFromUserStatedTask:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)convertMatchingSpan:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  char v7;
  SiriInstrumentationObjectContainer *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v23;
  id v24;
  id v25;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  if (v26)
  {
    v25 = objc_alloc_init(MEMORY[0x1E0D99C18]);
    objc_msgSend(v26, "label");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLabel:", v3);

    objc_msgSend(v25, "setStartTokenIndex:", objc_msgSend(v26, "startTokenIndex"));
    objc_msgSend(v25, "setEndTokenIndex:", objc_msgSend(v26, "endTokenIndex"));
    objc_msgSend(v26, "internalSpanData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertInternalSpanData:](SiriNLUSELFLogUtils, "convertInternalSpanData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setInternalSpanData:", v5);

    v6 = 0;
    v7 = 0;
    while (objc_msgSend(v26, "matcherNamesCount") > v6)
    {
      objc_msgSend(v25, "addMatcherNames:", +[SiriNLUSELFLogUtils convertCDMMatcherName:](SiriNLUSELFLogUtils, "convertCDMMatcherName:", objc_msgSend(v26, "matcherNamesAtIndex:", v6)));
      v7 |= objc_msgSend(v26, "matcherNamesAtIndex:", v6++) == 2;
    }
    v8 = objc_alloc_init(SiriInstrumentationObjectContainer);
    objc_msgSend(v26, "usoGraph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertUsoGraph:](SiriNLUSELFLogUtils, "convertUsoGraph:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v10;
    if (v10)
    {
      objc_msgSend(v10, "mainItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setUsoGraph:", v11);

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v10, "tier1Events");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v33 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            if ((v7 & 1) != 0)
            {
              v30 = 0u;
              v31 = 0u;
              v28 = 0u;
              v29 = 0u;
              objc_msgSend(v15, "cdmUsoGraphTier1");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "usoGraphTier1");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "linkedUsoGraphNodeDatas");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              if (v19)
              {
                v20 = *(_QWORD *)v29;
                do
                {
                  for (j = 0; j != v19; ++j)
                  {
                    if (*(_QWORD *)v29 != v20)
                      objc_enumerationMutation(v18);
                    objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "setLinkedUsoNodeData:", 0, v23);
                  }
                  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
                }
                while (v19);
              }

            }
            -[SiriInstrumentationObjectContainer addTier1Event:](v8, "addTier1Event:", v15, v23);
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v12);
      }

    }
    -[SiriInstrumentationObjectContainer setMainItem:](v8, "setMainItem:", v25, v23);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)convertMatchingSpanTier1:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99C30]);
    objc_msgSend(v3, "input");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInput:", v5);

    objc_msgSend(v3, "semanticValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSemanticValue:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertInternalSpanData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99C08]);
    objc_msgSend(v3, "siriVocabularySpanData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertSiriVocabularySpanData:](SiriNLUSELFLogUtils, "convertSiriVocabularySpanData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSiriVocabularySpanData:", v6);

    objc_msgSend(v3, "plumSpanData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertPLUMSpanData:](SiriNLUSELFLogUtils, "convertPLUMSpanData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlumSpanData:", v8);

    objc_msgSend(v3, "mentionDetectorSpanData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertMentionDetectorSpanData:](SiriNLUSELFLogUtils, "convertMentionDetectorSpanData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMentionDetectorSpanData:", v10);

    objc_msgSend(v3, "mentionResolverSpanData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertMentionResolverSpanData:](SiriNLUSELFLogUtils, "convertMentionResolverSpanData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMentionResolverSpanData:", v12);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertSiriVocabularySpanData:(id)a3
{
  if (a3)
    return objc_alloc_init(MEMORY[0x1E0D99C88]);
  else
    return 0;
}

+ (id)convertPLUMSpanData:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99E50]);
    objc_msgSend(v3, "score");
    objc_msgSend(v4, "setScore:");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertMentionDetectorSpanData:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99E18]);
    objc_msgSend(v3, "score");
    objc_msgSend(v4, "setScore:");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertMentionResolverSpanData:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99E20]);
    objc_msgSend(v3, "modelScore");
    objc_msgSend(v4, "setModelScore:");
    objc_msgSend(v3, "jointScore");
    objc_msgSend(v4, "setJointScore:");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertTokenChain:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99CE0]);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v3, "tokens", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          +[SiriNLUSELFLogUtils convertToken:](SiriNLUSELFLogUtils, "convertToken:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addTokens:", v9);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertToken:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99CD8]);
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:", v5);

    objc_msgSend(v4, "setBegin:", objc_msgSend(v3, "begin"));
    objc_msgSend(v4, "setEnd:", objc_msgSend(v3, "end"));
    objc_msgSend(v4, "setIsSignificant:", objc_msgSend(v3, "isSignificant"));
    objc_msgSend(v4, "setIsWhitespace:", objc_msgSend(v3, "isWhitespace"));
    objc_msgSend(v4, "setNonWhitespaceTokenIndex:", objc_msgSend(v3, "nonWhitespaceTokenIndex"));
    objc_msgSend(v3, "cleanValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCleanValue:", v6);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v3, "normalizedValues", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(v4, "addNormalizedValues:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setTokenIndex:", objc_msgSend(v3, "tokenIndex"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertReformedTurnInputBundle:(id)a3
{
  id v3;
  id v4;
  SiriInstrumentationObjectContainer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99C50]);
    objc_msgSend(v4, "setType:", +[SiriNLUSELFLogUtils convertCDMReformType:](SiriNLUSELFLogUtils, "convertCDMReformType:", objc_msgSend(v3, "type")));
    v5 = objc_alloc_init(SiriInstrumentationObjectContainer);
    objc_msgSend(v3, "currentTurn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUSELFLogUtils convertTurnInput:](SiriNLUSELFLogUtils, "convertTurnInput:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "mainItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCurrentTurn:", v8);

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(v7, "tier1Events", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v9);
            -[SiriInstrumentationObjectContainer addTier1Event:](v5, "addTier1Event:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v10);
      }

    }
    -[SiriInstrumentationObjectContainer setMainItem:](v5, "setMainItem:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertLvcResult:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99C10]);
    objc_msgSend(v3, "multilingualVariants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v3, "multilingualVariants", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v19 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            v11 = objc_alloc_init(MEMORY[0x1E0D99C38]);
            objc_msgSend(v10, "languageVariantName");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setLanguageVariantName:", v12);

            objc_msgSend(v10, "languageVariantScore");
            objc_msgSend(v11, "setLanguageVariantConfidenceScore:");
            objc_msgSend(v4, "addMultilingualVariants:", v11);

          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v7);
      }

    }
    objc_msgSend(v3, "parser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (!v14)
    {
      objc_msgSend(v3, "parser");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUSELFLogUtils convertParser:](SiriNLUSELFLogUtils, "convertParser:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCdmParser:", v16);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)convertUSOEntityIdentifierNluComponent:(int)a3
{
  if (a3 > 6)
    return 0;
  else
    return dword_1C20463C0[a3];
}

+ (int)convertUSOEntitySpanNluComponent:(int)a3
{
  if (a3 > 6)
    return 0;
  else
    return dword_1C20463C0[a3];
}

+ (int)convertMatchInfoAliasType:(int)a3
{
  if (a3 < 8)
    return a3 + 1;
  else
    return 0;
}

+ (int)convertCDMMatcherName:(int)a3
{
  if (a3 < 9)
    return a3 + 1;
  else
    return 0;
}

+ (int)convertCDMRepetitionType:(int)a3
{
  if (a3 > 3)
    return 0;
  else
    return dword_1C2047E10[a3];
}

+ (int)convertCDMCorrectionType:(int)a3
{
  return a3 == 1;
}

+ (int)convertCDMRewriteType:(int)a3
{
  if (a3 < 4)
    return a3 + 1;
  else
    return 0;
}

+ (int)convertCDMReformType:(int)a3
{
  if (a3 < 4)
    return a3 + 1;
  else
    return 0;
}

+ (int)convertCDMParserAlgorithmType:(int)a3
{
  if (a3 < 3)
    return a3 + 1;
  else
    return 0;
}

+ (int)convertLegacyContextSource:(int)a3
{
  if ((a3 - 1) > 2)
    return 0;
  else
    return dword_1C20463DC[a3 - 1];
}

+ (id)extractRequestLinkData:(id)a3
{
  id v3;
  SiriNLUSELFRequestLinkData *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(SiriNLUSELFRequestLinkData);
  if (v3)
  {
    v5 = CFSTR("No ResultCandidateId");
    objc_msgSend(v3, "connectionId");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "idA");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v6;

    if (v7)
    {
      objc_msgSend(v3, "idA");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(":"));
      v9 = objc_claimAutoreleasedReturnValue();

      if (v9 && -[NSObject count](v9, "count"))
      {
        v10 = -[NSObject count](v9, "count");
        -[NSObject objectAtIndex:](v9, "objectAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);
        loggerContext(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
          _os_log_debug_impl(&dword_1C1D3C000, v13, OS_LOG_TYPE_DEBUG, "%s SELF RequestLink: Getting NL ID info...", buf, 0xCu);
        }

        loggerContext(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
          v34 = 2112;
          v35 = (uint64_t)v11;
          _os_log_debug_impl(&dword_1C1D3C000, v14, OS_LOG_TYPE_DEBUG, "%s Target ID: %@", buf, 0x16u);
        }

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0D978A0], "derivedIdentifierForComponentName:fromSourceIdentifier:", 7, v12);
          v15 = objc_claimAutoreleasedReturnValue();
          +[SiriNLUExternalTypesConverter convertFromUUID:](SiriNLUExternalTypesConverter, "convertFromUUID:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          loggerContext(0);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject UUIDString](v15, "UUIDString");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
            v34 = 2112;
            v35 = (uint64_t)v29;
            _os_log_debug_impl(&dword_1C1D3C000, v17, OS_LOG_TYPE_DEBUG, "%s SELF RequestLink: NL ID: %@", buf, 0x16u);

          }
        }
        else
        {
          loggerContext(0);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
            _os_log_impl(&dword_1C1D3C000, v15, OS_LOG_TYPE_INFO, "%s [WARN]: SELF RequestLink extraction error - upstream UUID could not be converted into NSUUID!", buf, 0xCu);
          }
          v16 = 0;
        }

        if (v10 == 2)
        {
          -[NSObject objectAtIndex:](v9, "objectAtIndex:", 1);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          loggerContext(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
            v34 = 2112;
            v35 = (uint64_t)v5;
            _os_log_debug_impl(&dword_1C1D3C000, v20, OS_LOG_TYPE_DEBUG, "%s SELF RequestLink: RC ID: %@", buf, 0x16u);
          }

          v10 = 2;
        }
        else
        {
          v5 = CFSTR("No ResultCandidateId");
        }
      }
      else
      {
        loggerContext(0);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
          _os_log_impl(&dword_1C1D3C000, v11, OS_LOG_TYPE_INFO, "%s [WARN]: SELF RequestLink: Splitting the ID with a delimiter returned nil or an array of size 0!", buf, 0xCu);
        }
        v10 = 0;
        v12 = 0;
        v16 = 0;
      }

      if (!objc_msgSend(v3, "hasTrpId")
        || (objc_msgSend(v3, "trpId"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "length") == 0,
            v21,
            v22))
      {
        loggerContext(0);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
          _os_log_impl(&dword_1C1D3C000, v25, OS_LOG_TYPE_INFO, "%s [WARN]: SELF TRP ID: The transition relevance place Id (trpId) inside RequestID was nil!", buf, 0xCu);
        }
        v19 = 0;
      }
      else
      {
        v23 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v3, "trpId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "initWithUUIDString:", v24);

        if (v25)
        {
          +[SiriNLUExternalTypesConverter convertFromUUID:](SiriNLUExternalTypesConverter, "convertFromUUID:", v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          loggerContext(0);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject UUIDString](v25, "UUIDString");
            v27 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
            v34 = 2112;
            v35 = v27;
            v30 = (void *)v27;
            _os_log_debug_impl(&dword_1C1D3C000, v26, OS_LOG_TYPE_DEBUG, "%s SELF TRP ID: %@", buf, 0x16u);

          }
        }
        else
        {
          loggerContext(0);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
            _os_log_impl(&dword_1C1D3C000, v26, OS_LOG_TYPE_INFO, "%s [WARN]: SELF TRP ID extraction error - upstream UUID for TRP ID could not be converted into NSUUID!", buf, 0xCu);
          }
          v19 = 0;
        }

      }
    }
    else
    {
      loggerContext(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "+[SiriNLUSELFLogUtils extractRequestLinkData:]";
        _os_log_impl(&dword_1C1D3C000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: SELF RequestLink: The ID inside RequestID was nil!", buf, 0xCu);
      }
      v10 = 0;
      v12 = 0;
      v19 = 0;
      v16 = 0;
    }

    v18 = v31;
  }
  else
  {
    v10 = 0;
    v12 = 0;
    v18 = 0;
    v19 = 0;
    v16 = 0;
    v5 = CFSTR("No ResultCandidateId");
  }
  -[SiriNLUSELFRequestLinkData setNlId:](v4, "setNlId:", v16, v30);
  -[SiriNLUSELFRequestLinkData setTrpId:](v4, "setTrpId:", v19);
  -[SiriNLUSELFRequestLinkData setResultCandidateId:](v4, "setResultCandidateId:", v5);
  -[SiriNLUSELFRequestLinkData setTargetName:](v4, "setTargetName:", v18);
  -[SiriNLUSELFRequestLinkData setTargetUUID:](v4, "setTargetUUID:", v12);
  -[SiriNLUSELFRequestLinkData setSplitCount:](v4, "setSplitCount:", v10);

  return v4;
}

+ (id)getErrorDomainMapping
{
  if (+[SiriNLUSELFLogUtils getErrorDomainMapping]::onceToken[0] != -1)
    dispatch_once(+[SiriNLUSELFLogUtils getErrorDomainMapping]::onceToken, &__block_literal_global_2622);
  return (id)+[SiriNLUSELFLogUtils getErrorDomainMapping]::errorDomainStringToEnum;
}

+ (int)getErrorDomain:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v3 = a3;
  if (v3)
  {
    +[SiriNLUSELFLogUtils getErrorDomainMapping](SiriNLUSELFLogUtils, "getErrorDomainMapping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "objectForKey:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        v8 = objc_msgSend(v6, "intValue");
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)createAllZeroUUID
{
  SIRINLUEXTERNALUUID *v2;
  void *v3;

  v2 = objc_alloc_init(SIRINLUEXTERNALUUID);
  -[SIRINLUEXTERNALUUID setLowInt:](v2, "setLowInt:", 0);
  -[SIRINLUEXTERNALUUID setHighInt:](v2, "setHighInt:", 0);
  +[SiriNLUSELFLogUtils convertUUID:](SiriNLUSELFLogUtils, "convertUUID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __44__SiriNLUSELFLogUtils_getErrorDomainMapping__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  _QWORD v24[22];
  _QWORD v25[24];

  v25[22] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("NlxErrorDomainCDM");
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 1);
  v25[0] = v23;
  v24[1] = CFSTR("NlxErrorDomainCDMClient");
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 2);
  v25[1] = v22;
  v24[2] = CFSTR("NlxErrorDomainAssetsManager");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 3);
  v25[2] = v21;
  v24[3] = CFSTR("NlxErrorDomainDAG");
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 4);
  v25[3] = v20;
  v24[4] = CFSTR("NlxErrorDomainNlv4");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 5);
  v25[4] = v19;
  v24[5] = CFSTR("NlxErrorDomainSNLC");
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 6);
  v25[5] = v18;
  v24[6] = CFSTR("NlxErrorDomainPSC");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 7);
  v25[6] = v17;
  v24[7] = CFSTR("NlxErrorDomainEmbedding");
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 8);
  v25[7] = v16;
  v24[8] = CFSTR("NlxErrorDomainCcqrAerCbR");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 9);
  v25[8] = v15;
  v24[9] = CFSTR("NlxErrorDomainUaaP");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 10);
  v25[9] = v14;
  v24[10] = CFSTR("NlxErrorDomainMDSUaaP");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 11);
  v25[10] = v13;
  v24[11] = CFSTR("NlxErrorDomainPLUM");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 12);
  v25[11] = v12;
  v24[12] = CFSTR("NlxErrorDomainCATI");
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 13);
  v25[12] = v0;
  v24[13] = CFSTR("NlxErrorDomainTokenizer");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 14);
  v25[13] = v1;
  v24[14] = CFSTR("NlxErrorDomainSpanMatch");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 15);
  v25[14] = v2;
  v24[15] = CFSTR("NlxErrorDomainOverrides");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 16);
  v25[15] = v3;
  v24[16] = CFSTR("NlxErrorDomainShortcut");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 17);
  v25[16] = v4;
  v24[17] = CFSTR("NlxErrorDomainRepetitionDetection");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 18);
  v25[17] = v5;
  v24[18] = CFSTR("NlxErrorDomainMentionDetector");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 19);
  v25[18] = v6;
  v24[19] = CFSTR("NlxErrorDomainMentionResolver");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 20);
  v25[19] = v7;
  v24[20] = CFSTR("NlxErrorDomainContextUpdate");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 21);
  v25[20] = v8;
  v24[21] = CFSTR("NlxErrorDomainContextualSpanMatcher");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 22);
  v25[21] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 22);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)+[SiriNLUSELFLogUtils getErrorDomainMapping]::errorDomainStringToEnum;
  +[SiriNLUSELFLogUtils getErrorDomainMapping]::errorDomainStringToEnum = v10;

}

@end
