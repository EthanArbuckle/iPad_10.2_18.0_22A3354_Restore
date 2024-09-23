@implementation IdFeatureConfig

- (IdFeatureConfig)init
{
  IdFeatureConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IdFeatureConfig;
  result = -[FeatureConfig init](&v3, sel_init);
  if (result)
    result->_hashing = 0;
  return result;
}

- (int)embeddingTableSize
{
  return self->_embeddingTableSize;
}

- (void)setEmbeddingTableSize:(int)a3
{
  self->_embeddingTableSize = a3;
}

- (int)embeddingDimention
{
  return self->_embeddingDimention;
}

- (void)setEmbeddingDimention:(int)a3
{
  self->_embeddingDimention = a3;
}

- (BOOL)hashing
{
  return self->_hashing;
}

- (void)setHashing:(BOOL)a3
{
  self->_hashing = a3;
}

- (int)hashBucketStart
{
  return self->_hashBucketStart;
}

- (void)setHashBucketStart:(int)a3
{
  self->_hashBucketStart = a3;
}

@end
