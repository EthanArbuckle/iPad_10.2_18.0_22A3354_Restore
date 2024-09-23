@implementation _PIDisparitySampleResult

- (_PIDisparitySampleResult)initWithDisparityValue:(float)a3
{
  _PIDisparitySampleResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PIDisparitySampleResult;
  result = -[_PIDisparitySampleResult init](&v5, sel_init);
  if (result)
    result->_sampledDisparityValue = a3;
  return result;
}

- (float)sampledDisparityValue
{
  return self->_sampledDisparityValue;
}

@end
