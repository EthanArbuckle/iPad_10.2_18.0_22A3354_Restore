@implementation WiFiUserInteractionMonitorNetworkAgent

- (BOOL)isActive
{
  return self->active;
}

+ (id)agentDomain
{
  return CFSTR("WiFiUserInteractionMonitor");
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

+ (id)agentType
{
  return CFSTR("WiFiTrafficAssertion");
}

- (id)copyAgentData
{
  return 0;
}

- (WiFiUserInteractionMonitorNetworkAgent)initWithUUID:(id)a3 andDescription:(id)a4
{
  id v6;
  id v7;
  WiFiUserInteractionMonitorNetworkAgent *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WiFiUserInteractionMonitorNetworkAgent;
  v8 = -[WiFiUserInteractionMonitorNetworkAgent init](&v16, "init");
  if (!v8)
    goto LABEL_5;
  v9 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v6);
  -[WiFiUserInteractionMonitorNetworkAgent setAgentUUID:](v8, "setAgentUUID:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent agentUUID](v8, "agentUUID"));
  if (!v10)
    goto LABEL_5;
  v11 = objc_msgSend(objc_alloc((Class)NWNetworkAgentRegistration), "initWithNetworkAgentClass:", objc_opt_class(WiFiUserInteractionMonitorNetworkAgent));
  -[WiFiUserInteractionMonitorNetworkAgent setRegistration:](v8, "setRegistration:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent registration](v8, "registration"));
  if (!v12)
    goto LABEL_5;
  -[WiFiUserInteractionMonitorNetworkAgent setAgentDescription:](v8, "setAgentDescription:", v7);
  -[WiFiUserInteractionMonitorNetworkAgent setActive:](v8, "setActive:", 0);
  -[WiFiUserInteractionMonitorNetworkAgent setKernelActivated:](v8, "setKernelActivated:", 1);
  -[WiFiUserInteractionMonitorNetworkAgent setUserActivated:](v8, "setUserActivated:", 1);
  -[WiFiUserInteractionMonitorNetworkAgent setVoluntary:](v8, "setVoluntary:", 1);
  -[WiFiUserInteractionMonitorNetworkAgent setSpecificUseOnly:](v8, "setSpecificUseOnly:", 1);
  -[WiFiUserInteractionMonitorNetworkAgent setNetworkProvider:](v8, "setNetworkProvider:", 0);
  -[WiFiUserInteractionMonitorNetworkAgent setAssertCount:](v8, "setAssertCount:", 0);
  -[WiFiUserInteractionMonitorNetworkAgent setAvcMinJB:](v8, "setAvcMinJB:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent registration](v8, "registration"));
  v14 = objc_msgSend(v13, "registerNetworkAgent:", v8);

  if ((v14 & 1) == 0)
  {
LABEL_5:

    v8 = 0;
  }

  return v8;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = -[WiFiUserInteractionMonitorNetworkAgent avcMinJB](self, "avcMinJB");
  -[WiFiUserInteractionMonitorNetworkAgent setAssertCount:](self, "setAssertCount:", (char *)-[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount") + 1);
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: received AVC assert, assertCount=%lu", "-[WiFiUserInteractionMonitorNetworkAgent assertAgentWithOptions:]", -[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount"));
  objc_autoreleasePoolPop(v6);
  if (!v4)
  {
    v17 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null userInfo", "-[WiFiUserInteractionMonitorNetworkAgent assertAgentWithOptions:]");
    goto LABEL_18;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", NWNetworkAgentStartOptionClientUUID));
  if (!v7)
  {
    v17 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null clientUUID", "-[WiFiUserInteractionMonitorNetworkAgent assertAgentWithOptions:]");
LABEL_18:
    objc_autoreleasePoolPop(v17);
    goto LABEL_8;
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](NWPath, "pathForClientID:", v7));
  if (v9)
  {
    v10 = v9;

  }
  else
  {
    v18 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null clientPath", "-[WiFiUserInteractionMonitorNetworkAgent assertAgentWithOptions:]");
    objc_autoreleasePoolPop(v18);
  }

LABEL_8:
  if (-[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount")
    && !-[WiFiUserInteractionMonitorNetworkAgent isActive](self, "isActive")
    || v5 != (void *)-[WiFiUserInteractionMonitorNetworkAgent avcMinJB](self, "avcMinJB"))
  {
    -[WiFiUserInteractionMonitorNetworkAgent setActive:](self, "setActive:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent registration](self, "registration"));
    objc_msgSend(v11, "updateNetworkAgent:", self);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "callback"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
      ((void (**)(_QWORD, id, uint64_t))v14)[2](v14, objc_msgSend(v15, "context"), 1);

    }
  }

  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  id v10;

  v10 = a3;
  if (-[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount"))
    -[WiFiUserInteractionMonitorNetworkAgent setAssertCount:](self, "setAssertCount:", (char *)-[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount") - 1);
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: received AVC unassert, assertCount=%lu", "-[WiFiUserInteractionMonitorNetworkAgent unassertAgentWithOptions:]", -[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount"));
  objc_autoreleasePoolPop(v4);
  if (!-[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount"))
  {
    if (-[WiFiUserInteractionMonitorNetworkAgent isActive](self, "isActive"))
    {
      -[WiFiUserInteractionMonitorNetworkAgent setActive:](self, "setActive:", 0);
      -[WiFiUserInteractionMonitorNetworkAgent setAvcMinJB:](self, "setAvcMinJB:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent registration](self, "registration"));
      objc_msgSend(v5, "updateNetworkAgent:", self);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
        v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "callback"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
        ((void (**)(_QWORD, id, uint64_t))v8)[2](v8, objc_msgSend(v9, "context"), 1);

      }
    }
  }

}

- (void)registerStateChangeCallback:(id)a3 withCallbackContext:(void *)a4
{
  void *v6;
  void *v7;
  id v8;
  WiFiUserInteractionMonitorClient *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)qword_10026DD20;
  if (qword_10026DD20)
  {
    v8 = objc_retainBlock(v12);
    objc_msgSend(v7, "WFLog:message:", 3, "%s: callback %@, context %@", "-[WiFiUserInteractionMonitorNetworkAgent registerStateChangeCallback:withCallbackContext:]", v8, a4);

  }
  objc_autoreleasePoolPop(v6);
  v9 = objc_alloc_init(WiFiUserInteractionMonitorClient);
  -[WiFiUserInteractionMonitorNetworkAgent setClient:](self, "setClient:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
  objc_msgSend(v10, "setCallback:", v12);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitorNetworkAgent client](self, "client"));
  objc_msgSend(v11, "setContext:", a4);

}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
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

- (unint64_t)assertCount
{
  return self->_assertCount;
}

- (void)setAssertCount:(unint64_t)a3
{
  self->_assertCount = a3;
}

- (unint64_t)avcMinJB
{
  return self->_avcMinJB;
}

- (void)setAvcMinJB:(unint64_t)a3
{
  self->_avcMinJB = a3;
}

- (NWNetworkAgentRegistration)registration
{
  return self->_registration;
}

- (void)setRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_registration, a3);
}

- (WiFiUserInteractionMonitorClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
}

@end
