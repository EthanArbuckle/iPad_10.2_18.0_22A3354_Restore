@implementation PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation

- (PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation)initWithReplacementAssetsByUUID:(id)a3
{
  id v4;
  PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation *v5;
  uint64_t v6;
  NSMutableDictionary *replacementAssetsByUUID;
  PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation;
  v5 = -[PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
    replacementAssetsByUUID = v5->_replacementAssetsByUUID;
    v5->_replacementAssetsByUUID = (NSMutableDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)replaceAssetInDataSourceWithAsset:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_replacementAssetsByUUID, "setObject:forKeyedSubscript:", v5, v4);

}

- (void)removeReplacementAssetInDataSourceForUUID:(id)a3
{
  if (a3)
    -[NSMutableDictionary removeObjectForKey:](self->_replacementAssetsByUUID, "removeObjectForKey:");
}

- (NSMutableDictionary)replacementAssetsByUUID
{
  return self->_replacementAssetsByUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementAssetsByUUID, 0);
}

@end
