@implementation CLDurianSetWildConfigurationTask

- (CLDurianSetWildConfigurationTask)initWithConfiguration:(id)a3
{
  CLDurianSetWildConfigurationTask *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLDurianSetWildConfigurationTask;
  v4 = -[CLDurianTask initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:](&v6, "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", 0, 0, 1, 0, 0);
  if (v4)
    v4->_configuration = (CLFindMyAccessoryWildConfiguration *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianSetWildConfigurationTask;
  -[CLDurianTask dealloc](&v3, "dealloc");
}

- (void)willStart
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianSetWildConfigurationTask;
  -[CLDurianTask willStart](&v3, "willStart");
  -[CLDurianTask setCommand:](self, "setCommand:", +[CLDurianCommand setWildModeConfigurationCommandWithConfiguration:](CLDurianCommand, "setWildModeConfigurationCommandWithConfiguration:", -[CLFindMyAccessoryWildConfiguration encodeConfiguration](self->_configuration, "encodeConfiguration")));
}

- (CLFindMyAccessoryWildConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
