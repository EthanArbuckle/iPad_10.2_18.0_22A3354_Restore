@implementation PXSearchZeroKeywordAssetCollectionViewModel

- (id)debugDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSearchZeroKeywordAssetCollectionViewModel;
  -[PXSearchZeroKeywordAssetViewModel debugDictionary](&v8, sel_debugDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PXSearchZeroKeywordAssetCollectionViewModel assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("assetCollection"));

  return v4;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

@end
