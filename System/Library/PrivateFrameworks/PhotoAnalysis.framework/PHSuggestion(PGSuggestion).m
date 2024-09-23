@implementation PHSuggestion(PGSuggestion)

- (id)keyAssets
{
  void *v2;
  void *v3;

  objc_getAssociatedObject(a1, "PHSuggestionPGSuggestionKeyAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", a1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchedObjects");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, "PHSuggestionPGSuggestionKeyAssets", v2, (void *)1);

  }
  return v2;
}

- (id)representativeAssets
{
  void *v2;
  void *v3;

  objc_getAssociatedObject(a1, "PHSuggestionPGSuggestionRepresentativeAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", a1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchedObjects");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, "PHSuggestionPGSuggestionRepresentativeAssets", v2, (void *)1);

  }
  return v2;
}

- (id)features
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "featuresProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("features"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)suggestedPersonLocalIdentifiers
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "featuresProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("suggestedPersonLocalIdentifiers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)containsUnverifiedPersons
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "featuresProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("containsUnverifiedPersons"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "BOOLValue");
  return v3;
}

- (uint64_t)notificationQuality
{
  return 0;
}

- (uint64_t)relevanceDurationInDays
{
  return 0;
}

@end
