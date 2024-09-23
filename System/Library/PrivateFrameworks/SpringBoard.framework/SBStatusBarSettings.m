@implementation SBStatusBarSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

- (NSSet)backgroundActivitiesToSuppress
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSSet *)v5;
}

uint64_t __31__SBStatusBarSettings_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "alpha");
}

uint64_t __31__SBStatusBarSettings_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backgroundActivitiesToSuppress");
}

uint64_t __31__SBStatusBarSettings_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "legibilitySettings");
}

uint64_t __31__SBStatusBarSettings_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "style");
}

- (id)_initWithBSSettings:(id)a3
{
  id v4;
  SBStatusBarSettings *v5;
  uint64_t v6;
  BSMutableSettings *settings;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBStatusBarSettings;
  v5 = -[SBStatusBarSettings init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    settings = v5->_settings;
    v5->_settings = (BSMutableSettings *)v6;

    -[BSMutableSettings setDescriptionProvider:](v5->_settings, "setDescriptionProvider:", v5);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BSMutableSettings setDescriptionProvider:](self->_settings, "setDescriptionProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBStatusBarSettings;
  -[SBStatusBarSettings dealloc](&v3, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBStatusBarSettings _initWithBSSettings:]([SBMutableStatusBarSettings alloc], "_initWithBSSettings:", self->_settings);
}

- (NSNumber)alpha
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &unk_1E91D1C40;
  v4 = v2;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SBStatusBarSettings *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SBStatusBarSettings *v8;
  id v9;
  int64_t v10;
  SBStatusBarSettings *v11;
  id v12;
  void *v13;
  SBStatusBarSettings *v14;
  id v15;
  void *v16;
  id v17;
  char v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  SBStatusBarSettings *v24;
  _QWORD v25[4];
  SBStatusBarSettings *v26;
  _QWORD v27[4];
  SBStatusBarSettings *v28;
  _QWORD v29[4];
  SBStatusBarSettings *v30;

  v4 = (SBStatusBarSettings *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBStatusBarSettings alpha](self, "alpha");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __31__SBStatusBarSettings_isEqual___block_invoke;
    v29[3] = &unk_1E8E9E6B0;
    v8 = v4;
    v30 = v8;
    v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v29);

    v10 = -[SBStatusBarSettings style](self, "style");
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __31__SBStatusBarSettings_isEqual___block_invoke_2;
    v27[3] = &unk_1E8E9EAA0;
    v11 = v8;
    v28 = v11;
    v12 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v10, v27);
    -[SBStatusBarSettings legibilitySettings](self, "legibilitySettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __31__SBStatusBarSettings_isEqual___block_invoke_3;
    v25[3] = &unk_1E8E9E6B0;
    v14 = v11;
    v26 = v14;
    v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", v13, v25);

    -[SBStatusBarSettings backgroundActivitiesToSuppress](self, "backgroundActivitiesToSuppress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v7;
    v21 = 3221225472;
    v22 = __31__SBStatusBarSettings_isEqual___block_invoke_4;
    v23 = &unk_1E8E9E6B0;
    v24 = v14;
    v17 = (id)objc_msgSend(v5, "appendObject:counterpart:", v16, &v20);

    v18 = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);
  }

  return v18;
}

- (int64_t)style
{
  void *v2;
  void *v3;
  int64_t v4;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  return (_UILegibilitySettings *)-[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 3);
}

void __49__SBStatusBarSettings_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alpha");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:skipIfNil:", v3, CFSTR("alpha"), 1);

}

void __61__SBStatusBarSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "stringForStatusBarStyle:", objc_msgSend(*(id *)(a1 + 40), "style"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, CFSTR("style"), 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "legibilitySettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("legibilitySettings"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "backgroundActivitiesToSuppress");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  STBackgroundActivityIdentifiersDescription();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:skipIfEmpty:", v9, CFSTR("backgroundActivitiesToSuppress"), 1);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBStatusBarSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBStatusBarSettings *v11;

  v4 = a3;
  -[SBStatusBarSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SBStatusBarSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SBStatusBarSettings *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SBStatusBarSettings_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E8E9E820;
  v4 = v3;
  v9 = v4;
  v10 = self;
  v5 = (id)objc_msgSend(v4, "modifyProem:", v8);
  v6 = v4;

  return v6;
}

- (BSSettings)_BSSettings
{
  return self->_settings;
}

- (SBStatusBarSettings)init
{
  id v3;
  SBStatusBarSettings *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D01850]);
  v4 = -[SBStatusBarSettings _initWithBSSettings:](self, "_initWithBSSettings:", v3);

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStatusBarSettings alpha](self, "alpha");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBStatusBarSettings style](self, "style"));
  -[SBStatusBarSettings legibilitySettings](self, "legibilitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:", v7);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SBStatusBarSettings backgroundActivitiesToSuppress](self, "backgroundActivitiesToSuppress", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = (id)objc_msgSend(v3, "appendObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = objc_msgSend(v3, "hash");
  return v15;
}

- (NSString)description
{
  return (NSString *)-[SBStatusBarSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBStatusBarSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBStatusBarSettings _initWithBSSettings:]([SBStatusBarSettings alloc], "_initWithBSSettings:", self->_settings);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return off_1E8EBB2B8[a3 - 1];
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = v7;
  switch(a5)
  {
    case 1uLL:
      objc_msgSend(v7, "description");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CEA2F8], "stringForStatusBarStyle:", objc_msgSend(v7, "integerValue"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3uLL:
      objc_msgSend(v7, "sb_description");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v10 = (void *)v9;
      break;
    case 4uLL:
      -[SBStatusBarSettings backgroundActivitiesToSuppress](self, "backgroundActivitiesToSuppress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      STBackgroundActivityIdentifiersDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

@end
