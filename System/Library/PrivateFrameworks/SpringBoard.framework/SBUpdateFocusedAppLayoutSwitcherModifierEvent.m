@implementation SBUpdateFocusedAppLayoutSwitcherModifierEvent

- (SBUpdateFocusedAppLayoutSwitcherModifierEvent)initWithAppLayout:(id)a3 focused:(BOOL)a4
{
  id v7;
  SBUpdateFocusedAppLayoutSwitcherModifierEvent *v8;
  SBUpdateFocusedAppLayoutSwitcherModifierEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBUpdateFocusedAppLayoutSwitcherModifierEvent;
  v8 = -[SBUpdateFocusedAppLayoutSwitcherModifierEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appLayout, a3);
    v9->_focused = a4;
  }

  return v9;
}

- (int64_t)type
{
  return 20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBUpdateFocusedAppLayoutSwitcherModifierEvent;
  v4 = -[SBChainableModifierEvent copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SBUpdateFocusedAppLayoutSwitcherModifierEvent appLayout](self, "appLayout");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[4];
  v4[4] = v5;

  *((_BYTE *)v4 + 24) = -[SBUpdateFocusedAppLayoutSwitcherModifierEvent isFocused](self, "isFocused");
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBUpdateFocusedAppLayoutSwitcherModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v8, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_appLayout, CFSTR("appLayout"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", self->_focused, CFSTR("focused"));
  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
