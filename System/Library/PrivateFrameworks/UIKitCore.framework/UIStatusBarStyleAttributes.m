@implementation UIStatusBarStyleAttributes

- (BOOL)isDoubleHeight
{
  return 0;
}

- (UIStatusBarStyleAttributes)initWithRequest:(id)a3
{
  id v4;
  UIStatusBarStyleAttributes *v5;
  uint64_t v6;
  UIStatusBarStyleRequest *request;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIStatusBarStyleAttributes;
  v5 = -[UIStatusBarStyleAttributes init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    request = v5->_request;
    v5->_request = (UIStatusBarStyleRequest *)v6;

  }
  return v5;
}

- (UIStatusBarStyleAttributes)init
{
  return -[UIStatusBarStyleAttributes initWithRequest:](self, "initWithRequest:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)-[UIStatusBarStyleRequest copy](self->_request, "copy");
  v6 = (_QWORD *)objc_msgSend(v4, "initWithRequest:", v5);

  v7 = -[UIStatusBarStyleRequest copy](self->_request, "copy");
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[UIStatusBarForegroundStyleAttributes copy](self->_foregroundStyle, "copy");
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (double)foregroundAlpha
{
  double result;

  -[UIStatusBarStyleRequest foregroundAlpha](self->_request, "foregroundAlpha");
  return result;
}

- (void)setForegroundAlpha:(double)a3
{
  UIStatusBarStyleRequest *v5;
  UIStatusBarStyleRequest *request;

  v5 = (UIStatusBarStyleRequest *)-[UIStatusBarStyleRequest mutableCopy](self->_request, "mutableCopy");
  -[UIStatusBarStyleRequest setForegroundAlpha:](v5, "setForegroundAlpha:", a3);
  request = self->_request;
  self->_request = v5;

}

- (int64_t)style
{
  return -[UIStatusBarStyleRequest style](self->_request, "style");
}

- (int64_t)legibilityStyle
{
  return -[UIStatusBarStyleRequest legibilityStyle](self->_request, "legibilityStyle");
}

- (BOOL)supportsRasterization
{
  return -[UIStatusBarStyleAttributes legibilityStyle](self, "legibilityStyle") == 0;
}

- (id)foregroundStyle
{
  UIStatusBarForegroundStyleAttributes *foregroundStyle;
  UIStatusBarForegroundStyleAttributes *v4;
  UIStatusBarForegroundStyleAttributes *v5;
  unint64_t v6;
  uint64_t v7;

  foregroundStyle = self->_foregroundStyle;
  if (!foregroundStyle)
  {
    -[UIStatusBarStyleAttributes heightForMetrics:](self, "heightForMetrics:", 0);
    v4 = -[UIStatusBarStyleAttributes newForegroundStyleWithHeight:](self, "newForegroundStyleWithHeight:");
    v5 = self->_foregroundStyle;
    self->_foregroundStyle = v4;

    v6 = -[UIStatusBarStyleAttributes style](self, "style");
    if (v6 - 300 < 6
      || v6 - 103 <= 7 && ((1 << (v6 - 103)) & 0x99) != 0
      || (v7 = 0, v6 <= 3) && v6 != 2)
    {
      v7 = 1;
    }
    -[UIStatusBarForegroundStyleAttributes setCanShowBreadcrumbs:](self->_foregroundStyle, "setCanShowBreadcrumbs:", v7);
    foregroundStyle = self->_foregroundStyle;
  }
  return foregroundStyle;
}

- (int64_t)idiom
{
  void *v2;
  int64_t v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return v3;
}

- (double)heightForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double result;
  uint64_t v10;
  _BOOL8 v12;

  -[UIStatusBarStyleRequest overrideHeight](self->_request, "overrideHeight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIStatusBarStyleRequest overrideHeight](self->_request, "overrideHeight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    return v8;
  }
  else
  {
    v10 = _UIDeviceNativeUserInterfaceIdiom();
    v12 = (unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFELL && v10 != 1;
    -[UIStatusBarStyleAttributes heightForMetrics:](self, "heightForMetrics:", v12);
  }
  return result;
}

- (double)heightForMetrics:(int64_t)a3
{
  return 20.0;
}

- (BOOL)isTranslucent
{
  return 0;
}

- (BOOL)isTransparent
{
  return 0;
}

- (BOOL)isLockScreen
{
  return 0;
}

- (BOOL)usesVerticalLayout
{
  void *v2;
  char v3;

  -[UIStatusBarStyleAttributes foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesVerticalLayout");

  return v3;
}

- (BOOL)shouldProduceReturnEvent
{
  return 0;
}

- (BOOL)shouldUseVisualAltitude
{
  return 0;
}

- (id)backgroundColorWithTintColor:(id)a3
{
  return 0;
}

- (id)backgroundImageName
{
  return 0;
}

- (id)newForegroundStyleWithHeight:(double)a3
{
  return 0;
}

- (double)glowAnimationDuration
{
  return 0.0;
}

- (BOOL)shouldShowInternalItemType:(int)a3 withScreenCapabilities:(id)a4
{
  return 0;
}

- (int64_t)tapButtonType
{
  return -1;
}

- (BOOL)isPulsingAnimationEnabled
{
  return self->_pulsingAnimationEnabled;
}

- (void)setPulsingAnimationEnabled:(BOOL)a3
{
  self->_pulsingAnimationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundStyle, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
