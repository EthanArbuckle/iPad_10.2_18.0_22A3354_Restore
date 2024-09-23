@implementation CRLiOSPencilTrayColorWell

- (CRLiOSPencilTrayColorWell)initWithFrame:(CGRect)a3
{
  CRLiOSPencilTrayColorWell *v3;
  CRLiOSPencilTrayColorWell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSPencilTrayColorWell;
  v3 = -[CRLiOSPencilTrayColorWell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CRLiOSPencilTrayColorWell p_commonInit](v3, "p_commonInit");
  return v4;
}

- (CRLiOSPencilTrayColorWell)initWithCoder:(id)a3
{
  CRLiOSPencilTrayColorWell *v3;
  CRLiOSPencilTrayColorWell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSPencilTrayColorWell;
  v3 = -[CRLiOSPencilTrayColorWell initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CRLiOSPencilTrayColorWell p_commonInit](v3, "p_commonInit");
  return v4;
}

- (void)p_commonInit
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CRLiOSPencilTrayColorWell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[CRLiOSPencilTrayColorWell p_installBackgroundView](self, "p_installBackgroundView");
  -[CRLiOSPencilTrayColorWell p_updateColorBulletView](self, "p_updateColorBulletView");
  -[CRLiOSPencilTrayColorWell p_updateStrokeHoleMask](self, "p_updateStrokeHoleMask");
  -[CRLiOSPencilTrayColorWell addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "p_presentColorPicker:", 64);
  -[CRLiOSPencilTrayColorWell setShowsLargeContentViewer:](self, "setShowsLargeContentViewer:", 1);
  v4 = objc_alloc_init((Class)UILargeContentViewerInteraction);
  -[CRLiOSPencilTrayColorWell addInteraction:](self, "addInteraction:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Show More Colors"), 0, 0));
  -[CRLiOSPencilTrayColorWell setLargeContentTitle:](self, "setLargeContentTitle:", v6);

  v7 = objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", self);
  -[CRLiOSPencilTrayColorWell setPointerInteraction:](self, "setPointerInteraction:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayColorWell pointerInteraction](self, "pointerInteraction"));
  -[CRLiOSPencilTrayColorWell addInteraction:](self, "addInteraction:", v8);

  -[CRLiOSPencilTrayColorWell setHitTestInsets:](self, "setHitTestInsets:", -12.0, -12.0, -12.0, -12.0);
  v12 = objc_opt_class(UITraitUserInterfaceStyle, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v11 = -[CRLiOSPencilTrayColorWell registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v10, self, "setNeedsLayout");

}

- (void)p_installBackgroundView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *rainbowBackgroundView;

  if (self->_rainbowBackgroundView)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231A08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF03A4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231A28);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell p_installBackgroundView]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 77, 0, "expected nil value for '%{public}s'", "_rainbowBackgroundView");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("CRLiOSPencilTray/ColorWell")));
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231A48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF0318();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231A68);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell p_installBackgroundView]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 79, 0, "invalid nil value for '%{public}s'", "rainbowBackgroundImage");

  }
  v10 = (UIView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v6);
  rainbowBackgroundView = self->_rainbowBackgroundView;
  self->_rainbowBackgroundView = v10;

  -[CRLiOSPencilTrayColorWell addSubview:](self, "addSubview:", self->_rainbowBackgroundView);
}

- (void)setSelectedColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_selectedColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedColor, a3);
    -[CRLiOSPencilTrayColorWell p_updateColorBulletView](self, "p_updateColorBulletView");
    -[CRLiOSPencilTrayColorWell p_updateColorPickerIfNeeded](self, "p_updateColorPickerIfNeeded");
    v5 = v6;
  }

}

- (void)setForStrokeColor:(BOOL)a3
{
  if (self->_isForStrokeColor != a3)
  {
    self->_isForStrokeColor = a3;
    -[CRLiOSPencilTrayColorWell p_updateStrokeHoleMask](self, "p_updateStrokeHoleMask");
    -[CRLiOSPencilTrayColorWell p_updateColorPickerIfNeeded](self, "p_updateColorPickerIfNeeded");
  }
}

- (void)toggleColorPickerPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayColorWell window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231A88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF04B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231AA8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell toggleColorPickerPresentation]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 106, 0, "invalid nil value for '%{public}s'", "rootVC");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  if (v9)
  {
    v10 = objc_opt_class(UIColorPickerViewController, v8);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101231AC8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF0430();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101231AE8);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell toggleColorPickerPresentation]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 110, 0, "PencilKit should handle dismissing other presented view controllers before we get here.");

    }
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    -[CRLiOSPencilTrayColorWell p_presentColorPicker:](self, "p_presentColorPicker:", 0);
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  CRLiOSPencilTrayColorWell *v6;
  CRLiOSPencilTrayColorWell *v7;
  CRLiOSPencilTrayColorWell *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLiOSPencilTrayColorWell;
  v5 = -[CRLiOSPencilTrayColorWell hitTest:withEvent:](&v10, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (CRLiOSPencilTrayColorWell *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6 && -[CRLiOSPencilTrayColorWell isDescendantOfView:](v6, "isDescendantOfView:", self))
  {
    v8 = self;

    v7 = v8;
  }
  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSPencilTrayColorWell;
  -[CRLiOSPencilTrayColorWell setHighlighted:](&v6, "setHighlighted:");
  v5 = 1.0;
  if (v3)
    v5 = 0.5;
  -[CRLiOSPencilTrayColorWell setAlpha:](self, "setAlpha:", v5);
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
  CGFloat v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  CAShapeLayer *strokeHoleMask;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGPath *Mutable;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v34.receiver = self;
  v34.super_class = (Class)CRLiOSPencilTrayColorWell;
  -[CRLiOSPencilTrayColorWell layoutSubviews](&v34, "layoutSubviews");
  -[CRLiOSPencilTrayColorWell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_rainbowBackgroundView, "setFrame:");
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  v11 = CGRectGetWidth(v35) * 0.5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_rainbowBackgroundView, "layer"));
  objc_msgSend(v12, "setCornerRadius:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayColorWell layer](self, "layer"));
  objc_msgSend(v13, "setCornerRadius:", v11);

  if (self->_colorBulletView)
  {
    v36.origin.x = v4;
    v36.origin.y = v6;
    v36.size.width = v8;
    v36.size.height = v10;
    v14 = round(CGRectGetWidth(v36) * 0.13);
    v37.origin.x = v4;
    v37.origin.y = v6;
    v37.size.width = v8;
    v37.size.height = v10;
    v15 = round(CGRectGetHeight(v37) * 0.13);
    v38.origin.x = v4;
    v38.origin.y = v6;
    v38.size.width = v8;
    v38.size.height = v10;
    v39 = CGRectInset(v38, v14, v15);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    -[UIView setFrame:](self->_colorBulletView, "setFrame:");
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v20 = CGRectGetWidth(v40) * 0.5;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_colorBulletView, "layer"));
    objc_msgSend(v21, "setCornerRadius:", v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_colorBulletView, "layer"));
    objc_msgSend(v22, "setBorderWidth:", 0.5);

    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayColorWell p_colorBulletOutlineColor](self, "p_colorBulletOutlineColor")));
    v24 = objc_msgSend(v23, "CGColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_colorBulletView, "layer"));
    objc_msgSend(v25, "setBorderColor:", v24);

  }
  strokeHoleMask = self->_strokeHoleMask;
  if (strokeHoleMask)
  {
    -[CAShapeLayer setFrame:](strokeHoleMask, "setFrame:", v4, v6, v8, v10);
    v41.origin.x = v4;
    v41.origin.y = v6;
    v41.size.width = v8;
    v41.size.height = v10;
    v27 = round(CGRectGetWidth(v41) * 0.29);
    v42.origin.x = v4;
    v42.origin.y = v6;
    v42.size.width = v8;
    v42.size.height = v10;
    v28 = round(CGRectGetHeight(v42) * 0.29);
    v43.origin.x = v4;
    v43.origin.y = v6;
    v43.size.width = v8;
    v43.size.height = v10;
    v44 = CGRectInset(v43, v27, v28);
    v29 = v44.origin.x;
    v30 = v44.origin.y;
    v31 = v44.size.width;
    v32 = v44.size.height;
    Mutable = CGPathCreateMutable();
    v45.origin.x = v4;
    v45.origin.y = v6;
    v45.size.width = v8;
    v45.size.height = v10;
    CGPathAddRect(Mutable, 0, v45);
    v46.origin.x = v29;
    v46.origin.y = v30;
    v46.size.width = v31;
    v46.size.height = v32;
    CGPathAddEllipseInRect(Mutable, 0, v46);
    -[CAShapeLayer setPath:](self->_strokeHoleMask, "setPath:", Mutable);
    CGPathRelease(Mutable);
  }
}

- (id)p_colorBulletOutlineColor
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayColorWell traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == (id)2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v5 = v4;
    v6 = 0.16;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v5 = v4;
    v6 = 0.08;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorWithAlphaComponent:", v6));

  return v7;
}

- (void)p_updateColorBulletView
{
  void *v3;
  UIView *colorBulletView;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayColorWell selectedColor](self, "selectedColor"));

  colorBulletView = self->_colorBulletView;
  if (v3 && !colorBulletView)
  {
    v5 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v6 = self->_colorBulletView;
    self->_colorBulletView = v5;

    -[CRLiOSPencilTrayColorWell addSubview:](self, "addSubview:", self->_colorBulletView);
LABEL_8:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayColorWell selectedColor](self, "selectedColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorWithAlphaComponent:", 1.0));
    -[UIView setBackgroundColor:](self->_colorBulletView, "setBackgroundColor:", v9);

    -[CRLiOSPencilTrayColorWell setNeedsLayout](self, "setNeedsLayout");
    return;
  }
  if (!v3 && colorBulletView)
  {
    -[UIView removeFromSuperview](colorBulletView, "removeFromSuperview");
    v7 = self->_colorBulletView;
    self->_colorBulletView = 0;

    return;
  }
  if (v3)
    goto LABEL_8;
}

- (void)p_updateStrokeHoleMask
{
  unsigned int v3;
  unsigned int v4;
  CAShapeLayer *strokeHoleMask;
  CAShapeLayer *v6;
  CAShapeLayer *v7;
  id v8;
  CAShapeLayer *v9;
  CAShapeLayer *v10;
  char v11;
  void *v12;

  v3 = -[CRLiOSPencilTrayColorWell isForStrokeColor](self, "isForStrokeColor");
  v4 = v3;
  strokeHoleMask = self->_strokeHoleMask;
  if (v3 && !strokeHoleMask)
  {
    v6 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
    v7 = self->_strokeHoleMask;
    self->_strokeHoleMask = v6;

    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    -[CAShapeLayer setFillColor:](self->_strokeHoleMask, "setFillColor:", objc_msgSend(v8, "CGColor"));

    -[CAShapeLayer setFillRule:](self->_strokeHoleMask, "setFillRule:", kCAFillRuleEvenOdd);
    v9 = self->_strokeHoleMask;
    v10 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayColorWell layer](self, "layer"));
    -[CAShapeLayer setMask:](v10, "setMask:", v9);
LABEL_9:

    goto LABEL_10;
  }
  if (strokeHoleMask)
    v11 = v3;
  else
    v11 = 1;
  if ((v11 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayColorWell layer](self, "layer"));
    objc_msgSend(v12, "setMask:", 0);

    v10 = self->_strokeHoleMask;
    self->_strokeHoleMask = 0;
    goto LABEL_9;
  }
LABEL_10:
  if (v4)
    -[CRLiOSPencilTrayColorWell setNeedsLayout](self, "setNeedsLayout");
}

- (void)p_presentColorPicker:(id)a3
{
  -[CRLiOSPencilTrayColorWell p_presentColorPicker:withCompletion:](self, "p_presentColorPicker:withCompletion:", a3, 0);
}

- (void)p_presentColorPicker:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIColorPickerViewController *v12;
  UIColorPickerViewController *colorPicker;
  void *v14;
  void *v15;
  void *v16;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayColorWell window](self, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231B08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF0540();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231B28);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell p_presentColorPicker:withCompletion:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 250, 0, "invalid nil value for '%{public}s'", "rootVC");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedViewController"));
  if (!v11)
  {
    if (!self->_colorPicker)
    {
      v12 = (UIColorPickerViewController *)objc_alloc_init((Class)UIColorPickerViewController);
      colorPicker = self->_colorPicker;
      self->_colorPicker = v12;

      -[UIColorPickerViewController setDelegate:](self->_colorPicker, "setDelegate:", self);
      -[UIColorPickerViewController setSupportsAlpha:](self->_colorPicker, "setSupportsAlpha:", 1);
      -[UIColorPickerViewController setModalPresentationStyle:](self->_colorPicker, "setModalPresentationStyle:", 7);
    }
    -[CRLiOSPencilTrayColorWell p_updateColorPickerIfNeeded](self, "p_updateColorPickerIfNeeded");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIColorPickerViewController popoverPresentationController](self->_colorPicker, "popoverPresentationController"));
    objc_msgSend(v14, "setSourceView:", self);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayColorWell window](self, "window"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rootViewController"));
    objc_msgSend(v16, "presentViewController:animated:completion:", self->_colorPicker, 1, v5);

  }
}

- (void)p_updateColorPickerIfNeeded
{
  UIColorPickerViewController *colorPicker;
  UIColorPickerViewController *v4;
  id v5;

  colorPicker = self->_colorPicker;
  if (colorPicker)
  {
    -[UIColorPickerViewController crl_ifVisuallyDifferentSetSelectedColor:](colorPicker, "crl_ifVisuallyDifferentSetSelectedColor:", self->_selectedColor);
    v4 = self->_colorPicker;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayColorWell p_titleForColorPicker](self, "p_titleForColorPicker"));
    -[UIColorPickerViewController setTitle:](v4, "setTitle:", v5);

  }
}

- (id)p_titleForColorPicker
{
  _BOOL4 isForStrokeColor;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  isForStrokeColor = self->_isForStrokeColor;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (isForStrokeColor)
    v5 = CFSTR("Stroke Color");
  else
    v5 = CFSTR("Fill Color");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return v6;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc((Class)UITargetedPreview);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v7 = objc_msgSend(v5, "initWithView:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerHighlightEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));

  objc_msgSend(v9, "bounds");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v8, v11));
  return v12;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGRect v19;
  CGRect v20;

  objc_msgSend(a5, "rect", a3, a4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CRLiOSPencilTrayColorWell hitTestInsets](self, "hitTestInsets");
  v15 = v14;
  -[CRLiOSPencilTrayColorWell hitTestInsets](self, "hitTestInsets");
  v17 = v16;
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  v20 = CGRectInset(v19, v15, v17);
  return +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  UIColor *v8;
  void *v9;
  void *v10;
  void *v11;
  UIColor *selectedColor;

  v8 = (UIColor *)a4;
  if (self->_colorPicker != a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231B48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF05CC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231B68);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell colorPickerViewController:didSelectColor:continuously:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 310, 0, "expected equality between %{public}s and %{public}s", "viewController", "_colorPicker");

  }
  selectedColor = self->_selectedColor;
  self->_selectedColor = v8;

  self->_isUpdatingContinuously = a5;
  -[CRLiOSPencilTrayColorWell p_updateColorBulletView](self, "p_updateColorBulletView");
  -[CRLiOSPencilTrayColorWell sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  UIColorPickerViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (UIColorPickerViewController *)a3;
  if (self->_colorPicker != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231B88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF06FC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231BA8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell colorPickerViewControllerDidFinish:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 322, 0, "expected equality between %{public}s and %{public}s", "viewController", "_colorPicker");

  }
  if (self->_isUpdatingContinuously)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231BC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF0678();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231BE8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayColorWell colorPickerViewControllerDidFinish:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayColorWell.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 325, 0, "Color picker should not tell us it finished before telling us about the final color.");

    self->_isUpdatingContinuously = 0;
    -[CRLiOSPencilTrayColorWell sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }

}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (BOOL)isForStrokeColor
{
  return self->_isForStrokeColor;
}

- (BOOL)isUpdatingContinuously
{
  return self->_isUpdatingContinuously;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_colorPicker, 0);
  objc_storeStrong((id *)&self->_strokeHoleMask, 0);
  objc_storeStrong((id *)&self->_colorBulletView, 0);
  objc_storeStrong((id *)&self->_rainbowBackgroundView, 0);
}

@end
