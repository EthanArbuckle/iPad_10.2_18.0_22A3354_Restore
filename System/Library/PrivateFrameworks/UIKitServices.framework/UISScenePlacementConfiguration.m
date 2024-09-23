@implementation UISScenePlacementConfiguration

+ (unint64_t)placementType
{
  return 0;
}

- (UISScenePlacementConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISScenePlacementConfiguration;
  return -[UISScenePlacementConfiguration init](&v3, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  UISScenePlacementConfiguration *v4;
  UISScenePlacementConfiguration *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (UISScenePlacementConfiguration *)a3;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISScenePlacementConfiguration)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISScenePlacementConfiguration;
  return -[UISScenePlacementConfiguration init](&v4, sel_init, a3);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (UISScenePlacementConfiguration)initWithBSXPCCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISScenePlacementConfiguration;
  return -[UISScenePlacementConfiguration init](&v4, sel_init, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[UISScenePlacementConfiguration debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UISScenePlacementConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  UISScenePlacementConfiguration *v9;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__UISScenePlacementConfiguration_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E2CAF5B8;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "appendProem:block:", 0, v7);
  v5 = v4;

  return v5;
}

void __60__UISScenePlacementConfiguration_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = objc_msgSend((id)objc_opt_class(), "placementType");
  NSStringForUISScenePlacementType(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:withName:", v3, CFSTR("placementType"));

}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UISScenePlacementConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", v4);

  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UISScenePlacementConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UISScenePlacementConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
