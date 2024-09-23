@implementation SBIconListViewIconVisibilityAssertion

- (SBIconListViewIconVisibilityAssertion)initWithListView:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  SBIconListViewIconVisibilityAssertion *v9;
  SBIconListViewIconVisibilityAssertion *v10;
  uint64_t v11;
  NSString *reason;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBIconListViewIconVisibilityAssertion;
  v9 = -[SBIconListViewIconVisibilityAssertion init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_listView, a3);
    v11 = objc_msgSend(v8, "copy");
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;

  }
  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *reason;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!-[SBIconListViewIconVisibilityAssertion isInvalidated](self, "isInvalidated"))
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      reason = self->_reason;
      *(_DWORD *)buf = 138543362;
      v7 = reason;
      _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "SBIconListViewIconVisibilityAssertion deallocated but not invalidated! Reason: %{public}@", buf, 0xCu);
    }

    -[SBIconListViewIconVisibilityAssertion invalidate](self, "invalidate");
  }
  v5.receiver = self;
  v5.super_class = (Class)SBIconListViewIconVisibilityAssertion;
  -[SBIconListViewIconVisibilityAssertion dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  void *v3;

  if (!-[SBIconListViewIconVisibilityAssertion isInvalidated](self, "isInvalidated"))
  {
    -[SBIconListViewIconVisibilityAssertion listView](self, "listView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeShowAllIconsAssertion:", self);

    -[SBIconListViewIconVisibilityAssertion setInvalidated:](self, "setInvalidated:", 1);
  }
}

- (NSString)description
{
  return (NSString *)-[SBIconListViewIconVisibilityAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListViewIconVisibilityAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBIconListViewIconVisibilityAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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

  -[SBIconListViewIconVisibilityAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewIconVisibilityAssertion reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("reason"));

  -[SBIconListViewIconVisibilityAssertion listView](self, "listView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendPointer:withName:", v7, CFSTR("listView"));

  return v4;
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
}

@end
