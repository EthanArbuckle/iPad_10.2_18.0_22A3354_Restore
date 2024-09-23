@implementation PESCAPReviewManager

- (PESCAPReviewManager)init
{
  PESCAPReviewManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *assetsMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PESCAPReviewManager;
  v2 = -[PESCAPReviewManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetsMap = v2->_assetsMap;
    v2->_assetsMap = v3;

  }
  return v2;
}

- (void)registerPayload:(id)a3 forAsset:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *assetsMap;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "originalFilename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilename:", v7);

  }
  assetsMap = self->_assetsMap;
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](assetsMap, "setObject:forKeyedSubscript:", v10, v9);

}

- (id)payloadForAsset:(id)a3
{
  NSMutableDictionary *assetsMap;
  void *v4;
  void *v5;

  assetsMap = self->_assetsMap;
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](assetsMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)clearAll
{
  NSMutableDictionary *v3;
  NSMutableDictionary *assetsMap;

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  assetsMap = self->_assetsMap;
  self->_assetsMap = v3;

}

- (id)lastPasteBreadcrumb
{
  id v3;
  NSMutableDictionary *assetsMap;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  assetsMap = self->_assetsMap;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__PESCAPReviewManager_lastPasteBreadcrumb__block_invoke;
  v7[3] = &unk_24C618700;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](assetsMap, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsMap, 0);
}

void __42__PESCAPReviewManager_lastPasteBreadcrumb__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  unint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v5 = a3;
  objc_msgSend(v5, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "filename");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v16;
  }
  v8 = v7;

  v9 = *(void **)(a1 + 32);
  v10 = objc_msgSend(v5, "actionType");
  v11 = CFSTR("Smart C&P");
  if (!v10)
    v11 = CFSTR("Legacy C&P");
  v12 = v11;
  v13 = objc_msgSend(v5, "reason") - 1;
  if (v13 > 6)
    v14 = CFSTR("Unknown");
  else
    v14 = off_24C618720[v13];
  objc_msgSend(v5, "score");
  objc_msgSend(v9, "appendFormat:", CFSTR("%@ - %@ - %@ (%f)\n"), v8, v12, v14, v15);

}

+ (PESCAPReviewManager)sharedReviewManager
{
  if (sharedReviewManager_onceToken != -1)
    dispatch_once(&sharedReviewManager_onceToken, &__block_literal_global_927);
  return (PESCAPReviewManager *)(id)sharedReviewManager_reviewManager;
}

void __42__PESCAPReviewManager_sharedReviewManager__block_invoke()
{
  PESCAPReviewManager *v0;
  void *v1;

  v0 = objc_alloc_init(PESCAPReviewManager);
  v1 = (void *)sharedReviewManager_reviewManager;
  sharedReviewManager_reviewManager = (uint64_t)v0;

}

@end
