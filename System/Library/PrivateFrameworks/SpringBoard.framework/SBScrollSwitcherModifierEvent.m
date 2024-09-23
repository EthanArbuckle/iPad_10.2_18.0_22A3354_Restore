@implementation SBScrollSwitcherModifierEvent

- (SBScrollSwitcherModifierEvent)initWithContentOffset:(CGPoint)a3 phase:(unint64_t)a4 userInitiated:(BOOL)a5
{
  CGFloat y;
  CGFloat x;
  SBScrollSwitcherModifierEvent *result;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)SBScrollSwitcherModifierEvent;
  result = -[SBScrollSwitcherModifierEvent init](&v10, sel_init);
  if (result)
  {
    result->_contentOffset.x = x;
    result->_contentOffset.y = y;
    result->_phase = a4;
    result->_userInitiated = a5;
  }
  return result;
}

- (int64_t)type
{
  return 19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBScrollSwitcherModifierEvent;
  result = -[SBChainableModifierEvent copyWithZone:](&v5, sel_copyWithZone_, a3);
  *(CGPoint *)((char *)result + 40) = self->_contentOffset;
  *((_QWORD *)result + 4) = self->_phase;
  *((_BYTE *)result + 24) = self->_userInitiated;
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBScrollSwitcherModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v9, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_contentOffset);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("contentOffset"));

  if (self->_phase)
    v6 = CFSTR("EndScrolling");
  else
    v6 = CFSTR("Scrolling");
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("phase"));
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", self->_userInitiated, CFSTR("userInitiated"));
  return v4;
}

- (CGPoint)contentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

@end
