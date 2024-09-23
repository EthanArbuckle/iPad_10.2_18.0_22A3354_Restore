@implementation SBFloatingDockWindowLevelAssertion

- (SBFloatingDockWindowLevelAssertion)initWithFloatingDockController:(id)a3 priority:(unint64_t)a4 level:(double)a5 reason:(id)a6
{
  id v10;
  id v11;
  SBFloatingDockWindowLevelAssertion *v12;
  SBFloatingDockWindowLevelAssertion *v13;
  uint64_t v14;
  NSString *reason;
  objc_super v17;

  v10 = a3;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBFloatingDockWindowLevelAssertion;
  v12 = -[SBFloatingDockWindowLevelAssertion init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_floatingDockController, v10);
    v13->_priority = a4;
    v13->_level = a5;
    v14 = objc_msgSend(v11, "copy");
    reason = v13->_reason;
    v13->_reason = (NSString *)v14;

    objc_msgSend(v10, "_addFloatingDockWindowLevelAssertion:", v13);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFloatingDockWindowLevelAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBFloatingDockWindowLevelAssertion;
  -[SBFloatingDockWindowLevelAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_floatingDockController);
  objc_msgSend(WeakRetained, "_removeFloatingDockWindowLevelAssertion:", self);

}

- (NSString)description
{
  return (NSString *)-[SBFloatingDockWindowLevelAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFloatingDockWindowLevelAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBFloatingDockWindowLevelAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBFloatingDockWindowLevelAssertion *v11;

  v4 = a3;
  -[SBFloatingDockWindowLevelAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__SBFloatingDockWindowLevelAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __76__SBFloatingDockWindowLevelAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) - 1;
  if (v3 > 4)
    v4 = CFSTR("app switcher");
  else
    v4 = off_1E8EBE108[v3];
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("priority"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("level"), *(double *)(*(_QWORD *)(a1 + 40) + 24));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("reason"));
}

- (SBFloatingDockController)floatingDockController
{
  return (SBFloatingDockController *)objc_loadWeakRetained((id *)&self->_floatingDockController);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (double)level
{
  return self->_level;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_floatingDockController);
}

@end
