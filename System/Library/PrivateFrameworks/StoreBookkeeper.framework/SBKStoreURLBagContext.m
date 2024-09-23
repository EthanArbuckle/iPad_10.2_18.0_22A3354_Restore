@implementation SBKStoreURLBagContext

- (id)_initWithDomain:(id)a3 syncRequestURL:(id)a4 domainDisabled:(BOOL)a5
{
  id v9;
  id v10;
  SBKStoreURLBagContext *v11;
  SBKStoreURLBagContext *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBKStoreURLBagContext;
  v11 = -[SBKStoreURLBagContext init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_domain, a3);
    objc_storeStrong((id *)&v12->_syncRequestURL, a4);
    v12->_domainDisabled = a5;
  }

  return v12;
}

- (SBKStoreURLBagContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKStoreURLBagContext.m"), 194, CFSTR("Use +loadBagContextFromURLBag:domain:completionBlock:"));

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  SBKStoreURLBagContext *v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __36__SBKStoreURLBagContext_description__block_invoke;
  v11[3] = &unk_24E2A8000;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v4, "enumerateRequestURLBagKeysWithBlock:", v11);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)SBKStoreURLBagContext;
  -[SBKStoreURLBagContext description](&v10, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ domain=%@, enabled=%d, requestURLs = \n%@\n\n"), v7, self->_domain, !self->_domainDisabled, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SBKStoreURLBagContext)initWithBag:(id)a3 domain:(id)a4
{
  id v6;
  SBKStoreURLBagContext *v7;
  SBKStoreURLBagContext *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBKStoreURLBagContext;
  v7 = -[SBKStoreURLBagContext init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_domain, a4);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  id v16;
  SBKStoreURLBagContext *v17;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SBKStoreURLBagContext domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithDomain:syncRequestURL:domainDisabled:", v5, 0, -[SBKStoreURLBagContext domainDisabled](self, "domainDisabled"));

  v7 = (void *)objc_opt_class();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __38__SBKStoreURLBagContext_copyWithZone___block_invoke;
  v15 = &unk_24E2A8000;
  v8 = v6;
  v16 = v8;
  v17 = self;
  objc_msgSend(v7, "enumerateRequestURLBagKeysWithBlock:", &v12);
  -[SBKStoreURLBagContext pollingIntervalInSeconds](self, "pollingIntervalInSeconds", v12, v13, v14, v15);
  v8[2] = v9;
  v10 = v8;

  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  id v16;
  SBKStoreURLBagContext *v17;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SBKStoreURLBagContext domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithDomain:syncRequestURL:domainDisabled:", v5, 0, -[SBKStoreURLBagContext domainDisabled](self, "domainDisabled"));

  v7 = (void *)objc_opt_class();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __45__SBKStoreURLBagContext_mutableCopyWithZone___block_invoke;
  v15 = &unk_24E2A8000;
  v8 = v6;
  v16 = v8;
  v17 = self;
  objc_msgSend(v7, "enumerateRequestURLBagKeysWithBlock:", &v12);
  -[SBKStoreURLBagContext pollingIntervalInSeconds](self, "pollingIntervalInSeconds", v12, v13, v14, v15);
  v8[2] = v9;
  v10 = v8;

  return v10;
}

- (void)setPollingIntervalInSeconds:(double)a3
{
  if (fabs(a3) <= 0.00000011920929)
    a3 = 604800.0;
  self->_pollingIntervalInSeconds = a3;
}

- (double)pollingIntervalInSeconds
{
  double result;

  result = self->_pollingIntervalInSeconds;
  if (fabs(result) <= 0.00000011920929)
    return 604800.0;
  return result;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)syncRequestURL
{
  return self->_syncRequestURL;
}

- (void)setSyncRequestURL:(id)a3
{
  objc_storeStrong((id *)&self->_syncRequestURL, a3);
}

- (NSURL)pushKeyValueRequestURL
{
  return self->_pushKeyValueRequestURL;
}

- (void)setPushKeyValueRequestURL:(id)a3
{
  objc_storeStrong((id *)&self->_pushKeyValueRequestURL, a3);
}

- (NSURL)pullKeyValueRequestURL
{
  return self->_pullKeyValueRequestURL;
}

- (void)setPullKeyValueRequestURL:(id)a3
{
  objc_storeStrong((id *)&self->_pullKeyValueRequestURL, a3);
}

- (NSURL)pushAllKeyValueRequestURL
{
  return self->_pushAllKeyValueRequestURL;
}

- (void)setPushAllKeyValueRequestURL:(id)a3
{
  objc_storeStrong((id *)&self->_pushAllKeyValueRequestURL, a3);
}

- (NSURL)pullAllKeyValueRequestURL
{
  return self->_pullAllKeyValueRequestURL;
}

- (void)setPullAllKeyValueRequestURL:(id)a3
{
  objc_storeStrong((id *)&self->_pullAllKeyValueRequestURL, a3);
}

- (BOOL)domainDisabled
{
  return self->_domainDisabled;
}

- (void)setDomainDisabled:(BOOL)a3
{
  self->_domainDisabled = a3;
}

- (SSURLBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_pullAllKeyValueRequestURL, 0);
  objc_storeStrong((id *)&self->_pushAllKeyValueRequestURL, 0);
  objc_storeStrong((id *)&self->_pullKeyValueRequestURL, 0);
  objc_storeStrong((id *)&self->_pushKeyValueRequestURL, 0);
  objc_storeStrong((id *)&self->_syncRequestURL, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

void __45__SBKStoreURLBagContext_mutableCopyWithZone___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a3;
  objc_msgSend(v4, "valueForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, v5);

}

void __38__SBKStoreURLBagContext_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a3;
  objc_msgSend(v4, "valueForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, v5);

}

void __36__SBKStoreURLBagContext_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "valueForKey:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@(%@) = %@"), v7, v8, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v9);
}

+ (void)enumerateRequestURLBagKeysWithBlock:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__SBKStoreURLBagContext_enumerateRequestURLBagKeysWithBlock___block_invoke;
  v5[3] = &unk_24E2A7E00;
  v6 = v3;
  v4 = v3;
  objc_msgSend(&unk_24E2B00F0, "enumerateKeysAndObjectsUsingBlock:", v5);

}

+ (id)UPPDomainIdentifier
{
  return CFSTR("com.apple.upp");
}

+ (id)ExtrasDomainIdentifier
{
  return CFSTR("com.apple.upp-extras");
}

+ (void)_findFirstValueInBag:(id)a3 keyEnumerator:(id)a4 valueTransformer:(id)a5 defaultValue:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v13, "nextObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __106__SBKStoreURLBagContext__findFirstValueInBag_keyEnumerator_valueTransformer_defaultValue_completionBlock___block_invoke;
    v18[3] = &unk_24E2A7E28;
    v22 = v14;
    v23 = v16;
    v24 = a1;
    v19 = v12;
    v20 = v13;
    v21 = v15;
    objc_msgSend(v19, "loadValueForKey:completionBlock:", v17, v18);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v16 + 2))(v16, v15, 0);
  }

}

+ (void)loadBagContextFromURLBag:(id)a3 domain:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_group_t v11;
  dispatch_queue_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  NSObject *v42;
  NSObject *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  SBKStoreURLBagContext *v49;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__1149;
  v48[4] = __Block_byref_object_dispose__1150;
  v49 = -[SBKStoreURLBagContext initWithBag:domain:]([SBKStoreURLBagContext alloc], "initWithBag:domain:", v8, v9);
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__1149;
  v46[4] = __Block_byref_object_dispose__1150;
  v47 = 0;
  v11 = dispatch_group_create();
  v12 = dispatch_queue_create(0, 0);
  v13 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke;
  v41[3] = &unk_24E2A7EB8;
  v14 = v12;
  v42 = v14;
  v44 = v48;
  v45 = v46;
  v15 = v11;
  v43 = v15;
  v16 = (void *)MEMORY[0x2207AF7FC](v41);
  v36[0] = v13;
  v36[1] = 3221225472;
  v36[2] = __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_3;
  v36[3] = &unk_24E2A7F08;
  v17 = v15;
  v37 = v17;
  v40 = a1;
  v18 = v8;
  v38 = v18;
  v19 = v16;
  v39 = v19;
  v20 = (void *)MEMORY[0x2207AF7FC](v36);
  v21 = (void *)objc_opt_class();
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_8;
  v32[3] = &unk_24E2A7FB0;
  v22 = v20;
  v34 = v22;
  v35 = &__block_literal_global_39_1151;
  v23 = v9;
  v33 = v23;
  objc_msgSend(v21, "enumerateRequestURLBagKeysWithBlock:", v32);
  (*((void (**)(id, const __CFString *, _QWORD, void *, const __CFString *, id, _QWORD))v22 + 2))(v22, CFSTR("domainDisabled"), MEMORY[0x24BDBD1C0], &__block_literal_global_41, CFSTR("kvs-sync-disabled"), v23, 0);
  (*((void (**)(id, const __CFString *, void *, void *, const __CFString *, id, _QWORD))v22 + 2))(v22, CFSTR("pollingIntervalInSeconds"), &unk_24E2B0118, &__block_literal_global_43, CFSTR("kvs-sync-polling-interval-secs"), v23, 0);
  v24 = dispatch_queue_create(0, 0);
  v27[0] = v13;
  v27[1] = 3221225472;
  v27[2] = __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_53;
  v27[3] = &unk_24E2A7FD8;
  v30 = v46;
  v31 = v48;
  v28 = v17;
  v29 = v10;
  v25 = v10;
  v26 = v17;
  dispatch_async(v24, v27);

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);

}

void __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  __int128 v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_2;
  block[3] = &unk_24E2A7E90;
  v15 = v8;
  v16 = v7;
  v17 = v9;
  v18 = *(_OWORD *)(a1 + 48);
  v11 = v9;
  v12 = v7;
  v13 = v8;
  dispatch_sync(v10, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v13 = a2;
  v14 = a5;
  v15 = *(NSObject **)(a1 + 32);
  v16 = a7;
  v17 = a6;
  v18 = a4;
  v19 = a3;
  dispatch_group_enter(v15);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v14, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addObject:", v21);
  if (v22)
    objc_msgSend(v20, "addObject:", v22);
  objc_msgSend(v20, "addObject:", v14);
  v23 = *(void **)(a1 + 56);
  v24 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v20, "objectEnumerator");
  v28 = v14;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_4;
  v29[3] = &unk_24E2A7EE0;
  v26 = *(id *)(a1 + 48);
  v30 = v13;
  v31 = v26;
  v27 = v13;
  objc_msgSend(v23, "_findFirstValueInBag:keyEnumerator:valueTransformer:defaultValue:completionBlock:", v24, v25, v18, v19, v29);

}

uint64_t __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a3, 0, a1[6], a2, a1[4], 0);
}

uint64_t __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_53(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = (void *)MEMORY[0x24BDD16E0];
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0;
LABEL_5:

    v2 = (id)v5;
  }
  return v2;
}

id __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v2, "BOOLValue"));
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = 0;
LABEL_5:

    v2 = (id)v3;
  }
  return v2;
}

id __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_5:

    v2 = (id)v3;
    return v2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = 0;
    goto LABEL_5;
  }
  return v2;
}

uint64_t __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

void __73__SBKStoreURLBagContext_loadBagContextFromURLBag_domain_completionBlock___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setValue:forKey:", a1[4], a1[5]);
  v2 = (void *)a1[6];
  if (v2)
  {
    v3 = *(_QWORD *)(a1[8] + 8);
    v5 = *(_QWORD *)(v3 + 40);
    v4 = (id *)(v3 + 40);
    if (!v5)
      objc_storeStrong(v4, v2);
  }
}

void __106__SBKStoreURLBagContext__findFirstValueInBag_keyEnumerator_valueTransformer_defaultValue_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v9 = v6;
  if (v5
    && ((v7 = *(_QWORD *)(a1 + 56)) == 0
     || ((*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6),
         v8 = objc_claimAutoreleasedReturnValue(),
         v5,
         (v5 = (id)v8) != 0)))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 72), "_findFirstValueInBag:keyEnumerator:valueTransformer:defaultValue:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }

}

uint64_t __61__SBKStoreURLBagContext_enumerateRequestURLBagKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
