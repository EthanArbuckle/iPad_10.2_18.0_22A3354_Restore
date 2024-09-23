@implementation SBItemResizeGestureSwitcherModifierEvent

- (int64_t)type
{
  return 31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBItemResizeGestureSwitcherModifierEvent;
  result = -[SBGestureSwitcherModifierEvent copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 19) = self->_selectedLayoutRole;
  *((_QWORD *)result + 20) = self->_selectedEdge;
  return result;
}

- (int64_t)selectedLayoutRole
{
  return self->_selectedLayoutRole;
}

- (void)setSelectedLayoutRole:(int64_t)a3
{
  self->_selectedLayoutRole = a3;
}

- (unint64_t)selectedEdge
{
  return self->_selectedEdge;
}

- (void)setSelectedEdge:(unint64_t)a3
{
  self->_selectedEdge = a3;
}

@end
