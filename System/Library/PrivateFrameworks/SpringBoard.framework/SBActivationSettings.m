@implementation SBActivationSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)setObject:(id)a3 forActivationSetting:(unsigned int)a4
{
  -[BSMutableSettings setObject:forSetting:](self->_settings, "setObject:forSetting:", a3, a4);
}

- (void)applyActivationSettings:(id)a3
{
  if (a3)
    -[BSMutableSettings applySettings:](self->_settings, "applySettings:", *((_QWORD *)a3 + 1));
}

- (BOOL)BOOLForActivationSetting:(unsigned int)a3
{
  return -[BSMutableSettings BOOLForSetting:](self->_settings, "BOOLForSetting:", a3);
}

- (id)objectForActivationSetting:(unsigned int)a3
{
  return (id)-[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", a3);
}

- (void)setFlag:(int64_t)a3 forActivationSetting:(unsigned int)a4
{
  -[BSMutableSettings setFlag:forSetting:](self->_settings, "setFlag:forSetting:", a3, a4);
}

- (int64_t)flagForActivationSetting:(unsigned int)a3
{
  return -[BSMutableSettings flagForSetting:](self->_settings, "flagForSetting:", a3);
}

- (SBActivationSettings)init
{
  SBActivationSettings *v2;
  BSMutableSettings *v3;
  BSMutableSettings *settings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBActivationSettings;
  v2 = -[SBActivationSettings init](&v6, sel_init);
  if (v2)
  {
    v3 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x1E0D017D0]);
    settings = v2->_settings;
    v2->_settings = v3;

    -[BSMutableSettings setDescriptionProvider:](v2->_settings, "setDescriptionProvider:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BSMutableSettings setDescriptionProvider:](self->_settings, "setDescriptionProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBActivationSettings;
  -[SBActivationSettings dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "applyActivationSettings:", self);
  return v4;
}

- (BOOL)isEmpty
{
  return -[BSMutableSettings isEmpty](self->_settings, "isEmpty");
}

- (id)copyActivationSettings
{
  return -[SBActivationSettings copyActivationSettingsPassingFilter:](self, "copyActivationSettingsPassingFilter:", 0);
}

- (id)copyActivationSettingsPassingFilter:(id)a3
{
  id v4;
  SBActivationSettings *v5;
  BSMutableSettings *settings;
  uint64_t v7;
  id v8;
  SBActivationSettings *v9;
  BSMutableSettings *v10;
  SBActivationSettings *v11;
  id v12;
  SBActivationSettings *v13;
  SBActivationSettings *v14;
  _QWORD v16[4];
  SBActivationSettings *v17;
  id v18;
  _QWORD v19[4];
  SBActivationSettings *v20;
  id v21;

  v4 = a3;
  v5 = objc_alloc_init(SBActivationSettings);
  settings = self->_settings;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__SBActivationSettings_copyActivationSettingsPassingFilter___block_invoke;
  v19[3] = &unk_1E8EB6B40;
  v8 = v4;
  v21 = v8;
  v9 = v5;
  v20 = v9;
  -[BSMutableSettings enumerateFlagsWithBlock:](settings, "enumerateFlagsWithBlock:", v19);
  v10 = self->_settings;
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __60__SBActivationSettings_copyActivationSettingsPassingFilter___block_invoke_2;
  v16[3] = &unk_1E8EB6B68;
  v18 = v8;
  v11 = v9;
  v17 = v11;
  v12 = v8;
  -[BSMutableSettings enumerateObjectsWithBlock:](v10, "enumerateObjectsWithBlock:", v16);
  v13 = v17;
  v14 = v11;

  return v14;
}

uint64_t __60__SBActivationSettings_copyActivationSettingsPassingFilter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;

  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
    return objc_msgSend(*(id *)(a1 + 32), "setFlag:forActivationSetting:", a3, a2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setFlag:forActivationSetting:", a3, a2);
  return result;
}

void __60__SBActivationSettings_copyActivationSettingsPassingFilter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v5;
  if (!v6 || (v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2), v8 = v9, v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forActivationSetting:", v9, a2);
    v8 = v9;
  }

}

- (void)clearActivationSettings
{
  -[BSMutableSettings removeAllSettings](self->_settings, "removeAllSettings");
}

- (unint64_t)hash
{
  return 167 * -[BSMutableSettings hash](self->_settings, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SBActivationSettings *v4;
  char v5;

  v4 = (SBActivationSettings *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[BSMutableSettings isEqual:](self->_settings, "isEqual:", v4->_settings);
    else
      v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)-[SBActivationSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBActivationSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBActivationSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  SBActivationSettings *v11;

  v4 = a3;
  -[SBActivationSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  settings = self->_settings;
  if (settings && (-[BSMutableSettings isEmpty](settings, "isEmpty") & 1) == 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__SBActivationSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
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

id __62__SBActivationSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), 0);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 > 0x49)
    return 0;
  else
    return off_1E8EB6B88[a3];
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

- (BOOL)_settingsAreValidToMoveContentToNewScene
{
  BOOL v3;
  BOOL v4;

  v3 = -[SBActivationSettings BOOLForActivationSetting:](self, "BOOLForActivationSetting:", 66);
  v4 = -[SBActivationSettings BOOLForActivationSetting:](self, "BOOLForActivationSetting:", 67);
  return (v3 && v4) & -[SBActivationSettings BOOLForActivationSetting:](self, "BOOLForActivationSetting:", 31);
}

@end
