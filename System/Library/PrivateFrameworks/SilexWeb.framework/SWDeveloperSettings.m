@implementation SWDeveloperSettings

- (SWDeveloperSettings)initWithAllowRemoteInspection:(BOOL)a3
{
  SWDeveloperSettings *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SWDeveloperSettings;
  result = -[SWDeveloperSettings init](&v5, sel_init);
  if (result)
    result->_allowRemoteInspection = a3;
  return result;
}

- (BOOL)allowRemoteInspection
{
  return self->_allowRemoteInspection;
}

@end
