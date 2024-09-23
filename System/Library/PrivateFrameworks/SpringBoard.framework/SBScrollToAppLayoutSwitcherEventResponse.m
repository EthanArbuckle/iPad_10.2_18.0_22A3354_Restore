@implementation SBScrollToAppLayoutSwitcherEventResponse

- (int64_t)type
{
  return 11;
}

- (SBScrollToAppLayoutSwitcherEventResponse)initWithAppLayout:(id)a3 alignment:(int64_t)a4 animated:(BOOL)a5
{
  id v9;
  SBScrollToAppLayoutSwitcherEventResponse *v10;
  SBScrollToAppLayoutSwitcherEventResponse *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBScrollToAppLayoutSwitcherEventResponse;
  v10 = -[SBChainableModifierEventResponse init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_appLayout, a3);
    v11->_alignment = a4;
    v11->_animated = a5;
  }

  return v11;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBScrollToAppLayoutSwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("appLayout"));

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
