@implementation SBAppSwitcherServiceManager

- (id)registeredServicesSnapshot
{
  return (id)-[SBAppSwitcherServiceSet copy](self->_services, "copy");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_12);
  return (id)sharedInstance___manager;
}

uint64_t __45__SBAppSwitcherServiceManager_sharedInstance__block_invoke()
{
  SBAppSwitcherServiceManager *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBAppSwitcherServiceManager);
  v1 = (void *)sharedInstance___manager;
  sharedInstance___manager = (uint64_t)v0;

  return kdebug_trace();
}

- (void)registerService:(id)a3
{
  id v4;
  SBAppSwitcherServiceSet *services;
  SBAppSwitcherServiceSet *v6;
  SBAppSwitcherServiceSet *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  services = self->_services;
  if (!services)
  {
    v6 = objc_alloc_init(SBAppSwitcherServiceSet);
    v7 = self->_services;
    self->_services = v6;

    services = self->_services;
  }
  -[SBAppSwitcherServiceSet addService:](services, "addService:", v4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("AppSwitcherService");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("AppSwitcherServiceAdded"), self, v9);

}

- (void)unregisterService:(id)a3
{
  SBAppSwitcherServiceSet *services;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  services = self->_services;
  v5 = a3;
  -[SBAppSwitcherServiceSet removeService:](services, "removeService:", v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("AppSwitcherService");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("AppSwitcherServiceRemoved"), self, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
}

@end
