@implementation SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent

- (SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent)initWithTonguePresented:(BOOL)a3
{
  SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent;
  result = -[SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent init](&v5, sel_init);
  if (result)
    result->_tonguePresented = a3;
  return result;
}

- (int64_t)type
{
  return 35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent initWithTonguePresented:]([SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent alloc], "initWithTonguePresented:", self->_tonguePresented);
}

- (BOOL)isTonguePresented
{
  return self->_tonguePresented;
}

@end
