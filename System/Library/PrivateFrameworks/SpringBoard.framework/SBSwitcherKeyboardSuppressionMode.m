@implementation SBSwitcherKeyboardSuppressionMode

- (BOOL)suppressesAllScenes
{
  return self->_type == 1;
}

+ (id)suppressionModeNone
{
  if (suppressionModeNone_onceToken != -1)
    dispatch_once(&suppressionModeNone_onceToken, &__block_literal_global_230);
  return (id)suppressionModeNone___noScenesSuppressionMode;
}

+ (id)suppressionModeForAllScenes
{
  if (suppressionModeForAllScenes_onceToken != -1)
    dispatch_once(&suppressionModeForAllScenes_onceToken, &__block_literal_global_6_4);
  return (id)suppressionModeForAllScenes___allScenesSuppressionMode;
}

- (BOOL)isEqual:(id)a3
{
  SBSwitcherKeyboardSuppressionMode *v4;
  SBSwitcherKeyboardSuppressionMode *v5;
  int64_t type;
  void *v7;
  char v8;

  v4 = (SBSwitcherKeyboardSuppressionMode *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      type = self->_type;
      if (type == -[SBSwitcherKeyboardSuppressionMode type](v5, "type"))
      {
        -[SBSwitcherKeyboardSuppressionMode appLayouts](v5, "appLayouts");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = BSEqualSets();

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)suppressesSwitcherScenesOnly
{
  return self->_type == 2;
}

- (BOOL)applyAssertionEvenIfAppIsHostingTheKeyboard
{
  return self->_applyAssertionEvenIfAppIsHostingTheKeyboard;
}

- (id)_initWithAppLayouts:(id)a3 suppressionType:(int64_t)a4
{
  id v7;
  SBSwitcherKeyboardSuppressionMode *v8;
  SBSwitcherKeyboardSuppressionMode *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherKeyboardSuppressionMode;
  v8 = -[SBSwitcherKeyboardSuppressionMode init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appLayouts, a3);
    v9->_type = a4;
  }

  return v9;
}

+ (id)newSuppressionModeForSwitcherScenesFromAppLayouts:(id)a3
{
  id v5;
  id v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSwitcherKeyboardSuppressionMode.m"), 45, CFSTR("appLayouts cannot be nil."));

  }
  v6 = -[SBSwitcherKeyboardSuppressionMode _initWithAppLayouts:suppressionType:]([SBSwitcherKeyboardSuppressionMode alloc], "_initWithAppLayouts:suppressionType:", v5, 2);

  return v6;
}

void __56__SBSwitcherKeyboardSuppressionMode_suppressionModeNone__block_invoke()
{
  SBSwitcherKeyboardSuppressionMode *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SBSwitcherKeyboardSuppressionMode alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SBSwitcherKeyboardSuppressionMode _initWithAppLayouts:suppressionType:](v0, "_initWithAppLayouts:suppressionType:", v3, 0);
  v2 = (void *)suppressionModeNone___noScenesSuppressionMode;
  suppressionModeNone___noScenesSuppressionMode = v1;

}

void __64__SBSwitcherKeyboardSuppressionMode_suppressionModeForAllScenes__block_invoke()
{
  SBSwitcherKeyboardSuppressionMode *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SBSwitcherKeyboardSuppressionMode alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SBSwitcherKeyboardSuppressionMode _initWithAppLayouts:suppressionType:](v0, "_initWithAppLayouts:suppressionType:", v3, 1);
  v2 = (void *)suppressionModeForAllScenes___allScenesSuppressionMode;
  suppressionModeForAllScenes___allScenesSuppressionMode = v1;

}

- (BOOL)suppressesNoScenes
{
  return self->_type == 0;
}

- (unint64_t)hash
{
  return self->_type + -[NSSet hash](self->_appLayouts, "hash");
}

- (NSString)description
{
  return (NSString *)-[SBSwitcherKeyboardSuppressionMode descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSwitcherKeyboardSuppressionMode succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  int64_t type;
  const __CFString *v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  type = self->_type;
  v6 = CFSTR("none");
  if (type == 1)
    v6 = CFSTR("allScenes");
  if (type == 2)
    v7 = CFSTR("switcherScenesOnly");
  else
    v7 = v6;
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("type"));
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSwitcherKeyboardSuppressionMode descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)appLayouts
{
  return self->_appLayouts;
}

- (void)setApplyAssertionEvenIfAppIsHostingTheKeyboard:(BOOL)a3
{
  self->_applyAssertionEvenIfAppIsHostingTheKeyboard = a3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayouts, 0);
}

@end
