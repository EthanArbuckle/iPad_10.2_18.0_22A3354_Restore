@implementation PGFeaturedMemoryGenerator

- (NSDate)upperBoundLocalDate
{
  return self->_upperBoundLocalDate;
}

- (void)setUpperBoundLocalDate:(id)a3
{
  objc_storeStrong((id *)&self->_upperBoundLocalDate, a3);
}

- (BOOL)usesLowRequirements
{
  return self->_usesLowRequirements;
}

- (void)setUsesLowRequirements:(BOOL)a3
{
  self->_usesLowRequirements = a3;
}

- (BOOL)oldMemory
{
  return self->_oldMemory;
}

- (void)setOldMemory:(BOOL)a3
{
  self->_oldMemory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upperBoundLocalDate, 0);
}

@end
