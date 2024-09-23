@implementation PLMediaAnalysisEmbeddingSearchResult

- (PLMediaAnalysisEmbeddingSearchResult)initWithAssetUUID:(id)a3 distance:(id)a4
{
  id v7;
  id v8;
  PLMediaAnalysisEmbeddingSearchResult *v9;
  PLMediaAnalysisEmbeddingSearchResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLMediaAnalysisEmbeddingSearchResult;
  v9 = -[PLMediaAnalysisEmbeddingSearchResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetUUID, a3);
    objc_storeStrong((id *)&v10->_distance, a4);
  }

  return v10;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

@end
