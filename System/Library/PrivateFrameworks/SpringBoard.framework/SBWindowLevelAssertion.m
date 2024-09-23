@implementation SBWindowLevelAssertion

- (SBWindowLevelAssertion)initWithPriority:(int64_t)a3 windowLevel:(double)a4 reason:(id)a5 invalidationHandler:(id)a6
{
  id v10;
  id v11;
  SBWindowLevelAssertion *v12;
  SBWindowLevelAssertion *v13;
  uint64_t v14;
  NSString *reason;
  uint64_t v16;
  id invalidationHandler;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SBWindowLevelAssertion;
  v12 = -[SBWindowLevelAssertion init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_priority = a3;
    v12->_windowLevel = a4;
    v14 = objc_msgSend(v10, "copy");
    reason = v13->_reason;
    v13->_reason = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    invalidationHandler = v13->_invalidationHandler;
    v13->_invalidationHandler = (id)v16;

  }
  return v13;
}

- (NSString)description
{
  return (NSString *)-[SBWindowLevelAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBWindowLevelAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_reason, CFSTR("reason"));
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("windowLevel"), self->_windowLevel);
  v6 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_priority, CFSTR("priority"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBWindowLevelAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)invalidate
{
  id invalidationHandler;
  id v4;
  void (**v5)(id, SBWindowLevelAssertion *);

  invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {
    v5 = (void (**)(id, SBWindowLevelAssertion *))objc_msgSend(invalidationHandler, "copy");
    v4 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    v5[2](v5, self);
  }
}

- (double)windowLevel
{
  return self->_windowLevel;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end
