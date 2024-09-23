@implementation PREResponsesMetricsPET

- (PREResponsesMetricsPET)init
{
  void *v3;
  PREResponsesMetricsPET *v4;

  +[PREExperimentResolver sharedInstance](PREExperimentResolver, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PREResponsesMetricsPET initWithExperimentResolver:](self, "initWithExperimentResolver:", v3);

  return v4;
}

- (PREResponsesMetricsPET)initWithExperimentResolver:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PREResponsesMetricsPET *v7;

  v4 = (void *)MEMORY[0x1E0D80F28];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PREResponsesMetricsPET initWithTracker:experimentResolver:](self, "initWithTracker:experimentResolver:", v6, v5);

  return v7;
}

- (PREResponsesMetricsPET)initWithTracker:(id)a3 experimentResolver:(id)a4
{
  id v7;
  id v8;
  PREResponsesMetricsPET *v9;
  PREResponsesMetricsPET *v10;
  void *v11;
  uint64_t v12;
  NSString *processName;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PREResponsesMetricsPET;
  v9 = -[PREResponsesMetricsPET init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tracker, a3);
    objc_storeStrong((id *)&v10->_resolver, a4);
    v10->_isApricotDevice = -[PREResponsesMetricsPET isApricotDevice](v10, "isApricotDevice");
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "processName");
    v12 = objc_claimAutoreleasedReturnValue();
    processName = v10->_processName;
    v10->_processName = (NSString *)v12;

  }
  return v10;
}

- (void)registerResponsesGenerated:(id)a3
{
  id v4;
  void *v5;
  PREExperimentResolverProtocol *resolver;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t v22[8];
  _QWORD v23[4];
  NSObject *v24;
  PREResponsesMetricsPET *v25;
  id v26;
  uint8_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  int v36;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    resolver = self->_resolver;
    objc_msgSend(v4, "language");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREExperimentResolverProtocol getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](resolver, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    v34 = buf;
    v35 = 0x2020000000;
    v36 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    objc_msgSend(v5, "responses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __53__PREResponsesMetricsPET_registerResponsesGenerated___block_invoke;
    v23[3] = &unk_1E7D9E120;
    v10 = v8;
    v24 = v10;
    v25 = self;
    v11 = v5;
    v26 = v11;
    v27 = buf;
    v28 = &v29;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);

    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setIsCached:", objc_msgSend(v11, "isCached"));
    -[NSObject experimentIdentifiers](v10, "experimentIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "experimentId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setExperimentId:", v14);

    -[NSObject experimentIdentifiers](v10, "experimentIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "treatmentId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTreatmentId:", v16);

    -[NSObject treatmentName](v10, "treatmentName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTreatmentModelName:", v17);

    objc_msgSend(v12, "setHostProcess:", self->_processName);
    objc_msgSend(v11, "locale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLocale:", v18);

    objc_msgSend(v11, "language");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLang:", v19);

    objc_msgSend(v12, "setIsApricotDevice:", self->_isApricotDevice);
    objc_msgSend(v12, "setGenerationStatus:", objc_msgSend(v11, "generationStatus"));
    objc_msgSend(v11, "responses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfResponsesGenerated:", objc_msgSend(v20, "count"));

    objc_msgSend(v12, "setNumberOfCustomResponses:", *((unsigned int *)v34 + 6));
    objc_msgSend(v12, "setNumberOfRobotResponses:", *((unsigned int *)v30 + 6));
    -[PETEventTracker2 trackDistributionForMessage:value:](self->_tracker, "trackDistributionForMessage:value:", v12, (double)(unint64_t)objc_msgSend(v11, "responseTimePerf"));
    pre_responses_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1C35DB000, v21, OS_LOG_TYPE_DEFAULT, "PREResponsesMetricsPET finished logging responses generated", v22, 2u);
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    pre_responses_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C35DB000, v10, OS_LOG_TYPE_DEFAULT, "PREResponsesGeneratedEvent is nil. Skip logging", buf, 2u);
    }
  }

}

- (id)_responseListFromGeneratedEvent:(id)a3
{
  id v4;
  PREExperimentResolverProtocol *resolver;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  resolver = self->_resolver;
  objc_msgSend(v4, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREExperimentResolverProtocol getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](resolver, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "experimentIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "experimentId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExperimentId:", v10);

  objc_msgSend(v7, "experimentIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "treatmentId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTreatmentId:", v12);

  v33 = v7;
  objc_msgSend(v7, "treatmentName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTreatmentModelName:", v13);

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setHostProcess:", self->_processName);
  objc_msgSend(v4, "locale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocale:", v15);

  objc_msgSend(v4, "language");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLang:", v16);

  objc_msgSend(v14, "setIsApricotDevice:", self->_isApricotDevice);
  objc_msgSend(v14, "setCharCount:", objc_msgSend(v4, "messageCharCount"));
  v32 = v14;
  objc_msgSend(v14, "setHasQuestionMark:", objc_msgSend(v4, "hasQuestionMark"));
  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "responses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v4, "responses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v26 = (void *)objc_opt_new();
        objc_msgSend(v25, "modelId");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setModelId:", objc_msgSend(v27, "unsignedIntegerValue"));

        objc_msgSend(v26, "setResponseClassId:", 0xFFFFFFFFLL);
        objc_msgSend(v26, "setReplyTextId:", 0xFFFFFFFFLL);
        objc_msgSend(v25, "isCustomResponse");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setIsCustomResponse:", objc_msgSend(v28, "BOOLValue"));

        objc_msgSend(v25, "isRobotResponse");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setIsRobotResponse:", objc_msgSend(v29, "BOOLValue"));

        objc_msgSend(v19, "addObject:", v26);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v22);
  }

  v30 = (void *)objc_opt_new();
  objc_msgSend(v30, "setExperiment:", v8);
  objc_msgSend(v30, "setMsgMetadata:", v32);
  objc_msgSend(v30, "setItems:", v19);
  objc_msgSend(v30, "setIsCached:", objc_msgSend(v4, "isCached"));
  objc_msgSend(v30, "setResponseTimePerf:", objc_msgSend(v4, "responseTimePerf"));
  objc_msgSend(v30, "setGenerationStatus:", objc_msgSend(v4, "generationStatus"));

  return v30;
}

- (void)registerResponseTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  PREExperimentResolverProtocol *resolver;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  PREResponsesMetricsPET *v47;
  NSObject *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[16];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "selectedPosition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "selectedPosition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntegerValue");

    }
    else
    {
      v8 = 0xFFFFFFFFLL;
    }

    resolver = self->_resolver;
    objc_msgSend(v5, "responsesGeneratedEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "language");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREExperimentResolverProtocol getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](resolver, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", v12, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_opt_new();
    objc_msgSend(v5, "responsesGeneratedEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v48 = v9;
      objc_msgSend(v5, "responsesGeneratedEvent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "responses");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      v47 = self;
      if (v17 <= v8)
      {
        objc_msgSend(v13, "setModelId:", 0xFFFFFFFFLL);
        objc_msgSend(v13, "setReplyTextId:", 0xFFFFFFFFLL);
        objc_msgSend(v13, "setResponseClassId:", 0xFFFFFFFFLL);
      }
      else
      {
        objc_msgSend(v15, "responses");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "modelId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setModelId:", objc_msgSend(v20, "unsignedIntegerValue"));

        objc_msgSend(v13, "setReplyTextId:", 0xFFFFFFFFLL);
        objc_msgSend(v13, "setResponseClassId:", 0xFFFFFFFFLL);
        objc_msgSend(v19, "isCustomResponse");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setIsCustomResponse:", objc_msgSend(v21, "BOOLValue"));

        objc_msgSend(v19, "isRobotResponse");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setIsRobotResponse:", objc_msgSend(v22, "BOOLValue"));

      }
      v46 = v8;
      v49 = v5;
      objc_msgSend(v15, "locale");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLocale:", v24);

      objc_msgSend(v15, "language");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLang:", v25);

      objc_msgSend(v13, "setGenerationStatus:", objc_msgSend(v15, "generationStatus"));
      objc_msgSend(v15, "responses");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNumberOfResponsesGenerated:", objc_msgSend(v26, "count"));

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v45 = v15;
      objc_msgSend(v15, "responses");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v28)
      {
        v29 = v28;
        v30 = 0;
        v31 = 0;
        v32 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v51 != v32)
              objc_enumerationMutation(v27);
            v34 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend(v34, "isCustomResponse");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "BOOLValue");

            if (v36)
            {
              v30 = (v30 + 1);
            }
            else
            {
              objc_msgSend(v34, "isRobotResponse");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "BOOLValue");

              v31 = (v31 + v38);
            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v29);
      }
      else
      {
        v30 = 0;
        v31 = 0;
      }

      objc_msgSend(v13, "setNumberOfCustomResponses:", v30);
      objc_msgSend(v13, "setNumberOfRobotResponses:", v31);

      v9 = v48;
      v5 = v49;
      v8 = v46;
      self = v47;
    }
    else
    {
      pre_responses_handle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C35DB000, v23, OS_LOG_TYPE_DEFAULT, "No generated list found in the tapped event. Probably due to process restart", buf, 2u);
      }

      objc_msgSend(v13, "setModelId:", 0xFFFFFFFFLL);
      objc_msgSend(v13, "setReplyTextId:", 0xFFFFFFFFLL);
      objc_msgSend(v13, "setResponseClassId:", 0xFFFFFFFFLL);
      objc_msgSend(v13, "setLocale:", 0);
      objc_msgSend(v13, "setLang:", 0);
      objc_msgSend(v13, "setGenerationStatus:", 0);
      objc_msgSend(v13, "setNumberOfResponsesGenerated:", 0xFFFFFFFFLL);
      objc_msgSend(v13, "setNumberOfCustomResponses:", 0xFFFFFFFFLL);
      objc_msgSend(v13, "setIsCustomResponse:", 0);
      objc_msgSend(v13, "setIsRobotResponse:", 0);
    }
    -[NSObject experimentIdentifiers](v9, "experimentIdentifiers");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "experimentId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setExperimentId:", v40);

    -[NSObject experimentIdentifiers](v9, "experimentIdentifiers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "treatmentId");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTreatmentId:", v42);

    -[NSObject treatmentName](v9, "treatmentName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTreatmentModelName:", v43);

    objc_msgSend(v13, "setIsApricotDevice:", self->_isApricotDevice);
    objc_msgSend(v13, "setHostProcess:", self->_processName);
    objc_msgSend(v13, "setInputMethod:", objc_msgSend(v5, "inputMethod"));
    objc_msgSend(v13, "setHasQuestionMark:", objc_msgSend(v5, "hasQuestionMark"));
    objc_msgSend(v13, "setPosition:", v8);
    -[PETEventTracker2 trackDistributionForMessage:value:](self->_tracker, "trackDistributionForMessage:value:", v13, (double)(unint64_t)objc_msgSend(v5, "timeToTap"));
    pre_responses_handle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C35DB000, v44, OS_LOG_TYPE_DEFAULT, "PREResponsesMetricsPET finished logging response tapped", buf, 2u);
    }

  }
  else
  {
    pre_responses_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C35DB000, v9, OS_LOG_TYPE_DEFAULT, "PREResponseTappedEvent is nil. Skip logging", buf, 2u);
    }
  }

}

- (void)registerResponseViewed:(id)a3
{
  id v4;
  NSObject *v5;
  PREExperimentResolverProtocol *resolver;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PETEventTracker2 *tracker;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_new();
    -[NSObject setLastViewedIndex:](v5, "setLastViewedIndex:", objc_msgSend(v4, "unsignedIntValue"));
    resolver = self->_resolver;
    objc_msgSend(MEMORY[0x1E0D70A90], "defaultLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREExperimentResolverProtocol getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](resolver, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "experimentIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "experimentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setExperimentId:](v5, "setExperimentId:", v10);

    objc_msgSend(v8, "experimentIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "treatmentId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setTreatmentId:](v5, "setTreatmentId:", v12);

    objc_msgSend(v8, "treatmentName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setTreatmentModelName:](v5, "setTreatmentModelName:", v13);

    -[NSObject setHostProcess:](v5, "setHostProcess:", self->_processName);
    -[NSObject setIsApricotDevice:](v5, "setIsApricotDevice:", self->_isApricotDevice);
    tracker = self->_tracker;
    objc_msgSend(v4, "doubleValue");
    -[PETEventTracker2 trackDistributionForMessage:value:](tracker, "trackDistributionForMessage:value:", v5);
    pre_responses_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1C35DB000, v15, OS_LOG_TYPE_DEFAULT, "PREResponsesMetricsPET finished logging responses viewed", v16, 2u);
    }

  }
  else
  {
    pre_responses_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C35DB000, v5, OS_LOG_TYPE_DEFAULT, "lastViewedIndex is nil. Skip logging", buf, 2u);
    }
  }

}

- (BOOL)isApricotDevice
{
  return 0;
}

- (id)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

void __53__PREResponsesMetricsPET_registerResponsesGenerated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
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
  int v18;
  id v19;

  v19 = a2;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v19, "modelId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setModelId:", objc_msgSend(v6, "unsignedIntegerValue"));

  objc_msgSend(v5, "setResponseClassId:", 0xFFFFFFFFLL);
  objc_msgSend(v5, "setReplyTextId:", 0xFFFFFFFFLL);
  objc_msgSend(v5, "setPosition:", a3);
  objc_msgSend(*(id *)(a1 + 32), "experimentIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "experimentId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExperimentId:", v8);

  objc_msgSend(*(id *)(a1 + 32), "experimentIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "treatmentId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTreatmentId:", v10);

  objc_msgSend(*(id *)(a1 + 32), "treatmentName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTreatmentModelName:", v11);

  objc_msgSend(v5, "setHostProcess:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  objc_msgSend(*(id *)(a1 + 48), "locale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocale:", v12);

  objc_msgSend(*(id *)(a1 + 48), "language");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLang:", v13);

  objc_msgSend(v5, "setIsApricotDevice:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(v19, "isCustomResponse");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsCustomResponse:", objc_msgSend(v14, "BOOLValue"));

  objc_msgSend(v19, "isCustomResponse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v15, "BOOLValue");

  if ((_DWORD)v10)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  objc_msgSend(v19, "isRobotResponse");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsRobotResponse:", objc_msgSend(v16, "BOOLValue"));

  objc_msgSend(v19, "isRobotResponse");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (v18)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "trackScalarForMessage:", v5);

}

@end
