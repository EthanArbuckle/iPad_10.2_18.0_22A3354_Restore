@implementation SBRemovalSwitcherModifierEvent

- (SBRemovalSwitcherModifierEvent)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 reason:(int64_t)a5 phase:(unint64_t)a6
{
  id v11;
  SBRemovalSwitcherModifierEvent *v12;
  SBRemovalSwitcherModifierEvent *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBRemovalSwitcherModifierEvent;
  v12 = -[SBRemovalSwitcherModifierEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_layoutRole = a3;
    objc_storeStrong((id *)&v12->_appLayout, a4);
    v13->_reason = a5;
    v13->_phase = a6;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBRemovalSwitcherModifierEvent;
  v4 = -[SBChainableModifierEvent copyWithZone:](&v8, sel_copyWithZone_, a3);
  v4[3] = self->_layoutRole;
  v5 = -[SBAppLayout copy](self->_appLayout, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v4[5] = self->_reason;
  v4[6] = self->_phase;
  return v4;
}

- (int64_t)type
{
  return 14;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBRemovalSwitcherModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v13, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = self->_phase - 1;
  if (v6 > 2)
    v7 = CFSTR("Possible");
  else
    v7 = off_1E8EA3180[v6];
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("phase"));
  SBLayoutRoleDescription(self->_layoutRole);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v8, CFSTR("role"));

  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "appendObject:withName:", v9, CFSTR("appLayout"));

  SBStringFromSwitcherMutationReason(self->_reason);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v11, CFSTR("reason"));

  return v5;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)reason
{
  return self->_reason;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
