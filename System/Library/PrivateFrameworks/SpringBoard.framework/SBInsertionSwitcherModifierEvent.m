@implementation SBInsertionSwitcherModifierEvent

- (SBInsertionSwitcherModifierEvent)initWithAppLayout:(id)a3 intoIndex:(unint64_t)a4 phase:(unint64_t)a5
{
  id v9;
  SBInsertionSwitcherModifierEvent *v10;
  SBInsertionSwitcherModifierEvent *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBInsertionSwitcherModifierEvent;
  v10 = -[SBInsertionSwitcherModifierEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_appLayout, a3);
    v11->_index = a4;
    v11->_phase = a5;
  }

  return v11;
}

- (int64_t)type
{
  return 13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBInsertionSwitcherModifierEvent;
  v4 = -[SBChainableModifierEvent copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[SBAppLayout copy](self->_appLayout, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  v4[4] = self->_index;
  v4[5] = self->_phase;
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBInsertionSwitcherModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v11, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_index, CFSTR("intoIndex"));
  v6 = self->_phase - 1;
  if (v6 > 3)
    v7 = CFSTR("Possible");
  else
    v7 = off_1E8EAEA10[v6];
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("phase"));
  -[SBAppLayout succinctDescription](self->_appLayout, "succinctDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("appLayout"));

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (unint64_t)index
{
  return self->_index;
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
