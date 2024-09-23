@implementation SBSceneReadySwitcherModifierEvent

- (int64_t)type
{
  return 24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

- (SBSceneReadySwitcherModifierEvent)initWithAppLayout:(id)a3
{
  id v5;
  SBSceneReadySwitcherModifierEvent *v6;
  SBSceneReadySwitcherModifierEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneReadySwitcherModifierEvent;
  v6 = -[SBSceneReadySwitcherModifierEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appLayout, a3);

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSceneReadySwitcherModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_appLayout, CFSTR("appLayout"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBSceneReadySwitcherModifierEvent initWithAppLayout:]([SBSceneReadySwitcherModifierEvent alloc], "initWithAppLayout:", self->_appLayout);
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

@end
