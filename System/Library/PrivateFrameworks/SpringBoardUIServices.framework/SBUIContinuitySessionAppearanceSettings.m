@implementation SBUIContinuitySessionAppearanceSettings

- (SBUIContinuitySessionAppearanceSettings)init
{
  id v3;
  SBUIContinuitySessionAppearanceSettings *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D01850]);
  v4 = (SBUIContinuitySessionAppearanceSettings *)-[SBUIContinuitySessionAppearanceSettings _initWithBSSettings:]((id *)&self->super.isa, v3);

  return v4;
}

- (id)_initWithBSSettings:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v8;
  objc_super v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithBSSettings_, a1, CFSTR("SBUIContinuitySessionAppearanceSettings.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

    }
    v9.receiver = a1;
    v9.super_class = (Class)SBUIContinuitySessionAppearanceSettings;
    a1 = (id *)objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v5 = objc_msgSend(v4, "mutableCopy");
      v6 = a1[1];
      a1[1] = (id)v5;

      objc_msgSend(a1[1], "setDescriptionProvider:", a1);
    }
  }

  return a1;
}

- (void)dealloc
{
  objc_super v3;

  -[BSMutableSettings setDescriptionProvider:](self->_mutableSettings, "setDescriptionProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBUIContinuitySessionAppearanceSettings;
  -[SBUIContinuitySessionAppearanceSettings dealloc](&v3, sel_dealloc);
}

- (int64_t)userInterfaceStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[BSMutableSettings objectForSetting:](self->_mutableSettings, "objectForSetting:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SBUIContinuitySessionAppearanceSettings *v4;
  void *v5;
  int64_t v6;
  id v7;
  char v8;
  _QWORD v10[4];
  SBUIContinuitySessionAppearanceSettings *v11;

  v4 = (SBUIContinuitySessionAppearanceSettings *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBUIContinuitySessionAppearanceSettings userInterfaceStyle](self, "userInterfaceStyle");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__SBUIContinuitySessionAppearanceSettings_isEqual___block_invoke;
    v10[3] = &unk_1E4C40270;
    v11 = v4;
    v7 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v6, v10);
    v8 = objc_msgSend(v5, "isEqual");

  }
  return v8;
}

uint64_t __51__SBUIContinuitySessionAppearanceSettings_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userInterfaceStyle");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBUIContinuitySessionAppearanceSettings userInterfaceStyle](self, "userInterfaceStyle"));
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBUIContinuitySessionAppearanceSettings _initWithBSSettings:]((id *)[SBUIContinuitySessionAppearanceSettings alloc], self->_mutableSettings);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBUIContinuitySessionAppearanceSettings _initWithBSSettings:]((id *)[SBUIMutableContinuitySessionAppearanceSettings alloc], self->_mutableSettings);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  BSMutableSettings *mutableSettings;
  id v4;
  id v5;

  mutableSettings = self->_mutableSettings;
  v4 = a3;
  v5 = (id)-[BSMutableSettings copy](mutableSettings, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("settings"));

}

- (SBUIContinuitySessionAppearanceSettings)initWithBSXPCCoder:(id)a3
{
  id v5;
  void *v6;
  SBUIContinuitySessionAppearanceSettings *v7;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIContinuitySessionAppearanceSettings.m"), 113, CFSTR("Unable to decode settings"));

  }
  v7 = (SBUIContinuitySessionAppearanceSettings *)-[SBUIContinuitySessionAppearanceSettings _initWithBSSettings:]((id *)&self->super.isa, v6);

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0D01750];
    objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "descriptionForRootObject:withStyle:", v1, v3);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBUIContinuitySessionAppearanceSettings *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__SBUIContinuitySessionAppearanceSettings_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E4C3E6A0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

void __69__SBUIContinuitySessionAppearanceSettings_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInterfaceStyle");
  SBFStringForUIUserInterfaceStyle();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:withName:", v2, CFSTR("userInterfaceStyle"));

}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("userInterfaceStyle");
  else
    return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a5 != 1)
    return 0;
  objc_msgSend(a4, "integerValue", a3, v5, v6);
  SBFStringForUIUserInterfaceStyle();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSettings, 0);
}

@end
