@implementation SBIconListViewIconOverridingLayoutDelegateAssertion

- (SBIconListViewIconOverridingLayoutDelegateAssertion)initWithListView:(id)a3 layoutDelegate:(id)a4 reason:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBIconListViewIconOverridingLayoutDelegateAssertion *v12;
  SBIconListViewIconOverridingLayoutDelegateAssertion *v13;
  uint64_t v14;
  NSString *reason;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBIconListViewIconOverridingLayoutDelegateAssertion;
  v12 = -[SBIconListViewIconOverridingLayoutDelegateAssertion init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_listView, a3);
    objc_storeWeak((id *)&v13->_layoutDelegate, v10);
    v14 = objc_msgSend(v11, "copy");
    reason = v13->_reason;
    v13->_reason = (NSString *)v14;

  }
  return v13;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3_2(&dword_1CFEF3000, a2, a3, "SBIconListViewIconOverridingLayoutDelegateAssertion deallocated but not invalidated! Reason: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)invalidate
{
  void *v3;

  if (!-[SBIconListViewIconOverridingLayoutDelegateAssertion isInvalidated](self, "isInvalidated"))
  {
    -[SBIconListViewIconOverridingLayoutDelegateAssertion listView](self, "listView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeOverridingLayoutDelegateAssertion:", self);

    -[SBIconListViewIconOverridingLayoutDelegateAssertion setInvalidated:](self, "setInvalidated:", 1);
  }
}

- (NSString)description
{
  return (NSString *)-[SBIconListViewIconOverridingLayoutDelegateAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListViewIconOverridingLayoutDelegateAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconListViewIconOverridingLayoutDelegateAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  -[SBIconListViewIconOverridingLayoutDelegateAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewIconOverridingLayoutDelegateAssertion layoutDelegate](self, "layoutDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("layoutDelegate"));

  -[SBIconListViewIconOverridingLayoutDelegateAssertion reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("reason"));

  -[SBIconListViewIconOverridingLayoutDelegateAssertion listView](self, "listView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendPointer:withName:", v9, CFSTR("listView"));

  return v4;
}

- (SBIconListLayoutDelegate)layoutDelegate
{
  return (SBIconListLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (NSString)reason
{
  return self->_reason;
}

- (SBIconListView)listView
{
  return self->_listView;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
}

@end
