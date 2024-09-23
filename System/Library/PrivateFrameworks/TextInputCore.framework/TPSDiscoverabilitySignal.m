@implementation TPSDiscoverabilitySignal

- (TPSDiscoverabilitySignal)initWithIdentifier:(id)a3
{
  return -[TPSDiscoverabilitySignal initWithIdentifier:bundleIdentifier:context:](self, "initWithIdentifier:bundleIdentifier:context:", a3, 0, 0);
}

- (TPSDiscoverabilitySignal)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  TPSDiscoverabilitySignal *v12;
  TPSDiscoverabilitySignal *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPSDiscoverabilitySignal;
  v12 = -[TPSDiscoverabilitySignal init](&v15, sel_init);
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
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  Class (*v37)(uint64_t);
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v29 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSDiscoverabilitySignal identifier](self, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSDiscoverabilitySignal bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[TPSDiscoverabilitySignal context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v9 = (void *)get_DKSourceClass_softClass;
  v43 = get_DKSourceClass_softClass;
  v10 = MEMORY[0x1E0C809B0];
  if (!get_DKSourceClass_softClass)
  {
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __get_DKSourceClass_block_invoke;
    v38 = &unk_1EA107058;
    v39 = &v40;
    __get_DKSourceClass_block_invoke((uint64_t)&v35);
    v9 = (void *)v41[3];
  }
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v40, 8);
  v12 = (void *)objc_msgSend([v11 alloc], "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", 0, v6, 0, 0, 0, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  objc_msgSend((id)objc_opt_class(), "osBuild");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("_DKDiscoverabilitySignalsMetadataKey-osBuild"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("_DKDiscoverabilitySignalsMetadataKey-context"));
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v15 = (void *)get_DKEventClass_softClass;
  v43 = get_DKEventClass_softClass;
  if (!get_DKEventClass_softClass)
  {
    v35 = v10;
    v36 = 3221225472;
    v37 = __get_DKEventClass_block_invoke;
    v38 = &unk_1EA107058;
    v39 = &v40;
    __get_DKEventClass_block_invoke((uint64_t)&v35);
    v15 = (void *)v41[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v40, 8);
  -[TPSDiscoverabilitySignal _discoverabilitySignalsStream](self, "_discoverabilitySignalsStream");
  v17 = v10;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v16, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v18, v12, v28, v28, v27, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSDiscoverabilitySignal _knowledgeStore](self, "_knowledgeStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __55__TPSDiscoverabilitySignal_donateSignalWithCompletion___block_invoke;
  v30[3] = &unk_1EA0FFF90;
  v31 = v27;
  v32 = v6;
  v33 = v8;
  v34 = v29;
  v23 = v29;
  v24 = v8;
  v25 = v6;
  v26 = v27;
  objc_msgSend(v21, "saveObjects:responseQueue:withCompletion:", v22, 0, v30);

}

- (id)_knowledgeStore
{
  if (_knowledgeStore_onceToken != -1)
    dispatch_once(&_knowledgeStore_onceToken, &__block_literal_global_8322);
  return (id)_knowledgeStore_store;
}

- (id)_discoverabilitySignalsStream
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v2 = (void *)get_DKEventStreamClass_softClass;
  v17 = get_DKEventStreamClass_softClass;
  if (!get_DKEventStreamClass_softClass)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __get_DKEventStreamClass_block_invoke;
    v12 = &unk_1EA107058;
    v13 = &v14;
    __get_DKEventStreamClass_block_invoke((uint64_t)&v9);
    v2 = (void *)v15[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v14, 8);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v4 = (void *)get_DKAnyStringIdentifierClass_softClass;
  v17 = get_DKAnyStringIdentifierClass_softClass;
  if (!get_DKAnyStringIdentifierClass_softClass)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __get_DKAnyStringIdentifierClass_block_invoke;
    v12 = &unk_1EA107058;
    v13 = &v14;
    __get_DKAnyStringIdentifierClass_block_invoke((uint64_t)&v9);
    v4 = (void *)v15[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventStreamWithName:valueType:", CFSTR("/discoverability/signals"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

void __43__TPSDiscoverabilitySignal__knowledgeStore__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)get_DKKnowledgeStoreClass_softClass;
  v8 = get_DKKnowledgeStoreClass_softClass;
  if (!get_DKKnowledgeStoreClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __get_DKKnowledgeStoreClass_block_invoke;
    v4[3] = &unk_1EA107058;
    v4[4] = &v5;
    __get_DKKnowledgeStoreClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  objc_msgSend(v1, "knowledgeStore");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_knowledgeStore_store;
  _knowledgeStore_store = v2;

}

void __55__TPSDiscoverabilitySignal_donateSignalWithCompletion___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", a1[4], CFSTR("signalIdentifier"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", a1[5], CFSTR("sourceBundleIdentifier"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", a1[6], CFSTR("context"));
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v7 = (void *)get_CDContextualKeyPathClass_softClass;
    v23 = get_CDContextualKeyPathClass_softClass;
    if (!get_CDContextualKeyPathClass_softClass)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __get_CDContextualKeyPathClass_block_invoke;
      v18 = &unk_1EA107058;
      v19 = &v20;
      __get_CDContextualKeyPathClass_block_invoke((uint64_t)&v15);
      v7 = (void *)v21[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v20, 8);
    objc_msgSend(v8, "keyPathWithKey:", CFSTR("/discoverability/signals/dataDictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v10 = (void *)get_CDClientContextClass_softClass;
    v23 = get_CDClientContextClass_softClass;
    if (!get_CDClientContextClass_softClass)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __get_CDClientContextClass_block_invoke;
      v18 = &unk_1EA107058;
      v19 = &v20;
      __get_CDClientContextClass_block_invoke((uint64_t)&v15);
      v10 = (void *)v21[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v20, 8);
    objc_msgSend(v11, "userContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, v9);

  }
  v13 = a1[7];
  if (v13)
  {
    if (a2)
      v14 = 0;
    else
      v14 = v5;
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v14);
  }

}

+ (id)osBuild
{
  if (osBuild_onceToken != -1)
    dispatch_once(&osBuild_onceToken, &__block_literal_global_18);
  return (id)osBuild_gOSBuild;
}

void __35__TPSDiscoverabilitySignal_osBuild__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = MGCopyAnswer();
  v2 = (id)v0;
  if (v0)
  {
    objc_msgSend(CFSTR("iOS-"), "stringByAppendingString:", v0);
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)osBuild_gOSBuild;
  osBuild_gOSBuild = v0;

}

@end
