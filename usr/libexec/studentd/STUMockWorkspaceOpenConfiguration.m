@implementation STUMockWorkspaceOpenConfiguration

- (STUMockWorkspaceOpenConfiguration)init
{
  STUMockWorkspaceOpenConfiguration *v2;
  STUMockWorkspaceOpenConfiguration *v3;
  NSDictionary *environment;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUMockWorkspaceOpenConfiguration;
  v2 = -[STUMockWorkspaceOpenConfiguration init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    environment = v2->_environment;
    v2->_environment = (NSDictionary *)&__NSDictionary0__struct;

  }
  return v3;
}

- (BOOL)activates
{
  return self->_activates;
}

- (void)setActivates:(BOOL)a3
{
  self->_activates = a3;
}

- (BOOL)createsNewApplicationInstance
{
  return self->_createsNewApplicationInstance;
}

- (void)setCreatesNewApplicationInstance:(BOOL)a3
{
  self->_createsNewApplicationInstance = a3;
}

- (BOOL)promptsUserIfNeeded
{
  return self->_promptsUserIfNeeded;
}

- (void)setPromptsUserIfNeeded:(BOOL)a3
{
  self->_promptsUserIfNeeded = a3;
}

- (NSDictionary)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
