@implementation CSArmedSeconds

- (CSArmedSeconds)init
{
  CSArmedSeconds *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSArmedSeconds;
  result = -[CSArmedSeconds init](&v3, "init");
  if (result)
  {
    result->_armedSeconds = 0;
    result->_isArmed = 0;
  }
  return result;
}

- (int)armedSeconds
{
  return self->_armedSeconds;
}

- (void)setArmedSeconds:(int)a3
{
  self->_armedSeconds = a3;
}

- (BOOL)isArmed
{
  return self->_isArmed;
}

- (void)setIsArmed:(BOOL)a3
{
  self->_isArmed = a3;
}

@end
