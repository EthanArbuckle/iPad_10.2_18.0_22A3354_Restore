@implementation CRLineWrappingConfiguration

- (BOOL)allowWrappingBetweenGroups
{
  return self->_allowWrappingBetweenGroups;
}

- (void)setAllowWrappingBetweenGroups:(BOOL)a3
{
  self->_allowWrappingBetweenGroups = a3;
}

- (BOOL)mergeOversegmentedTokens
{
  return self->_mergeOversegmentedTokens;
}

- (void)setMergeOversegmentedTokens:(BOOL)a3
{
  self->_mergeOversegmentedTokens = a3;
}

@end
