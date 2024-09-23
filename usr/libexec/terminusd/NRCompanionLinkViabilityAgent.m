@implementation NRCompanionLinkViabilityAgent

- (void)dealloc
{
  NRCompanionLinkViabilityAgent *v2;
  void *v3;
  int IsLevelEnabled;
  uint64_t v5;
  NSUUID *nrUUID;
  NSUUID *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSUUID *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v2 = self;
  if (self)
    self = (NRCompanionLinkViabilityAgent *)self->_nrUUID;
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
    _NRLogWithArgs(v9, 0, "%s%.30s:%-4d Dealloc: %@", ", "-[NRCompanionLinkViabilityAgent dealloc]", 65, v2);

  }
  if (v2)
  {
    if (v2->_isRegistered)
    {
      v10 = (void *)_NRCopyLogObjectForNRUUID(v2->_nrUUID, v5);
      v11 = _NRLogIsLevelEnabled(v10, 17);

      if (v11)
      {
        v12 = v2->_nrUUID;
        v14 = (void *)_NRCopyLogObjectForNRUUID(v12, v13);
        _NRLogWithArgs(v14, 17, "Agent dealloc'd while registered: %@", v2);

      }
    }
  }
  v15.receiver = v2;
  v15.super_class = (Class)NRCompanionLinkViabilityAgent;
  -[NRCompanionLinkViabilityAgent dealloc](&v15, "dealloc");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  const char *v6;
  id v7;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRCompanionLinkViabilityAgent agentUUID](self, "agentUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  objc_msgSend(v3, "appendFormat:", CFSTR("agent-uuid: %@"), v5);

  v6 = "";
  if (self && self->_isRegistered)
    v6 = ", R";
  objc_msgSend(v3, "appendFormat:", CFSTR("%s"), v6);
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("[%@]"), v3);

  return v7;
}

- (id)copyAgentData
{
  return 0;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067B90;
  block[3] = &unk_1001B8AE0;
  block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067AF0;
  block[3] = &unk_1001B8AE0;
  block[4] = self;
  dispatch_async(queue, block);
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
  objc_storeStrong((id *)&self->_localDeviceStringForLogging, 0);
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
  objc_storeStrong((id *)&self->_registrationObject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

+ (id)agentType
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), "CmpLnkViability");
}

+ (id)agentDomain
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), "com.apple.networkrelay");
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

@end
