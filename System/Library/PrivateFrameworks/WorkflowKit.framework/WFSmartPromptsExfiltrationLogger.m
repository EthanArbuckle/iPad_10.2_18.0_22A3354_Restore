@implementation WFSmartPromptsExfiltrationLogger

- (WFSmartPromptsExfiltrationLogger)init
{
  WFSmartPromptsExfiltrationLogger *v2;
  uint64_t v3;
  NSMutableDictionary *store;
  WFSmartPromptsExfiltrationLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSmartPromptsExfiltrationLogger;
  v2 = -[WFSmartPromptsExfiltrationLogger init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    store = v2->_store;
    v2->_store = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)logExfiltratedItemsCount:(unint64_t)a3 actionUUID:(id)a4 contentOrigin:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v9 = a5;
  if (v17)
  {
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSmartPromptsExfiltrationLogger.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionUUID"));

    if (!a3)
      goto LABEL_7;
  }
  if (v9)
  {
    -[WFSmartPromptsExfiltrationLogger store](self, "store");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13 + a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v14, v9);

    -[WFSmartPromptsExfiltrationLogger store](self, "store");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v11, v17);

  }
LABEL_7:

}

- (unint64_t)currentExfiltratedItemCountForActionUUID:(id)a3 contentOrigin:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v6 = a4;
  v7 = a3;
  -[WFSmartPromptsExfiltrationLogger store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  return v11;
}

- (id)attributionSetByRewritingSetWithLoggedCounts:(id)a3 forExfiltratingActionUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  WFSmartPromptsExfiltrationLogger *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "attributions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __107__WFSmartPromptsExfiltrationLogger_attributionSetByRewritingSetWithLoggedCounts_forExfiltratingActionUUID___block_invoke;
    v15 = &unk_1E7AFA5F8;
    v16 = self;
    v17 = v7;
    objc_msgSend(v8, "if_map:", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D13EA0], "attributionSetWithAttributions:shouldReduceAttributions:", v9, 0, v12, v13, v14, v15, v16);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (NSMutableDictionary)store
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

id __107__WFSmartPromptsExfiltrationLogger_attributionSetByRewritingSetWithLoggedCounts_forExfiltratingActionUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "currentExfiltratedItemCountForActionUUID:contentOrigin:", v3, v5);

  objc_msgSend(v4, "attributionByUpdatingItemsCount:", objc_msgSend(v4, "count") + v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
