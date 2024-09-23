@implementation SBLockScreenPluginContext

+ (id)contextWithName:(id)a3
{
  id v3;
  SBLockScreenPluginContext *v4;

  v3 = a3;
  v4 = objc_alloc_init(SBLockScreenPluginContext);
  -[SBLockScreenPluginContext setName:](v4, "setName:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBLockScreenPluginContext *v4;

  v4 = objc_alloc_init(SBLockScreenPluginContext);
  -[SBLockScreenPluginContext setName:](v4, "setName:", self->_name);
  -[SBLockScreenPluginContext setUserInfo:](v4, "setUserInfo:", self->_userInfo);
  -[SBLockScreenPluginContext setProcess:](v4, "setProcess:", self->_process);
  -[SBLockScreenPluginContext setAuxiliaryAnimation:](v4, "setAuxiliaryAnimation:", self->_auxiliaryAnimation);
  return v4;
}

- (NSString)description
{
  return (NSString *)-[SBLockScreenPluginContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLockScreenPluginContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_name, CFSTR("name"));
  FBSProcessPrettyDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("process"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBLockScreenPluginContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  SBLockScreenPluginContext *v10;

  v4 = a3;
  -[SBLockScreenPluginContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_userInfo)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __67__SBLockScreenPluginContext_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_24D4D06C0;
    v9 = v5;
    v10 = self;
    objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v8);

  }
  return v6;
}

uint64_t __67__SBLockScreenPluginContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("userInfo"), 1);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (FBSProcess)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
  objc_storeStrong((id *)&self->_process, a3);
}

- (id)auxiliaryAnimation
{
  return self->_auxiliaryAnimation;
}

- (void)setAuxiliaryAnimation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SBLockScreenPluginLifecycleObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong(&self->_auxiliaryAnimation, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
