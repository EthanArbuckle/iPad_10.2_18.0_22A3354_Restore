@implementation BKScrubberControl

- (void)_setupCommon:(int64_t)a3
{
  void *v4;
  CALayer *v5;
  CALayer *modernKnobLayer;
  void *v7;
  BKScrubberLayerImp *v8;
  BKScrubberLayerImp *modernKnobImp;
  CALayer *v10;
  CALayer *modernTrackLayer;
  void *v12;
  BKScrubberLayerImp *v13;
  BKScrubberLayerImp *modernTrackImp;
  void *v15;
  id v16;
  id v17;

  self->_isClassic = a3 == 0;
  -[BKScrubberControl setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  v17 = (id)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  -[BKScrubberControl bounds](self, "bounds");
  objc_msgSend(v17, "setFrame:");
  objc_msgSend(v17, "setAutoresizingMask:", 18);
  -[BKScrubberControl addSubview:](self, "addSubview:", v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl thumb](self, "thumb"));
  -[BKScrubberControl addSubview:](self, "addSubview:", v4);

  -[BKScrubberControl addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "_updateInteractions:", 4096);
  -[BKScrubberControl addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "_updateInteractions:", 64);
  -[BKScrubberControl addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "_updateInteractions:", 256);
  self->_pageNumber = 0x7FFFFFFFFFFFFFFFLL;
  -[BKScrubberControl setProgress:](self, "setProgress:", 0.0);
  -[BKScrubberControl setLayoutDirection:](self, "setLayoutDirection:", 0);
  -[BKScrubberControl setOrientation:](self, "setOrientation:", 0);
  if (!self->_isClassic)
  {
    v5 = (CALayer *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl _makeScrollerPartLayer](self, "_makeScrollerPartLayer"));
    modernKnobLayer = self->_modernKnobLayer;
    self->_modernKnobLayer = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKShapeView layer](self->_thumb, "layer"));
    objc_msgSend(v7, "addSublayer:", self->_modernKnobLayer);

    -[BKScrubberControl _setupCommonLayerProperties:](self, "_setupCommonLayerProperties:", self->_modernKnobLayer);
    v8 = -[BKScrubberLayerImp initWithLayer:orientation:]([BKScrubberLayerImp alloc], "initWithLayer:orientation:", self->_modernKnobLayer, -[BKScrubberControl orientation](self, "orientation"));
    modernKnobImp = self->_modernKnobImp;
    self->_modernKnobImp = v8;

    -[BKScrubberLayerImp setIsKnob:](self->_modernKnobImp, "setIsKnob:", 1);
    v10 = (CALayer *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl _makeScrollerPartLayer](self, "_makeScrollerPartLayer"));
    modernTrackLayer = self->_modernTrackLayer;
    self->_modernTrackLayer = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberTrack layer](self->_track, "layer"));
    objc_msgSend(v12, "addSublayer:", self->_modernTrackLayer);

    -[BKScrubberControl _setupCommonLayerProperties:](self, "_setupCommonLayerProperties:", self->_modernTrackLayer);
    v13 = -[BKScrubberLayerImp initWithLayer:orientation:]([BKScrubberLayerImp alloc], "initWithLayer:orientation:", self->_modernTrackLayer, -[BKScrubberControl orientation](self, "orientation"));
    modernTrackImp = self->_modernTrackImp;
    self->_modernTrackImp = v13;

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
  v16 = -[BKScrubberControl registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v15, "_traitCollectionDidChange:previousTraitCollection:");

}

- (void)didMoveToWindow
{
  BKScrubberHoverController *v3;
  BKScrubberHoverController *hoverController;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKScrubberControl;
  -[BKScrubberControl didMoveToWindow](&v5, "didMoveToWindow");
  if (!self->_hoverController && !self->_isClassic)
  {
    v3 = -[BKScrubberHoverController initWithScrubber:]([BKScrubberHoverController alloc], "initWithScrubber:", self);
    hoverController = self->_hoverController;
    self->_hoverController = v3;

  }
}

- (void)setThemeInterfaceStyle:(int64_t)a3
{
  self->_themeInterfaceStyle = a3;
  -[BKScrubberLayerImp setThemeInterfaceStyle:](self->_modernKnobImp, "setThemeInterfaceStyle:");
  -[BKScrubberLayerImp setThemeInterfaceStyle:](self->_modernTrackImp, "setThemeInterfaceStyle:", a3);
  -[CALayer setNeedsDisplay](self->_modernKnobLayer, "setNeedsDisplay");
  -[CALayer setNeedsDisplay](self->_modernTrackLayer, "setNeedsDisplay");
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl traitCollection](self, "traitCollection", a3, a4));
  -[BKScrubberLayerImp setTraitCollection:](self->_modernKnobImp, "setTraitCollection:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKScrubberControl traitCollection](self, "traitCollection"));
  -[BKScrubberLayerImp setTraitCollection:](self->_modernTrackImp, "setTraitCollection:", v6);

}

- (void)_setupCommonLayerProperties:(id)a3
{
  double y;
  id v5;
  id v6;

  y = CGPointZero.y;
  v5 = a3;
  objc_msgSend(v5, "setAnchorPoint:", CGPointZero.x, y);
  objc_msgSend(v5, "setGeometryFlipped:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKScrubberTrack layer](self->_track, "layer"));
  objc_msgSend(v6, "contentsScale");
  objc_msgSend(v5, "setContentsScale:");

}

- (id)_makeScrollerPartLayer
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  objc_msgSend(v2, "setBounds:", 0.0, 0.0, 8.0, 8.0);
  objc_msgSend(v2, "setNeedsDisplayOnBoundsChange:", 0);
  objc_msgSend(v2, "setNeedsDisplay");
  return v2;
}

- (BKScrubberControl)initWithFrame:(CGRect)a3
{
  return -[BKScrubberControl initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BKScrubberControl)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  BKScrubberControl *v5;
  BKScrubberControl *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKScrubberControl;
  v5 = -[BKScrubberControl initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    -[BKScrubberControl _setupCommon:](v5, "_setupCommon:", a4);
  return v6;
}

- (void)dealloc
{
  BKScrubberTrack *track;
  BKShapeView *thumb;
  UIScrollView *scrollView;
  objc_super v6;

  track = self->_track;
  self->_track = 0;

  thumb = self->_thumb;
  self->_thumb = 0;

  scrollView = self->_scrollView;
  self->_scrollView = 0;

  v6.receiver = self;
  v6.super_class = (Class)BKScrubberControl;
  -[BKScrubberControl dealloc](&v6, "dealloc");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[BKScrubberControl hitRectForThumb](self, "hitRectForThumb", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  BKScrubberControl *v6;
  BKScrubberControl *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKScrubberControl;
  v5 = -[BKScrubberControl hitTest:withEvent:](&v9, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (BKScrubberControl *)objc_claimAutoreleasedReturnValue(v5);
  if (-[BKScrubberControl isDescendantOfView:](v6, "isDescendantOfView:", self))
  {
    v7 = self;

    v6 = v7;
  }
  return v6;
}

- (double)_xPositionFromPercentage:(double)Width
{
  void *v5;
  char *v6;
  double result;
  double v8;
  CGRect v9;
  CGRect v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  v6 = (char *)objc_msgSend(v5, "layoutDirection");

  if (v6 == (_BYTE *)&dword_0 + 1)
  {
    v8 = 1.0 - Width;
    -[BKScrubberControl bounds](self, "bounds");
    Width = CGRectGetWidth(v10);
  }
  else
  {
    result = 0.0;
    if (v6)
      return result;
    -[BKScrubberControl bounds](self, "bounds", 0.0);
    v8 = CGRectGetWidth(v9);
  }
  return v8 * Width;
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
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BOOL8 v31;
  objc_super v32;
  CGRect v33;

  v32.receiver = self;
  v32.super_class = (Class)BKScrubberControl;
  -[BKScrubberControl layoutSubviews](&v32, "layoutSubviews");
  -[BKScrubberControl bounds](self, "bounds");
  -[BKScrubberControl trackRectForBounds:](self, "trackRectForBounds:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  objc_msgSend(v12, "bounds");
  -[CALayer setFrame:](self->_modernTrackLayer, "setFrame:");

  -[BKScrubberControl thumbRect](self, "thumbRect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl thumb](self, "thumb"));
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl thumb](self, "thumb"));
  objc_msgSend(v22, "bounds");
  -[CALayer setFrame:](self->_modernKnobLayer, "setFrame:");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl thumb](self, "thumb"));
  -[BKScrubberControl progress](self, "progress");
  if (v24 == 1.0
    && -[BKScrubberControl isEnabled](self, "isEnabled")
    && (-[BKScrubberControl value](self, "value"), v25 >= 0.0)
    && (-[BKScrubberControl value](self, "value"), v26 <= 1.0)
    || -[BKScrubberControl hideThumbView](self, "hideThumbView"))
  {
    objc_msgSend(v23, "bounds");
    v28 = v27;
    -[BKScrubberControl value](self, "value");
    -[BKScrubberControl _xPositionFromPercentage:](self, "_xPositionFromPercentage:");
    v30 = v29;
    -[BKScrubberControl bounds](self, "bounds");
    v31 = v30 > v28 * 0.5 + CGRectGetWidth(v33) || v30 < -(v28 * 0.5);
  }
  else
  {
    v31 = 1;
  }
  objc_msgSend(v23, "setHidden:", v31);

}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  objc_super v13;
  CGPoint v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)BKScrubberControl;
  v6 = a3;
  -[BKScrubberControl beginTrackingWithTouch:withEvent:](&v13, "beginTrackingWithTouch:withEvent:", v6, a4);
  objc_msgSend(v6, "locationInView:", self, v13.receiver, v13.super_class);
  v8 = v7;
  v10 = v9;

  -[BKScrubberControl hitRectForThumb](self, "hitRectForThumb");
  v14.x = v8;
  v14.y = v10;
  v11 = CGRectContainsPoint(v15, v14);
  if (v11)
    LOBYTE(v11) = -[BKScrubberControl _touchBeganAtPoint:](self, "_touchBeganAtPoint:", v8, v10);
  return v11;
}

- (BOOL)_touchBeganAtPoint:(CGPoint)a3
{
  -[BKScrubberControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096, a3.x, a3.y);
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BKScrubberControl;
  v6 = a3;
  -[BKScrubberControl continueTrackingWithTouch:withEvent:](&v13, "continueTrackingWithTouch:withEvent:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track", v13.receiver, v13.super_class));
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  -[BKScrubberControl _touchMovedAtPoint:refresh:](self, "_touchMovedAtPoint:refresh:", -[BKScrubberControl isTracking](self, "isTracking") ^ 1, v9, v11);
  return 1;
}

- (void)_touchMovedAtPoint:(CGPoint)a3 refresh:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  unsigned int v8;
  double v9;
  int64_t v10;
  id v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  if (-[BKScrubberControl orientation](self, "orientation"))
  {
    v8 = -[BKScrubberControl orientation](self, "orientation");
    v9 = 0.0;
    if (v8 == 1)
    {
      objc_msgSend(v11, "frame", 0.0);
      v9 = y / CGRectGetHeight(v12);
    }
  }
  else
  {
    v10 = -[BKScrubberControl layoutDirection](self, "layoutDirection");
    if (v10 == 1)
    {
      objc_msgSend(v11, "frame");
      v9 = 1.0 - x / CGRectGetWidth(v14);
    }
    else
    {
      v9 = 0.0;
      if (!v10)
      {
        objc_msgSend(v11, "frame", 0.0);
        v9 = x / CGRectGetWidth(v13);
      }
    }
  }
  -[BKScrubberControl scrubToValue:refresh:](self, "scrubToValue:refresh:", v4, v9);
  -[BKScrubberControl layoutIfNeeded](self, "layoutIfNeeded");

}

- (int64_t)pageNumberForValue:(double)a3
{
  uint64_t v4;
  double v6;

  v4 = -[BKScrubberControl pageCount](self, "pageCount");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  v6 = (double)v4;
  if ((double)v4 * a3 <= (double)v4)
    v6 = (double)v4 * a3;
  return (uint64_t)fmax(v6, 1.0);
}

- (void)scrubToValue:(double)a3 refresh:(BOOL)a4
{
  double v5;
  unint64_t v6;
  double v7;
  double v8;

  if (a3 > 1.0)
    a3 = 1.0;
  v5 = fmax(a3, 0.0);
  -[BKScrubberControl _setValue:updateScrollView:](self, "_setValue:updateScrollView:", 0, v5);
  v6 = -[BKScrubberControl pageCount](self, "pageCount");
  v7 = v5 * (double)-[BKScrubberControl pageCount](self, "pageCount") + 1.0;
  if (v7 > (double)v6)
    v7 = (double)v6;
  v8 = fmax(v7, 1.0);
  if (v8 != (double)-[BKScrubberControl pageNumber](self, "pageNumber"))
  {
    -[BKScrubberControl setPageNumber:](self, "setPageNumber:", (uint64_t)v8);
    -[BKScrubberControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (void)scrubToPageNumber:(int64_t)a3 refresh:(BOOL)a4
{
  -[BKScrubberControl setPageNumber:refresh:](self, "setPageNumber:refresh:", a3, a4);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (-[BKScrubberControl isEnabled](self, "isEnabled") != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)BKScrubberControl;
    -[BKScrubberControl setEnabled:](&v8, "setEnabled:", v3);
    -[BKScrubberControl setNeedsLayout](self, "setNeedsLayout");
    v5 = v3 ^ 1;
    if (self->_isClassic)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
      objc_msgSend(v6, "setHidden:", v5);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl scrollView](self, "scrollView"));
    objc_msgSend(v7, "setHidden:", v5);

    -[BKScrubberControl updateHoverState](self, "updateHoverState");
  }
}

- (CGRect)hitRectForThumb
{
  void *v2;
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
  double v15;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl thumb](self, "thumb"));
  objc_msgSend(v2, "center");
  v5 = CGRectMakeWithCenterAndSize(v3, v4, 65.0, 31.0);
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setValue:(double)a3
{
  -[BKScrubberControl _setValue:updateScrollView:](self, "_setValue:updateScrollView:", 1, a3);
}

- (void)_setValue:(double)a3 updateScrollView:(BOOL)a4
{
  void *v6;
  double v7;
  double v8;
  void *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track", a4));
  objc_msgSend(v6, "readingProgress");
  v8 = v7;

  if (v8 != a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
    objc_msgSend(v9, "setReadingProgress:", a3);

    if (!-[BKScrubberControl hideThumbView](self, "hideThumbView"))
      -[BKScrubberControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPageNumber:(int64_t)a3
{
  -[BKScrubberControl setPageNumber:refresh:](self, "setPageNumber:refresh:", a3, -[BKScrubberControl isTracking](self, "isTracking") ^ 1);
}

- (void)setPageNumber:(int64_t)a3 refresh:(BOOL)a4
{
  int64_t v4;
  _BOOL8 v5;

  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 >= 1)
    v4 = a3;
  if (v4 != self->_pageNumber)
  {
    v5 = a4;
    self->_pageNumber = v4;
    if (!-[BKScrubberControl hideThumbView](self, "hideThumbView"))
      -[BKScrubberControl setNeedsLayout](self, "setNeedsLayout");
    -[BKScrubberControl updateValueAndRefresh:](self, "updateValueAndRefresh:", v5);
  }
}

- (void)setPageCount:(unint64_t)a3
{
  -[BKScrubberControl setPageCount:refresh:](self, "setPageCount:refresh:", a3, -[BKScrubberControl isTracking](self, "isTracking") ^ 1);
}

- (void)setPageCount:(unint64_t)a3 refresh:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_pageCount != a3)
  {
    v4 = a4;
    self->_pageCount = a3;
    -[BKScrubberControl setNeedsLayout](self, "setNeedsLayout");
    -[BKScrubberControl updateValueAndRefresh:](self, "updateValueAndRefresh:", v4);
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", CGSizeZero.width, CGSizeZero.height);
  }
}

- (void)updateValue
{
  -[BKScrubberControl updateValueAndRefresh:](self, "updateValueAndRefresh:", -[BKScrubberControl isTracking](self, "isTracking") ^ 1);
}

- (void)updateValueAndRefresh:(BOOL)a3
{
  int64_t pageNumber;
  double v4;
  unint64_t pageCount;

  if (a3)
  {
    pageNumber = self->_pageNumber;
    v4 = 0.0;
    if (pageNumber != 1 && pageNumber != 0x7FFFFFFFFFFFFFFFLL)
    {
      pageCount = self->_pageCount;
      v4 = 1.0;
      if (pageNumber != pageCount)
      {
        v4 = 0.0;
        if (pageCount)
          v4 = (double)pageNumber / (double)pageCount;
      }
    }
    -[BKScrubberControl setValue:](self, "setValue:", v4);
  }
}

- (void)setLayoutDirection:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  v6 = objc_msgSend(v5, "layoutDirection");

  if (v6 != (id)a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
    objc_msgSend(v7, "setLayoutDirection:", a3);

    -[BKScrubberControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOrientation:(int)a3
{
  uint64_t v3;
  void *v5;
  unsigned int v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  v6 = objc_msgSend(v5, "trackOrientation");

  if (v6 != (_DWORD)v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
    objc_msgSend(v7, "setTrackOrientation:", v3);

    -[BKScrubberLayerImp setOrientation:](self->_modernKnobImp, "setOrientation:", v3);
    -[BKScrubberLayerImp setOrientation:](self->_modernTrackImp, "setOrientation:", v3);
    -[BKScrubberControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setProgress:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  objc_msgSend(v5, "loadingProgress");
  v7 = v6;

  if (v7 != a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
    objc_msgSend(v8, "setLoadingProgress:", a3);

    -[BKScrubberControl setNeedsLayout](self, "setNeedsLayout");
    -[BKScrubberControl updateHoverState](self, "updateHoverState");
  }
}

- (CGRect)thumbRect
{
  void *v3;
  double v4;
  double v5;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  objc_msgSend(v3, "loadingProgress");
  v5 = v4;

  if (v5 == 1.0)
  {
    if (self->_isClassic)
      -[BKScrubberControl _classicThumbRect](self, "_classicThumbRect");
    else
      -[BKScrubberControl _modernThumbRect](self, "_modernThumbRect");
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_classicThumbRect
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  void *v13;
  uint64_t v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  objc_msgSend(v3, "loadingProgress");
  v5 = v4;

  if (v5 == 1.0)
  {
    if (-[BKScrubberControl orientation](self, "orientation"))
    {
      if (-[BKScrubberControl orientation](self, "orientation") != 1)
      {
LABEL_8:
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v13, "scale");

        x = CGRectMakeWithOriginSize(v14);
        goto LABEL_9;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
      objc_msgSend(v6, "frame");
      CGRectGetMidX(v15);

      -[BKScrubberControl value](self, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
      objc_msgSend(v7, "frame");
      CGRectGetHeight(v16);
    }
    else
    {
      -[BKScrubberControl value](self, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
      objc_msgSend(v12, "frame");
      CGRectGetWidth(v17);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
      objc_msgSend(v7, "frame");
      CGRectGetMidY(v18);
    }

    goto LABEL_8;
  }
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
LABEL_9:
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)_knobOffsetForInset:(double)a3 knobLength:(double)a4 knobTravelLength:(double)a5
{
  double v8;

  -[BKScrubberControl value](self, "value");
  return a3 + v8 * (a5 - a4);
}

- (CGRect)_modernThumbRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  unsigned int v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  -[BKScrubberControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[BKScrubberControl orientation](self, "orientation");
  v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  if (v11)
  {
    v16 = CGRectGetHeight(*(CGRect *)&v12) + -2.0;
    -[BKScrubberControl _knobProportion](self, "_knobProportion");
    v18 = fmax(v17 * v16, 26.0);
    v19 = 1.0;
    -[BKScrubberControl _knobOffsetForInset:knobLength:knobTravelLength:](self, "_knobOffsetForInset:knobLength:knobTravelLength:", 1.0, v18, v16);
    v21 = v20;
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    v22 = CGRectGetWidth(v30) + -2.0;
  }
  else
  {
    v23 = CGRectGetWidth(*(CGRect *)&v12) + -2.0;
    -[BKScrubberControl _knobProportion](self, "_knobProportion");
    v22 = fmax(v24 * v23, 26.0);
    v21 = 1.0;
    -[BKScrubberControl _knobOffsetForInset:knobLength:knobTravelLength:](self, "_knobOffsetForInset:knobLength:knobTravelLength:", 1.0, v22, v23);
    v19 = v25;
    v31.origin.x = v4;
    v31.origin.y = v6;
    v31.size.width = v8;
    v31.size.height = v10;
    v18 = CGRectGetHeight(v31) + -2.0;
  }
  v26 = v19;
  v27 = v21;
  v28 = v22;
  v29 = v18;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (double)_knobProportion
{
  return (float)(1.0 / (float)-[BKScrubberControl pageCount](self, "pageCount"));
}

- (BKShapeView)thumb
{
  BKShapeView *v3;
  BKShapeView *v4;
  void *v5;
  BKShapeView *thumb;
  BKShapeView *v7;

  if (!self->_thumb && !-[BKScrubberControl hideThumbView](self, "hideThumbView"))
  {
    v3 = -[BKShapeView initWithFrame:]([BKShapeView alloc], "initWithFrame:", 0.0, 0.0, 8.0, 8.0);
    v4 = v3;
    if (self->_isClassic)
    {
      -[BKShapeView bounds](v3, "bounds");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:"));
      -[BKShapeView setPath:](v4, "setPath:", v5);

    }
    -[BKShapeView setFillColorUsesTintColor:](v4, "setFillColorUsesTintColor:", 1);
    -[BKShapeView setIgnoresTintColorAlpha:](v4, "setIgnoresTintColorAlpha:", 1);
    thumb = self->_thumb;
    self->_thumb = v4;
    v7 = v4;

    -[BKShapeView setAlpha:](self->_thumb, "setAlpha:", 0.01);
  }
  return self->_thumb;
}

- (BKScrubberTrack)track
{
  BKScrubberTrack *track;
  BKClassicScrubberTrack *v4;
  BKScrubberTrack *v5;

  track = self->_track;
  if (!track)
  {
    v4 = objc_alloc_init(BKClassicScrubberTrack);
    v5 = self->_track;
    self->_track = &v4->super;

    -[BKScrubberTrack setAlpha:](self->_track, "setAlpha:", 0.01);
    track = self->_track;
    if (!self->_isClassic)
    {
      -[BKScrubberTrack setModern:](track, "setModern:", 1);
      track = self->_track;
    }
  }
  return track;
}

- (int64_t)layoutDirection
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  v3 = objc_msgSend(v2, "layoutDirection");

  return (int64_t)v3;
}

- (double)progress
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  objc_msgSend(v2, "loadingProgress");
  v4 = v3;

  return v4;
}

- (double)value
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;

  v3 = -[BKScrubberControl layoutDirection](self, "layoutDirection");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  objc_msgSend(v4, "readingProgress");
  if (v3)
    v6 = 1.0 - v5;
  else
    v6 = v5;

  return v6;
}

- (int)orientation
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
  v3 = objc_msgSend(v2, "trackOrientation");

  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  _BOOL4 v20;
  void *v21;
  CGPoint v23;
  CGRect v24;

  v7 = a3;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKScrubberControl pointerInteraction](self, "pointerInteraction"));
  if (v9 != v7)
  {

LABEL_5:
    v21 = 0;
    goto LABEL_6;
  }
  -[BKShapeView frame](self->_thumb, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v8, "location");
  v23.x = v18;
  v23.y = v19;
  v24.origin.x = v11;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  v20 = CGRectContainsPoint(v24, v23);

  if (!v20)
    goto LABEL_5;
  -[BKShapeView frame](self->_thumb, "frame");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", CFSTR("thumb")));
LABEL_6:

  return v21;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BKScrubberControl pointerInteraction](self, "pointerInteraction"));
  if ((id)v8 != v6)
  {
    v9 = (id)v8;
    v10 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("thumb"));

  if (v12)
  {
    if (-[BKScrubberControl isTracking](self, "isTracking"))
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v9));
      v14 = objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithShape:constrainedAxes:](UIPointerStyle, "styleWithShape:constrainedAxes:", v13, 0));
    }
    else
    {
      v9 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", self->_thumb);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerHighlightEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v9));
      v14 = objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v13, 0));
    }
    v10 = (void *)v14;

    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (int64_t)pageNumber
{
  return self->_pageNumber;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (void)setTrack:(id)a3
{
  objc_storeStrong((id *)&self->_track, a3);
}

- (int64_t)themeInterfaceStyle
{
  return self->_themeInterfaceStyle;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (BOOL)hideThumbView
{
  return self->_hideThumbView;
}

- (void)setHideThumbView:(BOOL)a3
{
  self->_hideThumbView = a3;
}

- (void)setThumb:(id)a3
{
  objc_storeStrong((id *)&self->_thumb, a3);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (BKAccessibilityScrubberControlDelegate)bkAccessibilityDelegate
{
  return (BKAccessibilityScrubberControlDelegate *)objc_loadWeakRetained((id *)&self->_bkAccessibilityDelegate);
}

- (void)setBkAccessibilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_bkAccessibilityDelegate, a3);
}

- (int64_t)hoverState
{
  return self->_hoverState;
}

- (BOOL)isClassic
{
  return self->_isClassic;
}

- (void)setIsClassic:(BOOL)a3
{
  self->_isClassic = a3;
}

- (BKScrubberHoverController)hoverController
{
  return self->_hoverController;
}

- (void)setHoverController:(id)a3
{
  objc_storeStrong((id *)&self->_hoverController, a3);
}

- (CALayer)modernKnobLayer
{
  return self->_modernKnobLayer;
}

- (void)setModernKnobLayer:(id)a3
{
  objc_storeStrong((id *)&self->_modernKnobLayer, a3);
}

- (CALayer)modernTrackLayer
{
  return self->_modernTrackLayer;
}

- (void)setModernTrackLayer:(id)a3
{
  objc_storeStrong((id *)&self->_modernTrackLayer, a3);
}

- (BKScrubberLayerImp)modernKnobImp
{
  return self->_modernKnobImp;
}

- (void)setModernKnobImp:(id)a3
{
  objc_storeStrong((id *)&self->_modernKnobImp, a3);
}

- (BKScrubberLayerImp)modernTrackImp
{
  return self->_modernTrackImp;
}

- (void)setModernTrackImp:(id)a3
{
  objc_storeStrong((id *)&self->_modernTrackImp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modernTrackImp, 0);
  objc_storeStrong((id *)&self->_modernKnobImp, 0);
  objc_storeStrong((id *)&self->_modernTrackLayer, 0);
  objc_storeStrong((id *)&self->_modernKnobLayer, 0);
  objc_storeStrong((id *)&self->_hoverController, 0);
  objc_destroyWeak((id *)&self->_bkAccessibilityDelegate);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_thumb, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_track, 0);
}

- (void)updateHoverState
{
  BKScrubberHoverController *hoverController;
  id v4;

  hoverController = self->_hoverController;
  if (hoverController)
    v4 = -[BKScrubberHoverController gestureHoverState](hoverController, "gestureHoverState");
  else
    v4 = &dword_0 + 2;
  -[BKScrubberControl setHoverState:](self, "setHoverState:", v4);
}

- (void)setHoverState:(int64_t)a3
{
  int64_t v4;
  int64_t hoverState;
  int64_t v6;
  BOOL v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[5];
  BOOL v15;
  _QWORD v16[5];
  BOOL v17;

  v4 = -[BKScrubberControl validateHoverState:](self, "validateHoverState:", a3);
  hoverState = self->_hoverState;
  if (hoverState != v4)
  {
    v6 = v4;
    self->_hoverState = v4;
    v7 = v4 == 2;
    v8 = v4 != 0;
    -[BKScrubberControl progress](self, "progress");
    if (v9 == 1.0)
      v10 = 0.25;
    else
      v10 = 0.0;
    if (v9 == 1.0)
      v11 = 0.5;
    else
      v11 = 0.0;
    if (((v7 ^ (hoverState != 2)) & 1) == 0)
    {
      if (v6 == 2)
        v12 = v10;
      else
        v12 = v11;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_12F850;
      v16[3] = &unk_28D018;
      v16[4] = self;
      v17 = v6 == 2;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v16, v12);
    }
    if ((v6 != 0) == (hoverState == 0))
    {
      if (v6)
        v13 = v10;
      else
        v13 = v11;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_12F8A4;
      v14[3] = &unk_28D018;
      v14[4] = self;
      v15 = v8;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v14, v13);
    }
  }
}

- (int64_t)validateHoverState:(int64_t)a3
{
  double v5;

  if (!-[BKScrubberControl isEnabled](self, "isEnabled"))
    return 0;
  -[BKScrubberControl progress](self, "progress");
  if (v5 != 1.0)
    return 0;
  return a3;
}

- (void)_updateScrollviewValue:(double)a3
{
  double v5;
  double v6;
  UIScrollView *scrollView;
  double v8;
  void *v9;
  char *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (-[BKScrubberControl orientation](self, "orientation"))
  {
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    v6 = v5 * a3;
    scrollView = self->_scrollView;
    v8 = 0.0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberControl track](self, "track"));
    v10 = (char *)objc_msgSend(v9, "layoutDirection");

    if (v10 == (_BYTE *)&dword_0 + 1)
    {
      -[UIScrollView contentSize](self->_scrollView, "contentSize");
      v13 = v12;
      -[UIScrollView contentSize](self->_scrollView, "contentSize");
      v8 = v13 - v14 * a3;
    }
    else
    {
      if (v10)
        return;
      -[UIScrollView contentSize](self->_scrollView, "contentSize");
      v8 = v11 * a3;
    }
    scrollView = self->_scrollView;
    v6 = 0.0;
  }
  -[UIScrollView setContentOffset:](scrollView, "setContentOffset:", v8, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *scrollView;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  char *v22;

  scrollView = self->_scrollView;
  v5 = a3;
  -[UIScrollView frame](scrollView, "frame");
  v7 = v6;
  v9 = v8;
  v10 = -[BKScrubberControl orientation](self, "orientation");
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v12 = v11;
  v14 = v13;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v16 = v9 * (v14 / (v15 - v9));
  v18 = v7 * (v12 / (v17 - v7));
  if (v10)
    v19 = 0.0;
  else
    v19 = v18;
  if (v10)
    v20 = v16;
  else
    v20 = 0.0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "panGestureRecognizer"));

  v22 = (char *)objc_msgSend(v21, "state");
  if (v22 == (_BYTE *)&dword_0 + 2)
    -[BKScrubberControl _touchMovedAtPoint:refresh:](self, "_touchMovedAtPoint:refresh:", 0, v19, v20);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[BKScrubberControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 1);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_12FB9C;
  v4[3] = &unk_28CC18;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

@end
