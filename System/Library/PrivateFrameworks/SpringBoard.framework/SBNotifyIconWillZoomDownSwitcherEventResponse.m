@implementation SBNotifyIconWillZoomDownSwitcherEventResponse

- (int64_t)type
{
  return 14;
}

- (SBNotifyIconWillZoomDownSwitcherEventResponse)initWithAppLayout:(id)a3
{
  id v5;
  SBNotifyIconWillZoomDownSwitcherEventResponse *v6;
  SBNotifyIconWillZoomDownSwitcherEventResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBNotifyIconWillZoomDownSwitcherEventResponse;
  v6 = -[SBChainableModifierEventResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appLayout, a3);

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBNotifyIconWillZoomDownSwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v8, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("appLayout"));

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
