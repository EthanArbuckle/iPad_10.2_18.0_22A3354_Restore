@implementation CLSMeaningClue(Ingest)

- (uint64_t)numberOfAssets
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "extraParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4B0D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "unsignedIntegerValue");
  return v3;
}

- (uint64_t)numberOfHighConfidenceAssets
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "extraParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4B0E0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "unsignedIntegerValue");
  return v3;
}

- (uint64_t)numberOfSearchConfidenceAssets
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "extraParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4B0E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "unsignedIntegerValue");
  return v3;
}

- (uint64_t)numberOfDominantSceneAssets
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "extraParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4B0D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "unsignedIntegerValue");
  return v3;
}

- (uint64_t)isReliable
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "extraParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4B0C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "BOOLValue");
  return v3;
}

- (uint64_t)sceneIdentifier
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "extraParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4B0F0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "unsignedLongLongValue");
  return v3;
}

@end
