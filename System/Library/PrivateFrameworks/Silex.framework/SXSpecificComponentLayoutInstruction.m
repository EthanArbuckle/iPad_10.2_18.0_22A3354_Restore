@implementation SXSpecificComponentLayoutInstruction

+ (id)instructionWithIdentifier:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (BOOL)isFulfilledForBlueprint:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SXSpecificComponentLayoutInstruction componentIdentifier](self, "componentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentBlueprintForComponentIdentifier:includeChildren:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "hasValidLayout");
  return (char)v5;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SXSpecificComponentLayoutInstruction componentIdentifier](self, "componentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Require valid layout for component with identifier: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)componentIdentifier
{
  return self->_componentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
}

@end
