@implementation SBUIContinuitySessionTransitionContext

- (SBUIContinuitySessionTransitionContext)init
{
  id v3;
  SBUIContinuitySessionTransitionContext *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D01850]);
  v4 = -[SBUIContinuitySessionTransitionContext _initWithBSSettings:](self, "_initWithBSSettings:", v3);

  return v4;
}

- (id)_initWithBSSettings:(id)a3
{
  id v5;
  SBUIContinuitySessionTransitionContext *v6;
  uint64_t v7;
  BSMutableSettings *mutableSettings;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIContinuitySessionAppearanceSettings.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBUIContinuitySessionTransitionContext;
  v6 = -[SBUIContinuitySessionTransitionContext init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "mutableCopy");
    mutableSettings = v6->_mutableSettings;
    v6->_mutableSettings = (BSMutableSettings *)v7;

    -[BSMutableSettings setDescriptionProvider:](v6->_mutableSettings, "setDescriptionProvider:", v6);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[BSMutableSettings setDescriptionProvider:](self->_mutableSettings, "setDescriptionProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBUIContinuitySessionTransitionContext;
  -[SBUIContinuitySessionTransitionContext dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  SBUIContinuitySessionTransitionContext *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  SBUIContinuitySessionTransitionContext *v11;

  v4 = (SBUIContinuitySessionTransitionContext *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIContinuitySessionTransitionContext animationSettings](self, "animationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__SBUIContinuitySessionTransitionContext_isEqual___block_invoke;
    v10[3] = &unk_1E4C40298;
    v11 = v4;
    v7 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v10);

    v8 = objc_msgSend(v5, "isEqual");
  }

  return v8;
}

uint64_t __50__SBUIContinuitySessionTransitionContext_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animationSettings");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIContinuitySessionTransitionContext animationSettings](self, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = objc_msgSend(v3, "hash");
  return v6;
}

- (void)setAnimationSettings:(id)a3
{
  -[BSMutableSettings setObject:forSetting:](self->_mutableSettings, "setObject:forSetting:", a3, 1);
}

- (BSAnimationSettings)animationSettings
{
  return (BSAnimationSettings *)-[BSMutableSettings objectForSetting:](self->_mutableSettings, "objectForSetting:", 1);
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

- (SBUIContinuitySessionTransitionContext)initWithBSXPCCoder:(id)a3
{
  id v5;
  void *v6;
  SBUIContinuitySessionTransitionContext *v7;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIContinuitySessionAppearanceSettings.m"), 240, CFSTR("Unable to decode settings"));

  }
  v7 = -[SBUIContinuitySessionTransitionContext _initWithBSSettings:](self, "_initWithBSSettings:", v6);

  return v7;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("animationSettings");
  else
    return 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBUIContinuitySessionTransitionContext *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__SBUIContinuitySessionTransitionContext_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E4C3E6A0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

void __68__SBUIContinuitySessionTransitionContext_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "animationSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:skipIfNil:", v3, CFSTR("animationSettings"), 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSettings, 0);
}

@end
