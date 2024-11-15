@implementation SBPointerCrossedDisplayBoundarySwitcherModifierEvent

- (SBPointerCrossedDisplayBoundarySwitcherModifierEvent)initWithDirection:(unint64_t)a3 edge:(unsigned int)a4
{
  SBPointerCrossedDisplayBoundarySwitcherModifierEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPointerCrossedDisplayBoundarySwitcherModifierEvent;
  result = -[SBPointerCrossedDisplayBoundarySwitcherModifierEvent init](&v7, sel_init);
  if (result)
  {
    result->_direction = a3;
    result->_edge = a4;
  }
  return result;
}

- (int64_t)type
{
  return 37;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (unsigned)edge
{
  return self->_edge;
}

- (void)setEdge:(unsigned int)a3
{
  self->_edge = a3;
}

@end
