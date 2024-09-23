@implementation _SBIconImageViewDisableUpdatesAssertion

- (_SBIconImageViewDisableUpdatesAssertion)initWithIconImageView:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  _SBIconImageViewDisableUpdatesAssertion *v8;
  _SBIconImageViewDisableUpdatesAssertion *v9;
  uint64_t v10;
  NSString *reason;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SBIconImageViewDisableUpdatesAssertion;
  v8 = -[_SBIconImageViewDisableUpdatesAssertion init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_iconImageView, v6);
    v10 = objc_msgSend(v7, "copy");
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;

  }
  return v9;
}

- (void)invalidate
{
  id v3;

  if (!-[_SBIconImageViewDisableUpdatesAssertion isInvalidated](self, "isInvalidated"))
  {
    -[_SBIconImageViewDisableUpdatesAssertion setInvalidated:](self, "setInvalidated:", 1);
    -[_SBIconImageViewDisableUpdatesAssertion iconImageView](self, "iconImageView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateImageUpdatesAssertion:", self);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_SBIconImageViewDisableUpdatesAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SBIconImageViewDisableUpdatesAssertion;
  -[_SBIconImageViewDisableUpdatesAssertion dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[_SBIconImageViewDisableUpdatesAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBIconImageViewDisableUpdatesAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[_SBIconImageViewDisableUpdatesAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v9;

  -[_SBIconImageViewDisableUpdatesAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBIconImageViewDisableUpdatesAssertion iconImageView](self, "iconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendPointer:withName:", v5, CFSTR("iconImageView"));

  -[_SBIconImageViewDisableUpdatesAssertion reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("reason"));

  v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[_SBIconImageViewDisableUpdatesAssertion isInvalidated](self, "isInvalidated"), CFSTR("isInvalidated"), 1);
  return v4;
}

- (SBIconImageView)iconImageView
{
  return (SBIconImageView *)objc_loadWeakRetained((id *)&self->_iconImageView);
}

- (NSString)reason
{
  return self->_reason;
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
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_iconImageView);
}

@end
