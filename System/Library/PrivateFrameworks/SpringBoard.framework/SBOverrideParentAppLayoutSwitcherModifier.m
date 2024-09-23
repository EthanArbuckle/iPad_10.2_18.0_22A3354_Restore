@implementation SBOverrideParentAppLayoutSwitcherModifier

- (SBOverrideParentAppLayoutSwitcherModifier)initWithChildAppLayout:(id)a3 newParentAppLayout:(id)a4
{
  id v8;
  id v9;
  SBOverrideParentAppLayoutSwitcherModifier *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBOverrideParentAppLayoutSwitcherModifier;
  v10 = -[SBSwitcherModifier init](&v14, sel_init);
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        objc_storeStrong((id *)&v10->_childAppLayout, a3);
        objc_storeStrong((id *)&v10->_parentAppLayout, a4);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("SBOverrideParentAppLayoutSwitcherModifier.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("childAppLayout"));

      if (v9)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("SBOverrideParentAppLayoutSwitcherModifier.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentAppLayout"));

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4;
  SBAppLayout *v5;
  SBAppLayout *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self->_childAppLayout))
  {
    v5 = self->_parentAppLayout;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBOverrideParentAppLayoutSwitcherModifier;
    -[SBOverrideParentAppLayoutSwitcherModifier appLayoutContainingAppLayout:](&v8, sel_appLayoutContainingAppLayout_, v4);
    v5 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)appLayoutsContainedWithinAppLayout:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBOverrideParentAppLayoutSwitcherModifier;
  v4 = a3;
  -[SBOverrideParentAppLayoutSwitcherModifier appLayoutsContainedWithinAppLayout:](&v11, sel_appLayoutsContainedWithinAppLayout_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", self->_childAppLayout, v11.receiver, v11.super_class);
  v7 = objc_msgSend(v4, "isEqual:", self->_parentAppLayout);

  if (v6)
  {
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v5, "sb_arrayByRemovingObject:", self->_childAppLayout);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = (void *)v8;

      v5 = v9;
    }
  }
  else if (v7 && (objc_msgSend(v5, "containsObject:", self->_childAppLayout) & 1) == 0)
  {
    objc_msgSend(v5, "arrayByAddingObject:", self->_childAppLayout);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  return v5;
}

- (SBAppLayout)childAppLayout
{
  return self->_childAppLayout;
}

- (SBAppLayout)parentAppLayout
{
  return self->_parentAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentAppLayout, 0);
  objc_storeStrong((id *)&self->_childAppLayout, 0);
}

@end
