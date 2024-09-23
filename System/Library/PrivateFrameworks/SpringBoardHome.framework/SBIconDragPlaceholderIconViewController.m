@implementation SBIconDragPlaceholderIconViewController

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  double v6;

  self->iconImageInfo.size.width = v3;
  self->iconImageInfo.size.height = v4;
  self->iconImageInfo.scale = v5;
  self->iconImageInfo.continuousCornerRadius = v6;
}

- (BOOL)isEditing
{
  return self->editing;
}

- (void)setEditing:(BOOL)a3
{
  self->editing = a3;
}

- (BOOL)showsSquareCorners
{
  return self->showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->showsSquareCorners = a3;
}

- (double)continuousCornerRadius
{
  return self->continuousCornerRadius;
}

- (CGRect)visibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->visibleBounds.origin.x;
  y = self->visibleBounds.origin.y;
  width = self->visibleBounds.size.width;
  height = self->visibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
