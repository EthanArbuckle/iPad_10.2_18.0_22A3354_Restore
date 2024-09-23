@implementation FMMapDragRadiusView

- (void)initialize
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v3 = objc_alloc((Class)UIImageView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("FenceMapDragHandle")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fmfOrangeColor](UIColor, "fmfOrangeColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tintedImageWithColor:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("FenceMapDragHandle")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fmfOrangeColor](UIColor, "fmfOrangeColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tintedImageWithColor:", v8));
  v10 = objc_msgSend(v3, "initWithImage:highlightedImage:", v6, v9);
  -[FMMapDragRadiusView setHandleImageView:](self, "setHandleImageView:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  objc_msgSend(v12, "setZPosition:", 50.0);

  v13 = objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "handlePan:");
  -[FMMapDragRadiusView addGestureRecognizer:](self, "addGestureRecognizer:", v13);

}

- (FMMapDragRadiusView)initWithCoder:(id)a3
{
  FMMapDragRadiusView *v3;
  FMMapDragRadiusView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMMapDragRadiusView;
  v3 = -[FMMapDragRadiusView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[FMMapDragRadiusView initialize](v3, "initialize");
  return v4;
}

- (FMMapDragRadiusView)initWithFrame:(CGRect)a3
{
  FMMapDragRadiusView *v3;
  FMMapDragRadiusView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMMapDragRadiusView;
  v3 = -[FMMapDragRadiusView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[FMMapDragRadiusView initialize](v3, "initialize");
  return v4;
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
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CATransform3D v23;
  CATransform3D v24;
  CATransform3D v25;
  CATransform3D v26;
  CATransform3D v27;
  CATransform3D v28;
  CATransform3D v29;
  CATransform3D v30;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform")));
  objc_msgSend(v4, "setDuration:", 0.349999994);
  memset(&v30, 0, sizeof(v30));
  if (v3)
  {
    objc_msgSend(v3, "transform");
    CATransform3DScale(&v30, &v29, 0.5, 0.5, 1.0);
    memset(&v28, 0, sizeof(v28));
    objc_msgSend(v3, "transform");
    CATransform3DScale(&v28, &v27, 1.20000005, 1.20000005, 1.0);
    memset(&v26, 0, sizeof(v26));
    objc_msgSend(v3, "transform");
    CATransform3DScale(&v26, &v25, 0.899999976, 0.899999976, 1.0);
    memset(&v24, 0, sizeof(v24));
    objc_msgSend(v3, "transform");
  }
  else
  {
    memset(&v29, 0, sizeof(v29));
    CATransform3DScale(&v30, &v29, 0.5, 0.5, 1.0);
    memset(&v28, 0, sizeof(v28));
    memset(&v27, 0, sizeof(v27));
    CATransform3DScale(&v28, &v27, 1.20000005, 1.20000005, 1.0);
    memset(&v26, 0, sizeof(v26));
    memset(&v25, 0, sizeof(v25));
    CATransform3DScale(&v26, &v25, 0.899999976, 0.899999976, 1.0);
    memset(&v24, 0, sizeof(v24));
  }
  v23 = v30;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v23));
  v23 = v28;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v23));
  v23 = v26;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v23));
  v23 = v24;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v23));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, v6, v7, v8, 0));

  objc_msgSend(v4, "setValues:", v9);
  LODWORD(v10) = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10));
  LODWORD(v12) = 0.5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v12));
  LODWORD(v14) = *(_DWORD *)"fff?";
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));
  LODWORD(v16) = 1.0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v11, v13, v15, v17, 0));

  objc_msgSend(v4, "setKeyTimes:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v19, v20, v21, 0));

  objc_msgSend(v4, "setTimingFunctions:", v22);
  objc_msgSend(v4, "setFillMode:", kCAFillModeForwards);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  objc_msgSend(v3, "addAnimation:forKey:", v4, CFSTR("transform"));

}

- (id)bezierPathWithEndPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  __int128 v14;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView mapView](self, "mapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
  objc_msgSend(v7, "coordinate");
  objc_msgSend(v6, "convertCoordinate:toPointToView:", self);
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  v14 = xmmword_10047FB40;
  objc_msgSend(v12, "setLineDash:count:phase:", &v14, 2, 0.0);
  objc_msgSend(v12, "setLineWidth:", 2.0);
  objc_msgSend(v12, "setLineCapStyle:", 1);
  objc_msgSend(v12, "moveToPoint:", floor(v9), floor(v11));
  objc_msgSend(v12, "addLineToPoint:", floor(x), floor(y));
  objc_msgSend(v12, "stroke");
  return v12;
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
    v4 = objc_alloc_init((Class)CAShapeLayer);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor fmfOrangeColor](UIColor, "fmfOrangeColor")));
    objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    objc_msgSend(v4, "setFillColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v4, "setLineDashPattern:", &off_10056A3E8);
    objc_msgSend(v4, "setLineCap:", CFSTR("round"));
    objc_msgSend(v4, "setLineWidth:", 2.0);
    objc_msgSend(v4, "setStrokeStart:", 0.0);
    objc_msgSend(v4, "setStrokeEnd:", 1.0);
    objc_msgSend(v4, "setZPosition:", 40.0);
    -[FMMapDragRadiusView setShapeLayer:](self, "setShapeLayer:", v4);

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

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView bezierPathWithEndPoint:](self, "bezierPathWithEndPoint:", a3.x, a3.y));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView shapeLayer](self, "shapeLayer"));
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "setPath:", objc_msgSend(v6, "CGPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superlayer"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView layer](self, "layer"));
    objc_msgSend(v8, "addSublayer:", v5);

  }
  return v5;
}

- (void)animateHandleIn:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  double MidY;
  void *v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGContext *CurrentContext;
  id v51;
  void *v52;
  id v53;
  _QWORD v54[5];
  _QWORD v55[7];
  CGSize v56;
  MKMapRect v57;
  MKMapRect v58;
  MKCoordinateRegion v59;
  CGRect v60;
  CGRect v61;
  MKMapRect v62;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "overlay"));
  objc_msgSend(v6, "boundingMapRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView mapView](self, "mapView"));
  objc_msgSend(v15, "visibleMapRect");
  v62.origin.x = v16;
  v62.origin.y = v17;
  v62.size.width = v18;
  v62.size.height = v19;
  v57.origin.x = v8;
  v57.origin.y = v10;
  v57.size.width = v12;
  v57.size.height = v14;
  v20 = MKMapRectIntersectsRect(v57, v62);

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView mapView](self, "mapView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
    objc_msgSend(v22, "coordinate");
    objc_msgSend(v21, "convertCoordinate:toPointToView:", self);
    v24 = v23;
    v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
    objc_msgSend(v27, "setCenter:", floor(v24), floor(v26));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
    -[FMMapDragRadiusView addSubview:](self, "addSubview:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "overlay"));
    objc_msgSend(v30, "boundingMapRect");
    v59 = MKCoordinateRegionForMapRect(v58);
    latitude = v59.center.latitude;
    longitude = v59.center.longitude;
    latitudeDelta = v59.span.latitudeDelta;
    longitudeDelta = v59.span.longitudeDelta;

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView mapView](self, "mapView"));
    objc_msgSend(v35, "convertRegion:toRectToView:", self, latitude, longitude, latitudeDelta, longitudeDelta);
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;

    v60.origin.x = v37;
    v60.origin.y = v39;
    v60.size.width = v41;
    v60.size.height = v43;
    v44 = floor(CGRectGetMaxX(v60));
    v61.origin.x = v37;
    v61.origin.y = v39;
    v61.size.width = v41;
    v61.size.height = v43;
    MidY = CGRectGetMidY(v61);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
    v53 = v46;
    if (v44 - v24 < 12.0)
    {
      objc_msgSend(v46, "setAlpha:", 0.0);
LABEL_8:

      return;
    }
    v47 = floor(MidY);
    objc_msgSend(v46, "setAlpha:", 1.0);

    -[FMMapDragRadiusView frame](self, "frame");
    v56.width = v48;
    v56.height = v49;
    UIGraphicsBeginImageContext(v56);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v51 = -[FMMapDragRadiusView shapeLayerWithEndPoint:](self, "shapeLayerWithEndPoint:", v44, v47);
    CGContextRestoreGState(CurrentContext);
    UIGraphicsEndImageContext();
    if (!v3)
    {
      v53 = (id)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
      objc_msgSend(v53, "setCenter:", v44, v47);
      goto LABEL_8;
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("strokeEnd")));
    objc_msgSend(v52, "setDuration:", 0.35);
    objc_msgSend(v52, "setFromValue:", &off_10056A400);
    objc_msgSend(v52, "setToValue:", &off_10056A410);
    -[CAShapeLayer addAnimation:forKey:](self->_shapeLayer, "addAnimation:forKey:", v52, CFSTR("strokeEndAnimation"));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100062044;
    v55[3] = &unk_10053F250;
    v55[4] = self;
    *(double *)&v55[5] = v44;
    *(double *)&v55[6] = v47;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100062088;
    v54[3] = &unk_10053F278;
    v54[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v55, v54, 0.349999994);

  }
}

- (void)addHandleForAnnotation:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  _BOOL8 v9;
  id v10;

  v10 = a3;
  v4 = -[FMMapDragRadiusView isDragging](self, "isDragging");
  v5 = v10;
  if (v10)
  {
    if ((v4 & 1) == 0)
    {
      v6 = objc_opt_class(_TtC6FindMy20FMFenceMapAnnotation);
      isKindOfClass = objc_opt_isKindOfClass(v10, v6);
      v5 = v10;
      if ((isKindOfClass & 1) != 0)
      {
        v8 = (id)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
        v9 = v8 != v10;

        -[FMMapDragRadiusView setAnnotation:](self, "setAnnotation:", v10);
        -[FMMapDragRadiusView animateHandleIn:](self, "animateHandleIn:", v9);
        v5 = v10;
      }
    }
  }

}

- (void)removeHandle:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (!-[FMMapDragRadiusView isDragging](self, "isDragging"))
  {
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
      objc_msgSend(v5, "setDidZoomOnSelection:", 0);

      -[FMMapDragRadiusView setAnnotation:](self, "setAnnotation:", 0);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
    objc_msgSend(v6, "removeFromSuperview");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView shapeLayer](self, "shapeLayer"));
    objc_msgSend(v7, "removeFromSuperlayer");

  }
  -[FMMapDragRadiusView setNeedsDisplay](self, "setNeedsDisplay");
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
  CGContext *CurrentContext;
  id v22;
  const CGFloat *Components;
  id v24;
  const CGFloat *v25;
  id v26;
  const CGFloat *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unint64_t v32;
  double v33;
  void *v34;
  void *v35;
  __CFString *v36;
  id v37;
  void *v38;
  void *v39;
  double x;
  double y;
  double width;
  double height;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id v52;
  objc_super v53;
  _QWORD v54[3];
  _QWORD v55[3];
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v53.receiver = self;
  v53.super_class = (Class)FMMapDragRadiusView;
  -[FMMapDragRadiusView drawRect:](&v53, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (-[FMMapDragRadiusView isDragging](self, "isDragging"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView mapView](self, "mapView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
    objc_msgSend(v5, "coordinate");
    objc_msgSend(v4, "convertCoordinate:toPointToView:", self);
    v7 = v6;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
    objc_msgSend(v10, "center");
    v12 = v11 - v7;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
    objc_msgSend(v13, "center");
    v15 = v14 - (v12 + v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
    objc_msgSend(v16, "center");
    v18 = v17 - v12;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fmfOrangeColor](UIColor, "fmfOrangeColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fmfOverlayColor](UIColor, "fmfOverlayColor"));
    CurrentContext = UIGraphicsGetCurrentContext();
    v56.origin.x = v15;
    v56.origin.y = v18;
    v56.size.width = v12 + v12;
    v56.size.height = v12 + v12;
    CGContextAddEllipseInRect(CurrentContext, v56);
    v22 = objc_retainAutorelease(v20);
    Components = CGColorGetComponents((CGColorRef)objc_msgSend(v22, "CGColor"));
    CGContextSetFillColor(CurrentContext, Components);
    CGContextFillPath(CurrentContext);
    v57.origin.x = v15;
    v57.origin.y = v18;
    v57.size.width = v12 + v12;
    v57.size.height = v12 + v12;
    CGContextAddEllipseInRect(CurrentContext, v57);
    v24 = objc_retainAutorelease(v19);
    v25 = CGColorGetComponents((CGColorRef)objc_msgSend(v24, "CGColor"));
    CGContextSetStrokeColor(CurrentContext, v25);
    CGContextSetLineWidth(CurrentContext, 3.0);
    CGContextStrokePath(CurrentContext);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "colorWithAlphaComponent:", 0.5)));
    v27 = CGColorGetComponents((CGColorRef)objc_msgSend(v26, "CGColor"));
    CGContextSetStrokeColor(CurrentContext, v27);

    -[FMMapDragRadiusView currentHandleDistanceNormalized](self, "currentHandleDistanceNormalized");
    v29 = v28;
    if (-[FMMapDragRadiusView isMinimum](self, "isMinimum"))
    {
      -[FMMapDragRadiusView minimumRadiusNormalized](self, "minimumRadiusNormalized");
      v29 = v30;
    }
    if (-[FMMapDragRadiusView isMaximum](self, "isMaximum")
      || (-[FMMapDragRadiusView maximumRadiusNormalized](self, "maximumRadiusNormalized"),
          v31 <= (double)(unint64_t)v29))
    {
      -[FMMapDragRadiusView maximumRadiusNormalized](self, "maximumRadiusNormalized");
      v32 = (unint64_t)v33;
    }
    else
    {
      v32 = (unint64_t)v29;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v32));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v34, 1));

    if (-[FMMapDragRadiusView usesMetric](self, "usesMetric"))
      v36 = CFSTR("METERS");
    else
      v36 = CFSTR("FEET");
    v37 = sub_10005FE60(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v35, v38));

    v58.origin.y = v9 + -16.0;
    v58.size.width = v12 + -14.0;
    v58.size.height = 16.0;
    v58.origin.x = v7;
    v59 = CGRectIntegral(v58);
    x = v59.origin.x;
    y = v59.origin.y;
    width = v59.size.width;
    height = v59.size.height;
    objc_msgSend(v24, "set");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 12.0));
    objc_msgSend(v24, "set");
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    CGContextSetRGBFillColor(CurrentContext, 0.937254906, 0.56078434, 0.0784313753, 1.0);
    CGContextSetRGBStrokeColor(CurrentContext, 1.0, 1.0, 1.0, 0.5);
    CGContextSetTextDrawingMode(CurrentContext, kCGTextFill);
    CGContextSetLineWidth(CurrentContext, 2.0);
    v45 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v45, "setAlignment:", 1);
    objc_msgSend(v45, "setLineBreakMode:", 4);
    v54[0] = NSFontAttributeName;
    v54[1] = NSForegroundColorAttributeName;
    v55[0] = v44;
    v55[1] = v24;
    v54[2] = NSParagraphStyleAttributeName;
    v55[2] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 3));
    objc_msgSend(v39, "drawInRect:withAttributes:", v46, x, y, width, height);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
    objc_msgSend(v47, "center");
    v49 = v48;
    v51 = v50;

    v52 = -[FMMapDragRadiusView shapeLayerWithEndPoint:](self, "shapeLayerWithEndPoint:", v49, v51);
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
  FMMapDragRadiusView *v18;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView", a4));
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
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView")),
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview")),
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

- (void)handlePan:(id)a3
{
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  void *v20;
  double x;
  double y;
  double width;
  double height;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  CGRect v30;
  CGRect v31;

  v29 = a3;
  v4 = (char *)objc_msgSend(v29, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
    objc_msgSend(v7, "setHighlighted:", 0);

    objc_msgSend(v29, "locationInView:", self);
    v9 = v8;
    -[FMMapDragRadiusView minPoint](self, "minPoint");
    if (v9 > v10)
      -[FMMapDragRadiusView setIsMinimum:](self, "setIsMinimum:", 0);
    -[FMMapDragRadiusView maxPoint](self, "maxPoint");
    if (v9 < v11)
      -[FMMapDragRadiusView setIsMaximum:](self, "setIsMaximum:", 0);
    if (-[FMMapDragRadiusView isMinimum](self, "isMinimum"))
      -[FMMapDragRadiusView minimumInMeters](self, "minimumInMeters");
    else
      -[FMMapDragRadiusView currentHandleDistance](self, "currentHandleDistance");
    v26 = v12;
    if (-[FMMapDragRadiusView isMaximum](self, "isMaximum"))
      v26 = 241401.0;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
    objc_msgSend(v27, "setCustomRadius:", v26);

    -[FMMapDragRadiusView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "hideCircleAfterDelay", 0, 0.05);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView delegate](self, "delegate"));
    objc_msgSend(v28, "didStopDraggingHandle:", self);

    -[FMMapDragRadiusView popAnimateHandle](self, "popAnimateHandle");
    goto LABEL_21;
  }
  if (v4 == (char *)2)
  {
    objc_msgSend(v29, "locationInView:", self);
    v14 = v13;
    -[FMMapDragRadiusView minPoint](self, "minPoint");
    v16 = v15;
    -[FMMapDragRadiusView maxPoint](self, "maxPoint");
    if (v17 < 0.0)
      goto LABEL_22;
    v18 = v17;
    -[FMMapDragRadiusView setIsMinimum:](self, "setIsMinimum:", 0);
    -[FMMapDragRadiusView setIsMaximum:](self, "setIsMaximum:", 0);
    v19 = v14;
    if (v14 <= v16)
    {
      -[FMMapDragRadiusView setIsMinimum:](self, "setIsMinimum:", 1);
      v19 = v16;
    }
    if (v14 >= v18)
    {
      -[FMMapDragRadiusView setIsMaximum:](self, "setIsMaximum:", 1);
      v19 = v18;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
    objc_msgSend(v20, "frame");
    v30.size.width = 24.0;
    v30.size.height = 24.0;
    v30.origin.x = v19;
    v31 = CGRectIntegral(v30);
    x = v31.origin.x;
    y = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
    objc_msgSend(v25, "setFrame:", x, y, width, height);

LABEL_21:
    -[FMMapDragRadiusView setNeedsDisplay](self, "setNeedsDisplay");
    goto LABEL_22;
  }
  if (v4 == (char *)1)
  {
    -[FMMapDragRadiusView setIsDragging:](self, "setIsDragging:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
    objc_msgSend(v5, "setHighlighted:", 1);

    -[FMMapDragRadiusView setNeedsDisplay](self, "setNeedsDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView delegate](self, "delegate"));
    objc_msgSend(v6, "willStartDraggingHandle:", self);

  }
LABEL_22:

}

- (void)_axSetCustomRadius:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
  objc_msgSend(v4, "setCustomRadius:", a3);

}

- (double)minimumInMeters
{
  double result;

  if (-[FMMapDragRadiusView usesMetric](self, "usesMetric"))
    return 100.0;
  -[FMMapDragRadiusView feetToMeters:](self, "feetToMeters:", 300.0);
  return result;
}

- (double)feetToMeters:(double)a3
{
  return a3 * 0.3048;
}

- (void)hideCircleAfterDelay
{
  -[FMMapDragRadiusView setIsDragging:](self, "setIsDragging:", 0);
  -[FMMapDragRadiusView setNeedsDisplay](self, "setNeedsDisplay");
}

- (CGPoint)minPoint
{
  void *v3;
  CLLocationDegrees v4;
  double v5;
  double v6;
  void *v7;
  MKMapPoint v8;
  CLLocationCoordinate2D v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CLLocationCoordinate2D v17;
  MKMapPoint v18;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
  objc_msgSend(v3, "coordinate");
  v5 = MKMapPointsPerMeterAtLatitude(v4);

  if (-[FMMapDragRadiusView usesMetric](self, "usesMetric"))
    v6 = 100.0;
  else
    v6 = 91.44;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
  objc_msgSend(v7, "coordinate");
  v8 = MKMapPointForCoordinate(v17);

  v18.x = v8.x + v5 * v6;
  v18.y = v8.y;
  v9 = MKCoordinateForMapPoint(v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView mapView](self, "mapView"));
  objc_msgSend(v10, "convertCoordinate:toPointToView:", self, v9.latitude, v9.longitude);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)maxPoint
{
  void *v3;
  CLLocationDegrees v4;
  double v5;
  double v6;
  void *v7;
  MKMapPoint v8;
  CLLocationCoordinate2D v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CLLocationCoordinate2D v17;
  MKMapPoint v18;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
  objc_msgSend(v3, "coordinate");
  v5 = MKMapPointsPerMeterAtLatitude(v4);

  if (-[FMMapDragRadiusView usesMetric](self, "usesMetric"))
    v6 = 241401.0;
  else
    v6 = 241401.6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
  objc_msgSend(v7, "coordinate");
  v8 = MKMapPointForCoordinate(v17);

  v18.x = v8.x + v5 * v6;
  v18.y = v8.y;
  v9 = MKCoordinateForMapPoint(v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView mapView](self, "mapView"));
  objc_msgSend(v10, "convertCoordinate:toPointToView:", self, v9.latitude, v9.longitude);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (double)currentHandleDistanceNormalized
{
  double v3;
  double v4;
  unsigned int v5;
  double v6;

  -[FMMapDragRadiusView currentHandleDistance](self, "currentHandleDistance");
  v4 = v3;
  v5 = -[FMMapDragRadiusView usesMetric](self, "usesMetric");
  v6 = v4 * 3.28084;
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
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  double v20;
  double v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView handleImageView](self, "handleImageView"));
  objc_msgSend(v3, "center");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView mapView](self, "mapView"));
  objc_msgSend(v8, "convertPoint:toCoordinateFromView:", self, v5, v7);
  v10 = v9;
  v12 = v11;

  v13 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v10, v12);
  v14 = objc_alloc((Class)CLLocation);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
  objc_msgSend(v15, "coordinate");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMMapDragRadiusView annotation](self, "annotation"));
  objc_msgSend(v18, "coordinate");
  v19 = objc_msgSend(v14, "initWithLatitude:longitude:", v17);

  objc_msgSend(v13, "distanceFromLocation:", v19);
  v21 = v20;

  return v21;
}

- (double)maximumRadiusNormalized
{
  unsigned int v2;
  double result;

  v2 = -[FMMapDragRadiusView usesMetric](self, "usesMetric");
  result = 792000.0;
  if (v2)
    return 241401.0;
  return result;
}

- (double)minimumRadiusNormalized
{
  unsigned int v2;
  double result;

  v2 = -[FMMapDragRadiusView usesMetric](self, "usesMetric");
  result = 300.0;
  if (v2)
    return 100.0;
  return result;
}

- (BOOL)usesMetric
{
  id v2;
  BOOL v3;

  v2 = objc_alloc_init((Class)FMDistanceCalculator);
  v3 = objc_msgSend(v2, "measurementSystem") == (id)2;

  return v3;
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

- (_TtC6FindMy20FMFenceMapAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_annotation, a3);
}

- (FMMapDragRadiusViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (FMMapDragRadiusViewDelegate *)a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_handleImageView, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
