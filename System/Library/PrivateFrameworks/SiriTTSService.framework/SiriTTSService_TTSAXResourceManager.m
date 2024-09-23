@implementation SiriTTSService_TTSAXResourceManager

- (SiriTTSService_TTSAXResourceManager)init
{
  SiriTTSService_TTSAXResourceManager *v2;
  void *v3;
  objc_class *v4;
  TTSAXResourceManager *v5;
  TTSAXResourceManager *axManager;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)SiriTTSService_TTSAXResourceManager;
  v2 = -[SiriTTSService_TTSAXResourceManager init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getTTSAXResourceManagerClass_softClass;
    v13 = getTTSAXResourceManagerClass_softClass;
    if (!getTTSAXResourceManagerClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getTTSAXResourceManagerClass_block_invoke;
      v9[3] = &unk_1E3A16020;
      v9[4] = &v10;
      __getTTSAXResourceManagerClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (TTSAXResourceManager *)objc_alloc_init(v4);
    axManager = v2->_axManager;
    v2->_axManager = v5;

  }
  return v2;
}

- (NSArray)allCompactResources
{
  NSArray *allCompactResources;
  void *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  SiriTTSService_TTSAXResource *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  allCompactResources = self->_allCompactResources;
  if (allCompactResources)
    return allCompactResources;
  -[TTSAXResourceManager resourcesWithType:subType:](self->_axManager, "resourcesWithType:subType:", 4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v12, "isInstalled", (_QWORD)v20))
        {
          v13 = objc_alloc_init(SiriTTSService_TTSAXResource);
          objc_msgSend(v12, "primaryLanguage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SiriTTSService_TTSAXResource setLanguage:](v13, "setLanguage:", v14);

          objc_msgSend(v12, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SiriTTSService_TTSAXResource setName:](v13, "setName:", v15);

          objc_msgSend(v12, "contentPath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SiriTTSService_TTSAXResource setPath:](v13, "setPath:", v16);

          -[NSArray addObject:](v6, "addObject:", v13);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v17 = self->_allCompactResources;
  self->_allCompactResources = v6;
  v18 = v6;

  v19 = self->_allCompactResources;
  return v19;
}

- (void)setAllCompactResources:(id)a3
{
  objc_storeStrong((id *)&self->_allCompactResources, a3);
}

- (TTSAXResourceManager)axManager
{
  return self->_axManager;
}

- (void)setAxManager:(id)a3
{
  objc_storeStrong((id *)&self->_axManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axManager, 0);
  objc_storeStrong((id *)&self->_allCompactResources, 0);
}

+ (SiriTTSService_TTSAXResourceManager)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_679);
  return (SiriTTSService_TTSAXResourceManager *)(id)sharedInstance_instance;
}

@end
