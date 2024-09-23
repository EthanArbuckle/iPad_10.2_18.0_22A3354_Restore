@implementation CRLWPTextMagnifierCaret

- (void)setTarget:(id)a3
{
  id v5;
  uint64_t v6;
  void **p_target;
  objc_class *v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  void *v14;
  id v15;

  v5 = a3;
  p_target = (void **)&self->_target;
  if (*p_target != v5)
  {
    v15 = v5;
    objc_opt_class(CRLWPRep, v6);
    v9 = sub_1002223BC(v8, *p_target);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v10, "enableCaretAnimation");

    objc_storeStrong(p_target, a3);
    objc_opt_class(CRLWPRep, v11);
    v13 = sub_1002223BC(v12, *p_target);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v14, "disableCaretAnimation");

    v5 = v15;
  }

}

- (CRLWPTextMagnifierCaret)init
{
  CRLWPTextMagnifierCaret *v2;
  void *v3;
  CRLWPTextMagnifierTimeWeightedPoint *v4;
  CRLWPTextMagnifierTimeWeightedPoint *weightedPoint;
  CRLWPTextMagnifierRenderer *v6;
  CRLWPTextMagnifierRenderer *magnifierRenderer;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLWPTextMagnifierCaret;
  v2 = -[CRLWPTextMagnifierCaret initWithFrame:](&v12, "initWithFrame:", 0.0, 0.0, 106.0, 106.0);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CRLWPTextMagnifierCaret setBackgroundColor:](v2, "setBackgroundColor:", v3);

    v4 = objc_alloc_init(CRLWPTextMagnifierTimeWeightedPoint);
    weightedPoint = v2->_weightedPoint;
    v2->_weightedPoint = v4;

    v6 = -[CRLWPTextMagnifierRenderer initWithFrame:]([CRLWPTextMagnifierRenderer alloc], "initWithFrame:", 0.0, 0.0, 106.0, 106.0);
    magnifierRenderer = v2->_magnifierRenderer;
    v2->_magnifierRenderer = v6;

    -[CRLWPTextMagnifierRenderer setRendererDelegate:](v2->_magnifierRenderer, "setRendererDelegate:", v2);
    -[CRLWPTextMagnifierCaret addSubview:](v2, "addSubview:", v2->_magnifierRenderer);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierCaret overlayImageName](v2, "overlayImageName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v8));

    v10 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v9);
    -[CRLWPTextMagnifierCaret addSubview:](v2, "addSubview:", v10);

  }
  return v2;
}

- (void)setFrame:(CGRect)a3
{
  CRLWPTextMagnifierRenderer *magnifierRenderer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLWPTextMagnifierCaret;
  -[CRLWPTextMagnifierCaret setFrame:](&v5, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  magnifierRenderer = self->_magnifierRenderer;
  -[CRLWPTextMagnifierCaret bounds](self, "bounds");
  -[CRLWPTextMagnifierRenderer setFrame:](magnifierRenderer, "setFrame:");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLWPTextMagnifierCaret;
  -[CRLWPTextMagnifierCaret setNeedsDisplay](&v3, "setNeedsDisplay");
  -[CRLWPTextMagnifierRenderer setNeedsDisplay](self->_magnifierRenderer, "setNeedsDisplay");
}

- (CGPoint)magnificationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_magnificationPoint.x;
  y = self->_magnificationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[CRLWPTextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:");
  if (x != self->_magnificationPoint.x || y != self->_magnificationPoint.y)
  {
    self->_magnificationPoint.x = x;
    self->_magnificationPoint.y = y;
    -[CRLWPTextMagnifierCaret updateFrameAndOffset](self, "updateFrameAndOffset");
    -[CRLWPTextMagnifierRenderer setNeedsDisplay](self->_magnifierRenderer, "setNeedsDisplay");
  }
}

- (CGPoint)terminalPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[CRLWPTextMagnifierTimeWeightedPoint weightedPoint](self->_weightedPoint, "weightedPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)terminalPointPlacedCarefully
{
  BOOL v3;
  double v4;

  v3 = -[CRLWPTextMagnifierTimeWeightedPoint historyCovers:](self->_weightedPoint, "historyCovers:", 0.5);
  -[CRLWPTextMagnifierTimeWeightedPoint distanceCoveredInInterval:](self->_weightedPoint, "distanceCoveredInInterval:", 0.5);
  return v4 < 10.0 && v3;
}

- (CGPoint)animationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_magnificationPoint.x;
  y = self->_magnificationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)postAutoscrollPoint:(CGPoint)a3
{
  -[CRLWPTextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:", a3.x, a3.y);
}

- (void)setAutoscrollDirections:(int)a3
{
  -[CRLWPTextMagnifierRenderer setAutoscrollDirections:](self->_magnifierRenderer, "setAutoscrollDirections:", *(_QWORD *)&a3);
}

- (void)autoscrollWillNotStart
{
  -[CRLWPTextMagnifierCaret setAutoscrollDirections:](self, "setAutoscrollDirections:", 0);
}

- (void)zoomUpAnimation
{
  CGFloat MaxY;
  _QWORD v4[5];
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGRect v8;

  memset(&v7, 0, sizeof(v7));
  -[CRLWPTextMagnifierCaret bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v8);
  CGAffineTransformMakeTranslation(&v7, 0.0, MaxY * 0.5);
  v5 = v7;
  CGAffineTransformScale(&v6, &v5, 0.25, 0.25);
  v7 = v6;
  -[CRLWPTextMagnifierCaret setTransform:](self, "setTransform:", &v6);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10025717C;
  v4[3] = &unk_10122D110;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.075);
}

- (void)zoomDownAnimation
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10025723C;
  v3[3] = &unk_10122D110;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100257480;
  v2[3] = &unk_10122F780;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v3, v2, 0.15);
}

- (void)remove
{
  UIWindow *hostWindow;

  -[UIWindow setHidden:](self->_hostWindow, "setHidden:", 1);
  hostWindow = self->_hostWindow;
  self->_hostWindow = 0;

}

- (void)updateFrameAndOffset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierCaret superview](self, "superview"));
  -[CRLWPTextMagnifierCaret magnificationPoint](self, "magnificationPoint");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierCaret target](self, "target"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasView"));
  objc_msgSend(v3, "convertPoint:fromView:", v11, v5, v7);
  v13 = v12;
  v15 = v14;

  -[CRLWPTextMagnifierCaret bounds](self, "bounds");
  v17 = v15 + v16 * 0.5;
  v18 = v17 + -60.0;
  v19 = v17 + -75.0;
  if (v18 >= 75.0)
    v20 = 60.0;
  else
    v20 = v19;
  -[CRLWPTextMagnifierCaret offset](self, "offset");
  v22 = v13 + v21;
  -[CRLWPTextMagnifierCaret offset](self, "offset");
  self->_yOffset = v20;
  -[CRLWPTextMagnifierCaret setCenter:](self, "setCenter:", round(v22), round(v15 + v23 - v20));
  -[CRLWPTextMagnifierCaret frame](self, "frame");
  v25 = CGRectIntegral(v24);
  -[CRLWPTextMagnifierCaret setFrame:](self, "setFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  id v13;
  void *v14;
  UIWindow *v15;
  UIWindow *hostWindow;
  void *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  CRLWPTextMagnifierCaretController *v25;
  id v26;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v12 = a3;
  -[CRLWPTextMagnifierCaret setTarget:](self, "setTarget:", v12);
  -[CRLWPTextMagnifierTimeWeightedPoint clearHistory](self->_weightedPoint, "clearHistory");
  -[CRLWPTextMagnifierCaret setAutoscrollDirections:](self, "setAutoscrollDirections:", 0);
  -[CRLWPTextMagnifierCaret setNeedsLayout](self, "setNeedsLayout");
  -[CRLWPTextMagnifierCaret setNeedsDisplay](self, "setNeedsDisplay");
  v13 = objc_alloc((Class)UIWindow);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v14, "bounds");
  v15 = (UIWindow *)objc_msgSend(v13, "initWithFrame:");
  hostWindow = self->_hostWindow;
  self->_hostWindow = v15;

  -[UIWindow setWindowLevel:](self->_hostWindow, "setWindowLevel:", UIWindowLevelStatusBar + 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIWindow setBackgroundColor:](self->_hostWindow, "setBackgroundColor:", v17);

  *(_QWORD *)&v19 = objc_opt_class(UIViewController, v18).n128_u64[0];
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactiveCanvasController", v19));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "delegate"));
  v24 = sub_100221D0C(v21, v23);
  v26 = (id)objc_claimAutoreleasedReturnValue(v24);

  v25 = -[CRLWPTextMagnifierCaretController initWithPreferredStatusBarStyle:]([CRLWPTextMagnifierCaretController alloc], "initWithPreferredStatusBarStyle:", objc_msgSend(v26, "preferredStatusBarStyle"));
  -[CRLWPTextMagnifierCaretController setView:](v25, "setView:", self);
  -[UIWindow setRootViewController:](self->_hostWindow, "setRootViewController:", v25);
  -[UIWindow addSubview:](self->_hostWindow, "addSubview:", self);
  -[UIWindow setHidden:](self->_hostWindow, "setHidden:", 0);
  -[CRLWPTextMagnifierCaret setMagnificationPoint:](self, "setMagnificationPoint:", v10, v9);
  -[CRLWPTextMagnifierCaret frame](self, "frame");
  -[CRLWPTextMagnifierCaret setFrame:](self, "setFrame:");
  -[CRLWPTextMagnifierCaret setOffset:](self, "setOffset:", x, y);
  if (v6)
    -[CRLWPTextMagnifierCaret zoomUpAnimation](self, "zoomUpAnimation");

}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3)
  {
    -[CRLWPTextMagnifierCaret zoomDownAnimation](self, "zoomDownAnimation");
  }
  else
  {
    -[CRLWPTextMagnifierCaret remove](self, "remove");
    -[CRLWPTextMagnifierCaret setTarget:](self, "setTarget:", 0);
  }
  self->_magnificationPoint = (CGPoint)xmmword_100EEC428;
  -[CRLWPTextMagnifierCaret setOffset:](self, "setOffset:", CGPointZero.x, CGPointZero.y);
}

- (BOOL)p_isMagnifierStopping
{
  double v4;
  double v5;

  if (self->_magnificationPoint.x != INFINITY || self->_magnificationPoint.y != INFINITY)
    return 0;
  -[CRLWPTextMagnifierCaret offset](self, "offset");
  return v5 == CGPointZero.y && v4 == CGPointZero.x;
}

- (id)overlayImageName
{
  return CFSTR("kb-loupe-hi");
}

- (NSString)maskImageName
{
  return (NSString *)CFSTR("kb-loupe-mask");
}

- (BOOL)shouldHideCanvasLayer
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierCaret target](self, "target"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "interactiveCanvasController"));

  objc_opt_class(CRLInteractiveCanvasController, v4);
  v6 = sub_100221D0C(v5, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8)
  {
    *(_QWORD *)&v9 = objc_opt_class(CRLiOSCanvasViewController, v7).n128_u64[0];
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layerHost", v9));
    v13 = sub_100221D0C(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  }
  return 1;
}

- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGContext *CurrentContext;
  double v32;
  UIImage *ImageFromCurrentImageContext;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  CGImage *v38;
  id v39;
  CGImage *v40;
  id v41;
  CGSize v42;
  CGRect v43;
  CGRect v44;

  v6 = objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierCaret target](self, "target", a3));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[CRLWPTextMagnifierCaret p_isMagnifierStopping](self, "p_isMagnifierStopping");

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierCaret target](self, "target"));
      v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interactiveCanvasController"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "layerHost"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasView"));

      -[CRLWPTextMagnifierCaret frame](self, "frame");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierCaret superview](self, "superview"));
      objc_msgSend(v11, "convertRect:fromView:", v20, v13, v15, v17, v19);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      +[UIScreen crl_screenScale](UIScreen, "crl_screenScale");
      v30 = v29;
      v42.width = v26;
      v42.height = v28;
      UIGraphicsBeginImageContextWithOptions(v42, 1, v30);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextScaleCTM(CurrentContext, 1.0, -1.0);
      CGContextScaleCTM(CurrentContext, 1.2, 1.2);
      -[CRLWPTextMagnifierCaret yOffset](self, "yOffset");
      CGContextTranslateCTM(CurrentContext, -v22, -v24 - v32);
      CGContextTranslateCTM(CurrentContext, v26 * -0.100000001, v28 * -0.899999999);
      ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
      v34 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      UIGraphicsEndImageContext();
      CGContextSaveGState(a4);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierCaret maskImageName](self, "maskImageName"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v35));

      v37 = objc_retainAutorelease(v36);
      v38 = (CGImage *)objc_msgSend(v37, "CGImage");
      v43.origin.x = 0.0;
      v43.origin.y = 0.0;
      v43.size.width = v26;
      v43.size.height = v28;
      CGContextClipToMask(a4, v43, v38);
      v39 = objc_retainAutorelease(v34);
      v40 = (CGImage *)objc_msgSend(v39, "CGImage");
      v44.origin.x = 0.0;
      v44.origin.y = 0.0;
      v44.size.width = v26;
      v44.size.height = v28;
      CGContextDrawImage(a4, v44, v40);
      CGContextRestoreGState(a4);

    }
  }
}

- (CRLCanvasRep)target
{
  return self->_target;
}

- (double)pointVelocity
{
  return self->_pointVelocity;
}

- (void)setPointVelocity:(double)a3
{
  self->_pointVelocity = a3;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (void)setAnimationPoint:(CGPoint)a3
{
  self->_magnificationPoint = a3;
}

- (double)yOffset
{
  return self->_yOffset;
}

- (void)setYOffset:(double)a3
{
  self->_yOffset = a3;
}

- (NSString)underlayImageName
{
  return self->_underlayImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlayImageName, 0);
  objc_storeStrong((id *)&self->_hostWindow, 0);
  objc_storeStrong((id *)&self->_magnifierRenderer, 0);
  objc_storeStrong((id *)&self->_weightedPoint, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

@end
