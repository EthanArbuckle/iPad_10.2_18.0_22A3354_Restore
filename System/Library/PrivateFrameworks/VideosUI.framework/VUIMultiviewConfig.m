@implementation VUIMultiviewConfig

- (void)setMaximumPlayerCount:(int64_t)a3
{
  self->_maximumPlayerCount = a3;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (VUIMultiviewConfig)init
{
  VUIMultiviewConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIMultiviewConfig;
  result = -[VUIMultiviewConfig init](&v3, sel_init);
  if (result)
  {
    result->_isEnabled = 0;
    result->_maximumPlayerCount = 4;
  }
  return result;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (int64_t)maximumPlayerCount
{
  return self->_maximumPlayerCount;
}

@end
