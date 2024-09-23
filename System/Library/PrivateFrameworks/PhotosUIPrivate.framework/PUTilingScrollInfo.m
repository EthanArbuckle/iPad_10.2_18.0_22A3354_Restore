@implementation PUTilingScrollInfo

- (int64_t)scrollDirections
{
  return self->_scrollDirections;
}

- (void)_setScrollDirections:(int64_t)a3
{
  self->_scrollDirections = a3;
}

- (BOOL)shouldEnablePaging
{
  return self->_shouldEnablePaging;
}

- (void)_setShouldEnablePaging:(BOOL)a3
{
  self->_shouldEnablePaging = a3;
}

- (CGSize)interpageSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interpageSpacing.width;
  height = self->_interpageSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setInterpageSpacing:(CGSize)a3
{
  self->_interpageSpacing = a3;
}

- (double)pagingSpringPullAdjustment
{
  return self->_pagingSpringPullAdjustment;
}

- (void)_setPagingSpringPullAdjustment:(double)a3
{
  self->_pagingSpringPullAdjustment = a3;
}

- (double)pagingFrictionAdjustment
{
  return self->_pagingFrictionAdjustment;
}

- (void)_setPagingFrictionAdjustment:(double)a3
{
  self->_pagingFrictionAdjustment = a3;
}

+ (PUTilingScrollInfo)scrollInfoWithScrollDirections:(int64_t)a3
{
  PUTilingScrollInfo *v4;

  v4 = objc_alloc_init(PUTilingScrollInfo);
  -[PUTilingScrollInfo _setScrollDirections:](v4, "_setScrollDirections:", a3);
  return v4;
}

+ (PUTilingScrollInfo)scrollInfoWithScrollDirections:(int64_t)a3 enabledPagingWithInterpageSpacing:(CGSize)a4
{
  return (PUTilingScrollInfo *)objc_msgSend(a1, "scrollInfoWithScrollDirections:enabledPagingWithInterpageSpacing:pagingSpringPullAdjustment:pagingFrictionAdjustment:", a3, a4.width, a4.height, 0.0, 0.0);
}

+ (PUTilingScrollInfo)scrollInfoWithScrollDirections:(int64_t)a3 enabledPagingWithInterpageSpacing:(CGSize)a4 pagingSpringPullAdjustment:(double)a5 pagingFrictionAdjustment:(double)a6
{
  double height;
  double width;
  PUTilingScrollInfo *v11;

  height = a4.height;
  width = a4.width;
  v11 = objc_alloc_init(PUTilingScrollInfo);
  -[PUTilingScrollInfo _setScrollDirections:](v11, "_setScrollDirections:", a3);
  -[PUTilingScrollInfo _setShouldEnablePaging:](v11, "_setShouldEnablePaging:", 1);
  -[PUTilingScrollInfo _setInterpageSpacing:](v11, "_setInterpageSpacing:", width, height);
  -[PUTilingScrollInfo _setPagingSpringPullAdjustment:](v11, "_setPagingSpringPullAdjustment:", a5);
  -[PUTilingScrollInfo _setPagingFrictionAdjustment:](v11, "_setPagingFrictionAdjustment:", a6);
  return v11;
}

@end
