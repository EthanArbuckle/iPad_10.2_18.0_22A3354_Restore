@implementation THWAutoplayConfig

- (THWAutoplayConfig)initWithAutoplayEnabled:(BOOL)a3
{
  THWAutoplayConfig *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWAutoplayConfig;
  result = -[THWAutoplayConfig init](&v5, "init");
  if (result)
    result->_enabled = a3;
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

@end
