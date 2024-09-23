@implementation PFStoryConcreteMutableRecipe

- (void)setContentIdentifier:(id)a3
{
  NSString *v4;
  NSString *contentIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contentIdentifier = self->super._contentIdentifier;
  self->super._contentIdentifier = v4;

}

- (void)setMajorVersion:(int64_t)a3
{
  self->super._majorVersion = a3;
}

- (void)setMinorVersion:(int64_t)a3
{
  self->super._minorVersion = a3;
}

- (void)setLibraries:(id)a3
{
  NSArray *v4;
  NSArray *libraries;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  libraries = self->super._libraries;
  self->super._libraries = v4;

}

- (void)setAssets:(id)a3
{
  NSArray *v4;
  NSArray *assets;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  assets = self->super._assets;
  self->super._assets = v4;

}

- (void)addAsset:(id)a3
{
  NSArray *v4;
  NSArray *assets;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!self->super._assets)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    assets = self->super._assets;
    self->super._assets = v4;

  }
  -[PFStoryConcreteRecipe assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteMutableRecipe setAssets:](self, "setAssets:", v7);

}

- (void)setCurrentStyle:(id)a3
{
  objc_storeStrong((id *)&self->super._currentStyle, a3);
}

- (void)removeAssetWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[PFStoryConcreteRecipe assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PFStoryConcreteMutableRecipe_removeAssetWithIdentifier___block_invoke;
  v11[3] = &unk_1E45A4168;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFStoryConcreteRecipe assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "removeObjectsAtIndexes:", v6);
  v9 = (void *)objc_msgSend(v8, "copy");
  -[PFStoryConcreteMutableRecipe setAssets:](self, "setAssets:", v9);

}

- (void)setPresentations:(id)a3
{
  NSArray *v4;
  NSArray *presentations;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  presentations = self->super._presentations;
  self->super._presentations = v4;

}

- (void)addPresentation:(id)a3
{
  NSArray *v4;
  NSArray *presentations;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!self->super._presentations)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    presentations = self->super._presentations;
    self->super._presentations = v4;

  }
  -[PFStoryConcreteRecipe presentations](self, "presentations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteMutableRecipe setPresentations:](self, "setPresentations:", v7);

}

- (void)removePresentationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[PFStoryConcreteRecipe presentations](self, "presentations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PFStoryConcreteMutableRecipe_removePresentationWithIdentifier___block_invoke;
  v11[3] = &unk_1E45A4190;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFStoryConcreteRecipe presentations](self, "presentations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "removeObjectsAtIndexes:", v6);
  v9 = (void *)objc_msgSend(v8, "copy");
  -[PFStoryConcreteMutableRecipe setPresentations:](self, "setPresentations:", v9);

}

- (void)addLibrary:(id)a3
{
  NSArray *v4;
  NSArray *libraries;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!self->super._libraries)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    libraries = self->super._libraries;
    self->super._libraries = v4;

  }
  -[PFStoryConcreteRecipe libraries](self, "libraries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteMutableRecipe setLibraries:](self, "setLibraries:", v7);

}

- (void)removeLibraryWithKind:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  -[PFStoryConcreteRecipe libraries](self, "libraries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__PFStoryConcreteMutableRecipe_removeLibraryWithKind___block_invoke;
  v10[3] = &__block_descriptor_40_e39_B32__0___PFStoryRecipeLibrary__8Q16_B24l;
  v10[4] = a3;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v10);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PFStoryConcreteRecipe libraries](self, "libraries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObjectsAtIndexes:", v9);
  v8 = (void *)objc_msgSend(v7, "copy");
  -[PFStoryConcreteMutableRecipe setLibraries:](self, "setLibraries:", v8);

}

- (void)setOverallDurationInfo:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->super._overallDurationInfo.kind = *(_OWORD *)&a3->var0;
  v3 = *(_OWORD *)&a3->var1.var0.var1;
  v4 = *(_OWORD *)&a3->var1.var1.var0;
  v5 = *(_OWORD *)&a3->var1.var1.var3;
  *(_OWORD *)&self->super._overallDurationInfo.specificDurationInfo.maximumDuration.timescale = *(_OWORD *)&a3->var1.var2.var1;
  *(_OWORD *)&self->super._overallDurationInfo.specificDurationInfo.preferredDuration.epoch = v5;
  *(_OWORD *)&self->super._overallDurationInfo.specificDurationInfo.preferredDuration.value = v4;
  *(_OWORD *)&self->super._overallDurationInfo.specificDurationInfo.minimumDuration.timescale = v3;
}

- (void)setAutoEditDecisionLists:(id)a3
{
  objc_storeStrong((id *)&self->super._autoEditDecisionLists, a3);
}

- (void)setSeedSongIdentifiersByCatalog:(id)a3
{
  objc_storeStrong((id *)&self->super._seedSongIdentifiersByCatalog, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PFStoryConcreteRecipe *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PFStoryConcreteRecipe *v14;
  _BYTE v16[80];

  v4 = [PFStoryConcreteRecipe alloc];
  -[PFStoryConcreteRecipe contentIdentifier](self, "contentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PFStoryConcreteRecipe majorVersion](self, "majorVersion");
  v7 = -[PFStoryConcreteRecipe minorVersion](self, "minorVersion");
  -[PFStoryConcreteRecipe libraries](self, "libraries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipe assets](self, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipe overallDurationInfo](self, "overallDurationInfo");
  -[PFStoryConcreteRecipe currentStyle](self, "currentStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipe seedSongIdentifiersByCatalog](self, "seedSongIdentifiersByCatalog");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipe autoEditDecisionLists](self, "autoEditDecisionLists");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipe presentations](self, "presentations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PFStoryConcreteRecipe initWithContentIdentifier:majorVersion:minorVersion:libraries:assets:overallDurationInfo:currentStyle:seedSongIdentifiersByCatalog:autoDecisionLists:presentations:](v4, "initWithContentIdentifier:majorVersion:minorVersion:libraries:assets:overallDurationInfo:currentStyle:seedSongIdentifiersByCatalog:autoDecisionLists:presentations:", v5, v6, v7, v8, v9, v16, v10, v11, v12, v13);

  return v14;
}

BOOL __54__PFStoryConcreteMutableRecipe_removeLibraryWithKind___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "kind") == *(_QWORD *)(a1 + 32);
}

uint64_t __65__PFStoryConcreteMutableRecipe_removePresentationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __58__PFStoryConcreteMutableRecipe_removeAssetWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
