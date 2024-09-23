@implementation UIWindowScenePlacement

+ (unint64_t)_placementType
{
  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWindowScenePlacement;
  return -[UIWindowScenePlacement init](&v3, sel_init);
}

+ (id)_default
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_init");
}

- (id)_createConfigurationWithError:(id *)a3
{
  _UISceneErrorWithCode(1);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
}

- (BOOL)isEqual:(id)a3
{
  UIWindowScenePlacement *v4;
  UIWindowScenePlacement *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (UIWindowScenePlacement *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v7 = 1;
    }
    else
    {
      v6 = objc_opt_class();
      v7 = v6 == objc_opt_class();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_preserveLayout
{
  return 0;
}

- (BOOL)_requestFullscreen
{
  return 0;
}

- (BOOL)_requestCenterSlot
{
  return 0;
}

- (BOOL)_requestBackground
{
  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[UIWindowScenePlacement debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIWindowScenePlacement succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIWindowScenePlacement succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", v4);

  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIWindowScenePlacement descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIWindowScenePlacement descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
