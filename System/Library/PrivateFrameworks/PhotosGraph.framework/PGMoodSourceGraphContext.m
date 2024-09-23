@implementation PGMoodSourceGraphContext

+ (id)_plistName
{
  return CFSTR("MoodSourceGraphContext");
}

- (double)weight
{
  return 1.0;
}

- (id)_plistMoodIdentifiersWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[PGMoodSource enrichedMemory](self, "enrichedMemory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PGMoodSource enrichedMemory](self, "enrichedMemory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "memoryMomentNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMoodSource options](self, "options");
    v8 = objc_claimAutoreleasedReturnValue();
    +[PGMoodUtilities moodGraphContextIdentifiersForMomentNodes:inGraph:moodOptions:](PGMoodUtilities, "moodGraphContextIdentifiersForMomentNodes:inGraph:moodOptions:", v7, v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  else
  {
    -[PGMoodSource assetCollection](self, "assetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMoodSource options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMoodUtilities moodGraphContextIdentifiersForAssetCollection:withGraph:moodOptions:](PGMoodUtilities, "moodGraphContextIdentifiersForAssetCollection:withGraph:moodOptions:", v6, v4, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end
