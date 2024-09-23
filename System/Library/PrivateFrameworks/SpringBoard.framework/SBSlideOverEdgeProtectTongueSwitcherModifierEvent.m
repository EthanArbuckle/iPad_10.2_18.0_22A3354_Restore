@implementation SBSlideOverEdgeProtectTongueSwitcherModifierEvent

- (SBSlideOverEdgeProtectTongueSwitcherModifierEvent)initWithTonguePresented:(BOOL)a3 edge:(unint64_t)a4
{
  SBSlideOverEdgeProtectTongueSwitcherModifierEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSlideOverEdgeProtectTongueSwitcherModifierEvent;
  result = -[SBSlideOverEdgeProtectTongueSwitcherModifierEvent init](&v7, sel_init);
  if (result)
  {
    result->_tonguePresented = a3;
    result->_edge = a4;
  }
  return result;
}

- (int64_t)type
{
  return 26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBSlideOverEdgeProtectTongueSwitcherModifierEvent initWithTonguePresented:edge:]([SBSlideOverEdgeProtectTongueSwitcherModifierEvent alloc], "initWithTonguePresented:edge:", self->_tonguePresented, self->_edge);
}

- (BOOL)isTonguePresented
{
  return self->_tonguePresented;
}

- (unint64_t)edge
{
  return self->_edge;
}

@end
