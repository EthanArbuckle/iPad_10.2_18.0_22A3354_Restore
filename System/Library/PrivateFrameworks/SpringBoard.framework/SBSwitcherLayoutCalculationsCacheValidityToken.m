@implementation SBSwitcherLayoutCalculationsCacheValidityToken

- (SBSwitcherLayoutCalculationsCacheValidityToken)initWithAppLayoutsGenCount:(unint64_t)a3 continuousExposeIdentifiersGenCount:(unint64_t)a4 switcherInterfaceOrientation:(int64_t)a5 containerViewBounds:(CGRect)a6 modifierEventGenCount:(unint64_t)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SBSwitcherLayoutCalculationsCacheValidityToken *result;
  objc_super v16;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)SBSwitcherLayoutCalculationsCacheValidityToken;
  result = -[SBSwitcherLayoutCalculationsCacheValidityToken init](&v16, sel_init);
  if (result)
  {
    result->_appLayoutsGenCount = a3;
    result->_continuousExposeIdentifiersGenCount = a4;
    result->_containerViewBounds.origin.x = x;
    result->_containerViewBounds.origin.y = y;
    result->_containerViewBounds.size.width = width;
    result->_containerViewBounds.size.height = height;
    result->_switcherInterfaceOrientation = a5;
    result->_modifierEventGenCount = a7;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SBSwitcherLayoutCalculationsCacheValidityToken *v4;
  SBSwitcherLayoutCalculationsCacheValidityToken *v5;
  SBSwitcherLayoutCalculationsCacheValidityToken *v6;
  BOOL v7;

  v4 = (SBSwitcherLayoutCalculationsCacheValidityToken *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      v7 = self->_appLayoutsGenCount == v5->_appLayoutsGenCount
        && self->_continuousExposeIdentifiersGenCount == v5->_continuousExposeIdentifiersGenCount
        && self->_switcherInterfaceOrientation == v5->_switcherInterfaceOrientation
        && CGRectEqualToRect(self->_containerViewBounds, v5->_containerViewBounds)
        && self->_modifierEventGenCount == v6->_modifierEventGenCount;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)appLayoutsGenCount
{
  return self->_appLayoutsGenCount;
}

- (void)setAppLayoutsGenCount:(unint64_t)a3
{
  self->_appLayoutsGenCount = a3;
}

- (unint64_t)continuousExposeIdentifiersGenCount
{
  return self->_continuousExposeIdentifiersGenCount;
}

- (void)setContinuousExposeIdentifiersGenCount:(unint64_t)a3
{
  self->_continuousExposeIdentifiersGenCount = a3;
}

- (int64_t)switcherInterfaceOrientation
{
  return self->_switcherInterfaceOrientation;
}

- (void)setSwitcherInterfaceOrientation:(int64_t)a3
{
  self->_switcherInterfaceOrientation = a3;
}

- (CGRect)containerViewBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containerViewBounds.origin.x;
  y = self->_containerViewBounds.origin.y;
  width = self->_containerViewBounds.size.width;
  height = self->_containerViewBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContainerViewBounds:(CGRect)a3
{
  self->_containerViewBounds = a3;
}

- (unint64_t)modifierEventGenCount
{
  return self->_modifierEventGenCount;
}

- (void)setModifierEventGenCount:(unint64_t)a3
{
  self->_modifierEventGenCount = a3;
}

@end
