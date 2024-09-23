@implementation PKProductSectionSearchResult

- (double)normalizedSearchDistance
{
  double result;

  result = self->_normalizedSearchDistance;
  if (result == 0.0)
  {
    result = self->_searchDistance / (double)self->_numberOfResults;
    self->_normalizedSearchDistance = result;
  }
  return result;
}

- (unint64_t)numberOfResults
{
  return self->_numberOfResults;
}

- (void)setNumberOfResults:(unint64_t)a3
{
  self->_numberOfResults = a3;
}

- (double)searchDistance
{
  return self->_searchDistance;
}

- (void)setSearchDistance:(double)a3
{
  self->_searchDistance = a3;
}

@end
