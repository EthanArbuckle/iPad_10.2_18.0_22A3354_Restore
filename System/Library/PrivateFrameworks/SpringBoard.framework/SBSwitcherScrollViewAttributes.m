@implementation SBSwitcherScrollViewAttributes

- (BOOL)scrollViewPagingEnabled
{
  return self->_scrollViewPagingEnabled;
}

- (double)decelerationRate
{
  return self->_decelerationRate;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScrollViewPagingEnabled:(BOOL)a3
{
  self->_scrollViewPagingEnabled = a3;
}

- (void)setPagingOrigin:(CGPoint)a3
{
  self->_pagingOrigin = a3;
}

- (void)setInterpolatesDuringSwipeToKill:(BOOL)a3
{
  self->_interpolatesDuringSwipeToKill = a3;
}

- (void)setInterpageSpacingForPaging:(CGSize)a3
{
  self->_interpageSpacingForPaging = a3;
}

- (void)setDecelerationRate:(double)a3
{
  self->_decelerationRate = a3;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBSwitcherScrollViewAttributes _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBSwitcherScrollViewAttributes _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)_copyWithClass:(Class)a3
{
  id v4;

  v4 = objc_alloc_init(a3);
  objc_msgSend(v4, "setContentSize:", self->_contentSize.width, self->_contentSize.height);
  objc_msgSend(v4, "setDecelerationRate:", self->_decelerationRate);
  objc_msgSend(v4, "setScrollViewPagingEnabled:", self->_scrollViewPagingEnabled);
  objc_msgSend(v4, "setInterpageSpacingForPaging:", self->_interpageSpacingForPaging.width, self->_interpageSpacingForPaging.height);
  objc_msgSend(v4, "setPagingOrigin:", self->_pagingOrigin.x, self->_pagingOrigin.y);
  objc_msgSend(v4, "setInterpolatesDuringSwipeToKill:", self->_interpolatesDuringSwipeToKill);
  return v4;
}

- (CGSize)interpageSpacingForPaging
{
  double width;
  double height;
  CGSize result;

  width = self->_interpageSpacingForPaging.width;
  height = self->_interpageSpacingForPaging.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)pagingOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_pagingOrigin.x;
  y = self->_pagingOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)interpolatesDuringSwipeToKill
{
  return self->_interpolatesDuringSwipeToKill;
}

@end
