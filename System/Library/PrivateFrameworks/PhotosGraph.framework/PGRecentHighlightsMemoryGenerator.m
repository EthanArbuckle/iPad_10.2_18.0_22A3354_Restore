@implementation PGRecentHighlightsMemoryGenerator

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGRecentHighlightsMemoryGenerator;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v6, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefilterAssetsWithFacesThreshold:", 2.22507386e-308);
  return v4;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PGBestOfTimeMemoryTitleGenerator *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PGBestOfTimeMemoryTitleGenerator *v21;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v9 = a7;
  objc_msgSend(a3, "memoryMomentNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sortedArrayUsingDescriptors:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [PGBestOfTimeMemoryTitleGenerator alloc];
  objc_msgSend(v15, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "universalStartDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "universalEndDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PGBestOfTimeMemoryTitleGenerator initWithStartDate:endDate:titleGenerationContext:](v16, "initWithStartDate:endDate:titleGenerationContext:", v18, v20, v9);

  return v21;
}

@end
