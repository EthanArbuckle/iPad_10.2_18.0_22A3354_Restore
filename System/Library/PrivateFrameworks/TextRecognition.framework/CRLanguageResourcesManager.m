@implementation CRLanguageResourcesManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CRLanguageResourcesManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0B4870 != -1)
    dispatch_once(&qword_1ED0B4870, block);
  return (id)_MergedGlobals_35;
}

void __43__CRLanguageResourcesManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithType:", 0);
  v2 = (void *)_MergedGlobals_35;
  _MergedGlobals_35 = v1;

}

+ (id)postProcessManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CRLanguageResourcesManager_postProcessManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0B4880 != -1)
    dispatch_once(&qword_1ED0B4880, block);
  return (id)qword_1ED0B4878;
}

void __48__CRLanguageResourcesManager_postProcessManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithType:", 1);
  v2 = (void *)qword_1ED0B4878;
  qword_1ED0B4878 = v1;

}

+ (id)lineWrappingManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CRLanguageResourcesManager_lineWrappingManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0B4890 != -1)
    dispatch_once(&qword_1ED0B4890, block);
  return (id)qword_1ED0B4888;
}

void __49__CRLanguageResourcesManager_lineWrappingManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithType:", 2);
  v2 = (void *)qword_1ED0B4888;
  qword_1ED0B4888 = v1;

}

- (CRLanguageResourcesManager)initWithType:(int64_t)a3
{
  CRLanguageResourcesManager *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLanguageResourcesManager;
  v4 = -[CRLanguageResourcesManager init](&v7, sel_init);
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    -[CRLanguageResourcesManager setLanguageResourceStacks:](v4, "setLanguageResourceStacks:", v5);

    -[CRLanguageResourcesManager setResourceType:](v4, "setResourceType:", a3);
  }
  return v4;
}

- (void)addSubscriber:(id)a3 forLocale:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CRLanguageResourcesStack *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = -[CRLanguageResourcesStack initWithLocaleIdentifier:resourceType:]([CRLanguageResourcesStack alloc], "initWithLocaleIdentifier:resourceType:", v6, -[CRLanguageResourcesManager resourceType](self, "resourceType"));
    -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v6);

  }
  -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubscriber:", v14);

  objc_sync_exit(v7);
}

- (void)removeSubscriber:(id)a3 forLocale:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeSubscriber:", v16);

    -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "subscriberCount");

    if (!v14)
    {
      -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForKey:", v6);

    }
  }
  objc_sync_exit(v7);

}

- (void)subscriber:(id)a3 willDeactivateForLocale:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deactivateSubscriber:", v12);

  }
  objc_sync_exit(v7);

}

- (BOOL)lockResourcesForLocale:(id)a3 sender:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  -[CRLanguageResourcesManager languageResourceStacks](self, "languageResourceStacks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v11);
  if (v13 && (objc_msgSend(v13, "hasSubscriber:", v9) & 1) != 0)
  {
    objc_msgSend(v13, "popResourceForSubscriber:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;
    if (v14)
    {
      v10[2](v10, v14);
      objc_msgSend(v13, "pushResource:", v14);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSMutableDictionary)languageResourceStacks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLanguageResourceStacks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(int64_t)a3
{
  self->_resourceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageResourceStacks, 0);
}

@end
