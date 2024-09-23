@implementation RMDummyDataProviderConfiguration

- (RMDummyDataProviderConfiguration)initWithUniqueIdentifier:(id)a3 updateInterval:(unint64_t)a4
{
  id v6;
  RMDummyDataProviderConfiguration *v7;
  RMDummyDataProviderConfiguration *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RMDummyDataProviderConfiguration;
  v7 = -[RMDummyDataProviderConfiguration init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[RMDummyDataProviderConfiguration setIdentifier:](v7, "setIdentifier:", v6);
    -[RMDummyDataProviderConfiguration setIntervalInNanoSeconds:](v8, "setIntervalInNanoSeconds:", a4);
  }

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)intervalInNanoSeconds
{
  return self->_intervalInNanoSeconds;
}

- (void)setIntervalInNanoSeconds:(unint64_t)a3
{
  self->_intervalInNanoSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
