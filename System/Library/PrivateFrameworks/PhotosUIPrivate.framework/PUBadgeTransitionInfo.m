@implementation PUBadgeTransitionInfo

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (UIOffset)badgesOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_badgesOffset.horizontal;
  vertical = self->_badgesOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setBadgesOffset:(UIOffset)a3
{
  self->_badgesOffset = a3;
}

- (unint64_t)badgesCorner
{
  return self->_badgesCorner;
}

- (void)setBadgesCorner:(unint64_t)a3
{
  self->_badgesCorner = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
}

@end
