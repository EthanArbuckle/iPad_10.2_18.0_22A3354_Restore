@implementation NRCompanionProxyConfigAgent

- (void)dealloc
{
  NRCompanionProxyConfigAgent *v2;
  void *v3;
  int IsLevelEnabled;
  uint64_t v5;
  NSUUID *nrUUID;
  NSUUID *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v2 = self;
  if (self)
    self = (NRCompanionProxyConfigAgent *)self->_nrUUID;
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRCompanionProxyConfigAgent agentDescription](v2, "agentDescription"));

    _NRLogWithArgs(v9, 0, "%s%.30s:%-4d Dealloc: %@", ", "-[NRCompanionProxyConfigAgent dealloc]", 331, v10);
  }
  sub_10005DFE8((uint64_t)v2, v5);
  v11.receiver = v2;
  v11.super_class = (Class)NRCompanionProxyConfigAgent;
  -[NRCompanionProxyConfigAgent dealloc](&v11, "dealloc");
}

- (id)copyAgentData
{
  OS_nw_parameters *parameters;
  uint64_t v3;
  id v4;
  BOOL v5;
  void *v6;
  id v7;
  uint64_t v9;

  if (!self)
    return 0;
  parameters = self->_parameters;
  if (!parameters)
    return 0;
  v9 = 0;
  v3 = nw_parameters_create_data(parameters, &v9);
  v4 = 0;
  if (v3)
    v5 = v9 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = (void *)v3;
    v7 = objc_alloc((Class)NSData);
    v4 = objc_msgSend(v7, "initWithBytes:length:", v6, v9);
    free(v6);
  }
  return v4;
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
  objc_storeStrong((id *)&self->_parameters, 0);
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
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), "CompanionProxyConfig");
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

@end
