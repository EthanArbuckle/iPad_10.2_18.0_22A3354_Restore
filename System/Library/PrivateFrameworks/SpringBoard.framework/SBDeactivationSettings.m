@implementation SBDeactivationSettings

- (SBDeactivationSettings)init
{
  SBDeactivationSettings *v2;
  BSMutableSettings *v3;
  BSMutableSettings *settings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDeactivationSettings;
  v2 = -[SBDeactivationSettings init](&v6, sel_init);
  if (v2)
  {
    v3 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x1E0D017D0]);
    settings = v2->_settings;
    v2->_settings = v3;

    -[BSMutableSettings setDescriptionProvider:](v2->_settings, "setDescriptionProvider:", v2);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "applyDeactivationSettings:", self);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[BSMutableSettings setDescriptionProvider:](self->_settings, "setDescriptionProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBDeactivationSettings;
  -[SBDeactivationSettings dealloc](&v3, sel_dealloc);
}

- (BOOL)isEmpty
{
  return -[BSMutableSettings isEmpty](self->_settings, "isEmpty");
}

- (void)setFlag:(int64_t)a3 forDeactivationSetting:(unsigned int)a4
{
  -[BSMutableSettings setFlag:forSetting:](self->_settings, "setFlag:forSetting:", a3, a4);
}

- (int64_t)flagForDeactivationSetting:(unsigned int)a3
{
  return -[BSMutableSettings flagForSetting:](self->_settings, "flagForSetting:", a3);
}

- (BOOL)BOOLForDeactivationSetting:(unsigned int)a3
{
  return -[BSMutableSettings BOOLForSetting:](self->_settings, "BOOLForSetting:", a3);
}

- (void)setObject:(id)a3 forDeactivationSetting:(unsigned int)a4
{
  -[BSMutableSettings setObject:forSetting:](self->_settings, "setObject:forSetting:", a3, a4);
}

- (id)objectForDeactivationSetting:(unsigned int)a3
{
  return (id)-[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", a3);
}

- (void)applyDeactivationSettings:(id)a3
{
  if (a3)
    -[BSMutableSettings applySettings:](self->_settings, "applySettings:", *((_QWORD *)a3 + 1));
}

- (void)clearDeactivationSettings
{
  -[BSMutableSettings removeAllSettings](self->_settings, "removeAllSettings");
}

- (NSString)description
{
  return (NSString *)-[SBDeactivationSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDeactivationSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBDeactivationSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  BSMutableSettings *settings;
  id v7;
  _QWORD v9[4];
  id v10;
  SBDeactivationSettings *v11;

  v4 = a3;
  -[SBDeactivationSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  settings = self->_settings;
  if (settings && (-[BSMutableSettings isEmpty](settings, "isEmpty") & 1) == 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__SBDeactivationSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E8E9E820;
    v10 = v5;
    v11 = self;
    objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  }
  else
  {
    v7 = (id)objc_msgSend(v5, "appendObject:withName:", CFSTR("(empty)"), 0);
  }

  return v5;
}

id __64__SBDeactivationSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), 0);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 > 9)
    return 0;
  else
    return off_1E8EAF868[a3];
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
