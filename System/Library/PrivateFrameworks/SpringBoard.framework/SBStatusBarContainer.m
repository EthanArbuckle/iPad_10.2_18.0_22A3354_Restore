@implementation SBStatusBarContainer

- (void)setStatusBar:(id)a3
{
  objc_storeWeak((id *)&self->_statusBar, a3);
}

- (void)setReusePool:(id)a3
{
  objc_storeWeak((id *)&self->_reusePool, a3);
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBStatusBarContainer reusePool](self, "reusePool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeStatusBarContainer:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBStatusBarContainer;
  -[SBStatusBarContainer dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[SBStatusBarContainer descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBStatusBarContainer succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  _QWORD v8[4];
  id v9;
  SBStatusBarContainer *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SBStatusBarContainer_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E8E9E820;
  v4 = v3;
  v9 = v4;
  v10 = self;
  v5 = (id)objc_msgSend(v4, "modifyProem:", v8);
  v6 = v4;

  return v6;
}

void __50__SBStatusBarContainer_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id WeakRetained;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("reason"));
  v3 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", WeakRetained, CFSTR("status bar"));

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBStatusBarContainer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIStatusBar)statusBar
{
  return (UIStatusBar *)objc_loadWeakRetained((id *)&self->_statusBar);
}

- (SBStatusBarReusePool)reusePool
{
  return (SBStatusBarReusePool *)objc_loadWeakRetained((id *)&self->_reusePool);
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_reusePool);
  objc_destroyWeak((id *)&self->_statusBar);
}

@end
