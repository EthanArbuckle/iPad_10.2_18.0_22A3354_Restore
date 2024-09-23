@implementation BYDeviceConfiguration

- (BYDeviceConfiguration)init
{
  BYDeviceConfiguration *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BYDeviceConfiguration;
  v2 = -[BYDeviceConfiguration init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();

    v2->_productVersion = (NSString *)v3;
    v4 = (void *)MGCopyAnswer();

    v2->_buildVersion = (NSString *)v4;
  }
  return v2;
}

+ (id)currentConfiguration
{
  if (currentConfiguration_onceToken != -1)
    dispatch_once(&currentConfiguration_onceToken, &__block_literal_global_16);
  return (id)currentConfiguration_configuration;
}

void __45__BYDeviceConfiguration_currentConfiguration__block_invoke()
{
  BYDeviceConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(BYDeviceConfiguration);
  v1 = (void *)currentConfiguration_configuration;
  currentConfiguration_configuration = (uint64_t)v0;

}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  self->_productVersion = (NSString *)a3;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  self->_buildVersion = (NSString *)a3;
}

@end
