@implementation NSDataAsset(UIAssetBundle)

+ (id)_namedDataPrivateAccessorWithName:()UIAssetBundle bundle:
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[_UIAssetManager assetManagerForBundle:](_UIAssetManager, "assetManagerForBundle:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataNamed:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
