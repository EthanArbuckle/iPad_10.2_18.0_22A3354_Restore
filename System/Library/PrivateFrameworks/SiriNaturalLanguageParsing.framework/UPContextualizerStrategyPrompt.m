@implementation UPContextualizerStrategyPrompt

- (UPContextualizerStrategyPrompt)initWithPrebuiltIntentThreshold:(double)a3 usoSerializer:(id)a4
{
  id v7;
  UPContextualizerStrategyPrompt *v8;
  UPContextualizerStrategyPrompt *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UPContextualizerStrategyPrompt;
  v8 = -[UPContextualizerStrategyPrompt init](&v11, sel_init);
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
  uint64_t v6;
  void *v7;
  uint64_t v8;
  UPContextualizerInput *v9;
  void *v10;
  void *v11;
  void *v12;
  UPContextualizerInput *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  UPContextualizerStrategyPrompt *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dialogAct");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[UPContextualizerStrategyPrompt resultUsingContextualizerInput:]", "UPContextualizerStrategyPrompt.m", 45, "[dialogAct isKindOfClass:[UPDialogActPrompt class]]");
  objc_msgSend(v5, "reference");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v6;
  +[UPContextualizerUtilities createConfirmOrRejectedDialogActsFor:reference:](UPContextualizerUtilities, "createConfirmOrRejectedDialogActsFor:reference:", v7, v6);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = [UPContextualizerInput alloc];
  objc_msgSend(v4, "domainResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v8;
  v34 = v5;
  v13 = -[UPContextualizerInput initWithDomainResult:coreResult:modelIdentifier:query:dialogAct:](v9, "initWithDomainResult:coreResult:modelIdentifier:query:dialogAct:", v10, v8, v11, v12, v5);

  -[UPContextualizerInput dialogAct](v13, "dialogAct");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPContextualizerInput query](v13, "query");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPContextualizerInput domainResult](v13, "domainResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = self;
  +[UPContextualizerUtilities filterResult:byEntityName:serializer:](UPContextualizerUtilities, "filterResult:byEntityName:serializer:", v17, v16, self->_usoSerializer);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "candidateCount");
  SNLPOSLoggerForCategory(3);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19 < 1)
  {
    if (v21)
    {
      *(_DWORD *)buf = 138412290;
      v37 = (uint64_t)v16;
      _os_log_impl(&dword_1C2196000, v20, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyPrompt: No domain result matched dialog act prompted entity (%@)", buf, 0xCu);
    }

    v24 = v33;
    goto LABEL_10;
  }
  if (v21)
  {
    *(_DWORD *)buf = 134218242;
    v37 = v19;
    v38 = 2112;
    v39 = v16;
    _os_log_impl(&dword_1C2196000, v20, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyPrompt; %ld domain candidates matched dialog act prompted entity (%@)",
      buf,
      0x16u);
  }

  objc_msgSend(v14, "intent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[UPContextualizerUtilities resultFromResult:withNewIntent:](UPContextualizerUtilities, "resultFromResult:withNewIntent:", v18, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v33;
  if (!v23)
  {
LABEL_10:
    objc_msgSend(v14, "entityType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("string"));

    if (v26)
    {
      SNLPOSLoggerForCategory(3);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2196000, v27, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyPrompt: Building verbatim string payload", buf, 2u);
      }

      -[UPContextualizerInput modelIdentifier](v13, "modelIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "intent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "entityName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[UPContextualizerUtilities buildPayloadResultFromQuery:modelIdentifier:intent:entityName:serializer:](UPContextualizerUtilities, "buildPayloadResultFromQuery:modelIdentifier:intent:entityName:serializer:", v15, v28, v29, v30, v32->_usoSerializer);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
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
