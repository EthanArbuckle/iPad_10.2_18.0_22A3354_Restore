@implementation PLInterest

- (NSKnownKeysMappingStrategy)allKeysMappingStrategy
{
  return self->_allKeysMappingStrategy;
}

- (void)setAllKeysMappingStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_allKeysMappingStrategy, a3);
}

- (unint64_t)indexesOfInterest
{
  return self->_indexesOfInterest;
}

- (void)setIndexesOfInterest:(unint64_t)a3
{
  self->_indexesOfInterest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKeysMappingStrategy, 0);
}

@end
