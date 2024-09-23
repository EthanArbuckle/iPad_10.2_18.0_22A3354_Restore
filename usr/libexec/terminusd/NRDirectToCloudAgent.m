@implementation NRDirectToCloudAgent

- (void)dealloc
{
  id v3;
  void *v4;
  objc_super v5;

  if (qword_1001E46B0 != -1)
    dispatch_once(&qword_1001E46B0, &stru_1001B6AD8);
  if (_NRLogIsLevelEnabled(qword_1001E46A8, 0))
  {
    if (qword_1001E46B0 != -1)
      dispatch_once(&qword_1001E46B0, &stru_1001B6AD8);
    v3 = (id)qword_1001E46A8;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRDirectToCloudAgent agentDescription](self, "agentDescription"));
    _NRLogWithArgs(v3, 0, "%s%.30s:%-4d Dealloc: %@", ", "-[NRDirectToCloudAgent dealloc]", 69, v4);

  }
  sub_100069348((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)NRDirectToCloudAgent;
  -[NRDirectToCloudAgent dealloc](&v5, "dealloc");
}

- (BOOL)requiresAssert
{
  return 1;
}

- (id)copyAgentData
{
  return 0;
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
  v8[2] = sub_100068C50;
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
  _QWORD v7[4];
  id v8;
  NRDirectToCloudAgent *v9;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006869C;
  v7[3] = &unk_1001B8778;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

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
  objc_storeStrong((id *)&self->_directToCloudClientNames, 0);
  objc_storeStrong((id *)&self->_directToCloudClients, 0);
  objc_storeStrong((id *)&self->_wifiInterfaceName, 0);
  objc_storeStrong((id *)&self->_registrationObject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

+ (id)agentDomain
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), "com.apple.networkrelay");
}

+ (id)agentType
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), "DirectToCloud");
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

@end
