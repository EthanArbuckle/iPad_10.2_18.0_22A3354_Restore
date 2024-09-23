@implementation UPContextualizerStrategyOptions

- (UPContextualizerStrategyOptions)initWithPrebuiltIntentThreshold:(double)a3 usoSerializer:(id)a4
{
  id v7;
  UPContextualizerStrategyOptions *v8;
  UPContextualizerStrategyOptions *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UPContextualizerStrategyOptions;
  v8 = -[UPContextualizerStrategyOptions init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_prebuiltIntentThreshold = a3;
    objc_storeStrong((id *)&v8->_usoSerializer, a4);
  }

  return v9;
}

- (id)resultUsingContextualizerInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double prebuiltIntentThreshold;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dialogAct");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[UPContextualizerStrategyOptions resultUsingContextualizerInput:]", "UPContextualizerStrategyOptions.m", 45, "[contextualizerInput.dialogAct isKindOfClass:[UPDialogActOptions class]]");

  objc_msgSend(v4, "dialogAct");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  prebuiltIntentThreshold = self->_prebuiltIntentThreshold;
  v32[0] = CFSTR("selectOrdinal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[UPContextualizerUtilities hasTopCandidate:excedingProbability:matchingOneOfIntents:](UPContextualizerUtilities, "hasTopCandidate:excedingProbability:matchingOneOfIntents:", v8, v10, prebuiltIntentThreshold);

  if (!v11)
    goto LABEL_6;
  SNLPOSLoggerForCategory(3);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v28) = 0;
    _os_log_impl(&dword_1C2196000, v12, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyOptions: Detected high-probability selectOrdinal intent in core result", (uint8_t *)&v28, 2u);
  }

  +[UPResult createResultFromExistingResult:truncatedTo:](UPResult, "createResultFromExistingResult:truncatedTo:", v8, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_6:
    objc_msgSend(v6, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domainResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[UPContextualizerUtilities filterResult:byEntityName:serializer:](UPContextualizerUtilities, "filterResult:byEntityName:serializer:", v15, v14, self->_usoSerializer);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "candidateCount");
    SNLPOSLoggerForCategory(3);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    if (v17 < 1)
    {
      if (v19)
      {
        v28 = 138412290;
        v29 = (uint64_t)v14;
        _os_log_impl(&dword_1C2196000, v18, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyOptions: No domain result matched dialog act prompted entity (%@)", (uint8_t *)&v28, 0xCu);
      }

      goto LABEL_14;
    }
    if (v19)
    {
      v28 = 134218242;
      v29 = v17;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_1C2196000, v18, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyOptions: %ld domain candidates matched dialog act prompted entity (%@)", (uint8_t *)&v28, 0x16u);
    }

    objc_msgSend(v6, "intent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[UPContextualizerUtilities resultFromResult:withNewIntent:](UPContextualizerUtilities, "resultFromResult:withNewIntent:", v16, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
LABEL_14:
      objc_msgSend(v6, "entityType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("string"));

      if (v22)
      {
        SNLPOSLoggerForCategory(3);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v28) = 0;
          _os_log_impl(&dword_1C2196000, v23, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyOptions: Building verbatim string payload", (uint8_t *)&v28, 2u);
        }

        objc_msgSend(v4, "modelIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "intent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "entityName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[UPContextualizerUtilities buildPayloadResultFromQuery:modelIdentifier:intent:entityName:serializer:](UPContextualizerUtilities, "buildPayloadResultFromQuery:modelIdentifier:intent:entityName:serializer:", v7, v24, v25, v26, self->_usoSerializer);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }
    }
  }

  return v13;
}

- (double)prebuiltIntentThreshold
{
  return self->_prebuiltIntentThreshold;
}

- (UPUsoSerializer)usoSerializer
{
  return self->_usoSerializer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoSerializer, 0);
}

@end
