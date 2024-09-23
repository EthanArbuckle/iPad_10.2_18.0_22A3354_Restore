@implementation WFSharedLinkMetadataProvider

- (WFSharedLinkMetadataProvider)init
{
  WFSharedLinkMetadataProvider *v2;
  uint64_t v3;
  LNMetadataProvider *metadataProvider;
  uint64_t v5;
  NSMutableDictionary *lock_cachedExamplePhrases;
  void *v7;
  WFSharedLinkMetadataProvider *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFSharedLinkMetadataProvider;
  v2 = -[WFSharedLinkMetadataProvider init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D44208]), "initWithOptions:", 0);
    metadataProvider = v2->_metadataProvider;
    v2->_metadataProvider = (LNMetadataProvider *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = objc_opt_new();
    lock_cachedExamplePhrases = v2->_lock_cachedExamplePhrases;
    v2->_lock_cachedExamplePhrases = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_handleLinkMetadataDidChangeNotification_, *MEMORY[0x1E0D44080], 0);
    v8 = v2;

  }
  return v2;
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 useCache:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD);
  id v12;
  void *v13;
  void *v14;
  _QWORD aBlock[5];

  v8 = a3;
  if (a4)
  {
    os_unfair_lock_lock(&self->_lock);
    -[WFSharedLinkMetadataProvider lock_cachedExamplePhrases](self, "lock_cachedExamplePhrases");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__WFSharedLinkMetadataProvider_examplePhrasesForBundleIdentifier_useCache_error___block_invoke;
    aBlock[3] = &unk_1E5FC7288;
    aBlock[4] = self;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      -[WFSharedLinkMetadataProvider metadataProvider](self, "metadataProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "examplePhrasesForBundleIdentifier:error:", v8, a5);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[WFSharedLinkMetadataProvider lock_cachedExamplePhrases](self, "lock_cachedExamplePhrases");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v12, v8);

      }
    }
    v11[2](v11);

  }
  else
  {
    -[WFSharedLinkMetadataProvider metadataProvider](self, "metadataProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "examplePhrasesForBundleIdentifier:error:", v8, a5);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)handleLinkMetadataDidChangeNotification:(id)a3
{
  NSObject *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *lock_cachedExamplePhrases;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFAppIntentsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[WFSharedLinkMetadataProvider handleLinkMetadataDidChangeNotification:]";
    _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_INFO, "%s Received Link metadata did change notification, invalidating cached example phrases", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  v5 = (NSMutableDictionary *)objc_opt_new();
  lock_cachedExamplePhrases = self->_lock_cachedExamplePhrases;
  self->_lock_cachedExamplePhrases = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (LNMetadataProvider)metadataProvider
{
  return self->_metadataProvider;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableDictionary)lock_cachedExamplePhrases
{
  return self->_lock_cachedExamplePhrases;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_cachedExamplePhrases, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
}

void __81__WFSharedLinkMetadataProvider_examplePhrasesForBundleIdentifier_useCache_error___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_8379);
  return (id)sharedProvider_provider;
}

void __46__WFSharedLinkMetadataProvider_sharedProvider__block_invoke()
{
  WFSharedLinkMetadataProvider *v0;
  void *v1;

  v0 = objc_alloc_init(WFSharedLinkMetadataProvider);
  v1 = (void *)sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v0;

}

@end
