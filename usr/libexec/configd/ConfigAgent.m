@implementation ConfigAgent

+ (id)agentDomain
{
  return CFSTR("SystemConfig");
}

+ (id)agentType
{
  return CFSTR("ConfigAgent");
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

- (ConfigAgent)initWithParameters:(id)a3
{
  id v4;
  ConfigAgent *v5;
  void *v6;
  NWNetworkAgentRegistration *internalRegistrationObject;
  NSString *v8;
  NSString *internalAssociatedEntity;
  NSData *internalAgentData;
  id internalAgentMapping;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ConfigAgent;
  v5 = -[ConfigAgent init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("EntityName")));
    internalRegistrationObject = v5->_internalRegistrationObject;
    v5->_internalRegistrationObject = 0;

    v8 = (NSString *)objc_msgSend(v6, "copy");
    internalAssociatedEntity = v5->_internalAssociatedEntity;
    v5->_internalAssociatedEntity = v8;

    internalAgentData = v5->_internalAgentData;
    v5->_internalAgentData = 0;

    v5->_internalShouldUpdateAgent = 1;
    internalAgentMapping = v5->_internalAgentMapping;
    v5->_internalAgentMapping = 0;

    *(_DWORD *)&v5->active = 65537;
  }

  return v5;
}

- (void)addAgentRegistrationObject:(id)a3
{
  objc_storeStrong((id *)&self->_internalRegistrationObject, a3);
}

- (unint64_t)getAgentType
{
  return 0;
}

- (id)getAgentUUID
{
  return 0;
}

- (id)getAgentName
{
  return CFSTR("ConfigAgent");
}

- (unint64_t)getAgentSubType
{
  return 0;
}

- (id)getRegistrationObject
{
  return self->_internalRegistrationObject;
}

- (id)getAssociatedEntity
{
  return self->_internalAssociatedEntity;
}

- (id)getAgentData
{
  return self->_internalAgentData;
}

- (id)copyAgentData
{
  return self->_internalAgentData;
}

- (void)setAgentMapping:(id)a3
{
  objc_storeStrong(&self->_internalAgentMapping, a3);
}

- (id)getAgentMapping
{
  return self->_internalAgentMapping;
}

- (void)setStartHandler:(id)a3
{
  if (a3)
    -[ConfigAgent setInternalStartHandler:](self, "setInternalStartHandler:");
}

- (BOOL)startAgentWithOptions:(id)a3
{
  void *v5;
  unsigned __int8 v6;

  if (-[ConfigAgent isActive](self, "isActive", a3))
    return 0;
  -[ConfigAgent setActive:](self, "setActive:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConfigAgent internalRegistrationObject](self, "internalRegistrationObject"));
  v6 = objc_msgSend(v5, "updateNetworkAgent:", self);

  return v6;
}

- (void)updateAgentData:(id)a3
{
  BOOL v4;
  NSData *v5;
  NSData *internalAgentData;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_internalAgentData) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (NSData *)objc_msgSend(v7, "copy");
    internalAgentData = self->_internalAgentData;
    self->_internalAgentData = v5;

    v4 = 1;
  }
  self->_internalShouldUpdateAgent = v4;

}

- (BOOL)shouldUpdateAgent
{
  return self->_internalShouldUpdateAgent;
}

- (id)createUUIDForName:(id)a3
{
  const char *v3;
  CC_LONG v4;
  unsigned __int8 md[32];

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = strlen(v3);
  CC_SHA256(v3, v4, md);
  return objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", md);
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)agentDescription
{
  return self->agentDescription;
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

- (BOOL)isSpecificUseOnly
{
  return self->specificUseOnly;
}

- (void)setSpecificUseOnly:(BOOL)a3
{
  self->specificUseOnly = a3;
}

- (NEPolicySession)preferredPolicySession
{
  return (NEPolicySession *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPreferredPolicySession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NWNetworkAgentRegistration)internalRegistrationObject
{
  return self->_internalRegistrationObject;
}

- (void)setInternalRegistrationObject:(id)a3
{
  objc_storeStrong((id *)&self->_internalRegistrationObject, a3);
}

- (NSString)internalAssociatedEntity
{
  return self->_internalAssociatedEntity;
}

- (void)setInternalAssociatedEntity:(id)a3
{
  objc_storeStrong((id *)&self->_internalAssociatedEntity, a3);
}

- (NSData)internalAgentData
{
  return self->_internalAgentData;
}

- (void)setInternalAgentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)internalShouldUpdateAgent
{
  return self->_internalShouldUpdateAgent;
}

- (void)setInternalShouldUpdateAgent:(BOOL)a3
{
  self->_internalShouldUpdateAgent = a3;
}

- (id)internalStartHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setInternalStartHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (id)internalAgentMapping
{
  return self->_internalAgentMapping;
}

- (void)setInternalAgentMapping:(id)a3
{
  objc_storeStrong(&self->_internalAgentMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internalAgentMapping, 0);
  objc_storeStrong(&self->_internalStartHandler, 0);
  objc_storeStrong((id *)&self->_internalAgentData, 0);
  objc_storeStrong((id *)&self->_internalAssociatedEntity, 0);
  objc_storeStrong((id *)&self->_internalRegistrationObject, 0);
  objc_storeStrong((id *)&self->_preferredPolicySession, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

@end
