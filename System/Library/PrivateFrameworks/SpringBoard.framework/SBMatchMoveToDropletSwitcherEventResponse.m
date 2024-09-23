@implementation SBMatchMoveToDropletSwitcherEventResponse

- (SBMatchMoveToDropletSwitcherEventResponse)initWithAppLayout:(id)a3 active:(BOOL)a4
{
  id v8;
  SBMatchMoveToDropletSwitcherEventResponse *v9;
  void *v11;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBMatchMoveToDropletSwitcherEventResponse;
  v9 = -[SBChainableModifierEventResponse init](&v12, sel_init);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBMatchMoveToDropletSwitcherEventResponse.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    objc_storeStrong((id *)&v9->_appLayout, a3);
    v9->_active = a4;
  }

  return v9;
}

- (int64_t)type
{
  return 44;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
