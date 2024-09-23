@implementation _XBWrapperWindow

- (BOOL)_shouldUseRemoteContext
{
  return 1;
}

- (BOOL)_isWindowServerHostingManaged
{
  return 1;
}

- (BOOL)_alwaysGetsContexts
{
  return 1;
}

- (BOOL)_shouldResizeWithScene
{
  return 0;
}

- (int64_t)_orientationForViewTransform
{
  return 1;
}

- (int64_t)_orientationForRootTransform
{
  return 1;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  UIEdgeInsets result;

  if (self->_customSafeAreaInsets)
  {
    -[XBDisplayEdgeInsetsWrapper edgeInsets](self->_customSafeAreaInsets, "edgeInsets");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_XBWrapperWindow;
    -[_XBWrapperWindow safeAreaInsets](&v6, "safeAreaInsets");
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (XBDisplayEdgeInsetsWrapper)_customSafeAreaInsets
{
  return self->_customSafeAreaInsets;
}

- (void)_setCustomSafeAreaInsets:(id)a3
{
  objc_storeStrong((id *)&self->_customSafeAreaInsets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSafeAreaInsets, 0);
}

@end
