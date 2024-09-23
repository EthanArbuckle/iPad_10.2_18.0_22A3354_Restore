@implementation PXStoryDefaultPersistableRecipeProducerFactory

- (id)persistableRecipeProducerForConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PXStoryPassthroughPersistableRecipeProducer *v6;
  PXStoryPHMemoryPersistableRecipeProducer *v7;
  PXStoryPHMemoryPersistableRecipeProducer *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "persistableRecipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isAppleMusicPreview"))
  {
    if (v4)
    {
      v6 = -[PXStoryPassthroughPersistableRecipeProducer initWithPersistableRecipe:]([PXStoryPassthroughPersistableRecipeProducer alloc], "initWithPersistableRecipe:", v4);
      goto LABEL_5;
    }
    if ((objc_msgSend(v3, "options") & 2) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = [PXStoryPHMemoryPersistableRecipeProducer alloc];
        objc_msgSend(v3, "keyAsset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[PXStoryPHMemoryPersistableRecipeProducer initWithMemory:keyAsset:](v9, "initWithMemory:keyAsset:", v5, v11);

        goto LABEL_6;
      }
    }
  }
  v6 = objc_alloc_init(PXStoryPassthroughPersistableRecipeProducer);
LABEL_5:
  v7 = (PXStoryPHMemoryPersistableRecipeProducer *)v6;
LABEL_6:

  return v7;
}

@end
