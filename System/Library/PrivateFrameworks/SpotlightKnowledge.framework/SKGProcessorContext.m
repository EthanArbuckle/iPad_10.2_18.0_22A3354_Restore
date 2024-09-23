@implementation SKGProcessorContext

+ (id)sharedContext
{
  if (sharedContext_onceToken != -1)
    dispatch_once(&sharedContext_onceToken, &__block_literal_global_0);
  return (id)sharedContext_sSharedContext;
}

void __36__SKGProcessorContext_sharedContext__block_invoke()
{
  SKGProcessorContext *v0;
  void *v1;

  v0 = objc_alloc_init(SKGProcessorContext);
  v1 = (void *)sharedContext_sSharedContext;
  sharedContext_sSharedContext = (uint64_t)v0;

}

- (void)commonInitWithResourcePath:(id)a3 bundleIdentifier:(id)a4
{
  NSString *v6;
  NSString *spotlightResourcesRoot;
  id v8;

  v6 = (NSString *)a3;
  objc_storeStrong((id *)&self->_bundleIdentifier, a4);
  v8 = a4;
  spotlightResourcesRoot = self->_spotlightResourcesRoot;
  self->_spotlightResourcesRoot = v6;

}

- (SKGProcessorContext)init
{
  SKGProcessorContext *v2;
  SKGProcessorContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKGProcessorContext;
  v2 = -[SKGProcessorContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKGProcessorContext commonInitWithResourcePath:bundleIdentifier:](v2, "commonInitWithResourcePath:bundleIdentifier:", 0, CFSTR("com.apple.spotlight.contacts"));
  return v3;
}

- (SKGProcessorContext)initWithResourceDirectoryPath:(id)a3 preferredLanguages:(id)a4 locale:(id)a5
{
  id v6;
  SKGProcessorContext *v7;
  SKGProcessorContext *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKGProcessorContext;
  v7 = -[SKGProcessorContext init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[SKGProcessorContext commonInitWithResourcePath:bundleIdentifier:](v7, "commonInitWithResourcePath:bundleIdentifier:", v6, CFSTR("com.apple.cslinguistics"));

  return v8;
}

- (NSString)corespotlightResourcesRootPath
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@"), v3, CFSTR("Library/Spotlight"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)corespotlightResourcesPath
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SKGProcessorContext corespotlightResourcesRootPath](self, "corespotlightResourcesRootPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/CoreSpotlight"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)spotlightResourcesRootPath
{
  NSString *spotlightResourcesRoot;

  spotlightResourcesRoot = self->_spotlightResourcesRoot;
  if (spotlightResourcesRoot)
    return spotlightResourcesRoot;
  -[SKGProcessorContext corespotlightResourcesPath](self, "corespotlightResourcesPath");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)enablePeople
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableKeyphrases
{
  return 1;
}

- (BOOL)enableEmbeddings
{
  if (enableEmbeddings_onceEmbEnabledToken != -1)
    dispatch_once(&enableEmbeddings_onceEmbEnabledToken, &__block_literal_global_27);
  return enableEmbeddings_sEmbeddingsEnabled;
}

void __39__SKGProcessorContext_enableEmbeddings__block_invoke()
{
  void *v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEB00C0], "sharedInstance");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    enableEmbeddings_sEmbeddingsEnabled = objc_msgSend(v0, "deviceSupportsEmbedding");

    if (enableEmbeddings_sEmbeddingsEnabled)
      return;
  }
  else
  {
    enableEmbeddings_sEmbeddingsEnabled = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = 11;
    _os_log_impl(&dword_247964000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "SKGTask: %d disabled", (uint8_t *)v1, 8u);
  }
}

- (id)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)knowledgeVersion
{
  return 2;
}

- (int64_t)embeddingVersion
{
  return 3;
}

- (int64_t)embeddingModelVersion
{
  return objc_msgSend(MEMORY[0x24BEB00C0], "version");
}

- (int64_t)keyphraseVersion
{
  return 12;
}

- (int64_t)releaseVersion
{
  return 2;
}

- (int64_t)textVersion
{
  return 2;
}

- (int64_t)graphVersion
{
  return 26;
}

- (int64_t)maxGraphSize
{
  return 1000000000;
}

- (int64_t)maxArchiveSize
{
  return 1000000000;
}

- (int64_t)maxJournalSize
{
  return 1000000000;
}

- (id)fetchAttributes
{
  return &unk_251904D68;
}

- (id)excludeBundles
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", CFSTR("com.apple.spotlight.contacts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKGProcessorContext bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(v3, "addObject:", CFSTR("com.apple.searchd"));
  objc_msgSend(v3, "addObject:", CFSTR("com.apple.suggestd"));
  objc_msgSend(v3, "addObject:", CFSTR("com.apple.cslinguistics"));
  objc_msgSend(v3, "addObject:", CFSTR("com.apple.corespotlight.InternalTestsHost"));
  objc_msgSend(v3, "addObject:", CFSTR("com.apple.corespotlight.TestsHost"));
  objc_msgSend(v3, "addObject:", CFSTR("com.apple.pommesctl"));
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)embeddingFetchAttributes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SKGProcessorContext_embeddingFetchAttributes__block_invoke;
  block[3] = &unk_2518FF8B0;
  block[4] = self;
  if (embeddingFetchAttributes_onceToken != -1)
    dispatch_once(&embeddingFetchAttributes_onceToken, block);
  return (id)embeddingFetchAttributes_gAllEmbeddingAttrs;
}

void __47__SKGProcessorContext_embeddingFetchAttributes__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "fetchAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "embeddingExtractionAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)embeddingFetchAttributes_gAllEmbeddingAttrs;
  embeddingFetchAttributes_gAllEmbeddingAttrs = v3;

}

- (id)embeddingExtractionAttributes
{
  return &unk_251904D80;
}

- (id)embeddingExcludeBundles
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SKGProcessorContext_embeddingExcludeBundles__block_invoke;
  block[3] = &unk_2518FF8B0;
  block[4] = self;
  if (embeddingExcludeBundles_onceEmbExcludeToken != -1)
    dispatch_once(&embeddingExcludeBundles_onceEmbExcludeToken, block);
  return (id)embeddingExcludeBundles_gEmbeddingExcludeBundles;
}

void __46__SKGProcessorContext_embeddingExcludeBundles__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "excludeBundles");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", &unk_251904D98);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)embeddingExcludeBundles_gEmbeddingExcludeBundles;
  embeddingExcludeBundles_gEmbeddingExcludeBundles = v1;

}

- (id)keyphraseExtractionAttributes
{
  return &unk_251904DB0;
}

- (id)keyphraseFetchAttributes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SKGProcessorContext_keyphraseFetchAttributes__block_invoke;
  block[3] = &unk_2518FF8B0;
  block[4] = self;
  if (keyphraseFetchAttributes_onceToken != -1)
    dispatch_once(&keyphraseFetchAttributes_onceToken, block);
  return (id)keyphraseFetchAttributes_gAllKeyphraseAttrs;
}

void __47__SKGProcessorContext_keyphraseFetchAttributes__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "fetchAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyphraseExtractionAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)keyphraseFetchAttributes_gAllKeyphraseAttrs;
  keyphraseFetchAttributes_gAllKeyphraseAttrs = v3;

}

- (id)keyphraseExcludeBundles
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SKGProcessorContext_keyphraseExcludeBundles__block_invoke;
  block[3] = &unk_2518FF8B0;
  block[4] = self;
  if (keyphraseExcludeBundles_onceToken != -1)
    dispatch_once(&keyphraseExcludeBundles_onceToken, block);
  return (id)keyphraseExcludeBundles_gKeyphraseExcludeBundles;
}

void __46__SKGProcessorContext_keyphraseExcludeBundles__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "excludeBundles");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", &unk_251904DC8);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)keyphraseExcludeBundles_gKeyphraseExcludeBundles;
  keyphraseExcludeBundles_gKeyphraseExcludeBundles = v1;

}

- (id)peopleExtractionAttributes
{
  return &unk_251904DE0;
}

- (id)peopleFetchAttributes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SKGProcessorContext_peopleFetchAttributes__block_invoke;
  block[3] = &unk_2518FF8B0;
  block[4] = self;
  if (peopleFetchAttributes_onceToken != -1)
    dispatch_once(&peopleFetchAttributes_onceToken, block);
  return (id)peopleFetchAttributes_gAllPeopleAttrs;
}

void __44__SKGProcessorContext_peopleFetchAttributes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "fetchAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "peopleExtractionAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)peopleFetchAttributes_gAllPeopleAttrs;
  peopleFetchAttributes_gAllPeopleAttrs = v4;

  objc_msgSend((id)peopleFetchAttributes_gAllPeopleAttrs, "arrayByAddingObjectsFromArray:", &unk_251904DF8);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)peopleFetchAttributes_gAllPeopleAttrs;
  peopleFetchAttributes_gAllPeopleAttrs = v6;

}

- (id)peoplePreferredBundles
{
  return &unk_251904E10;
}

- (void)setMaxGraphSize:(int64_t)a3
{
  self->_maxGraphSize = a3;
}

- (void)setMaxArchiveSize:(int64_t)a3
{
  self->_maxArchiveSize = a3;
}

- (void)setMaxJournalSize:(int64_t)a3
{
  self->_maxJournalSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightResourcesRoot, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
