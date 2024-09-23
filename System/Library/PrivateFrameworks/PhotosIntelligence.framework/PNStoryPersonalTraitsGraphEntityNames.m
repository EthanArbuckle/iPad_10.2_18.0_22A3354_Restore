@implementation PNStoryPersonalTraitsGraphEntityNames

- (PNStoryPersonalTraitsGraphEntityNames)init
{
  PNStoryPersonalTraitsGraphEntityNames *v2;
  uint64_t v3;
  NSDictionary *personalTraitEntityConfiguration;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PNStoryPersonalTraitsGraphEntityNames;
  v2 = -[PNStoryPersonalTraitsGraphEntityNames init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "_loadPersonalTraitEntityConfiguration");
    v3 = objc_claimAutoreleasedReturnValue();
    personalTraitEntityConfiguration = v2->_personalTraitEntityConfiguration;
    v2->_personalTraitEntityConfiguration = (NSDictionary *)v3;

  }
  return v2;
}

- (int64_t)configurationVersion
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_personalTraitEntityConfiguration, "objectForKeyedSubscript:", CFSTR("version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)sceneNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_personalTraitEntityConfiguration, "objectForKeyedSubscript:", CFSTR("scenes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v2, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dominantRequiredSceneNames
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  -[NSDictionary objectForKeyedSubscript:](self->_personalTraitEntityConfiguration, "objectForKeyedSubscript:", CFSTR("scenes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__PNStoryPersonalTraitsGraphEntityNames_dominantRequiredSceneNames__block_invoke;
  v6[3] = &unk_251480510;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);

  return v4;
}

- (id)meaningNames
{
  return -[NSDictionary objectForKeyedSubscript:](self->_personalTraitEntityConfiguration, "objectForKeyedSubscript:", CFSTR("meanings"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalTraitEntityConfiguration, 0);
}

void __67__PNStoryPersonalTraitsGraphEntityNames_dominantRequiredSceneNames__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isDominantRequired"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

+ (id)_loadPersonalTraitEntityConfiguration
{
  PNStoryRemoteConfiguration *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(PNStoryRemoteConfiguration);
  +[PNStoryRemoteConfiguration personalTraitsEntityConfiguration](PNStoryRemoteConfiguration, "personalTraitsEntityConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  -[PNStoryRemoteConfiguration fileURLForFactorKey:error:](v2, "fileURLForFactorKey:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;

  if (v4)
  {
    v9 = v5;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:error:", v4, &v9);
    v7 = v9;

    if (!v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = v7;
        _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[PNStoryPersonalTraitsGraphEntityNames] Couldn't load file (%@) from disk. error: %@", buf, 0x16u);
      }
      v6 = 0;
    }
    v5 = v7;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[PNStoryPersonalTraitsGraphEntityNames] Couldn't load file from remote configuration. error: %@", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

@end
