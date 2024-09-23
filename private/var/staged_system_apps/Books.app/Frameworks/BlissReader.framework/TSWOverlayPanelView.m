@implementation TSWOverlayPanelView

- (TSWOverlayPanelView)initWithFrame:(CGRect)a3
{
  TSWOverlayPanelView *v3;
  TSWOverlayPanelView *v4;
  float64x2_t v5;
  TSWPassThroughView *v6;
  TSWPassThroughView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSWOverlayPanelView;
  v3 = -[TSWOverlayPanelView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = TSDEdgeInsetsZero[1];
    *(float64x2_t *)&v3->_additionalShadowInset.top = TSDEdgeInsetsZero[0];
    *(float64x2_t *)&v3->_additionalShadowInset.bottom = v5;
    v6 = [TSWPassThroughView alloc];
    -[TSWOverlayPanelView bounds](v4, "bounds");
    v7 = -[TSWPassThroughView initWithFrame:](v6, "initWithFrame:");
    -[TSWOverlayPanelView setLayerHostingView:](v4, "setLayerHostingView:", v7);
    -[TSWOverlayPanelView addSubview:](v4, "addSubview:", -[TSWOverlayPanelView layerHostingView](v4, "layerHostingView"));
    -[TSWOverlayPanelView setAppearance:](v4, "setAppearance:", 1);

  }
  return v4;
}

- (CGRect)p_shadowFrame
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;

  -[TSWOverlayPanelView bounds](self, "bounds");
  top = self->_additionalShadowInset.top;
  left = self->_additionalShadowInset.left;
  v9.origin.x = v5 + left;
  v9.origin.y = v6 + top;
  v9.size.width = v7 - (left + self->_additionalShadowInset.right);
  v9.size.height = v8 - (top + self->_additionalShadowInset.bottom);
  return CGRectInset(v9, -4.0, -4.0);
}

- (void)p_layoutSublayers
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CALayer *topHairlineLayer;
  id v16;
  double v17;
  CALayer *bottomHairlineLayer;
  id v19;
  double v20;
  CGRect v21;
  CGRect v22;

  -[TSWOverlayPanelView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TSWOverlayPanelView p_shadowFrame](self, "p_shadowFrame");
  -[CALayer setFrame:](-[TSWOverlayPanelView bakedShadowLayer](self, "bakedShadowLayer"), "setFrame:", v11, v12, v13, v14);
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v22 = CGRectInset(v21, -1.0, 0.0);
  -[CAGradientLayer setFrame:](-[TSWOverlayPanelView gradientLayer](self, "gradientLayer"), "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  topHairlineLayer = self->_topHairlineLayer;
  if (topHairlineLayer)
  {
    v16 = -[CALayer contentsScale](topHairlineLayer, "contentsScale");
    -[CALayer setFrame:](self->_topHairlineLayer, "setFrame:", TSDRectWithOriginAndSize(v16, CGPointZero.x, CGPointZero.y, v8, 1.0 / v17));
  }
  bottomHairlineLayer = self->_bottomHairlineLayer;
  if (bottomHairlineLayer)
  {
    v19 = -[CALayer contentsScale](bottomHairlineLayer, "contentsScale");
    -[CALayer setFrame:](self->_bottomHairlineLayer, "setFrame:", TSDRectWithOriginAndSize(v19, 0.0, v10 - 1.0 / v20, v8, 1.0 / v20));
  }
}

- (void)setAdditionalShadowInset:(UIEdgeInsets)a3
{
  if (self->_additionalShadowInset.left != a3.left
    || self->_additionalShadowInset.top != a3.top
    || self->_additionalShadowInset.right != a3.right
    || self->_additionalShadowInset.bottom != a3.bottom)
  {
    self->_additionalShadowInset = a3;
    -[TSWOverlayPanelView p_layoutSublayers](self, "p_layoutSublayers");
  }
}

- (void)setAdditionalBackgroundInset:(UIEdgeInsets)a3
{
  if (self->_additionalBackgroundInset.left != a3.left
    || self->_additionalBackgroundInset.top != a3.top
    || self->_additionalBackgroundInset.right != a3.right
    || self->_additionalBackgroundInset.bottom != a3.bottom)
  {
    self->_additionalBackgroundInset = a3;
    -[TSWOverlayPanelView layoutSubviews](self, "layoutSubviews");
  }
}

- (double)shadowOpacity
{
  float v2;

  -[CALayer opacity](-[TSWOverlayPanelView bakedShadowLayer](self, "bakedShadowLayer"), "opacity");
  return v2;
}

- (void)setShadowOpacity:(double)a3
{
  float v3;
  CALayer *v4;
  double v5;

  v3 = a3;
  v4 = -[TSWOverlayPanelView bakedShadowLayer](self, "bakedShadowLayer");
  *(float *)&v5 = v3;
  -[CALayer setOpacity:](v4, "setOpacity:", v5);
}

- (double)p_contentsScale
{
  double result;

  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  return result;
}

- (void)setTopHairlineColor:(id)a3
{
  TSUColor *topHairlineColor;
  CALayer *topHairlineLayer;

  if (self->_topHairlineColor != a3 && (objc_msgSend(a3, "isEqual:") & 1) == 0)
  {

    topHairlineColor = (TSUColor *)a3;
    self->_topHairlineColor = topHairlineColor;
    topHairlineLayer = self->_topHairlineLayer;
    if (topHairlineColor)
    {
      if (!topHairlineLayer)
      {
        self->_topHairlineLayer = +[CALayer layer](CALayer, "layer");
        -[TSWOverlayPanelView p_contentsScale](self, "p_contentsScale");
        -[CALayer setContentsScale:](self->_topHairlineLayer, "setContentsScale:");
        -[CALayer setZPosition:](self->_topHairlineLayer, "setZPosition:", 1.0);
        -[CALayer addSublayer:](-[UIView layer](-[TSWOverlayPanelView layerHostingView](self, "layerHostingView"), "layer"), "addSublayer:", self->_topHairlineLayer);
        -[TSWOverlayPanelView p_layoutSublayers](self, "p_layoutSublayers");
        topHairlineColor = self->_topHairlineColor;
        if (!self->_topHairlineLayer)
          goto LABEL_10;
      }
      -[CALayer setBackgroundColor:](self->_topHairlineLayer, "setBackgroundColor:", -[TSUColor CGColor](topHairlineColor, "CGColor"));
    }
    else if (topHairlineLayer)
    {
      -[CALayer removeFromSuperlayer](self->_topHairlineLayer, "removeFromSuperlayer");

      self->_topHairlineLayer = 0;
    }
    topHairlineColor = self->_topHairlineColor;
LABEL_10:
    self->_topHairlineEnabled = topHairlineColor != 0;
  }
}

- (void)setBottomHairlineColor:(id)a3
{
  TSUColor *bottomHairlineColor;
  CALayer *bottomHairlineLayer;

  if (self->_bottomHairlineColor != a3 && (objc_msgSend(a3, "isEqual:") & 1) == 0)
  {

    bottomHairlineColor = (TSUColor *)a3;
    self->_bottomHairlineColor = bottomHairlineColor;
    bottomHairlineLayer = self->_bottomHairlineLayer;
    if (bottomHairlineColor)
    {
      if (!bottomHairlineLayer)
      {
        self->_bottomHairlineLayer = +[CALayer layer](CALayer, "layer");
        -[TSWOverlayPanelView p_contentsScale](self, "p_contentsScale");
        -[CALayer setContentsScale:](self->_bottomHairlineLayer, "setContentsScale:");
        -[CALayer setZPosition:](self->_bottomHairlineLayer, "setZPosition:", 1.0);
        -[CALayer addSublayer:](-[UIView layer](-[TSWOverlayPanelView layerHostingView](self, "layerHostingView"), "layer"), "addSublayer:", self->_bottomHairlineLayer);
        -[TSWOverlayPanelView p_layoutSublayers](self, "p_layoutSublayers");
        bottomHairlineColor = self->_bottomHairlineColor;
        if (!self->_bottomHairlineLayer)
          goto LABEL_10;
      }
      -[CALayer setBackgroundColor:](self->_bottomHairlineLayer, "setBackgroundColor:", -[TSUColor CGColor](bottomHairlineColor, "CGColor"));
    }
    else if (bottomHairlineLayer)
    {
      -[CALayer removeFromSuperlayer](self->_bottomHairlineLayer, "removeFromSuperlayer");

      self->_bottomHairlineLayer = 0;
    }
    bottomHairlineColor = self->_bottomHairlineColor;
LABEL_10:
    self->_bottomHairlineEnabled = bottomHairlineColor != 0;
  }
}

- (id)p_hairlineColorForAppearance:(int)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (!a3)
  {
    v3 = 0.15;
    v4 = 1.0;
    v5 = 1.0;
    v6 = 1.0;
    return +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", v4, v5, v6, v3);
  }
  if (a3 == 1)
  {
    v3 = 0.3;
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
    return +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", v4, v5, v6, v3);
  }
  return 0;
}

- (id)p_topHairlineColorForAppearance:(int)a3
{
  return -[TSWOverlayPanelView p_hairlineColorForAppearance:](self, "p_hairlineColorForAppearance:", *(_QWORD *)&a3);
}

- (id)p_bottomHairlineColorForAppearance:(int)a3
{
  return -[TSWOverlayPanelView p_hairlineColorForAppearance:](self, "p_hairlineColorForAppearance:", *(_QWORD *)&a3);
}

- (void)setTopHairlineEnabled:(BOOL)a3
{
  id v4;

  if (self->_topHairlineEnabled != a3)
  {
    if (a3)
      v4 = -[TSWOverlayPanelView p_topHairlineColorForAppearance:](self, "p_topHairlineColorForAppearance:", -[TSWOverlayPanelView appearance](self, "appearance"));
    else
      v4 = 0;
    -[TSWOverlayPanelView setTopHairlineColor:](self, "setTopHairlineColor:", v4);
  }
}

- (void)setBottomHairlineEnabled:(BOOL)a3
{
  if (self->_bottomHairlineEnabled != a3)
  {
    if (a3)
      -[TSWOverlayPanelView setBottomHairlineColor:](self, "setBottomHairlineColor:", -[TSWOverlayPanelView p_bottomHairlineColorForAppearance:](self, "p_bottomHairlineColorForAppearance:", -[TSWOverlayPanelView appearance](self, "appearance")));
    else
      -[TSWOverlayPanelView setBottomHairlineColor:](self, "setBottomHairlineColor:", 0);
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TSWOverlayPanelView;
  -[TSWOverlayPanelView layoutSubviews](&v15, "layoutSubviews");
  -[TSWOverlayPanelView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TSWOverlayPanelView additionalBackgroundInset](self, "additionalBackgroundInset");
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  -[TSWOverlayPanelView p_layoutSublayers](self, "p_layoutSublayers");
}

- (NSString)backdropGroupName
{
  uint64_t v3;
  void *v4;

  v3 = objc_opt_class(_UIBackdropView, a2);
  v4 = (void *)TSUDynamicCast(v3, self->_backgroundView);
  return (NSString *)objc_msgSend(v4, "groupName");
}

- (void)setBackdropGroupName:(id)a3
{
  uint64_t v5;
  void *v6;

  v5 = objc_opt_class(_UIBackdropView, a2);
  v6 = (void *)TSUDynamicCast(v5, self->_backgroundView);
  objc_msgSend(v6, "setGroupName:", a3);
}

- (void)dealloc
{
  objc_super v3;

  self->_layerHostingView = 0;
  self->_backgroundView = 0;

  self->mGradientLayer = 0;
  self->mBakedShadowLayer = 0;

  self->_topHairlineColor = 0;
  self->_bottomHairlineColor = 0;

  self->_topHairlineLayer = 0;
  self->_bottomHairlineLayer = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWOverlayPanelView;
  -[TSWOverlayPanelView dealloc](&v3, "dealloc");
}

- (void)p_resetAppearance
{
  CALayer *v3;
  double v4;

  -[CAGradientLayer setColors:](-[TSWOverlayPanelView gradientLayer](self, "gradientLayer"), "setColors:", 0);
  -[CAGradientLayer setBackgroundColor:](-[TSWOverlayPanelView gradientLayer](self, "gradientLayer"), "setBackgroundColor:", 0);
  -[CAGradientLayer setBorderColor:](-[TSWOverlayPanelView gradientLayer](self, "gradientLayer"), "setBorderColor:", 0);
  -[CAGradientLayer setBorderWidth:](-[TSWOverlayPanelView gradientLayer](self, "gradientLayer"), "setBorderWidth:", 0.0);
  v3 = -[TSWOverlayPanelView bakedShadowLayer](self, "bakedShadowLayer");
  LODWORD(v4) = 1.0;
  -[CALayer setOpacity:](v3, "setOpacity:", v4);
  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
}

- (BOOL)p_addBackgroundViewWithColor:(id)a3
{
  UIView *v5;

  if (!self->_backgroundView)
  {
    v5 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", TSDRectWithSize(-[TSWOverlayPanelView bounds](self, "bounds")));
    self->_backgroundView = v5;
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  }
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", objc_msgSend(a3, "UIColor"));
  if (!-[UIView superview](self->_backgroundView, "superview"))
  {
    -[TSWOverlayPanelView addSubview:](self, "addSubview:", self->_backgroundView);
    -[TSWOverlayPanelView sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
  }
  return 1;
}

- (BOOL)p_addBackdropWithSettings:(id)a3
{
  UIView *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;

  if (!self->_backgroundView)
  {
    v5 = (UIView *)objc_msgSend(objc_alloc((Class)_UIBackdropView), "initWithSettings:", a3);
    if (-[UIView effectView](v5, "effectView"))
      self->_backgroundView = v5;
    else

  }
  v6 = objc_opt_class(_UIBackdropView);
  *(_QWORD *)&v8 = TSUDynamicCast(v6, self->_backgroundView).n128_u64[0];
  v9 = v7;
  if (v7)
  {
    objc_msgSend(v7, "transitionToSettings:", a3, v8);
    if (!objc_msgSend(v9, "superview"))
    {
      -[TSWOverlayPanelView addSubview:](self, "addSubview:", self->_backgroundView);
      -[TSWOverlayPanelView sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
    }
  }
  return v9 != 0;
}

- (void)alphaAnimationWillBegin
{
  objc_msgSend(-[TSWOverlayPanelView layer](self, "layer"), "setAllowsGroupOpacity:", 0);
}

- (void)alphaAnimationDidEnd
{
  objc_msgSend(-[TSWOverlayPanelView layer](self, "layer"), "setAllowsGroupOpacity:", 1);
}

- (void)setAppearance:(int)a3
{
  uint64_t v3;
  TSUColor *v5;
  CALayer *v6;
  double v7;
  int v8;
  TSUColor *v9;

  v3 = *(_QWORD *)&a3;
  -[TSWOverlayPanelView p_resetAppearance](self, "p_resetAppearance");
  if ((_DWORD)v3 == 2)
  {
    -[CAGradientLayer setColors:](-[TSWOverlayPanelView gradientLayer](self, "gradientLayer"), "setColors:", 0);
    -[CAGradientLayer setBackgroundColor:](-[TSWOverlayPanelView gradientLayer](self, "gradientLayer"), "setBackgroundColor:", -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 0.0), "CGColor"));
    v6 = -[TSWOverlayPanelView bakedShadowLayer](self, "bakedShadowLayer");
    LODWORD(v7) = 0;
    -[CALayer setOpacity:](v6, "setOpacity:", v7);
    v8 = 2;
LABEL_11:
    self->mAppearance = v8;
    goto LABEL_13;
  }
  if ((_DWORD)v3 == 1)
  {
    v9 = +[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.980392157, 0.9);
    if (!-[TSWOverlayPanelView p_addBackdropWithSettings:](self, "p_addBackdropWithSettings:", +[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", 2020)))-[TSWOverlayPanelView p_addBackgroundViewWithColor:](self, "p_addBackgroundViewWithColor:", v9);
    v8 = 1;
    goto LABEL_11;
  }
  if ((_DWORD)v3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWOverlayPanelView setAppearance:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/TSWOverlayPanelView.m"), 482, CFSTR("Unrecognized TSWOverlayAppearance value %u"), v3);
  }
  else
  {
    v5 = +[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 0.8);
    if (!-[TSWOverlayPanelView p_addBackdropWithSettings:](self, "p_addBackdropWithSettings:", +[_UIBackdropViewSettings settingsForPrivateStyle:](_UIBackdropViewSettings, "settingsForPrivateStyle:", 2030)))-[TSWOverlayPanelView p_addBackgroundViewWithColor:](self, "p_addBackgroundViewWithColor:", v5);
    self->mAppearance = 0;
  }
LABEL_13:
  if (self->_topHairlineEnabled)
    -[TSWOverlayPanelView setTopHairlineColor:](self, "setTopHairlineColor:", -[TSWOverlayPanelView p_topHairlineColorForAppearance:](self, "p_topHairlineColorForAppearance:", -[TSWOverlayPanelView appearance](self, "appearance")));
  if (self->_bottomHairlineEnabled)
    -[TSWOverlayPanelView setBottomHairlineColor:](self, "setBottomHairlineColor:", -[TSWOverlayPanelView p_bottomHairlineColorForAppearance:](self, "p_bottomHairlineColorForAppearance:", -[TSWOverlayPanelView appearance](self, "appearance")));
}

- (CAGradientLayer)gradientLayer
{
  return self->mGradientLayer;
}

- (void)setGradientLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CALayer)bakedShadowLayer
{
  return self->mBakedShadowLayer;
}

- (void)setBakedShadowLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)appearance
{
  return self->mAppearance;
}

- (UIEdgeInsets)additionalShadowInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalShadowInset.top;
  left = self->_additionalShadowInset.left;
  bottom = self->_additionalShadowInset.bottom;
  right = self->_additionalShadowInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)additionalBackgroundInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalBackgroundInset.top;
  left = self->_additionalBackgroundInset.left;
  bottom = self->_additionalBackgroundInset.bottom;
  right = self->_additionalBackgroundInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)allowWindowMoveForPanel
{
  return self->_allowWindowMoveForPanel;
}

- (void)setAllowWindowMoveForPanel:(BOOL)a3
{
  self->_allowWindowMoveForPanel = a3;
}

- (TSUColor)topHairlineColor
{
  return self->_topHairlineColor;
}

- (TSUColor)bottomHairlineColor
{
  return self->_bottomHairlineColor;
}

- (BOOL)topHairlineEnabled
{
  return self->_topHairlineEnabled;
}

- (BOOL)bottomHairlineEnabled
{
  return self->_bottomHairlineEnabled;
}

- (UIView)layerHostingView
{
  return self->_layerHostingView;
}

- (void)setLayerHostingView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (CALayer)topHairlineLayer
{
  return self->_topHairlineLayer;
}

- (void)setTopHairlineLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (CALayer)bottomHairlineLayer
{
  return self->_bottomHairlineLayer;
}

- (void)setBottomHairlineLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
