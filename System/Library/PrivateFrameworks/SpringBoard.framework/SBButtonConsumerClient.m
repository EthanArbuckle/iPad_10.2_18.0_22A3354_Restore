@implementation SBButtonConsumerClient

- (NSMutableSet)registrations
{
  return self->_registrations;
}

- (BOOL)canReceiveEvents
{
  if (self->_suspended)
    return 0;
  if (self->_application && !self->_entitledToConsumeButtonsInBackground)
    return self->_runningVisible;
  return 1;
}

- (FBSServiceFacilityClientHandle)systemServiceClient
{
  return self->_systemServiceClient;
}

- (void)setSystemServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_systemServiceClient, a3);
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (void)setRunningVisible:(BOOL)a3
{
  self->_runningVisible = a3;
}

- (void)setRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_registrations, a3);
}

- (void)setEntitledToConsumeButtonsInBackground:(BOOL)a3
{
  self->_entitledToConsumeButtonsInBackground = a3;
}

- (void)setApplication:(BOOL)a3
{
  self->_application = a3;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_systemServiceClient, CFSTR("systemServiceClient"), 0);
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_entitledToConsumeButtonsInBackground, CFSTR("entitledToConsumeButtonsInBackground"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_application, CFSTR("application"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_runningVisible, CFSTR("runningVisible"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", self->_suspended, CFSTR("suspended"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  FBSServiceFacilityClientHandle *systemServiceClient;
  void *v4;

  systemServiceClient = self->_systemServiceClient;
  objc_msgSend(a3, "systemServiceClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(systemServiceClient) = -[FBSServiceFacilityClientHandle isEqual:](systemServiceClient, "isEqual:", v4);

  return (char)systemServiceClient;
}

- (unint64_t)hash
{
  return -[FBSServiceFacilityClientHandle hash](self->_systemServiceClient, "hash");
}

- (BOOL)isEntitledToConsumeButtonsInBackground
{
  return self->_entitledToConsumeButtonsInBackground;
}

- (BOOL)isApplication
{
  return self->_application;
}

- (BOOL)isRunningVisible
{
  return self->_runningVisible;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_systemServiceClient, 0);
}

@end
