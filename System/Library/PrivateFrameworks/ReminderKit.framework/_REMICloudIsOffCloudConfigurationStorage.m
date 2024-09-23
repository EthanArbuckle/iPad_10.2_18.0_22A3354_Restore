@implementation _REMICloudIsOffCloudConfigurationStorage

- (_REMICloudIsOffCloudConfigurationStorage)initWithTimeIntervalSinceLastPrompt:(double)a3
{
  _REMICloudIsOffCloudConfigurationStorage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_REMICloudIsOffCloudConfigurationStorage;
  result = -[_REMICloudIsOffCloudConfigurationStorage init](&v5, sel_init);
  if (result)
    result->_iCloudIsOffTimeIntervalSinceLastPrompt = a3;
  return result;
}

- (double)iCloudIsOffTimeIntervalSinceLastPrompt
{
  return self->_iCloudIsOffTimeIntervalSinceLastPrompt;
}

@end
