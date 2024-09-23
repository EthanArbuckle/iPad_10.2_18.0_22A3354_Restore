@implementation SBIconsOccludedAssertion

- (SBIconsOccludedAssertion)initWithInvalidator:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  SBIconsOccludedAssertion *v8;
  SBIconsOccludedAssertion *v9;
  uint64_t v10;
  NSString *reason;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBIconsOccludedAssertion;
  v8 = -[SBIconsOccludedAssertion init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_invalidator, v6);
    v10 = objc_msgSend(v7, "copy");
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;

  }
  return v9;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "SBIconsOccludedAssertion not invalidated before release! Reason: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (NSString)description
{
  return (NSString *)-[SBIconsOccludedAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)invalidate
{
  id v3;

  if (!-[SBIconsOccludedAssertion isInvalidated](self, "isInvalidated"))
  {
    -[SBIconsOccludedAssertion setInvalidated:](self, "setInvalidated:", 1);
    -[SBIconsOccludedAssertion invalidator](self, "invalidator");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeIconsOccludedAssertion:", self);

  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconsOccludedAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconsOccludedAssertion reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("reason"));

  v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconsOccludedAssertion isInvalidated](self, "isInvalidated"), CFSTR("invalidated"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconsOccludedAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (SBIconsOccludedAssertionInvalidating)invalidator
{
  return (SBIconsOccludedAssertionInvalidating *)objc_loadWeakRetained((id *)&self->_invalidator);
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
  objc_destroyWeak((id *)&self->_invalidator);
}

@end
