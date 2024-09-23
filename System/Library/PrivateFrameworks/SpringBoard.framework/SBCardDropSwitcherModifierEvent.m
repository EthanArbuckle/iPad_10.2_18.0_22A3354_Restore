@implementation SBCardDropSwitcherModifierEvent

- (SBCardDropSwitcherModifierEvent)initWithPhase:(unint64_t)a3 context:(id)a4
{
  id v7;
  SBCardDropSwitcherModifierEvent *v8;
  SBCardDropSwitcherModifierEvent *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBCardDropSwitcherModifierEvent;
  v8 = -[SBCardDropSwitcherModifierEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_phase = a3;
    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBCardDropSwitcherModifierEvent;
  v4 = -[SBChainableModifierEvent copyWithZone:](&v8, sel_copyWithZone_, a3);
  v4[4] = self->_phase;
  v5 = -[SBSwitcherDropRegionContext copy](self->_context, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (int64_t)type
{
  return 25;
}

- (SBSwitcherDropRegionContext)context
{
  return self->_context;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
