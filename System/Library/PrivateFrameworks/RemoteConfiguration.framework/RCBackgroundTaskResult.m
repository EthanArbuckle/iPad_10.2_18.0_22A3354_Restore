@implementation RCBackgroundTaskResult

- (RCBackgroundTaskResult)initWithTaskIdentifier:(id)a3 configurationResourcesByRequestKey:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  RCBackgroundTaskResult *v12;
  RCBackgroundTaskResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RCBackgroundTaskResult;
  v12 = -[RCBackgroundTaskResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_taskIdentifier, a3);
    objc_storeStrong((id *)&v13->_configurationResourcesByRequestKey, a4);
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_taskIdentifier, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSDictionary)configurationResourcesByRequestKey
{
  return self->_configurationResourcesByRequestKey;
}

- (void)setConfigurationResourcesByRequestKey:(id)a3
{
  objc_storeStrong((id *)&self->_configurationResourcesByRequestKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationResourcesByRequestKey, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

@end
