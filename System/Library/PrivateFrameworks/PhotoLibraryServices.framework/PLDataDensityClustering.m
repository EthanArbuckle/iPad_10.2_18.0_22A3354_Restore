@implementation PLDataDensityClustering

- (PLDataDensityClustering)init
{
  PLDataDensityClustering *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLDataDensityClustering;
  result = -[PLDataDensityClustering init](&v3, sel_init);
  if (result)
  {
    result->_maximumDistance = 50.0;
    result->_minimumNumberOfObjects = 2;
  }
  return result;
}

- (double)maximumDistance
{
  return self->_maximumDistance;
}

- (void)setMaximumDistance:(double)a3
{
  self->_maximumDistance = a3;
}

- (unint64_t)minimumNumberOfObjects
{
  return self->_minimumNumberOfObjects;
}

- (void)setMinimumNumberOfObjects:(unint64_t)a3
{
  self->_minimumNumberOfObjects = a3;
}

@end
