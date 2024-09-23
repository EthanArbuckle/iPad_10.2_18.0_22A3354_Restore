@implementation SBIconOverlayVisibilitySwitcherEventResponse

- (BOOL)isVisible
{
  return self->_visible;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBIconOverlayVisibilitySwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v9, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_visible, CFSTR("visible"));
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("appLayout"));

  return v4;
}

- (SBIconOverlayVisibilitySwitcherEventResponse)initWithAppLayout:(id)a3 visible:(BOOL)a4
{
  id v7;
  SBIconOverlayVisibilitySwitcherEventResponse *v8;
  SBIconOverlayVisibilitySwitcherEventResponse *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBIconOverlayVisibilitySwitcherEventResponse;
  v8 = -[SBChainableModifierEventResponse init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appLayout, a3);
    v9->_visible = a4;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

- (int64_t)type
{
  return 12;
}

@end
