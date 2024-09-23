@implementation SBOverrideScrollViewContentOffsetSwitcherModifier

- (SBOverrideScrollViewContentOffsetSwitcherModifier)initWithScrollViewContentOffset:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  SBOverrideScrollViewContentOffsetSwitcherModifier *result;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)SBOverrideScrollViewContentOffsetSwitcherModifier;
  result = -[SBSwitcherModifier init](&v6, sel_init);
  if (result)
  {
    result->_scrollViewContentOffset.x = x;
    result->_scrollViewContentOffset.y = y;
  }
  return result;
}

- (CGPoint)scrollViewContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_scrollViewContentOffset.x;
  y = self->_scrollViewContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
