@implementation UPContextualizer

- (UPContextualizer)initWithPrebuiltIntentThreshold:(double)a3
{
  UPContextualizer *v4;
  UPUsoSerializer *v5;
  UPContextualizerStrategyCancel *v6;
  UPContextualizerStrategyCancel *cancelContextualizerStrategy;
  UPContextualizerStrategyOffer *v8;
  UPContextualizerStrategyOffer *offerContextualizerStrategy;
  UPContextualizerStrategyOptions *v10;
  UPContextualizerStrategyOptions *optionsContextualizerStrategy;
  UPContextualizerStrategyPrompt *v12;
  UPContextualizerStrategyPrompt *promptContextualizerStrategy;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UPContextualizer;
  v4 = -[UPContextualizer init](&v15, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(UPUsoSerializer);
    v4->_prebuiltIntentThreshold = a3;
    v6 = -[UPContextualizerStrategyCancel initWithPrebuiltIntentThreshold:]([UPContextualizerStrategyCancel alloc], "initWithPrebuiltIntentThreshold:", v4->_prebuiltIntentThreshold);
    cancelContextualizerStrategy = v4->_cancelContextualizerStrategy;
    v4->_cancelContextualizerStrategy = v6;

    v8 = -[UPContextualizerStrategyOffer initWithPrebuiltIntentThreshold:]([UPContextualizerStrategyOffer alloc], "initWithPrebuiltIntentThreshold:", v4->_prebuiltIntentThreshold);
    offerContextualizerStrategy = v4->_offerContextualizerStrategy;
    v4->_offerContextualizerStrategy = v8;

    v10 = -[UPContextualizerStrategyOptions initWithPrebuiltIntentThreshold:usoSerializer:]([UPContextualizerStrategyOptions alloc], "initWithPrebuiltIntentThreshold:usoSerializer:", v5, v4->_prebuiltIntentThreshold);
    optionsContextualizerStrategy = v4->_optionsContextualizerStrategy;
    v4->_optionsContextualizerStrategy = v10;

    v12 = -[UPContextualizerStrategyPrompt initWithPrebuiltIntentThreshold:usoSerializer:]([UPContextualizerStrategyPrompt alloc], "initWithPrebuiltIntentThreshold:usoSerializer:", v5, v4->_prebuiltIntentThreshold);
    promptContextualizerStrategy = v4->_promptContextualizerStrategy;
    v4->_promptContextualizerStrategy = v12;

  }
  return v4;
}

- (UPContextualizer)init
{
  return -[UPContextualizer initWithPrebuiltIntentThreshold:](self, "initWithPrebuiltIntentThreshold:", 0.5);
}

- (id)resultWithContextualizerInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "coreResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "candidateCount");

  if (!v6
    || (-[UPContextualizerStrategyCancel resultUsingContextualizerInput:](self->_cancelContextualizerStrategy, "resultUsingContextualizerInput:", v4), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0)&& (-[UPContextualizer _contextualizeByDialogActTypeUsingContextualizerInput:](self, "_contextualizeByDialogActTypeUsingContextualizerInput:", v4), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v4, "domainResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_contextualizeByDialogActTypeUsingContextualizerInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UPContextualizerInput *v9;
  void *v10;
  void *v11;
  void *v12;
  UPContextualizerInput *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21[0] = objc_opt_class();
  v22[0] = self->_offerContextualizerStrategy;
  v21[1] = objc_opt_class();
  v22[1] = self->_optionsContextualizerStrategy;
  v21[2] = objc_opt_class();
  v22[2] = self->_promptContextualizerStrategy;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialogAct");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UPContextualizerUtilities createConfirmOrRejectedDialogActsFor:reference:](UPContextualizerUtilities, "createConfirmOrRejectedDialogActsFor:reference:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [UPContextualizerInput alloc];
  objc_msgSend(v4, "domainResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[UPContextualizerInput initWithDomainResult:coreResult:modelIdentifier:query:dialogAct:](v9, "initWithDomainResult:coreResult:modelIdentifier:query:dialogAct:", v10, v8, v11, v12, v6);
  objc_msgSend(v5, "objectForKey:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "resultUsingContextualizerInput:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SNLPOSLoggerForCategory(3);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = 138739971;
      v20 = v6;
      _os_log_impl(&dword_1C2196000, v17, OS_LOG_TYPE_ERROR, "Could not find contextualizer strategy for dialog act: %{sensitive}@", (uint8_t *)&v19, 0xCu);
    }

    v16 = 0;
  }

  return v16;
}

- (double)prebuiltIntentThreshold
{
  return self->_prebuiltIntentThreshold;
}

- (UPContextualizerStrategyCancel)cancelContextualizerStrategy
{
  return self->_cancelContextualizerStrategy;
}

- (UPContextualizerStrategyOffer)offerContextualizerStrategy
{
  return self->_offerContextualizerStrategy;
}

- (UPContextualizerStrategyOptions)optionsContextualizerStrategy
{
  return self->_optionsContextualizerStrategy;
}

- (UPContextualizerStrategyPrompt)promptContextualizerStrategy
{
  return self->_promptContextualizerStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptContextualizerStrategy, 0);
  objc_storeStrong((id *)&self->_optionsContextualizerStrategy, 0);
  objc_storeStrong((id *)&self->_offerContextualizerStrategy, 0);
  objc_storeStrong((id *)&self->_cancelContextualizerStrategy, 0);
}

@end
