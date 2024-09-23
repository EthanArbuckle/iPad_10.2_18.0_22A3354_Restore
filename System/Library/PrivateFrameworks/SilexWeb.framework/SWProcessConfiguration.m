@implementation SWProcessConfiguration

- (SWProcessConfiguration)initWithBackgroundPriority:(BOOL)a3
{
  SWProcessConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SWProcessConfiguration;
  result = -[SWProcessConfiguration init](&v5, sel_init);
  if (result)
    result->_shouldRunAtBackgroundPriority = a3;
  return result;
}

- (BOOL)shouldRunAtBackgroundPriority
{
  return self->_shouldRunAtBackgroundPriority;
}

@end
