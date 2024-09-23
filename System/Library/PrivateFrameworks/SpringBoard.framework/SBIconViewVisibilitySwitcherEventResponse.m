@implementation SBIconViewVisibilitySwitcherEventResponse

- (BOOL)isVisible
{
  return self->_visible;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (SBFFluidBehaviorSettings)animationSettings
{
  return self->_animationSettings;
}

- (NSSet)excludedIconLocations
{
  return self->_excludedIconLocations;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBIconViewVisibilitySwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v10, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_visible, CFSTR("visible"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_animationSettings, CFSTR("animationSettings"));
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("appLayout"));

  return v4;
}

- (SBIconViewVisibilitySwitcherEventResponse)initWithAppLayout:(id)a3 visible:(BOOL)a4 animationSettings:(id)a5 excludedIconLocations:(id)a6
{
  id v11;
  id v12;
  id v13;
  SBIconViewVisibilitySwitcherEventResponse *v14;
  SBIconViewVisibilitySwitcherEventResponse *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBIconViewVisibilitySwitcherEventResponse;
  v14 = -[SBChainableModifierEventResponse init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_appLayout, a3);
    v15->_visible = a4;
    objc_storeStrong((id *)&v15->_animationSettings, a5);
    objc_storeStrong((id *)&v15->_excludedIconLocations, a6);
  }

  return v15;
}

- (int64_t)type
{
  return 13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedIconLocations, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
