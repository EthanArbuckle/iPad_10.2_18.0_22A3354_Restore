@implementation _UIStatusBarDisplayItemRelation

+ (id)exclusionWithDisplayItemState:(id)a3 placement:(id)a4
{
  id v5;
  id v6;
  _UIStatusBarDisplayItemDependencyRelation *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_UIStatusBarDisplayItemDependencyRelation);
  -[_UIStatusBarDisplayItemDependencyRelation setItemState:](v7, "setItemState:", v6);

  -[_UIStatusBarDisplayItemDependencyRelation setPlacement:](v7, "setPlacement:", v5);
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
  _UIStatusBarDisplayItemGroupRelation *v4;

  v3 = a3;
  v4 = objc_alloc_init(_UIStatusBarDisplayItemGroupRelation);
  -[_UIStatusBarDisplayItemGroupRelation setRelations:](v4, "setRelations:", v3);

  return v4;
}

+ (id)allRelationWithRelations:(id)a3
{
  id v3;
  _UIStatusBarDisplayItemGroupRelation *v4;

  v3 = a3;
  v4 = objc_alloc_init(_UIStatusBarDisplayItemGroupRelation);
  -[_UIStatusBarDisplayItemGroupRelation setRelations:](v4, "setRelations:", v3);

  -[_UIStatusBarDisplayItemGroupRelation setRequiresAll:](v4, "setRequiresAll:", 1);
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

- (id)_ui_descriptionBuilder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDisplayItemRelation;
  -[NSObject _ui_descriptionBuilder](&v8, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  NSStringFromSelector(sel_isFulfilled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;

  -[_UIStatusBarDisplayItemRelation _ui_descriptionBuilder](self, "_ui_descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
