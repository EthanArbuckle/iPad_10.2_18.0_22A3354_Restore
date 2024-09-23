@implementation PGPictureInPictureViewControllerClippingView

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v3;

  if (!self->_ignoreCornerRadiusUpdates)
  {
    v3.receiver = self;
    v3.super_class = (Class)PGPictureInPictureViewControllerClippingView;
    -[PGPictureInPictureViewControllerClippingView _setContinuousCornerRadius:](&v3, sel__setContinuousCornerRadius_, a3);
  }
}

- (BOOL)ignoreCornerRadiusUpdates
{
  return self->_ignoreCornerRadiusUpdates;
}

- (void)setIgnoreCornerRadiusUpdates:(BOOL)a3
{
  self->_ignoreCornerRadiusUpdates = a3;
}

@end
