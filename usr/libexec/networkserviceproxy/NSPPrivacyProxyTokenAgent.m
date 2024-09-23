@implementation NSPPrivacyProxyTokenAgent

+ (id)agentDomain
{
  return CFSTR("NetworkServiceProxy");
}

+ (id)agentType
{
  return CFSTR("TokenAgent");
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (id)copyAgentData
{
  return 0;
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

- (void)tokenLowWaterMarkReached
{
  NSPPrivacyProxyTokenAgent *v2;
  NSPPrivacyProxyTokenAgent *v3;

  v2 = self;
  if (self)
    self = (NSPPrivacyProxyTokenAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  v3 = self;
  -[NSPPrivacyProxyTokenAgent tokenLowWaterMarkReachedForAgent:](self, "tokenLowWaterMarkReachedForAgent:", v2);

}

- (BOOL)reportError:(int)a3 withOptions:(id)a4
{
  uint64_t v4;
  id v6;
  id WeakRetained;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "reportErrorForAgent:error:withOptions:", self, v4, v6);

  return 1;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAgentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

@end
