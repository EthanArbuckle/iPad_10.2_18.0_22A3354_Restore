@implementation _PS_TPSDiscoverabilitySignal

- (_PS_TPSDiscoverabilitySignal)initWithIdentifier:(id)a3
{
  return -[_PS_TPSDiscoverabilitySignal initWithIdentifier:bundleIdentifier:context:](self, "initWithIdentifier:bundleIdentifier:context:", a3, 0, 0);
}

- (_PS_TPSDiscoverabilitySignal)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  _PS_TPSDiscoverabilitySignal *v12;
  _PS_TPSDiscoverabilitySignal *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PS_TPSDiscoverabilitySignal;
  v12 = -[_PS_TPSDiscoverabilitySignal init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v13->_context, a5);
  }

  return v13;
}

- (void)donateSignalWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PS_TPSDiscoverabilitySignal identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PS_TPSDiscoverabilitySignal bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[_PS_TPSDiscoverabilitySignal context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D15AF0]), "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", 0, v8, 0, 0, 0, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  objc_msgSend(MEMORY[0x1E0D159F0], "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  v13 = (void *)MEMORY[0x1E0D159F8];
  objc_msgSend(MEMORY[0x1E0D15AF8], "discoverabilitySignalsStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v13, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v14, v23, v24, v24, v5, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PS_TPSDiscoverabilitySignal _knowledgeStore](self, "_knowledgeStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __59___PS_TPSDiscoverabilitySignal_donateSignalWithCompletion___block_invoke_2;
  v25[3] = &unk_1E4401E98;
  v26 = v5;
  v27 = v8;
  v28 = v10;
  v29 = v4;
  v19 = v4;
  v20 = v10;
  v21 = v8;
  v22 = v5;
  objc_msgSend(v17, "saveObjects:tracker:responseQueue:withCompletion:", v18, &__block_literal_global_40, 0, v25);

}

- (id)_knowledgeStore
{
  if (_knowledgeStore_onceToken != -1)
    dispatch_once(&_knowledgeStore_onceToken, &__block_literal_global_19);
  return (id)_knowledgeStore_store;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
