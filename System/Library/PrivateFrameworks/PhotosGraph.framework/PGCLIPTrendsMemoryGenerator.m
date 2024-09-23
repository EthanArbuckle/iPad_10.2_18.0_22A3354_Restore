@implementation PGCLIPTrendsMemoryGenerator

- (PGCLIPTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4
{
  PGCLIPTrendsMemoryGenerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGCLIPTrendsMemoryGenerator;
  v4 = -[PGTrendsMemoryGenerator initWithMemoryGenerationContext:configurations:](&v6, sel_initWithMemoryGenerationContext_configurations_, a3, a4);
  if (v4)
    v4->_minimumSceneAnalysisVersion = objc_msgSend(MEMORY[0x1E0D781F8], "latestVersion");
  return v4;
}

- (unint64_t)minimumSceneAnalysisVersion
{
  return self->_minimumSceneAnalysisVersion;
}

- (void)setMinimumSceneAnalysisVersion:(unint64_t)a3
{
  self->_minimumSceneAnalysisVersion = a3;
}

+ (id)_CLIPTrends
{
  PGRemoteConfiguration *v2;
  void *v3;
  id v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PGRemoteConfiguration);
  -[PGRemoteConfiguration dictionaryValueForKey:withFallbackValue:](v2, "dictionaryValueForKey:withFallbackValue:", CFSTR("com.apple.photos.memories.trendsmemory.CLIPTrendsQueries"), MEMORY[0x1E0C9AA70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = CFSTR("com.apple.photos.memories.trendsmemory.CLIPTrendsQueries");
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Couldn't load remotely configured CLIP Trends dictionary from Trial factor %@", (uint8_t *)&v6, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)CLIPTrendsConfigurations
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(a1, "_CLIPTrends");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__PGCLIPTrendsMemoryGenerator_CLIPTrendsConfigurations__block_invoke;
    v6[3] = &unk_1E8428998;
    v8 = 0x3FF0000000000000;
    v4 = v3;
    v7 = v4;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
  else
  {
    v4 = (id)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

void __55__PGCLIPTrendsMemoryGenerator_CLIPTrendsConfigurations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  PGDictionaryConfigurationSource *v5;
  PGCLIPTrendsConfiguration *v6;
  void *v7;
  PGCLIPTrendsConfiguration *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PGDictionaryConfigurationSource initWithDictionary:]([PGDictionaryConfigurationSource alloc], "initWithDictionary:", v4);

  v6 = [PGCLIPTrendsConfiguration alloc];
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PGConfiguration initWithSources:version:](v6, "initWithSources:version:", v7, *(double *)(a1 + 40));

  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

@end
