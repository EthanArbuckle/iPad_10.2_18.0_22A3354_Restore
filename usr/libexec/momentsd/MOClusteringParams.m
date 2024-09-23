@implementation MOClusteringParams

- (MOClusteringParams)initWithembeddingDistanceWeights:(id)a3 minPoints:(unint64_t)a4 minClusterSize:(unint64_t)a5
{
  id v9;
  MOClusteringParams *v10;
  MOClusteringParams *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MOClusteringParams;
  v10 = -[MOClusteringParams init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_embeddingDistanceWeights, a3);
    v11->_minPoints = a4;
    v11->_minClusterSize = a5;
  }

  return v11;
}

- (NSDictionary)embeddingDistanceWeights
{
  return self->_embeddingDistanceWeights;
}

- (void)setEmbeddingDistanceWeights:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingDistanceWeights, a3);
}

- (unint64_t)minPoints
{
  return self->_minPoints;
}

- (void)setMinPoints:(unint64_t)a3
{
  self->_minPoints = a3;
}

- (unint64_t)minClusterSize
{
  return self->_minClusterSize;
}

- (void)setMinClusterSize:(unint64_t)a3
{
  self->_minClusterSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingDistanceWeights, 0);
}

@end
