@implementation NRPreferWiFiAgent

- (NRPreferWiFiAgent)init
{
  NRPreferWiFiAgent *v2;
  NRPreferWiFiAgent *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *policyIdentifier;
  NSMutableDictionary *v10;
  NSMutableDictionary *clientUUIDToPathDictionary;
  NSCountedSet *v12;
  NSCountedSet *p2pClientUUIDSet;
  void *v14;
  void *v15;
  id v17;
  int IsLevelEnabled;
  id v19;
  uint64_t v20;
  char *v21;
  int *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)NRPreferWiFiAgent;
  v2 = -[NRPreferWiFiAgent init](&v26, "init");
  if (!v2)
  {
    v17 = sub_100060BFC();
    IsLevelEnabled = _NRLogIsLevelEnabled(v17, 16);

    if (IsLevelEnabled)
    {
      v19 = sub_100060BFC();
      _NRLogWithArgs(v19, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRPreferWiFiAgent init]", 36);

    }
    v20 = _os_log_pack_size(12);
    v21 = (char *)&v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    v22 = __error();
    v23 = _os_log_pack_fill(v21, v20, *v22, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v23 = 136446210;
    *(_QWORD *)(v23 + 4) = "-[NRPreferWiFiAgent init]";
    v24 = sub_100060BFC();
    _NRLogAbortWithPack(v24, v21);
  }
  v3 = v2;
  -[NRPreferWiFiAgent setActive:](v2, "setActive:", 0);
  -[NRPreferWiFiAgent setKernelActivated:](v3, "setKernelActivated:", 1);
  -[NRPreferWiFiAgent setUserActivated:](v3, "setUserActivated:", 1);
  -[NRPreferWiFiAgent setVoluntary:](v3, "setVoluntary:", 1);
  -[NRPreferWiFiAgent setNetworkProvider:](v3, "setNetworkProvider:", 1);
  -[NRPreferWiFiAgent setSpecificUseOnly:](v3, "setSpecificUseOnly:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  -[NRPreferWiFiAgent setAgentUUID:](v3, "setAgentUUID:", v4);

  v5 = objc_alloc((Class)NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRPreferWiFiAgent agentUUID](v3, "agentUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (NSString *)objc_msgSend(v5, "initWithFormat:", CFSTR("NRPreferWiFiAgent-%@"), v7);
  policyIdentifier = v3->_policyIdentifier;
  v3->_policyIdentifier = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  clientUUIDToPathDictionary = v3->_clientUUIDToPathDictionary;
  v3->_clientUUIDToPathDictionary = v10;

  v12 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
  p2pClientUUIDSet = v3->_p2pClientUUIDSet;
  v3->_p2pClientUUIDSet = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRPreferWiFiAgent agentUUID](v3, "agentUUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
  sub_100121E18(0, 15001, 0, v15);

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (qword_1001E4640 != -1)
    dispatch_once(&qword_1001E4640, &stru_1001B6970);
  if (_NRLogIsLevelEnabled(qword_1001E4638, 1))
  {
    if (qword_1001E4640 != -1)
      dispatch_once(&qword_1001E4640, &stru_1001B6970);
    _NRLogWithArgs(qword_1001E4638, 1, "%s%.30s:%-4d Dealloc: %@", ", "-[NRPreferWiFiAgent dealloc]", 55, self);
  }
  if (self)
  {
    if (self->_isRegistered)
    {
      if (qword_1001E4640 != -1)
        dispatch_once(&qword_1001E4640, &stru_1001B6970);
      if (_NRLogIsLevelEnabled(qword_1001E4638, 17))
      {
        if (qword_1001E4640 != -1)
          dispatch_once(&qword_1001E4640, &stru_1001B6970);
        _NRLogWithArgs(qword_1001E4638, 17, "Prefer Wi-Fi agent getting dealloc'd without unregistering");
      }
    }
    self->_invalidated = 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)NRPreferWiFiAgent;
  -[NRPreferWiFiAgent dealloc](&v3, "dealloc");
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t assertCount;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRPreferWiFiAgent agentUUID](self, "agentUUID"));
  objc_msgSend(v3, "appendFormat:", CFSTR("agent UUID: %@\n"), v4);

  if (self)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("registration handle: %@\n"), self->_registrationObject);
    assertCount = self->_assertCount;
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("registration handle: %@\n"), 0);
    assertCount = 0;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("assert count: %d\n"), assertCount);
  return v3;
}

- (id)copyAgentData
{
  return 0;
}

- (BOOL)startAgentWithOptions:(id)a3
{
  id v4;
  NRPreferWiFiAgent *v5;
  id v6;
  char IsLevelEnabled;
  id v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (qword_1001E4640 != -1)
    dispatch_once(&qword_1001E4640, &stru_1001B6970);
  v6 = (id)qword_1001E4638;
  IsLevelEnabled = _NRLogIsLevelEnabled(v6, 1);

  if ((IsLevelEnabled & 1) != 0)
  {
    if (qword_1001E4640 != -1)
      dispatch_once(&qword_1001E4640, &stru_1001B6970);
    v8 = (id)qword_1001E4638;
    _NRLogWithArgs(v8, 1, "%s%.30s:%-4d Received start agent request", ", "-[NRPreferWiFiAgent startAgentWithOptions:]", 242);

  }
  objc_sync_exit(v5);

  return 0;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v4;
  NRPreferWiFiAgent *v5;
  NSObject *queue;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5)
    queue = v5->_queue;
  else
    queue = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100060808;
  v9[3] = &unk_1001B8778;
  v9[4] = v5;
  v10 = v4;
  v7 = v4;
  dispatch_async(queue, v9);

  objc_sync_exit(v5);
  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  id v4;
  NRPreferWiFiAgent *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5)
    queue = v5->_queue;
  else
    queue = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100060198;
  v8[3] = &unk_1001B8778;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

  objc_sync_exit(v5);
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_p2pClientUUIDSet, 0);
  objc_storeStrong((id *)&self->_clientUUIDToPathDictionary, 0);
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
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
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), "PreferWiFi");
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

@end
