@implementation PKApplicationMessageViewConfiguration

- (PKApplicationMessageViewConfiguration)init
{

  return 0;
}

- (PKApplicationMessageViewConfiguration)initWithWidth:(double)a3
{
  PKApplicationMessageViewConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplicationMessageViewConfiguration;
  result = -[PKApplicationMessageViewConfiguration init](&v5, sel_init);
  if (result)
    result->_width = a3;
  return result;
}

- (double)width
{
  return self->_width;
}

@end
