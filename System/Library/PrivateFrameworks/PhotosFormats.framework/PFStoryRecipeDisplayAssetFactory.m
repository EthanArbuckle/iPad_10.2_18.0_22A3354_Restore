@implementation PFStoryRecipeDisplayAssetFactory

+ (id)createAssetWithCategory:(int64_t)a3 scheme:(id)a4 cloudIdentifier:(id)a5
{
  id v7;
  id v8;
  PFStoryConcreteRecipeDisplayAsset *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[PFStoryConcreteRecipeDisplayAsset initWithIdentifier:category:scheme:cloudIdentifier:]([PFStoryConcreteRecipeDisplayAsset alloc], "initWithIdentifier:category:scheme:cloudIdentifier:", 0, a3, v8, v7);

  return v9;
}

@end
