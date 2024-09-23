@implementation VUILiveLinkConfig

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (VUILiveLinkConfig)init
{
  VUILiveLinkConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUILiveLinkConfig;
  result = -[VUILiveLinkConfig init](&v3, sel_init);
  if (result)
    result->_isEnabled = 0;
  return result;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

@end
