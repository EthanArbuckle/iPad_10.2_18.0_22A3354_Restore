@implementation REMICloudIsOffDataViewConfigurationsInvocationResult

- (REMICloudIsOffDataViewConfigurationsInvocationResult)initWithTimeIntervalSinceLastPrompt:(double)a3
{
  REMICloudIsOffDataViewConfigurationsInvocationResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMICloudIsOffDataViewConfigurationsInvocationResult;
  result = -[REMStoreInvocationValueStorage init](&v5, sel_init);
  if (result)
    result->_timeIntervalSinceLastPrompt = a3;
  return result;
}

- (double)timeIntervalSinceLastPrompt
{
  return self->_timeIntervalSinceLastPrompt;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMICloudIsOffDataViewConfigurationsInvocationResult)initWithCoder:(id)a3
{
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("timeIntervalSinceLastPrompt"));
  return -[REMICloudIsOffDataViewConfigurationsInvocationResult initWithTimeIntervalSinceLastPrompt:](self, "initWithTimeIntervalSinceLastPrompt:");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[REMICloudIsOffDataViewConfigurationsInvocationResult timeIntervalSinceLastPrompt](self, "timeIntervalSinceLastPrompt");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeIntervalSinceLastPrompt"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[REMICloudIsOffDataViewConfigurationsInvocationResult timeIntervalSinceLastPrompt](self, "timeIntervalSinceLastPrompt");
    v6 = v5;
    objc_msgSend(v4, "timeIntervalSinceLastPrompt");
    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  double v2;

  -[REMICloudIsOffDataViewConfigurationsInvocationResult timeIntervalSinceLastPrompt](self, "timeIntervalSinceLastPrompt");
  return (unint64_t)v2;
}

@end
