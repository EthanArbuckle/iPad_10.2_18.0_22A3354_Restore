@implementation NSPPrivacyProxyConfigAgent

+ (id)agentDomain
{
  if (qword_100112E10 != -1)
    dispatch_once(&qword_100112E10, &stru_1000F5D38);
  return (id)qword_100112E08;
}

+ (id)agentType
{
  if (qword_100112E20 != -1)
    dispatch_once(&qword_100112E20, &stru_1000F5D58);
  return (id)qword_100112E18;
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (id)copyAgentData
{
  NSPPrivacyProxyConfigAgent *v2;
  id v3;
  SEL v4;
  NSPPrivacyProxyConfigAgent *v5;
  id v6;
  unsigned int v8;
  char v9;

  if (self
    && (v2 = self,
        v3 = objc_getProperty(self, a2, 40, 1),
        self = (NSPPrivacyProxyConfigAgent *)objc_getProperty(v2, v4, 32, 1),
        v3))
  {
    v5 = (NSPPrivacyProxyConfigAgent *)-[NSPPrivacyProxyConfigAgent mutableCopy](self, "mutableCopy");
    v9 = 100;
    v8 = objc_msgSend(v3, "length");
    -[NSPPrivacyProxyConfigAgent appendBytes:length:](v5, "appendBytes:length:", &v9, 1);
    -[NSPPrivacyProxyConfigAgent appendBytes:length:](v5, "appendBytes:length:", &v8, 4);
    v6 = objc_msgSend(v3, "bytes");
    -[NSPPrivacyProxyConfigAgent appendBytes:length:](v5, "appendBytes:length:", v6, v8);
  }
  else
  {
    v5 = self;
    v3 = 0;
  }

  return v5;
}

+ (id)agentFromData:(id)a3
{
  id v3;
  NSPPrivacyProxyConfigAgent *v4;
  const char *v5;
  NSPPrivacyProxyConfigAgent *v6;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(NSPPrivacyProxyConfigAgent);
    v6 = v4;
    if (v4)
      objc_setProperty_atomic(v4, v5, v3, 32);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)tokenLowWaterMarkReached
{
  NSPPrivacyProxyConfigAgent *v2;
  NSPPrivacyProxyConfigAgent *v3;

  v2 = self;
  if (self)
    self = (NSPPrivacyProxyConfigAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  v3 = self;
  -[NSPPrivacyProxyConfigAgent tokenLowWaterMarkReachedForAgent:](self, "tokenLowWaterMarkReachedForAgent:", v2);

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
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_configurationHash, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

@end
