@implementation TLKTrialManager

+ (id)sharedManager
{
  if (sharedManager_onceToken[0] != -1)
    dispatch_once(sharedManager_onceToken, &__block_literal_global_4);
  return (id)sharedManager_manager;
}

- (BOOL)snippetModernizationEnabled
{
  return self->_snippetModernizationEnabled;
}

- (int64_t)zkwOverrideValue
{
  return self->_zkwOverrideValue;
}

void __32__TLKTrialManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = v0;

}

- (void)refresh
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TRIExperimentIdentifiers *v8;
  TRIExperimentIdentifiers *experimentIdentifiers;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (!self->_client)
  {
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 333);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKTrialManager setClient:](self, "setClient:", v3);

    objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", 333);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKTrialManager setNamespace:](self, "setNamespace:", v4);

  }
  -[TLKTrialManager client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refresh");

  if (self->_experimentIdentifiers)
    NSLog(CFSTR("Has experiment in in progress"));
  -[TLKTrialManager client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", 333);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "experimentIdentifiersWithNamespaceName:", v7);
  v8 = (TRIExperimentIdentifiers *)objc_claimAutoreleasedReturnValue();
  experimentIdentifiers = self->_experimentIdentifiers;
  self->_experimentIdentifiers = v8;

  -[TLKTrialManager client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTrialManager namespace](self, "namespace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "levelForFactor:withNamespaceName:", CFSTR("SnippetModernization"), v11);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[TLKTrialManager client](self, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTrialManager namespace](self, "namespace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "levelForFactor:withNamespaceName:", CFSTR("BiggerSuggestionsLayout"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[TLKTrialManager client](self, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTrialManager namespace](self, "namespace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "levelForFactor:withNamespaceName:", CFSTR("ZKWExpansionOverride"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    -[TLKTrialManager setSnippetModernizationEnabled:](self, "setSnippetModernizationEnabled:", objc_msgSend(v18, "BOOLeanValue"));
  if (v14)
    -[TLKTrialManager setBiggerSuggestionsLayoutEnabled:](self, "setBiggerSuggestionsLayoutEnabled:", objc_msgSend(v14, "BOOLeanValue"));
  if (v17)
    -[TLKTrialManager setZkwOverrideValue:](self, "setZkwOverrideValue:", objc_msgSend(v17, "longValue"));

}

- (TRIClient)client
{
  return self->_client;
}

- (NSString)namespace
{
  return self->_namespace;
}

- (void)setNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_namespace, a3);
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (TLKTrialManager)init
{
  TLKTrialManager *v2;
  TLKTrialManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TLKTrialManager;
  v2 = -[TLKTrialManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TLKTrialManager setSnippetModernizationEnabled:](v2, "setSnippetModernizationEnabled:", 1);
    -[TLKTrialManager setBiggerSuggestionsLayoutEnabled:](v3, "setBiggerSuggestionsLayoutEnabled:", 1);
    -[TLKTrialManager setZkwOverrideValue:](v3, "setZkwOverrideValue:", 0);
  }
  return v3;
}

- (void)setZkwOverrideValue:(int64_t)a3
{
  self->_zkwOverrideValue = a3;
}

- (void)setSnippetModernizationEnabled:(BOOL)a3
{
  self->_snippetModernizationEnabled = a3;
}

- (void)setBiggerSuggestionsLayoutEnabled:(BOOL)a3
{
  self->_biggerSuggestionsLayoutEnabled = a3;
}

- (BOOL)biggerSuggestionsLayoutEnabled
{
  return self->_biggerSuggestionsLayoutEnabled;
}

- (TRIExperimentIdentifiers)experimentIdentifiers
{
  return self->_experimentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
}

@end
