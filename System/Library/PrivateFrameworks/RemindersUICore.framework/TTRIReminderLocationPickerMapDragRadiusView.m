@implementation TTRIReminderLocationPickerMapDragRadiusView

- (TTRIReminderLocationPickerMapDragRadiusView)initWithCoder:(id)a3
{

  return 0;
}

- (TTRIReminderLocationPickerMapDragRadiusView)initWithFrame:(CGRect)a3 mapView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  TTRIReminderLocationPickerMapDragRadiusView *v11;
  double v12;
  uint64_t v13;
  UIImageView *handleImageView;
  void *v15;
  NSMeasurementFormatter *v16;
  NSMeasurementFormatter *measurementFormatter;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIColor *circleColor;
  uint64_t v23;
  UIColor *handleColor;
  void *v25;
  objc_super v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TTRIReminderLocationPickerMapDragRadiusView;
  v11 = -[TTRIReminderLocationPickerMapDragRadiusView initWithFrame:](&v27, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D846C8], "minimumRegionMonitoringDistance");
    v11->_minimumRadius = v12;
    v11->_maximumRadius = 241401.0;
    v11->_radiusPaddingMultiplier = 3.5;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
    handleImageView = v11->_handleImageView;
    v11->_handleImageView = (UIImageView *)v13;

    -[UIImageView layer](v11->_handleImageView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setZPosition:", 50.0);

    objc_storeStrong((id *)&v11->_mapView, a4);
    v16 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x1E0CB3760]);
    measurementFormatter = v11->_measurementFormatter;
    v11->_measurementFormatter = v16;

    if (-[TTRIReminderLocationPickerMapDragRadiusView _usesMetric](v11, "_usesMetric"))
      v18 = 3;
    else
      v18 = 2;
    -[NSMeasurementFormatter setUnitOptions:](v11->_measurementFormatter, "setUnitOptions:", v18);
    -[NSMeasurementFormatter numberFormatter](v11->_measurementFormatter, "numberFormatter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMinimumFractionDigits:", 0);

    -[NSMeasurementFormatter numberFormatter](v11->_measurementFormatter, "numberFormatter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMaximumFractionDigits:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v21 = objc_claimAutoreleasedReturnValue();
    circleColor = v11->_circleColor;
    v11->_circleColor = (UIColor *)v21;

    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v23 = objc_claimAutoreleasedReturnValue();
    handleColor = v11->_handleColor;
    v11->_handleColor = (UIColor *)v23;

    -[TTRIReminderLocationPickerMapDragRadiusView _updateHandleImageView](v11, "_updateHandleImageView");
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v11, sel_handlePanGesture_);
    -[TTRIReminderLocationPickerMapDragRadiusView addGestureRecognizer:](v11, "addGestureRecognizer:", v25);

  }
  return v11;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  CGContext *CurrentContext;
  id v23;
  const CGFloat *Components;
  id v25;
  const CGFloat *v26;
  void *v27;
  void *v28;
  void *v29;
  double x;
  double y;
  double width;
  double height;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  objc_super v44;
  _QWORD v45[3];
  _QWORD v46[4];
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v46[3] = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)TTRIReminderLocationPickerMapDragRadiusView;
  -[TTRIReminderLocationPickerMapDragRadiusView drawRect:](&v44, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (-[TTRIReminderLocationPickerMapDragRadiusView isDragging](self, "isDragging"))
  {
    -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIReminderLocationPickerMapDragRadiusView region](self, "region");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "center");
    objc_msgSend(v4, "convertCoordinate:toPointToView:", self);
    v7 = v6;
    v9 = v8;

    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "center");
    v12 = v11 - v7;

    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "center");
    v15 = v14 - (v12 + v12);
    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "center");
    v18 = v17 - v12;

    -[TTRIReminderLocationPickerMapDragRadiusView circleColor](self, "circleColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIReminderLocationPickerMapDragRadiusView circleColor](self, "circleColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "colorWithAlphaComponent:", 0.15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    CurrentContext = UIGraphicsGetCurrentContext();
    v47.origin.x = v15;
    v47.origin.y = v18;
    v47.size.width = v12 + v12;
    v47.size.height = v12 + v12;
    CGContextAddEllipseInRect(CurrentContext, v47);
    v23 = objc_retainAutorelease(v21);
    Components = CGColorGetComponents((CGColorRef)objc_msgSend(v23, "CGColor"));
    CGContextSetFillColor(CurrentContext, Components);
    CGContextFillPath(CurrentContext);
    v48.origin.x = v15;
    v48.origin.y = v18;
    v48.size.width = v12 + v12;
    v48.size.height = v12 + v12;
    CGContextAddEllipseInRect(CurrentContext, v48);
    v25 = objc_retainAutorelease(v19);
    v26 = CGColorGetComponents((CGColorRef)objc_msgSend(v25, "CGColor"));
    CGContextSetStrokeColor(CurrentContext, v26);
    CGContextSetLineWidth(CurrentContext, 3.0);
    CGContextStrokePath(CurrentContext);
    -[TTRIReminderLocationPickerMapDragRadiusView _currentHandleDistanceMeasurement](self, "_currentHandleDistanceMeasurement");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIReminderLocationPickerMapDragRadiusView measurementFormatter](self, "measurementFormatter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringFromMeasurement:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v49.origin.y = v9 + -16.0;
    v49.size.width = v12 + -14.0;
    v49.size.height = 16.0;
    v49.origin.x = v7;
    v50 = CGRectIntegral(v49);
    x = v50.origin.x;
    y = v50.origin.y;
    width = v50.size.width;
    height = v50.size.height;
    objc_msgSend(v25, "set");
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "set");
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    CGContextSetRGBFillColor(CurrentContext, 0.937254902, 0.560784314, 0.0784313725, 1.0);
    CGContextSetRGBStrokeColor(CurrentContext, 1.0, 1.0, 1.0, 0.5);
    CGContextSetTextDrawingMode(CurrentContext, kCGTextFill);
    CGContextSetLineWidth(CurrentContext, 2.0);
    v35 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v35, "setAlignment:", 1);
    objc_msgSend(v35, "setLineBreakMode:", 4);
    v36 = *MEMORY[0x1E0DC1140];
    v45[0] = *MEMORY[0x1E0DC1138];
    v45[1] = v36;
    v46[0] = v34;
    v46[1] = v25;
    v45[2] = *MEMORY[0x1E0DC1178];
    v46[2] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "drawInRect:withAttributes:", v37, x, y, width, height);

    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "center");
    v40 = v39;
    v42 = v41;

    v43 = -[TTRIReminderLocationPickerMapDragRadiusView _shapeLayerWithEndPoint:](self, "_shapeLayerWithEndPoint:", v40, v42);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  TTRIReminderLocationPickerMapDragRadiusView *v18;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v21.origin.x = v9 + -15.0;
  v21.origin.y = v11 + -15.0;
  v21.size.width = v13 + 30.0;
  v21.size.height = v15 + 30.0;
  v20.x = x;
  v20.y = y;
  if (CGRectContainsPoint(v21, v20)
    && (-[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "superview"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        v17))
  {
    v18 = self;
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (void)handlePanGesture:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v4 = a3;
  objc_msgSend(v4, "translationInView:", self);
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "state");

  if ((unint64_t)(v9 - 3) < 2)
  {
    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHighlighted:", 0);

    -[TTRIReminderLocationPickerMapDragRadiusView initialHandleCenterForDraggin](self, "initialHandleCenterForDraggin");
    v16 = v6 + v15;
    -[TTRIReminderLocationPickerMapDragRadiusView initialHandleCenterForDraggin](self, "initialHandleCenterForDraggin");
    -[TTRIReminderLocationPickerMapDragRadiusView _updateRegionWithPoint:](self, "_updateRegionWithPoint:", v16, v8 + v17);
  }
  else if (v9 == 2)
  {
    -[TTRIReminderLocationPickerMapDragRadiusView initialHandleCenterForDraggin](self, "initialHandleCenterForDraggin");
    v19 = v6 + v18;
    -[TTRIReminderLocationPickerMapDragRadiusView initialHandleCenterForDraggin](self, "initialHandleCenterForDraggin");
    -[TTRIReminderLocationPickerMapDragRadiusView _updateHandleImageViewWithPoint:](self, "_updateHandleImageViewWithPoint:", v19, v8 + v20);
  }
  else if (v9 == 1)
  {
    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "center");
    -[TTRIReminderLocationPickerMapDragRadiusView setInitialHandleCenterForDraggin:](self, "setInitialHandleCenterForDraggin:");

    -[TTRIReminderLocationPickerMapDragRadiusView setIsDragging:](self, "setIsDragging:", 1);
    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHighlighted:", 1);

    -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIReminderLocationPickerMapDragRadiusView overlay](self, "overlay");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeOverlay:", v13);

    -[TTRIReminderLocationPickerMapDragRadiusView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)startEditingRegion:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[TTRIReminderLocationPickerMapDragRadiusView region](self, "region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v14);

  if ((v5 & 1) == 0)
    -[TTRIReminderLocationPickerMapDragRadiusView stopEditing](self, "stopEditing");
  -[TTRIReminderLocationPickerMapDragRadiusView setRegion:](self, "setRegion:", v14);
  objc_msgSend(v14, "center");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v14, "radius");
  +[MKCircle circleWithCenterCoordinate:radius:](TTRIWorldBoundingMKCircle, "circleWithCenterCoordinate:radius:", v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIReminderLocationPickerMapDragRadiusView setOverlay:](self, "setOverlay:", v11);

  -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIReminderLocationPickerMapDragRadiusView overlay](self, "overlay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOverlay:", v13);

  -[TTRIReminderLocationPickerMapDragRadiusView _centerAndZoomToFitRegion:animated:](self, "_centerAndZoomToFitRegion:animated:", v14, 0);
  -[TTRIReminderLocationPickerMapDragRadiusView _animateHandleIn:](self, "_animateHandleIn:", v5);

}

- (void)stopEditing
{
  void *v3;
  void *v4;

  -[TTRIReminderLocationPickerMapDragRadiusView setRegion:](self, "setRegion:", 0);
  -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIReminderLocationPickerMapDragRadiusView overlay](self, "overlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeOverlay:", v4);

  -[TTRIReminderLocationPickerMapDragRadiusView setOverlay:](self, "setOverlay:", 0);
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  -[TTRIReminderLocationPickerMapDragRadiusView _animateHandleIn:](self, "_animateHandleIn:", a4);
}

- (CAShapeLayer)shapeLayer
{
  CAShapeLayer *shapeLayer;
  id v4;
  id v5;
  id v6;

  shapeLayer = self->_shapeLayer;
  if (!shapeLayer)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CD2840]);
    -[TTRIReminderLocationPickerMapDragRadiusView handleColor](self, "handleColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "setFillColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v4, "setLineDashPattern:", &unk_1E67F4498);
    objc_msgSend(v4, "setLineCap:", CFSTR("round"));
    objc_msgSend(v4, "setLineWidth:", 2.0);
    objc_msgSend(v4, "setStrokeStart:", 0.0);
    objc_msgSend(v4, "setStrokeEnd:", 1.0);
    objc_msgSend(v4, "setZPosition:", 40.0);
    -[TTRIReminderLocationPickerMapDragRadiusView setShapeLayer:](self, "setShapeLayer:", v4);

    shapeLayer = self->_shapeLayer;
  }
  return shapeLayer;
}

- (void)setHandleColor:(id)a3
{
  objc_storeStrong((id *)&self->_handleColor, a3);
  -[TTRIReminderLocationPickerMapDragRadiusView _updateHandleImageView](self, "_updateHandleImageView");
}

- (double)radius
{
  void *v2;
  double v3;
  double v4;

  -[TTRIReminderLocationPickerMapDragRadiusView region](self, "region");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "radius");
  v4 = v3;

  return v4;
}

- (void)_updateHandleImageView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0DC3870];
  RemindersUICoreBundleGet();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("locationDragHandle"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIReminderLocationPickerMapDragRadiusView handleColor](self, "handleColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ttr_tintedImageWithColor:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v10);

  -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHighlightedImage:", v10);

  -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeToFit");

}

- (void)_updateHandleImageViewWithPoint:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double y;
  double width;
  double height;
  void *v16;
  CGRect v17;
  CGRect v18;

  x = a3.x;
  -[TTRIReminderLocationPickerMapDragRadiusView _minPoint](self, "_minPoint", a3.x, a3.y);
  v6 = v5;
  -[TTRIReminderLocationPickerMapDragRadiusView _maxPoint](self, "_maxPoint");
  if (v7 >= 0.0)
  {
    v8 = v7;
    -[TTRIReminderLocationPickerMapDragRadiusView setIsMinimum:](self, "setIsMinimum:", 0);
    -[TTRIReminderLocationPickerMapDragRadiusView setIsMaximum:](self, "setIsMaximum:", 0);
    v9 = x;
    if (x <= v6)
    {
      -[TTRIReminderLocationPickerMapDragRadiusView setIsMinimum:](self, "setIsMinimum:", 1, x);
      v9 = v6;
    }
    if (x >= v8)
    {
      -[TTRIReminderLocationPickerMapDragRadiusView setIsMaximum:](self, "setIsMaximum:", 1, v9);
      v9 = v8;
    }
    v10 = v9 + -12.0;
    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v17.size.width = 24.0;
    v17.size.height = 24.0;
    v17.origin.x = v10;
    v18 = CGRectIntegral(v17);
    v12 = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v12, y, width, height);

    -[TTRIReminderLocationPickerMapDragRadiusView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)_updateRegionWithPoint:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  x = a3.x;
  -[TTRIReminderLocationPickerMapDragRadiusView _minPoint](self, "_minPoint", a3.x, a3.y);
  if (x > v5)
    -[TTRIReminderLocationPickerMapDragRadiusView setIsMinimum:](self, "setIsMinimum:", 0);
  -[TTRIReminderLocationPickerMapDragRadiusView _maxPoint](self, "_maxPoint");
  if (x < v6)
    -[TTRIReminderLocationPickerMapDragRadiusView setIsMaximum:](self, "setIsMaximum:", 0);
  if (-[TTRIReminderLocationPickerMapDragRadiusView isMinimum](self, "isMinimum"))
    -[TTRIReminderLocationPickerMapDragRadiusView minimumRadius](self, "minimumRadius");
  else
    -[TTRIReminderLocationPickerMapDragRadiusView _currentHandleDistance](self, "_currentHandleDistance");
  v8 = v7;
  if (-[TTRIReminderLocationPickerMapDragRadiusView isMaximum](self, "isMaximum"))
  {
    -[TTRIReminderLocationPickerMapDragRadiusView maximumRadius](self, "maximumRadius");
    v8 = v9;
  }
  v10 = 114.0;
  if (v8 >= 114.0)
    v10 = v8;
  -[TTRIReminderLocationPickerMapDragRadiusView _updateRegionWithRadius:](self, "_updateRegionWithRadius:", v10);
}

- (void)_updateRegionWithRadius:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  -[TTRIReminderLocationPickerMapDragRadiusView minimumRadius](self, "minimumRadius");
  v6 = v5;
  -[TTRIReminderLocationPickerMapDragRadiusView maximumRadius](self, "maximumRadius");
  if (v7 >= a3)
    v7 = a3;
  if (v6 >= v7)
    v8 = v6;
  else
    v8 = v7;
  v9 = objc_alloc(MEMORY[0x1E0C9E368]);
  -[TTRIReminderLocationPickerMapDragRadiusView region](self, "region");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "center");
  v12 = v11;
  v14 = v13;
  -[TTRIReminderLocationPickerMapDragRadiusView region](self, "region");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v9, "initWithCenter:radius:identifier:", v16, v12, v14, v8);

  objc_msgSend(v27, "center");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v27, "radius");
  +[MKCircle circleWithCenterCoordinate:radius:](TTRIWorldBoundingMKCircle, "circleWithCenterCoordinate:radius:", v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIReminderLocationPickerMapDragRadiusView _centerAndZoomToFitRegion:animated:](self, "_centerAndZoomToFitRegion:animated:", v27, 0);
  -[TTRIReminderLocationPickerMapDragRadiusView setRegion:](self, "setRegion:", v27);
  -[TTRIReminderLocationPickerMapDragRadiusView overlay](self, "overlay");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIReminderLocationPickerMapDragRadiusView overlay](self, "overlay");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeOverlay:", v25);

    -[TTRIReminderLocationPickerMapDragRadiusView setOverlay:](self, "setOverlay:", 0);
  }
  -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addOverlay:", v22);

  -[TTRIReminderLocationPickerMapDragRadiusView setOverlay:](self, "setOverlay:", v22);
  -[TTRIReminderLocationPickerMapDragRadiusView setNeedsDisplay](self, "setNeedsDisplay");
  -[TTRIReminderLocationPickerMapDragRadiusView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideCircleAfterDelay, 0, 0.01);
  -[TTRIReminderLocationPickerMapDragRadiusView _popAnimateHandle](self, "_popAnimateHandle");

}

- (void)_popAnimateHandle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  CATransform3D v27;
  CATransform3D v28;
  CATransform3D v29;
  CATransform3D v30;
  CATransform3D v31;
  CATransform3D v32;
  CATransform3D v33;
  CATransform3D v34;

  -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuration:", 0.35);
  memset(&v34, 0, sizeof(v34));
  if (v3)
  {
    objc_msgSend(v3, "transform");
    CATransform3DScale(&v34, &v33, 0.5, 0.5, 1.0);
    memset(&v32, 0, sizeof(v32));
    objc_msgSend(v3, "transform");
    CATransform3DScale(&v32, &v31, 1.2, 1.2, 1.0);
    memset(&v30, 0, sizeof(v30));
    objc_msgSend(v3, "transform");
    CATransform3DScale(&v30, &v29, 0.9, 0.9, 1.0);
    memset(&v28, 0, sizeof(v28));
    objc_msgSend(v3, "transform");
  }
  else
  {
    memset(&v33, 0, sizeof(v33));
    CATransform3DScale(&v34, &v33, 0.5, 0.5, 1.0);
    memset(&v32, 0, sizeof(v32));
    memset(&v31, 0, sizeof(v31));
    CATransform3DScale(&v32, &v31, 1.2, 1.2, 1.0);
    memset(&v30, 0, sizeof(v30));
    memset(&v29, 0, sizeof(v29));
    CATransform3DScale(&v30, &v29, 0.9, 0.9, 1.0);
    memset(&v28, 0, sizeof(v28));
  }
  v5 = (void *)MEMORY[0x1E0C99D20];
  v27 = v34;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v32;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v30;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v28;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObjects:", v6, v7, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setValues:", v10);
  v11 = (void *)MEMORY[0x1E0C99D20];
  LODWORD(v12) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 0.5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = *(_DWORD *)"fff?";
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithObjects:", v13, v15, v17, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setKeyTimes:", v20);
  v21 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0CD3048];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayWithObjects:", v22, v24, v25, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTimingFunctions:", v26);
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  objc_msgSend(v3, "addAnimation:forKey:", v4, CFSTR("transform"));

}

- (id)_bezierPathWithEndPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  __int128 v15;
  uint64_t v16;

  y = a3.y;
  x = a3.x;
  v16 = *MEMORY[0x1E0C80C00];
  -[TTRIReminderLocationPickerMapDragRadiusView region](self, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIReminderLocationPickerMapDragRadiusView region](self, "region");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "center");
    objc_msgSend(v7, "convertCoordinate:toPointToView:", self);
    v10 = v9;
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = xmmword_1B490F100;
    objc_msgSend(v13, "setLineDash:count:phase:", &v15, 2, 0.0);
    objc_msgSend(v13, "setLineWidth:", 2.0);
    objc_msgSend(v13, "setLineCapStyle:", 1);
    objc_msgSend(v13, "moveToPoint:", floor(v10), floor(v12));
    objc_msgSend(v13, "addLineToPoint:", floor(x), floor(y));
    objc_msgSend(v13, "stroke");
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)_shapeLayerWithEndPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[TTRIReminderLocationPickerMapDragRadiusView _bezierPathWithEndPoint:](self, "_bezierPathWithEndPoint:", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIReminderLocationPickerMapDragRadiusView shapeLayer](self, "shapeLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "setPath:", objc_msgSend(v6, "CGPath"));
  objc_msgSend(v5, "superlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[TTRIReminderLocationPickerMapDragRadiusView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSublayer:", v5);

  }
  return v5;
}

- (void)_animateHandleIn:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double MidY;
  void *v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGContext *CurrentContext;
  id v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[5];
  _QWORD v53[7];
  CGSize v54;
  MKMapRect v55;
  MKMapRect v56;
  MKCoordinateRegion v57;
  CGRect v58;
  CGRect v59;
  MKMapRect v60;

  v3 = a3;
  -[TTRIReminderLocationPickerMapDragRadiusView overlay](self, "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originalBoundingMapRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visibleMapRect");
  v60.origin.x = v15;
  v60.origin.y = v16;
  v60.size.width = v17;
  v60.size.height = v18;
  v55.origin.x = v7;
  v55.origin.y = v9;
  v55.size.width = v11;
  v55.size.height = v13;
  v19 = MKMapRectIntersectsRect(v55, v60);

  if (v19)
  {
    -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIReminderLocationPickerMapDragRadiusView region](self, "region");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "center");
    objc_msgSend(v20, "convertCoordinate:toPointToView:", self);
    v23 = v22;
    v25 = v24;

    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCenter:", floor(v23), floor(v25));

    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIReminderLocationPickerMapDragRadiusView addSubview:](self, "addSubview:", v27);

    v56.origin.x = v7;
    v56.origin.y = v9;
    v56.size.width = v11;
    v56.size.height = v13;
    v57 = MKCoordinateRegionForMapRect(v56);
    latitude = v57.center.latitude;
    longitude = v57.center.longitude;
    latitudeDelta = v57.span.latitudeDelta;
    longitudeDelta = v57.span.longitudeDelta;
    -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "convertRegion:toRectToView:", self, latitude, longitude, latitudeDelta, longitudeDelta);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;

    v58.origin.x = v34;
    v58.origin.y = v36;
    v58.size.width = v38;
    v58.size.height = v40;
    v41 = floor(CGRectGetMaxX(v58));
    v59.origin.x = v34;
    v59.origin.y = v36;
    v59.size.width = v38;
    v59.size.height = v40;
    MidY = CGRectGetMidY(v59);
    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v43;
    if (v41 - v23 < 12.0)
    {
      objc_msgSend(v43, "setAlpha:", 0.0);
LABEL_8:

      return;
    }
    v44 = floor(MidY);
    objc_msgSend(v43, "setAlpha:", 1.0);

    -[TTRIReminderLocationPickerMapDragRadiusView frame](self, "frame");
    v54.width = v45;
    v54.height = v46;
    UIGraphicsBeginImageContext(v54);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v48 = -[TTRIReminderLocationPickerMapDragRadiusView _shapeLayerWithEndPoint:](self, "_shapeLayerWithEndPoint:", v41, v44);
    CGContextRestoreGState(CurrentContext);
    UIGraphicsEndImageContext();
    if (!v3)
    {
      -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
      v51 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setCenter:", v41, v44);
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setDuration:", 0.35);
    objc_msgSend(v49, "setFromValue:", &unk_1E67F4588);
    objc_msgSend(v49, "setToValue:", &unk_1E67F4598);
    -[TTRIReminderLocationPickerMapDragRadiusView shapeLayer](self, "shapeLayer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addAnimation:forKey:", v49, CFSTR("strokeEndAnimation"));

    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __64__TTRIReminderLocationPickerMapDragRadiusView__animateHandleIn___block_invoke;
    v53[3] = &unk_1E6783E28;
    v53[4] = self;
    *(double *)&v53[5] = v41;
    *(double *)&v53[6] = v44;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __64__TTRIReminderLocationPickerMapDragRadiusView__animateHandleIn___block_invoke_2;
    v52[3] = &unk_1E6783C98;
    v52[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v53, v52, 0.35);

  }
}

void __64__TTRIReminderLocationPickerMapDragRadiusView__animateHandleIn___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  id v3;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "handleImageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCenter:", v1, v2);

}

uint64_t __64__TTRIReminderLocationPickerMapDragRadiusView__animateHandleIn___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_popAnimateHandle");
  return result;
}

- (void)_removeHandle
{
  void *v3;
  id v4;

  if (!-[TTRIReminderLocationPickerMapDragRadiusView isDragging](self, "isDragging"))
  {
    -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    -[TTRIReminderLocationPickerMapDragRadiusView shapeLayer](self, "shapeLayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperlayer");

  }
}

- (void)_hideCircleAfterDelay
{
  void *v3;
  void *v4;

  -[TTRIReminderLocationPickerMapDragRadiusView setIsDragging:](self, "setIsDragging:", 0);
  -[TTRIReminderLocationPickerMapDragRadiusView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIReminderLocationPickerMapDragRadiusView region](self, "region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapDragRadiusView:didUpdateRegion:", self, v4);

  -[TTRIReminderLocationPickerMapDragRadiusView setNeedsDisplay](self, "setNeedsDisplay");
  -[TTRIReminderLocationPickerMapDragRadiusView _animateHandleIn:](self, "_animateHandleIn:", 0);
}

- (CGPoint)_pointForRadius:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  MKMapPoint v10;
  CLLocationCoordinate2D v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CLLocationCoordinate2D v19;
  MKMapPoint v20;
  CGPoint result;

  -[TTRIReminderLocationPickerMapDragRadiusView region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v7 = v6;

  v8 = MEMORY[0x1B5E3CD6C](v7);
  -[TTRIReminderLocationPickerMapDragRadiusView region](self, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "center");
  v10 = MKMapPointForCoordinate(v19);

  v20.x = v10.x + v8 * a3;
  v20.y = v10.y;
  v11 = MKCoordinateForMapPoint(v20);
  -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertCoordinate:toPointToView:", self, v11.latitude, v11.longitude);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)_minPoint
{
  double v3;
  double v4;
  CGPoint result;

  -[TTRIReminderLocationPickerMapDragRadiusView minimumRadius](self, "minimumRadius");
  -[TTRIReminderLocationPickerMapDragRadiusView _pointForRadius:](self, "_pointForRadius:");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)_maxPoint
{
  double v3;
  double v4;
  CGPoint result;

  -[TTRIReminderLocationPickerMapDragRadiusView maximumRadius](self, "maximumRadius");
  -[TTRIReminderLocationPickerMapDragRadiusView _pointForRadius:](self, "_pointForRadius:");
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)_currentHandleDistance
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;

  -[TTRIReminderLocationPickerMapDragRadiusView handleImageView](self, "handleImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "center");
  v5 = v4;
  v7 = v6;

  -[TTRIReminderLocationPickerMapDragRadiusView _radiusForPoint:](self, "_radiusForPoint:", v5, v7);
  return result;
}

- (double)_radiusForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
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
  void *v17;
  double v18;
  double v19;

  y = a3.y;
  x = a3.x;
  -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toCoordinateFromView:", self, x, y);
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v8, v10);
  -[TTRIReminderLocationPickerMapDragRadiusView region](self, "region");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "center");
  v14 = v13;
  v16 = v15;

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v14, v16);
  objc_msgSend(v11, "distanceFromLocation:", v17);
  v19 = v18;

  return v19;
}

- (id)_currentHandleDistanceMeasurement
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  -[TTRIReminderLocationPickerMapDragRadiusView _currentHandleDistance](self, "_currentHandleDistance");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TTRIReminderLocationPickerMapDragRadiusView _usesMetric](self, "_usesMetric"))
    objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
  else
    objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIReminderLocationPickerMapDragRadiusView _measurementFor:fromUnit:toUnit:normalized:](self, "_measurementFor:fromUnit:toUnit:normalized:", v5, v6, 1, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_measurementFor:(double)a3 fromUnit:(id)a4 toUnit:(id)a5 normalized:(BOOL)a6
{
  _BOOL4 v6;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  void *v20;

  v6 = a6;
  v9 = (objc_class *)MEMORY[0x1E0CB3758];
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithDoubleValue:unit:", v11, a3);

  objc_msgSend(v12, "measurementByConvertingToUnit:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13;
  v15 = v14;
  v16 = v14;
  if (v6)
  {
    objc_msgSend(v14, "doubleValue");
    v18 = floor(v17 / 10.0) * 10.0;
    v19 = objc_alloc(MEMORY[0x1E0CB3758]);
    objc_msgSend(v15, "unit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v19, "initWithDoubleValue:unit:", v20, v18);

  }
  return v16;
}

- (BOOL)_usesMetric
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TTRIReminderLocationPickerMapDragRadiusView measurementFormatter](self, "measurementFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C99840]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)_centerAndZoomToFitRegion:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "radius");
  -[TTRIReminderLocationPickerMapDragRadiusView radiusPaddingMultiplier](self, "radiusPaddingMultiplier");
  v7 = MEMORY[0x1B5E3CD54](objc_msgSend(v6, "center"));
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "regionThatFits:", v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  v25 = v24;
  v27 = v26;

  objc_msgSend(v23, "setCenterCoordinate:animated:", v4, v25, v27);
  -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setRegion:animated:", v4, v16, v18, v20, v22);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
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
  CGRect result;

  -[TTRIReminderLocationPickerMapDragRadiusView mapView](self, "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v10 + -16.0;
  v12 = v4;
  v13 = v6;
  v14 = v8;
  result.size.height = v11;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  RemindersUICoreBundleGet();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Reminder radius"), CFSTR("Reminder radius"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;

  -[TTRIReminderLocationPickerMapDragRadiusView _currentHandleDistanceMeasurement](self, "_currentHandleDistanceMeasurement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIReminderLocationPickerMapDragRadiusView measurementFormatter](self, "measurementFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromMeasurement:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0DC4650];
}

- (void)accessibilityIncrement
{
  double v3;
  double v4;
  double v5;

  -[TTRIReminderLocationPickerMapDragRadiusView _ttriAccessibilityRadiusIncrement](self, "_ttriAccessibilityRadiusIncrement");
  v4 = v3;
  -[TTRIReminderLocationPickerMapDragRadiusView radius](self, "radius");
  -[TTRIReminderLocationPickerMapDragRadiusView _ttriAccessibilityUpdateWithRadius:](self, "_ttriAccessibilityUpdateWithRadius:", v4 + v5);
}

- (void)accessibilityDecrement
{
  double v3;
  double v4;
  double v5;

  -[TTRIReminderLocationPickerMapDragRadiusView _ttriAccessibilityRadiusIncrement](self, "_ttriAccessibilityRadiusIncrement");
  v4 = v3;
  -[TTRIReminderLocationPickerMapDragRadiusView radius](self, "radius");
  -[TTRIReminderLocationPickerMapDragRadiusView _ttriAccessibilityUpdateWithRadius:](self, "_ttriAccessibilityUpdateWithRadius:", v5 - v4);
}

- (double)_ttriAccessibilityRadiusByAdding:(double)a3
{
  double v4;

  -[TTRIReminderLocationPickerMapDragRadiusView radius](self, "radius");
  return v4 + a3;
}

- (double)_ttriAccessibilityRadiusIncrement
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (-[TTRIReminderLocationPickerMapDragRadiusView _usesMetric](self, "_usesMetric"))
    return 200.0;
  objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTRIReminderLocationPickerMapDragRadiusView _measurementFor:fromUnit:toUnit:normalized:](self, "_measurementFor:fromUnit:toUnit:normalized:", v4, v5, 0, 200.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (TTRIReminderLocationPickerMapDragRadiusViewDelegate)delegate
{
  return (TTRIReminderLocationPickerMapDragRadiusViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMeasurementFormatter)measurementFormatter
{
  return self->_measurementFormatter;
}

- (void)setMeasurementFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_measurementFormatter, a3);
}

- (double)minimumRadius
{
  return self->_minimumRadius;
}

- (void)setMinimumRadius:(double)a3
{
  self->_minimumRadius = a3;
}

- (double)maximumRadius
{
  return self->_maximumRadius;
}

- (void)setMaximumRadius:(double)a3
{
  self->_maximumRadius = a3;
}

- (double)radiusPaddingMultiplier
{
  return self->_radiusPaddingMultiplier;
}

- (void)setRadiusPaddingMultiplier:(double)a3
{
  self->_radiusPaddingMultiplier = a3;
}

- (UIColor)circleColor
{
  return self->_circleColor;
}

- (void)setCircleColor:(id)a3
{
  objc_storeStrong((id *)&self->_circleColor, a3);
}

- (UIColor)handleColor
{
  return self->_handleColor;
}

- (UIImageView)handleImageView
{
  return self->_handleImageView;
}

- (void)setHandleImageView:(id)a3
{
  objc_storeStrong((id *)&self->_handleImageView, a3);
}

- (void)setShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_shapeLayer, a3);
}

- (BOOL)isMinimum
{
  return self->_isMinimum;
}

- (void)setIsMinimum:(BOOL)a3
{
  self->_isMinimum = a3;
}

- (BOOL)isMaximum
{
  return self->_isMaximum;
}

- (void)setIsMaximum:(BOOL)a3
{
  self->_isMaximum = a3;
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (TTRIWorldBoundingMKCircle)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void)setIsDragging:(BOOL)a3
{
  self->_isDragging = a3;
}

- (CGPoint)initialHandleCenterForDraggin
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialHandleCenterForDraggin.x;
  y = self->_initialHandleCenterForDraggin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialHandleCenterForDraggin:(CGPoint)a3
{
  self->_initialHandleCenterForDraggin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_handleImageView, 0);
  objc_storeStrong((id *)&self->_handleColor, 0);
  objc_storeStrong((id *)&self->_circleColor, 0);
  objc_storeStrong((id *)&self->_measurementFormatter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
