@implementation NRBTLinkPreferencesAgent

- (void)dealloc
{
  objc_super v3;

  sub_1000656E4((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NRBTLinkPreferencesAgent;
  -[NRBTLinkPreferencesAgent dealloc](&v3, "dealloc");
}

- (id)copyAgentData
{
  return 0;
}

- (BOOL)requiresAssert
{
  return 1;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100065334;
  v8[3] = &unk_1001B8778;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_async(queue, v8);

  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100064F40;
  v7[3] = &unk_1001B8778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientUUIDSet, 0);
  objc_storeStrong((id *)&self->_linkPreferencesClientDictionary, 0);
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_registrationObject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

+ (id)agentType
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), "CompanionBTLinkPreferencesAgent");
}

+ (id)agentDomain
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("com.apple.networkrelay"));
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

@end
