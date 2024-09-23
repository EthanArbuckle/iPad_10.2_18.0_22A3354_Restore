@implementation PGMoodSourceMeaning

- (double)weight
{
  return 2.0;
}

- (id)_plistMoodIdentifiersWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PGMoodSource enrichedMemory](self, "enrichedMemory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PGMoodSource enrichedMemory](self, "enrichedMemory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "memoryMomentNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMoodUtilities moodMeaningIdentifiersForMomentNodes:](PGMoodUtilities, "moodMeaningIdentifiersForMomentNodes:", v7);
  }
  else
  {
    -[PGMoodSource assetCollection](self, "assetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMoodSource options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMoodUtilities moodMeaningIdentifiersForAssetCollection:withGraph:moodOptions:](PGMoodUtilities, "moodMeaningIdentifiersForAssetCollection:withGraph:moodOptions:", v6, v4, v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)_sourceInputCount
{
  void *v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  -[PGMoodSource options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)PGMoodSourceMeaning;
    return -[PGMoodSource _sourceInputCount](&v7, sel__sourceInputCount);
  }
  return v5;
}

+ (id)_plistName
{
  return CFSTR("MoodSourceMeaning");
}

@end
