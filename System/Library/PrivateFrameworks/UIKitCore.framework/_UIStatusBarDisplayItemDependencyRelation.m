@implementation _UIStatusBarDisplayItemDependencyRelation

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
  -[_UIStatusBarDisplayItemDependencyRelation itemState](self, "itemState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)type
{
  if (self->_requirement)
    return CFSTR("requirement");
  else
    return CFSTR("exclusion");
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
  v8.super_class = (Class)_UIStatusBarDisplayItemDependencyRelation;
  -[_UIStatusBarDisplayItemRelation _ui_descriptionBuilder](&v8, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_itemState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  NSStringFromSelector(sel_placement);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_UIStatusBarDisplayItemState)itemState
{
  return (_UIStatusBarDisplayItemState *)objc_loadWeakRetained((id *)&self->_itemState);
}

- (void)setItemState:(id)a3
{
  objc_storeWeak((id *)&self->_itemState, a3);
}

- (_UIStatusBarDisplayItemPlacement)placement
{
  return self->_placement;
}

- (void)setPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_placement, a3);
}

- (BOOL)requirement
{
  return self->_requirement;
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

@end
