@implementation NSBundle(TextureDataLoading)

- (id)dataForResourceName:()TextureDataLoading
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[_UIAssetManager assetManagerForBundle:](_UIAssetManager, "assetManagerForBundle:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
