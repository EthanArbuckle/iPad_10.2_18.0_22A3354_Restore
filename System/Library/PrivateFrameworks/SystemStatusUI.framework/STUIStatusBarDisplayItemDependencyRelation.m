@implementation STUIStatusBarDisplayItemDependencyRelation

- (BOOL)isFulfilled
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_itemState);
  v4 = objc_msgSend(WeakRetained, "isCurrentPlacement:", self->_placement);

  return v4 ^ !self->_requirement;
}

- (id)itemStates
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[STUIStatusBarDisplayItemDependencyRelation itemState](self, "itemState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (STUIStatusBarDisplayItemState)itemState
{
  return (STUIStatusBarDisplayItemState *)objc_loadWeakRetained((id *)&self->_itemState);
}

- (void)setPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_placement, a3);
}

- (void)setItemState:(id)a3
{
  objc_storeWeak((id *)&self->_itemState, a3);
}

- (void)setRequirement:(BOOL)a3
{
  self->_requirement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placement, 0);
  objc_destroyWeak((id *)&self->_itemState);
}

- (id)type
{
  if (self->_requirement)
    return CFSTR("requirement");
  else
    return CFSTR("exclusion");
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STUIStatusBarDisplayItemDependencyRelation;
  -[STUIStatusBarDisplayItemRelation _descriptionBuilderWithMultilinePrefix:forDebug:](&v11, sel__descriptionBuilderWithMultilinePrefix_forDebug_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarDisplayItemDependencyRelation itemState](self, "itemState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("itemState"), 1);

  -[STUIStatusBarDisplayItemDependencyRelation placement](self, "placement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v8, CFSTR("placement"), 1);

  return v5;
}

- (STUIStatusBarDisplayItemPlacement)placement
{
  return self->_placement;
}

- (BOOL)requirement
{
  return self->_requirement;
}

@end
