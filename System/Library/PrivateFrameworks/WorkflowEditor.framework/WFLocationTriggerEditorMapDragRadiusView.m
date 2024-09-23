@implementation WFLocationTriggerEditorMapDragRadiusView

- (WFLocationTriggerEditorMapDragRadiusView)initWithFrame:(CGRect)a3
{
  WFLocationTriggerEditorMapDragRadiusView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WFLocationTriggerEditorMapDragRadiusView;
  v3 = -[WFLocationTriggerEditorMapDragRadiusView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 16.0, 16.0);
    -[WFLocationTriggerEditorMapDragRadiusView setHandleEndpointView:](v3, "setHandleEndpointView:", v4);

    -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](v3, "handleEndpointView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 8.0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](v3, "handleEndpointView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](v3, "handleEndpointView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setZPosition:", 50.0);

    v11 = objc_alloc_init(MEMORY[0x24BDD1668]);
    -[WFLocationTriggerEditorMapDragRadiusView setMeasurmentFormatter:](v3, "setMeasurmentFormatter:", v11);

    -[WFLocationTriggerEditorMapDragRadiusView measurmentFormatter](v3, "measurmentFormatter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUnitOptions:", 3);

    -[WFLocationTriggerEditorMapDragRadiusView measurmentFormatter](v3, "measurmentFormatter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUnitStyle:", 3);

  }
  return v3;
}

- (void)setProximity:(unint64_t)a3
{
  self->_proximity = a3;
  -[WFLocationTriggerEditorMapDragRadiusView setHidden:](self, "setHidden:", a3 == 0);
}

- (CGPoint)center
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[WFLocationTriggerEditorMapDragRadiusView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationTriggerEditorMapDragRadiusView annotation](self, "annotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  objc_msgSend(v3, "convertCoordinate:toPointToView:", self);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)popAnimateHandle
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

  -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuration:", 0.349999994);
  memset(&v34, 0, sizeof(v34));
  if (v3)
  {
    objc_msgSend(v3, "transform");
    CATransform3DScale(&v34, &v33, 0.5, 0.5, 1.0);
    memset(&v32, 0, sizeof(v32));
    objc_msgSend(v3, "transform");
    CATransform3DScale(&v32, &v31, 1.20000005, 1.20000005, 1.0);
    memset(&v30, 0, sizeof(v30));
    objc_msgSend(v3, "transform");
    CATransform3DScale(&v30, &v29, 0.899999976, 0.899999976, 1.0);
    memset(&v28, 0, sizeof(v28));
    objc_msgSend(v3, "transform");
  }
  else
  {
    memset(&v33, 0, sizeof(v33));
    CATransform3DScale(&v34, &v33, 0.5, 0.5, 1.0);
    memset(&v32, 0, sizeof(v32));
    memset(&v31, 0, sizeof(v31));
    CATransform3DScale(&v32, &v31, 1.20000005, 1.20000005, 1.0);
    memset(&v30, 0, sizeof(v30));
    memset(&v29, 0, sizeof(v29));
    CATransform3DScale(&v30, &v29, 0.899999976, 0.899999976, 1.0);
    memset(&v28, 0, sizeof(v28));
  }
  v5 = (void *)MEMORY[0x24BDBCE30];
  v27 = v34;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v32;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v30;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v28;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObjects:", v6, v7, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setValues:", v10);
  v11 = (void *)MEMORY[0x24BDBCE30];
  LODWORD(v12) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 0.5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = *(_DWORD *)"fff?";
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithObjects:", v13, v15, v17, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setKeyTimes:", v20);
  v21 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BDE5D20];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayWithObjects:", v22, v24, v25, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTimingFunctions:", v26);
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  objc_msgSend(v3, "addAnimation:forKey:", v4, CFSTR("transform"));

}

- (id)bezierPathWithEndPoint:(CGPoint)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[WFLocationTriggerEditorMapDragRadiusView center](self, "center");
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = xmmword_2268AB440;
  objc_msgSend(v3, "setLineDash:count:phase:", &v11, 2, 0.0);
  objc_msgSend(v3, "setLineWidth:", 2.0);
  objc_msgSend(v3, "setLineCapStyle:", 1);
  UIRoundToViewScale();
  v5 = v4;
  UIRoundToViewScale();
  objc_msgSend(v3, "moveToPoint:", v5, v6);
  UIRoundToViewScale();
  v8 = v7;
  UIRoundToViewScale();
  objc_msgSend(v3, "addLineToPoint:", v8, v9);
  objc_msgSend(v3, "stroke");
  return v3;
}

- (CAShapeLayer)shapeLayer
{
  CAShapeLayer *shapeLayer;
  id v4;
  id v5;

  shapeLayer = self->_shapeLayer;
  if (!shapeLayer)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDE5758]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));
    objc_msgSend(v4, "setLineDashPattern:", &unk_24EE46B28);
    objc_msgSend(v4, "setLineCap:", CFSTR("round"));
    objc_msgSend(v4, "setLineWidth:", 2.0);
    objc_msgSend(v4, "setStrokeStart:", 0.0);
    objc_msgSend(v4, "setStrokeEnd:", 1.0);
    objc_msgSend(v4, "setZPosition:", 40.0);
    -[WFLocationTriggerEditorMapDragRadiusView setShapeLayer:](self, "setShapeLayer:", v4);

    shapeLayer = self->_shapeLayer;
  }
  return shapeLayer;
}

- (id)shapeLayerWithEndPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[WFLocationTriggerEditorMapDragRadiusView bezierPathWithEndPoint:](self, "bezierPathWithEndPoint:", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationTriggerEditorMapDragRadiusView shapeLayer](self, "shapeLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "setPath:", objc_msgSend(v6, "CGPath"));
  objc_msgSend(v5, "superlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[WFLocationTriggerEditorMapDragRadiusView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSublayer:", v5);

  }
  return v5;
}

- (void)animateHandleIn:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
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
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  CGContext *CurrentContext;
  id v39;
  void *v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[7];
  CGSize v44;
  MKMapRect v45;
  MKCoordinateRegion v46;
  CGRect v47;

  v3 = a3;
  -[WFLocationTriggerEditorMapDragRadiusView center](self, "center");
  v6 = v5;
  v8 = v7;
  -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCenter:", v6, v8);

  -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationTriggerEditorMapDragRadiusView addSubview:](self, "addSubview:", v10);

  -[WFLocationTriggerEditorMapDragRadiusView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationTriggerEditorMapDragRadiusView overlay](self, "overlay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mapRadiusView:boundingMapRectForOverlay:", self, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v45.origin.x = v14;
  v45.origin.y = v16;
  v45.size.width = v18;
  v45.size.height = v20;
  v46 = MKCoordinateRegionForMapRect(v45);
  latitude = v46.center.latitude;
  longitude = v46.center.longitude;
  latitudeDelta = v46.span.latitudeDelta;
  longitudeDelta = v46.span.longitudeDelta;
  -[WFLocationTriggerEditorMapDragRadiusView mapView](self, "mapView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "convertRegion:toRectToView:", self, latitude, longitude, latitudeDelta, longitudeDelta);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v47.origin.x = v27;
  v47.origin.y = v29;
  v47.size.width = v31;
  v47.size.height = v33;
  v34 = floor(CGRectGetMaxX(v47));
  -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v35;
  if (v34 - v6 >= 12.0)
  {
    objc_msgSend(v35, "setAlpha:", 1.0);

    -[WFLocationTriggerEditorMapDragRadiusView frame](self, "frame");
    v44.width = v36;
    v44.height = v37;
    UIGraphicsBeginImageContext(v44);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v39 = -[WFLocationTriggerEditorMapDragRadiusView shapeLayerWithEndPoint:](self, "shapeLayerWithEndPoint:", v34, v8);
    CGContextRestoreGState(CurrentContext);
    UIGraphicsEndImageContext();
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeEnd"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setDuration:", 0.35);
      objc_msgSend(v40, "setFromValue:", &unk_24EE46B90);
      objc_msgSend(v40, "setToValue:", &unk_24EE46BA0);
      -[CAShapeLayer addAnimation:forKey:](self->_shapeLayer, "addAnimation:forKey:", v40, CFSTR("strokeEndAnimation"));
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __60__WFLocationTriggerEditorMapDragRadiusView_animateHandleIn___block_invoke;
      v43[3] = &unk_24EE25AD8;
      v43[4] = self;
      *(double *)&v43[5] = v34;
      *(double *)&v43[6] = v8;
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __60__WFLocationTriggerEditorMapDragRadiusView_animateHandleIn___block_invoke_2;
      v42[3] = &unk_24EE25B00;
      v42[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v43, v42, 0.349999994);

      return;
    }
    -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setCenter:", v34, v8);
  }
  else
  {
    objc_msgSend(v35, "setAlpha:", 0.0);
  }

}

- (void)addHandleForAnnotation:(id)a3 withOverlay:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL8 v9;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[WFLocationTriggerEditorMapDragRadiusView annotation](self, "annotation");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v8 != v7;

    -[WFLocationTriggerEditorMapDragRadiusView setAnnotation:](self, "setAnnotation:", v7);
    -[WFLocationTriggerEditorMapDragRadiusView setOverlay:](self, "setOverlay:", v6);

    -[WFLocationTriggerEditorMapDragRadiusView animateHandleIn:](self, "animateHandleIn:", v9);
  }
}

- (void)removeHandle:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (!-[WFLocationTriggerEditorMapDragRadiusView isDragging](self, "isDragging"))
  {
    if (v3)
    {
      -[WFLocationTriggerEditorMapDragRadiusView setAnnotation:](self, "setAnnotation:", 0);
      -[WFLocationTriggerEditorMapDragRadiusView setOverlay:](self, "setOverlay:", 0);
    }
    -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[WFLocationTriggerEditorMapDragRadiusView shapeLayer](self, "shapeLayer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperlayer");

  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  CGContext *CurrentContext;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  CGFloat v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  double v55;
  CGRect rect;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[5];
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v59[3] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = WFLocationTriggerEditorMapDragRadiusView;
  -[CGFloat drawRect:]((objc_super *)&rect.origin.y, sel_drawRect_);
  if (-[WFLocationTriggerEditorMapDragRadiusView isDragging](self, "isDragging"))
  {
    -[WFLocationTriggerEditorMapDragRadiusView center](self, "center");
    v9 = v8;
    v55 = v10;
    -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "center");
    rect.origin.x = v9;
    v13 = v12 - v9;

    -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "center");
    v16 = v15 - (v13 + v13);
    -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "center");
    v19 = v18 - v13;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "colorWithAlphaComponent:", 0.15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    CurrentContext = UIGraphicsGetCurrentContext();
    if (-[WFLocationTriggerEditorMapDragRadiusView proximity](self, "proximity") == 2)
    {
      CGContextSaveGState(CurrentContext);
      v60.origin.x = x;
      v60.origin.y = y;
      v60.size.width = width;
      v60.size.height = height;
      CGContextAddRect(CurrentContext, v60);
    }
    v61.origin.x = v16;
    v61.origin.y = v19;
    v61.size.width = v13 + v13;
    v61.size.height = v13 + v13;
    CGContextAddEllipseInRect(CurrentContext, v61);
    if (-[WFLocationTriggerEditorMapDragRadiusView proximity](self, "proximity") == 2)
      CGContextEOClip(CurrentContext);
    v24 = objc_retainAutorelease(v22);
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v24, "CGColor"));
    if (-[WFLocationTriggerEditorMapDragRadiusView proximity](self, "proximity") == 2)
    {
      v62.origin.x = x;
      v62.origin.y = y;
      v62.size.width = width;
      v62.size.height = height;
      CGContextFillRect(CurrentContext, v62);
      CGContextRestoreGState(CurrentContext);
    }
    else
    {
      CGContextFillPath(CurrentContext);
    }
    v63.origin.x = v16;
    v63.origin.y = v19;
    v63.size.width = v13 + v13;
    v63.size.height = v13 + v13;
    CGContextAddEllipseInRect(CurrentContext, v63);
    v25 = objc_retainAutorelease(v20);
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v25, "CGColor"));
    CGContextSetLineWidth(CurrentContext, 4.0);
    CGContextStrokePath(CurrentContext);
    objc_msgSend(v25, "colorWithAlphaComponent:", 0.5);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v26, "CGColor"));

    -[WFLocationTriggerEditorMapDragRadiusView currentHandleDistanceNormalized](self, "currentHandleDistanceNormalized");
    v28 = v27;
    if (-[WFLocationTriggerEditorMapDragRadiusView isMinimum](self, "isMinimum"))
    {
      -[WFLocationTriggerEditorMapDragRadiusView minimumRadiusNormalized](self, "minimumRadiusNormalized");
      v28 = v29;
    }
    if (-[WFLocationTriggerEditorMapDragRadiusView isMaximum](self, "isMaximum")
      || (v30 = (double)(unint64_t)v28,
          -[WFLocationTriggerEditorMapDragRadiusView maximumRadiusNormalized](self, "maximumRadiusNormalized"),
          v31 <= v30))
    {
      -[WFLocationTriggerEditorMapDragRadiusView maximumRadiusNormalized](self, "maximumRadiusNormalized");
      v30 = (double)(unint64_t)v32;
    }
    v33 = objc_alloc(MEMORY[0x24BDD1660]);
    if (-[WFLocationTriggerEditorMapDragRadiusView usesMetric](self, "usesMetric"))
      objc_msgSend(MEMORY[0x24BDD1928], "meters");
    else
      objc_msgSend(MEMORY[0x24BDD1928], "feet");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v33, "initWithDoubleValue:unit:", v34, v30);

    -[WFLocationTriggerEditorMapDragRadiusView measurmentFormatter](self, "measurmentFormatter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringFromMeasurement:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v64.origin.y = v55 + -16.0;
    v64.size.height = 16.0;
    v64.origin.x = rect.origin.x;
    v64.size.width = v13;
    v65 = CGRectIntegral(v64);
    v38 = v65.origin.x;
    v39 = v65.origin.y;
    v40 = v65.size.width;
    v41 = v65.size.height;
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE1E8], 2, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v42, 0.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    CGContextSetRGBFillColor(CurrentContext, 0.398999989, 0.125, 0.672999978, 1.0);
    CGContextSetRGBStrokeColor(CurrentContext, 1.0, 1.0, 1.0, 0.5);
    CGContextSetTextDrawingMode(CurrentContext, kCGTextFill);
    CGContextSetLineWidth(CurrentContext, 2.0);
    v44 = objc_alloc_init(MEMORY[0x24BEBB490]);
    objc_msgSend(v44, "setAlignment:", 1);
    v45 = *MEMORY[0x24BEBB360];
    v59[0] = v43;
    v46 = *MEMORY[0x24BEBB368];
    rect.size.height = v45;
    v57 = v46;
    objc_msgSend(v24, "colorWithAlphaComponent:", 1.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = *MEMORY[0x24BEBB3A8];
    v59[1] = v47;
    v59[2] = v44;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, &rect.size.height, 3);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "drawWithRect:options:attributes:context:", 33, v48, 0, v38, v39 + -0.5, v40, v41);
    -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "center");
    v51 = v50;
    v53 = v52;

    v54 = -[WFLocationTriggerEditorMapDragRadiusView shapeLayerWithEndPoint:](self, "shapeLayerWithEndPoint:", v51, v53);
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
  WFLocationTriggerEditorMapDragRadiusView *v18;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView", a4);
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
    && (-[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView"),
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

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[WFLocationTriggerEditorMapDragRadiusView isDragging](self, "isDragging")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)objc_msgSend(v4, "numberOfTouches") < 2)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFLocationTriggerEditorMapDragRadiusView;
    v5 = -[WFLocationTriggerEditorMapDragRadiusView gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_, v4);
  }

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFLocationTriggerEditorMapDragRadiusView setIsDragging:](self, "setIsDragging:", 1, a4);
  -[WFLocationTriggerEditorMapDragRadiusView mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationTriggerEditorMapDragRadiusView overlay](self, "overlay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeOverlay:", v6);

  -[WFLocationTriggerEditorMapDragRadiusView mapView](self, "mapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollEnabled:", 0);

  -[WFLocationTriggerEditorMapDragRadiusView mapView](self, "mapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setZoomEnabled:", 0);

  -[WFLocationTriggerEditorMapDragRadiusView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  objc_msgSend(a3, "anyObject");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "locationInView:", self);
  v6 = v5;
  -[WFLocationTriggerEditorMapDragRadiusView minPoint](self, "minPoint");
  v8 = v7;
  -[WFLocationTriggerEditorMapDragRadiusView maxPoint](self, "maxPoint");
  if (v9 >= 0.0)
  {
    v10 = v9;
    -[WFLocationTriggerEditorMapDragRadiusView setIsMinimum:](self, "setIsMinimum:", 0);
    -[WFLocationTriggerEditorMapDragRadiusView setIsMaximum:](self, "setIsMaximum:", 0);
    v11 = v6;
    if (v6 <= v8)
    {
      -[WFLocationTriggerEditorMapDragRadiusView setIsMinimum:](self, "setIsMinimum:", 1);
      v11 = v8;
    }
    if (v6 >= v10)
    {
      -[WFLocationTriggerEditorMapDragRadiusView setIsMaximum:](self, "setIsMaximum:", 1);
      v11 = v10;
    }
    -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;

    -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v11 + -12.0, v14, v16, v18);

    -[WFLocationTriggerEditorMapDragRadiusView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  objc_msgSend(a3, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", self);
  v7 = v6;

  -[WFLocationTriggerEditorMapDragRadiusView minPoint](self, "minPoint");
  if (v7 > v8)
    -[WFLocationTriggerEditorMapDragRadiusView setIsMinimum:](self, "setIsMinimum:", 0);
  -[WFLocationTriggerEditorMapDragRadiusView maxPoint](self, "maxPoint");
  if (v7 < v9)
    -[WFLocationTriggerEditorMapDragRadiusView setIsMaximum:](self, "setIsMaximum:", 0);
  if (-[WFLocationTriggerEditorMapDragRadiusView isMinimum](self, "isMinimum"))
    -[WFLocationTriggerEditorMapDragRadiusView minimumInMeters](self, "minimumInMeters");
  else
    -[WFLocationTriggerEditorMapDragRadiusView currentHandleDistance](self, "currentHandleDistance");
  v11 = v10;
  if (-[WFLocationTriggerEditorMapDragRadiusView isMaximum](self, "isMaximum"))
    v11 = 2414016.0;
  if (-[WFLocationTriggerEditorMapDragRadiusView usesMetric](self, "usesMetric"))
    v12 = 114.0;
  else
    v12 = 104.0;
  -[WFLocationTriggerEditorMapDragRadiusView delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11 >= v12)
    v15 = v11;
  else
    v15 = v12;
  objc_msgSend(v13, "mapRadiusView:overlayForRadius:", self, v15);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[WFLocationTriggerEditorMapDragRadiusView mapView](self, "mapView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationTriggerEditorMapDragRadiusView overlay](self, "overlay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeOverlay:", v17);

    -[WFLocationTriggerEditorMapDragRadiusView setNeedsDisplay](self, "setNeedsDisplay");
    -[WFLocationTriggerEditorMapDragRadiusView setOverlay:](self, "setOverlay:", v23);
    -[WFLocationTriggerEditorMapDragRadiusView mapView](self, "mapView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationTriggerEditorMapDragRadiusView overlay](self, "overlay");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addOverlay:", v19);

    -[WFLocationTriggerEditorMapDragRadiusView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_resizeCircleAfterDelay, 0, 0.00999999978);
    -[WFLocationTriggerEditorMapDragRadiusView popAnimateHandle](self, "popAnimateHandle");
  }
  -[WFLocationTriggerEditorMapDragRadiusView mapView](self, "mapView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setScrollEnabled:", 1);

  -[WFLocationTriggerEditorMapDragRadiusView mapView](self, "mapView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setZoomEnabled:", 1);

  -[WFLocationTriggerEditorMapDragRadiusView delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mapRadiusView:radiusDidChange:", self, v11);

}

- (double)minimumInMeters
{
  double result;

  if (-[WFLocationTriggerEditorMapDragRadiusView usesMetric](self, "usesMetric"))
    return 100.0;
  -[WFLocationTriggerEditorMapDragRadiusView feetToMeters:](self, "feetToMeters:", 328.084015);
  return result;
}

- (double)feetToMeters:(double)a3
{
  return a3 * 0.304800004;
}

- (void)resizeCircleAfterDelay
{
  void *v3;
  void *v4;

  -[WFLocationTriggerEditorMapDragRadiusView setIsDragging:](self, "setIsDragging:", 0);
  -[WFLocationTriggerEditorMapDragRadiusView removeHandle:](self, "removeHandle:", 0);
  -[WFLocationTriggerEditorMapDragRadiusView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationTriggerEditorMapDragRadiusView overlay](self, "overlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationTriggerEditorMapDragRadiusView addHandleForAnnotation:withOverlay:](self, "addHandleForAnnotation:withOverlay:", v3, v4);

  -[WFLocationTriggerEditorMapDragRadiusView setNeedsDisplay](self, "setNeedsDisplay");
}

- (CGPoint)minPoint
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  MKMapPoint v7;
  CLLocationCoordinate2D v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CLLocationCoordinate2D v16;
  MKMapPoint v17;
  CGPoint result;

  -[WFLocationTriggerEditorMapDragRadiusView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x22769EDDC](objc_msgSend(v3, "coordinate"));

  if (-[WFLocationTriggerEditorMapDragRadiusView usesMetric](self, "usesMetric"))
    v5 = 100.0;
  else
    v5 = 100.000008;
  -[WFLocationTriggerEditorMapDragRadiusView annotation](self, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinate");
  v7 = MKMapPointForCoordinate(v16);

  v17.x = v7.x + v4 * v5;
  v17.y = v7.y;
  v8 = MKCoordinateForMapPoint(v17);
  -[WFLocationTriggerEditorMapDragRadiusView mapView](self, "mapView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertCoordinate:toPointToView:", self, v8.latitude, v8.longitude);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)maxPoint
{
  void *v3;
  double v4;
  void *v5;
  MKMapPoint v6;
  CLLocationCoordinate2D v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CLLocationCoordinate2D v15;
  MKMapPoint v16;
  CGPoint result;

  -[WFLocationTriggerEditorMapDragRadiusView annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x22769EDDC](objc_msgSend(v3, "coordinate"));

  -[WFLocationTriggerEditorMapDragRadiusView usesMetric](self, "usesMetric");
  -[WFLocationTriggerEditorMapDragRadiusView annotation](self, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinate");
  v6 = MKMapPointForCoordinate(v15);

  v16.x = v6.x + v4 * 2414016.0;
  v16.y = v6.y;
  v7 = MKCoordinateForMapPoint(v16);
  -[WFLocationTriggerEditorMapDragRadiusView mapView](self, "mapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertCoordinate:toPointToView:", self, v7.latitude, v7.longitude);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (double)currentHandleDistanceNormalized
{
  double v3;
  double v4;
  _BOOL4 v5;
  double v6;

  -[WFLocationTriggerEditorMapDragRadiusView currentHandleDistance](self, "currentHandleDistance");
  v4 = v3;
  v5 = -[WFLocationTriggerEditorMapDragRadiusView usesMetric](self, "usesMetric");
  v6 = v4 * 3.28083992;
  if (v5)
    v6 = v4;
  return floor(v6 / 10.0) * 10.0;
}

- (double)currentHandleDistance
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;

  -[WFLocationTriggerEditorMapDragRadiusView handleEndpointView](self, "handleEndpointView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "center");
  v5 = v4;
  v7 = v6;

  -[WFLocationTriggerEditorMapDragRadiusView mapView](self, "mapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toCoordinateFromView:", self, v5, v7);
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", v10, v12);
  v14 = objc_alloc(MEMORY[0x24BDBFA80]);
  -[WFLocationTriggerEditorMapDragRadiusView annotation](self, "annotation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "coordinate");
  v17 = v16;
  -[WFLocationTriggerEditorMapDragRadiusView annotation](self, "annotation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coordinate");
  v19 = (void *)objc_msgSend(v14, "initWithLatitude:longitude:", v17);

  objc_msgSend(v13, "distanceFromLocation:", v19);
  v21 = v20;

  return v21;
}

- (double)maximumRadiusNormalized
{
  _BOOL4 v2;
  double result;

  v2 = -[WFLocationTriggerEditorMapDragRadiusView usesMetric](self, "usesMetric");
  result = 7920000.0;
  if (v2)
    return 2414016.0;
  return result;
}

- (double)minimumRadiusNormalized
{
  _BOOL4 v2;
  double result;

  v2 = -[WFLocationTriggerEditorMapDragRadiusView usesMetric](self, "usesMetric");
  result = 328.084015;
  if (v2)
    return 100.0;
  return result;
}

- (BOOL)usesMetric
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCB60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (WFLocationTriggerEditorMapDragRadiusViewDelegate)delegate
{
  return (WFLocationTriggerEditorMapDragRadiusViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)proximity
{
  return self->_proximity;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void)setIsDragging:(BOOL)a3
{
  self->_isDragging = a3;
}

- (UIView)handleEndpointView
{
  return self->_handleEndpointView;
}

- (void)setHandleEndpointView:(id)a3
{
  objc_storeStrong((id *)&self->_handleEndpointView, a3);
}

- (MKAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_annotation, a3);
}

- (MKOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
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

- (NSMeasurementFormatter)measurmentFormatter
{
  return self->_measurmentFormatter;
}

- (void)setMeasurmentFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_measurmentFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurmentFormatter, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_handleEndpointView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __60__WFLocationTriggerEditorMapDragRadiusView_animateHandleIn___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  id v3;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "handleEndpointView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCenter:", v1, v2);

}

uint64_t __60__WFLocationTriggerEditorMapDragRadiusView_animateHandleIn___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "popAnimateHandle");
  return result;
}

@end
