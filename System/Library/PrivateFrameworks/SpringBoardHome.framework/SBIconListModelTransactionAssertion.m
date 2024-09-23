@implementation SBIconListModelTransactionAssertion

- (SBIconListModelTransactionAssertion)initWithListModel:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  SBIconListModelTransactionAssertion *v8;
  SBIconListModelTransactionAssertion *v9;
  uint64_t v10;
  NSString *reason;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBIconListModelTransactionAssertion;
  v8 = -[SBIconListModelTransactionAssertion init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listModel, v6);
    v10 = objc_msgSend(v7, "copy");
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[SBIconListModelTransactionAssertion isInvalidated](self, "isInvalidated"))
    NSLog(CFSTR("Assertion not invalidated before dealloc"));
  -[SBIconListModelTransactionAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBIconListModelTransactionAssertion;
  -[SBIconListModelTransactionAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id v3;

  if (!-[SBIconListModelTransactionAssertion isInvalidated](self, "isInvalidated"))
  {
    -[SBIconListModelTransactionAssertion setInvalidated:](self, "setInvalidated:", 1);
    -[SBIconListModelTransactionAssertion listModel](self, "listModel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeTransactionAssertion:", self);

  }
}

- (NSString)description
{
  return (NSString *)-[SBIconListModelTransactionAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListModelTransactionAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBIconListModelTransactionAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SBIconListModelTransactionAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModelTransactionAssertion reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("reason"));

  -[SBIconListModelTransactionAssertion listModel](self, "listModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendPointer:withName:", v6, CFSTR("listModel"));

  return v4;
}

- (SBIconListModel)listModel
{
  return (SBIconListModel *)objc_loadWeakRetained((id *)&self->_listModel);
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
  objc_destroyWeak((id *)&self->_listModel);
}

@end
