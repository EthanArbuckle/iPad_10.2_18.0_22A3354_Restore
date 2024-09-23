@implementation SBHighlightSwitcherModifierEvent

- (SBHighlightSwitcherModifierEvent)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 phase:(unint64_t)a5 hover:(BOOL)a6 pencilHover:(BOOL)a7
{
  id v13;
  SBHighlightSwitcherModifierEvent *v14;
  SBHighlightSwitcherModifierEvent *v15;
  objc_super v17;

  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBHighlightSwitcherModifierEvent;
  v14 = -[SBHighlightSwitcherModifierEvent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_layoutRole = a3;
    objc_storeStrong((id *)&v14->_appLayout, a4);
    v15->_phase = a5;
    v15->_hoverEvent = a6;
    v15->_pencilHoverEvent = a7;
  }

  return v15;
}

- (int64_t)type
{
  return 11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHighlightSwitcherModifierEvent;
  v4 = -[SBChainableModifierEvent copyWithZone:](&v8, sel_copyWithZone_, a3);
  v4[4] = self->_layoutRole;
  v5 = -[SBAppLayout copy](self->_appLayout, "copy");
  v6 = (void *)v4[5];
  v4[5] = v5;

  v4[6] = self->_phase;
  *((_BYTE *)v4 + 24) = self->_hoverEvent;
  *((_BYTE *)v4 + 25) = self->_pencilHoverEvent;
  return v4;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (BOOL)isHoverEvent
{
  return self->_hoverEvent;
}

- (BOOL)isPencilHoverEvent
{
  return self->_pencilHoverEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
