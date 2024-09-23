@implementation SBHistorianSwitcherModifier

- (SBHistorianSwitcherModifier)initWithRootModifier:(id)a3
{
  id v6;
  SBHistorianSwitcherModifier *v7;
  SBHistorianSwitcherModifier *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHistorianSwitcherModifier.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modifier"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBHistorianSwitcherModifier;
  v7 = -[SBSwitcherModifier init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_rootModifier, a3);

  return v8;
}

- (void)setDelegate:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHistorianSwitcherModifier;
  -[SBChainableModifier setDelegate:](&v5, sel_setDelegate_);
  if (a3)
  {
    if (!-[SBChainableModifier containsChildModifier:](self, "containsChildModifier:", self->_rootModifier))
      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_rootModifier);
  }
}

- (id)handleEvent:(id)a3
{
  id v4;
  void *v5;
  SBSwitcherModifierEventSnapshot *v6;
  void *v7;
  SBSwitcherModifierEventResponseSnapshot *v8;
  SBSwitcherModifierStackSnapshot *v9;
  SBSwitcherModifierTimelineEntry *v10;
  objc_super v12;
  objc_super v13;

  v4 = a3;
  -[SBHistorianSwitcherModifier historianDelegate](self, "historianDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "historianModifier:shouldRecordEvent:", self, v4))
  {
    v6 = -[SBSwitcherModifierEventSnapshot initWithEvent:]([SBSwitcherModifierEventSnapshot alloc], "initWithEvent:", v4);
    v13.receiver = self;
    v13.super_class = (Class)SBHistorianSwitcherModifier;
    -[SBChainableModifier handleEvent:](&v13, sel_handleEvent_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBSwitcherModifierEventResponseSnapshot initWithEventResponse:]([SBSwitcherModifierEventResponseSnapshot alloc], "initWithEventResponse:", v7);
    v9 = -[SBSwitcherModifierStackSnapshot initWithRootModifier:]([SBSwitcherModifierStackSnapshot alloc], "initWithRootModifier:", self->_rootModifier);
    v10 = -[SBSwitcherModifierTimelineEntry initWithEventSnapshot:responseSnapshot:stackSnapshotAfterEvent:]([SBSwitcherModifierTimelineEntry alloc], "initWithEventSnapshot:responseSnapshot:stackSnapshotAfterEvent:", v6, v8, v9);
    objc_msgSend(v5, "historianModifier:didRecordEntry:", self, v10);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBHistorianSwitcherModifier;
    -[SBChainableModifier handleEvent:](&v12, sel_handleEvent_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (SBHistorianSwitcherModifierDelegate)historianDelegate
{
  return (SBHistorianSwitcherModifierDelegate *)objc_loadWeakRetained((id *)&self->_historianDelegate);
}

- (void)setHistorianDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_historianDelegate, a3);
}

- (SBSwitcherModifier)rootModifier
{
  return self->_rootModifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootModifier, 0);
  objc_destroyWeak((id *)&self->_historianDelegate);
}

@end
