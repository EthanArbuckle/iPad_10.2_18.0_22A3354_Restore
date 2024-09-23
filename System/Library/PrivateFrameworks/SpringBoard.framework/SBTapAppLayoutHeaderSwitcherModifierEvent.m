@implementation SBTapAppLayoutHeaderSwitcherModifierEvent

- (SBTapAppLayoutHeaderSwitcherModifierEvent)initWithAppLayout:(id)a3 layoutRole:(int64_t)a4
{
  id v7;
  SBTapAppLayoutHeaderSwitcherModifierEvent *v8;
  SBTapAppLayoutHeaderSwitcherModifierEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBTapAppLayoutHeaderSwitcherModifierEvent;
  v8 = -[SBTapAppLayoutHeaderSwitcherModifierEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appLayout, a3);
    v9->_layoutRole = a4;
  }

  return v9;
}

- (int64_t)type
{
  return 36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBTapAppLayoutHeaderSwitcherModifierEvent initWithAppLayout:layoutRole:]([SBTapAppLayoutHeaderSwitcherModifierEvent alloc], "initWithAppLayout:layoutRole:", self->_appLayout, self->_layoutRole);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBTapAppLayoutHeaderSwitcherModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v9, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("appLayout"));

  SBLayoutRoleDescription(self->_layoutRole);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("layoutRole"));

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
