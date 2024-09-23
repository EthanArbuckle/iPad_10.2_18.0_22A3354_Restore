@implementation PGMeaningfulEventLocationCollectionTrait

- (PGMeaningfulEventLocationCollectionTrait)initWithNodes:(id)a3 negativeNodes:(id)a4
{
  PGMeaningfulEventLocationCollectionTrait *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGMeaningfulEventLocationCollectionTrait;
  result = -[PGMeaningfulEventCollectionTrait initWithNodes:negativeNodes:](&v5, sel_initWithNodes_negativeNodes_, a3, a4);
  if (result)
  {
    result->_useStrictNegativeNodesMatching = 1;
    result->_skipNegativeRequirementForMissingLocation = 0;
  }
  return result;
}

- (BOOL)useStrictNegativeNodesMatching
{
  return self->_useStrictNegativeNodesMatching;
}

- (void)setUseStrictNegativeNodesMatching:(BOOL)a3
{
  self->_useStrictNegativeNodesMatching = a3;
}

- (BOOL)skipNegativeRequirementForMissingLocation
{
  return self->_skipNegativeRequirementForMissingLocation;
}

- (void)setSkipNegativeRequirementForMissingLocation:(BOOL)a3
{
  self->_skipNegativeRequirementForMissingLocation = a3;
}

@end
