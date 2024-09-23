@implementation STUIStatusBarDisplayItemRelation

+ (id)exclusionWithDisplayItemState:(id)a3 placement:(id)a4
{
  id v5;
  id v6;
  STUIStatusBarDisplayItemDependencyRelation *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(STUIStatusBarDisplayItemDependencyRelation);
  -[STUIStatusBarDisplayItemDependencyRelation setItemState:](v7, "setItemState:", v6);

  -[STUIStatusBarDisplayItemDependencyRelation setPlacement:](v7, "setPlacement:", v5);
  return v7;
}

+ (id)requirementWithDisplayItemState:(id)a3 placement:(id)a4
{
  void *v4;

  objc_msgSend(a1, "exclusionWithDisplayItemState:placement:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequirement:", 1);
  return v4;
}

+ (id)anyRelationWithRelations:(id)a3
{
  id v3;
  STUIStatusBarDisplayItemGroupRelation *v4;

  v3 = a3;
  v4 = objc_alloc_init(STUIStatusBarDisplayItemGroupRelation);
  -[STUIStatusBarDisplayItemGroupRelation setRelations:](v4, "setRelations:", v3);

  return v4;
}

+ (id)allRelationWithRelations:(id)a3
{
  id v3;
  STUIStatusBarDisplayItemGroupRelation *v4;

  v3 = a3;
  v4 = objc_alloc_init(STUIStatusBarDisplayItemGroupRelation);
  -[STUIStatusBarDisplayItemGroupRelation setRelations:](v4, "setRelations:", v3);

  -[STUIStatusBarDisplayItemGroupRelation setRequiresAll:](v4, "setRequiresAll:", 1);
  return v4;
}

- (BOOL)isFulfilled
{
  return 1;
}

- (NSArray)itemStates
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)type
{
  return 0;
}

- (NSString)description
{
  return (NSString *)-[STUIStatusBarDisplayItemRelation descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STUIStatusBarDisplayItemRelation debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarDisplayItemRelation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarDisplayItemRelation type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", v4, CFSTR("type"), 1);

  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarDisplayItemRelation isFulfilled](self, "isFulfilled"), CFSTR("fulfilled"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarDisplayItemRelation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarDisplayItemRelation _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBarDisplayItemRelation _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  -[STUIStatusBarDisplayItemRelation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  return v7;
}

@end
