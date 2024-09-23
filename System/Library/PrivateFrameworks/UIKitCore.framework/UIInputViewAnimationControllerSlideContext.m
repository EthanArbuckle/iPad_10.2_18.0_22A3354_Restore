@implementation UIInputViewAnimationControllerSlideContext

- (UIView)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (CGRect)snapshotEndFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_snapshotEndFrame.origin.x;
  y = self->_snapshotEndFrame.origin.y;
  width = self->_snapshotEndFrame.size.width;
  height = self->_snapshotEndFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSnapshotEndFrame:(CGRect)a3
{
  self->_snapshotEndFrame = a3;
}

- (UIInputViewSetPlacement)endPlacement
{
  return self->_endPlacement;
}

- (void)setEndPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_endPlacement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endPlacement, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end
