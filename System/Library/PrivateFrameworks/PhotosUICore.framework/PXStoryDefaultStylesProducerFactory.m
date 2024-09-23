@implementation PXStoryDefaultStylesProducerFactory

- (id)stylesProducerForAutoEditDecisionLists:(id)a3
{
  id v3;
  PXStoryDefaultStylesProducer *v4;

  v3 = a3;
  v4 = -[PXStoryDefaultStylesProducer initWithAutoEditDecisionLists:]([PXStoryDefaultStylesProducer alloc], "initWithAutoEditDecisionLists:", v3);

  return v4;
}

- (id)initialStyleProducerForAssetCollection:(id)a3
{
  id v3;
  PXStoryAssetCollectionStyleProducer *v4;

  v3 = a3;
  v4 = -[PXStoryAssetCollectionStyleProducer initWithAssetCollection:]([PXStoryAssetCollectionStyleProducer alloc], "initWithAssetCollection:", v3);

  return v4;
}

- (id)initialStyleProducerForPersistableRecipe:(id)a3 songResource:(id)a4 autoEditDecisionList:(id)a5
{
  id v7;
  id v8;
  id v9;
  PXStoryPersistedStyleProducer *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PXStoryPersistedStyleProducer initWithPersistedRecipe:songResource:autoEditDecisionList:]([PXStoryPersistedStyleProducer alloc], "initWithPersistedRecipe:songResource:autoEditDecisionList:", v9, v8, v7);

  return v10;
}

@end
