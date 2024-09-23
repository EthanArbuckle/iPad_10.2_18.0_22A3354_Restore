@implementation SBHoverSwitcherModifierEvent

- (SBHoverSwitcherModifierEvent)initWithPhase:(unint64_t)a3 position:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  SBHoverSwitcherModifierEvent *result;
  objc_super v8;

  y = a4.y;
  x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)SBHoverSwitcherModifierEvent;
  result = -[SBHoverSwitcherModifierEvent init](&v8, sel_init);
  if (result)
  {
    result->_phase = a3;
    result->_position.x = x;
    result->_position.y = y;
  }
  return result;
}

- (int64_t)type
{
  return 32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHoverSwitcherModifierEvent;
  result = -[SBChainableModifierEvent copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 3) = self->_phase;
  *((_OWORD *)result + 2) = self->_position;
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  unint64_t phase;
  const __CFString *v7;
  const __CFString *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHoverSwitcherModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v11, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  phase = self->_phase;
  v7 = CFSTR("Hovering");
  if (phase == 1)
    v7 = CFSTR("EndHovering");
  if (phase == 2)
    v8 = CFSTR("CancelHovering");
  else
    v8 = v7;
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("phase"));
  v9 = (id)objc_msgSend(v5, "appendPoint:withName:", CFSTR("position"), self->_position.x, self->_position.y);
  return v5;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
