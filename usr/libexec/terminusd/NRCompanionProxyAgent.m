@implementation NRCompanionProxyAgent

- (void)dealloc
{
  NRCompanionProxyAgent *v2;
  void *v3;
  int IsLevelEnabled;
  uint64_t v5;
  NSUUID *nrUUID;
  NSUUID *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  objc_super v14;

  v2 = self;
  if (self)
    self = (NRCompanionProxyAgent *)self->_nrUUID;
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0);

  if (IsLevelEnabled)
  {
    if (v2)
      nrUUID = v2->_nrUUID;
    else
      nrUUID = 0;
    v7 = nrUUID;
    v9 = (void *)_NRCopyLogObjectForNRUUID(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRCompanionProxyAgent agentDescription](v2, "agentDescription"));

    _NRLogWithArgs(v9, 0, "%s%.30s:%-4d Dealloc: %@", ", "-[NRCompanionProxyAgent dealloc]", 79, v10);
  }
  if (v2)
  {
    if (v2->_isRegistered)
    {
      v11 = (void *)_NRCopyLogObjectForNRUUID(v2->_nrUUID, v5);
      v12 = _NRLogIsLevelEnabled(v11, 17);

      if (v12)
      {
        v13 = (void *)_NRCopyLogObjectForNRUUID(v2->_nrUUID, v5);
        _NRLogWithArgs(v13, 17, "agent dealloc'd while being registered");

      }
    }
  }
  sub_10005DA9C((uint64_t)v2, v5);
  v14.receiver = v2;
  v14.super_class = (Class)NRCompanionProxyAgent;
  -[NRCompanionProxyAgent dealloc](&v14, "dealloc");
}

- (id)copyAgentData
{
  unint64_t generation;
  unint64_t v4;

  if (self)
    generation = self->_generation;
  else
    generation = 0;
  v4 = generation;
  return objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v4, 8);
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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

- (BOOL)isSpecificUseOnly
{
  return self->specificUseOnly;
}

- (void)setSpecificUseOnly:(BOOL)a3
{
  self->specificUseOnly = a3;
}

- (BOOL)isNetworkProvider
{
  return self->networkProvider;
}

- (void)setNetworkProvider:(BOOL)a3
{
  self->networkProvider = a3;
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
  objc_storeStrong((id *)&self->_fallbackPathRegistrationObject, 0);
  objc_storeStrong((id *)&self->_fallbackPathControllerAgent, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_registrationObject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

+ (id)agentDomain
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), "com.apple.networkrelay");
}

+ (id)agentType
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), "CompanionProxy");
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

@end
