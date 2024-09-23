@implementation SBTapAppLayoutSwitcherModifierEvent

- (SBTapAppLayoutSwitcherModifierEvent)initWithAppLayout:(id)a3 layoutRole:(int64_t)a4 modifierFlags:(int64_t)a5
{
  return -[SBTapAppLayoutSwitcherModifierEvent initWithAppLayout:layoutRole:modifierFlags:source:](self, "initWithAppLayout:layoutRole:modifierFlags:source:", a3, a4, a5, 0);
}

- (SBTapAppLayoutSwitcherModifierEvent)initWithAppLayout:(id)a3 layoutRole:(int64_t)a4 modifierFlags:(int64_t)a5 source:(int64_t)a6
{
  id v11;
  SBTapAppLayoutSwitcherModifierEvent *v12;
  SBTapAppLayoutSwitcherModifierEvent *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBTapAppLayoutSwitcherModifierEvent;
  v12 = -[SBTapAppLayoutSwitcherModifierEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appLayout, a3);
    v13->_layoutRole = a4;
    v13->_modifierFlags = a5;
    v13->_source = a6;
  }

  return v13;
}

- (int64_t)type
{
  return 17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBTapAppLayoutSwitcherModifierEvent;
  v4 = -[SBChainableModifierEvent copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[SBAppLayout copy](self->_appLayout, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  v4[4] = self->_layoutRole;
  v4[5] = self->_modifierFlags;
  v4[6] = self->_source;
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBTapAppLayoutSwitcherModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v11, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("appLayout"));

  SBLayoutRoleDescription(self->_layoutRole);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("layoutRole"));

  v8 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_modifierFlags, CFSTR("modifierFlags"));
  v9 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_source, CFSTR("source"));
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

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
