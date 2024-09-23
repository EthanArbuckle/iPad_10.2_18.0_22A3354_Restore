@implementation TSWPTextMagnifierCaret

+ (id)sharedCaretMagnifier
{
  id result;

  result = (id)+[TSWPTextMagnifierCaret sharedCaretMagnifier]::sharedInstance;
  if (!+[TSWPTextMagnifierCaret sharedCaretMagnifier]::sharedInstance)
  {
    result = -[TSWPTextMagnifierCaret initWithDefaultFrame]([TSWPTextMagnifierCaret alloc], "initWithDefaultFrame");
    +[TSWPTextMagnifierCaret sharedCaretMagnifier]::sharedInstance = (uint64_t)result;
  }
  return result;
}

- (void)setTarget:(id)a3
{
  TSWPRep *target;
  id v6;

  target = self->_target;
  if (target != a3)
  {
    -[TSWPRep enableCaretAnimation](target, "enableCaretAnimation");

    self->_target = (TSWPRep *)a3;
    v6 = a3;
    -[TSWPRep disableCaretAnimation](self->_target, "disableCaretAnimation");
  }
}

- (TSWPTextMagnifierCaret)initWithDefaultFrame
{
  TSWPTextMagnifierCaret *v2;
  TSWPTextMagnifierRenderer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPTextMagnifierCaret;
  v2 = -[TSWPTextMagnifierCaret initWithFrame:](&v5, sel_initWithFrame_, 0.0, 0.0, 106.0, 106.0);
  if (v2)
  {
    -[TSWPTextMagnifierCaret setBackgroundColor:](v2, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    v2->_weightedPoint = objc_alloc_init(TSWPTextMagnifierTimeWeightedPoint);
    v3 = -[TSWPTextMagnifierRenderer initWithFrame:]([TSWPTextMagnifierRenderer alloc], "initWithFrame:", 0.0, 0.0, 106.0, 106.0);
    v2->_magnifierRenderer = v3;
    -[TSWPTextMagnifierRenderer setDelegate:](v3, "setDelegate:", v2);
    -[TSWPTextMagnifierCaret addSubview:](v2, "addSubview:", v2->_magnifierRenderer);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPTextMagnifierRenderer setDelegate:](self->_magnifierRenderer, "setDelegate:", 0);
  -[TSWPTextMagnifierRenderer tearDown](self->_magnifierRenderer, "tearDown");

  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierCaret;
  -[TSWPTextMagnifierCaret dealloc](&v3, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  TSWPTextMagnifierRenderer *magnifierRenderer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPTextMagnifierCaret;
  -[TSWPTextMagnifierCaret setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  magnifierRenderer = self->_magnifierRenderer;
  -[TSWPTextMagnifierCaret bounds](self, "bounds");
  -[TSWPTextMagnifierRenderer setFrame:](magnifierRenderer, "setFrame:");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTextMagnifierCaret;
  -[TSWPTextMagnifierCaret setNeedsDisplay](&v3, sel_setNeedsDisplay);
  -[TSWPTextMagnifierRenderer setNeedsDisplay](self->_magnifierRenderer, "setNeedsDisplay");
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
  -[TSWPTextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:");
  if (x != self->_magnificationPoint.x || y != self->_magnificationPoint.y)
  {
    self->_magnificationPoint.x = x;
    self->_magnificationPoint.y = y;
    -[TSWPTextMagnifierCaret updateFrameAndOffset](self, "updateFrameAndOffset");
    -[TSWPTextMagnifierRenderer canvasNeedsDisplay](self->_magnifierRenderer, "canvasNeedsDisplay");
  }
}

- (CGPoint)terminalPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[TSWPTextMagnifierTimeWeightedPoint weightedPoint](self->_weightedPoint, "weightedPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)terminalPointPlacedCarefully
{
  BOOL v3;
  double v4;

  v3 = -[TSWPTextMagnifierTimeWeightedPoint historyCovers:](self->_weightedPoint, "historyCovers:", 0.5);
  -[TSWPTextMagnifierTimeWeightedPoint distanceCoveredInInterval:](self->_weightedPoint, "distanceCoveredInInterval:", 0.5);
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
  -[TSWPTextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:", a3.x, a3.y);
}

- (void)setAutoscrollDirections:(int)a3
{
  -[TSWPTextMagnifierRenderer setAutoscrollDirections:](self->_magnifierRenderer, "setAutoscrollDirections:", *(_QWORD *)&a3);
}

- (void)autoscrollWillNotStart
{
  -[TSWPTextMagnifierCaret setAutoscrollDirections:](self, "setAutoscrollDirections:", 0);
}

- (void)zoomUpAnimation
{
  CGFloat MaxY;
  _QWORD v4[5];
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;

  memset(&v8, 0, sizeof(v8));
  -[TSWPTextMagnifierCaret bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v9);
  CGAffineTransformMakeTranslation(&v8, 0.0, MaxY * 0.5);
  v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  v8 = v7;
  v5 = v7;
  -[TSWPTextMagnifierCaret setTransform:](self, "setTransform:", &v5);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__TSWPTextMagnifierCaret_zoomUpAnimation__block_invoke;
  v4[3] = &unk_24D829278;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v4, 0.075);
}

uint64_t __41__TSWPTextMagnifierCaret_zoomUpAnimation__block_invoke(uint64_t a1)
{
  __int128 v1;
  _OWORD v3[3];

  v1 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v3[0] = *MEMORY[0x24BDBD8B8];
  v3[1] = v1;
  v3[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v3);
}

- (void)zoomDownAnimation
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__TSWPTextMagnifierCaret_zoomDownAnimation__block_invoke;
  v3[3] = &unk_24D829278;
  v3[4] = self;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __43__TSWPTextMagnifierCaret_zoomDownAnimation__block_invoke_2;
  v2[3] = &unk_24D82A8D0;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v3, v2, 0.15);
}

uint64_t __43__TSWPTextMagnifierCaret_zoomDownAnimation__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  int v6;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat MaxY;
  void *v26;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGRect v32;
  CGRect v33;

  v2 = *MEMORY[0x24BDBF070];
  v3 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 24);
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "selection")
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "selection"), "type") != 3
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "selection"), "type") != 5)
  {
    v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "selection"), "isInsertionPoint");
    v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "target");
    if (v6)
      objc_msgSend(v7, "caretRect");
    else
      objc_msgSend(v7, "caretRectForCharIndex:caretAffinity:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "selection"), "range"), 0);
    v12 = v8;
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "interactiveCanvasController"), "layerHost"), "canvasView");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "target"), "interactiveCanvasController"), "convertUnscaledToBoundsRect:", v12, v13, v14, v15);
    objc_msgSend(v16, "convertRect:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), v17, v18, v19, v20);
    v2 = v21;
    v3 = v22;
    v4 = v23;
    v5 = v24;
  }
  v32.origin.x = v2;
  v32.origin.y = v3;
  v32.size.width = v4;
  v32.size.height = v5;
  if (!CGRectIsEmpty(v32))
    return objc_msgSend(*(id *)(a1 + 32), "setFrame:", v2, v3, v4, v5);
  memset(&v31, 0, sizeof(v31));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  MaxY = CGRectGetMaxY(v33);
  CGAffineTransformMakeTranslation(&v31, 0.0, MaxY * 0.5);
  v29 = v31;
  CGAffineTransformScale(&v30, &v29, 0.25, 0.25);
  v31 = v30;
  v26 = *(void **)(a1 + 32);
  v28 = v30;
  return objc_msgSend(v26, "setTransform:", &v28);
}

uint64_t __43__TSWPTextMagnifierCaret_zoomDownAnimation__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "remove");
  return objc_msgSend(*(id *)(a1 + 32), "setTarget:", 0);
}

- (void)remove
{
  __int128 v3;
  _OWORD v4[3];

  -[TSWPTextMagnifierRenderer tearDown](self->_magnifierRenderer, "tearDown");
  -[TSWPTextMagnifierCaret removeFromSuperview](self, "removeFromSuperview");
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[TSWPTextMagnifierCaret setTransform:](self, "setTransform:", v4);
  -[TSWPTextMagnifierCaret setFrame:](self, "setFrame:", 0.0, 0.0, 106.0, 106.0);
}

- (void)updateFrameAndOffset
{
  void *v3;
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
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;

  v3 = (void *)-[TSWPTextMagnifierCaret superview](self, "superview");
  -[TSWPTextMagnifierCaret magnificationPoint](self, "magnificationPoint");
  objc_msgSend(v3, "convertPoint:fromView:", -[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](-[TSWPTextMagnifierCaret target](self, "target"), "interactiveCanvasController"), "layerHost"), "canvasView"), v4, v5);
  v7 = v6;
  v9 = v8;
  -[TSWPTextMagnifierCaret bounds](self, "bounds");
  v11 = v9 + v10 * 0.5;
  v12 = v11 + -60.0;
  v13 = v11 + -75.0;
  if (v12 >= 75.0)
    v14 = 60.0;
  else
    v14 = v13;
  -[TSWPTextMagnifierCaret offset](self, "offset");
  v16 = v7 + v15;
  -[TSWPTextMagnifierCaret offset](self, "offset");
  self->_yOffset = v14;
  -[TSWPTextMagnifierCaret setCenter:](self, "setCenter:", round(v16), round(v9 + v17 - v14));
  -[TSWPTextMagnifierCaret frame](self, "frame");
  v19 = CGRectIntegral(v18);
  -[TSWPTextMagnifierCaret setFrame:](self, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  double v9;
  double v10;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "stopMagnifying:", 0);
  objc_msgSend(+[TSWPTextMagnifierVerticalRanged sharedRangedMagnifier](TSWPTextMagnifierVerticalRanged, "sharedRangedMagnifier"), "stopMagnifying:", 0);
  -[TSWPTextMagnifierCaret setTarget:](self, "setTarget:", a3);
  -[TSWPTextMagnifierTimeWeightedPoint clearHistory](self->_weightedPoint, "clearHistory");
  -[TSWPTextMagnifierCaret setAutoscrollDirections:](self, "setAutoscrollDirections:", 0);
  -[TSWPTextMagnifierCaret setNeedsLayout](self, "setNeedsLayout");
  -[TSWPTextMagnifierCaret setNeedsDisplay](self, "setNeedsDisplay");
  if (!-[TSWPTextMagnifierCaret window](self, "window"))
    objc_msgSend(+[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:](TSWPEffectsWindow, "sharedEffectsWindowAboveStatusBarForView:", objc_msgSend((id)objc_msgSend(a3, "interactiveCanvasController"), "canvasView")), "addSubview:", self);
  -[TSWPTextMagnifierCaret setMagnificationPoint:](self, "setMagnificationPoint:", v10, v9);
  -[TSWPTextMagnifierCaret setOffset:](self, "setOffset:", x, y);
  if (v6)
    -[TSWPTextMagnifierCaret zoomUpAnimation](self, "zoomUpAnimation");
}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3)
  {
    -[TSWPTextMagnifierCaret zoomDownAnimation](self, "zoomDownAnimation");
  }
  else
  {
    -[TSWPTextMagnifierCaret remove](self, "remove");
    -[TSWPTextMagnifierCaret setTarget:](self, "setTarget:", 0);
  }
  self->_magnificationPoint = (CGPoint)vdupq_n_s64(0xC08F400000000000);
}

- (NSString)underlayImageName
{
  return 0;
}

- (NSString)overlayImageName
{
  return (NSString *)CFSTR("kb-loupe-hi");
}

- (NSString)maskImageName
{
  return (NSString *)CFSTR("kb-loupe-mask");
}

- (BOOL)shouldHideCanvasLayer
{
  uint64_t v2;
  void *v3;
  void *v4;

  -[TSDRep interactiveCanvasController](-[TSWPTextMagnifierCaret target](self, "target"), "interactiveCanvasController");
  objc_opt_class();
  v2 = TSUDynamicCast();
  if (v2 && (v3 = (void *)v2, objc_opt_class(), objc_msgSend(v3, "layerHost"), (v4 = (void *)TSUDynamicCast()) != 0))
    return objc_msgSend(v4, "shouldHideCanvasLayerInMagnifier");
  else
    return 1;
}

- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4
{
  TSDInteractiveCanvasController *v6;
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
  double v19;
  double v20;
  CGFloat v21;
  CGContext *CurrentContext;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  int v28;
  int v29;
  double v30;
  double v31;
  UIImage *ImageFromCurrentImageContext;
  CGImage *v33;
  CGImage *v34;
  CGSize v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v6 = -[TSDRep interactiveCanvasController](-[TSWPTextMagnifierCaret target](self, "target", a3), "interactiveCanvasController");
  v7 = (void *)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](v6, "layerHost"), "canvasView");
  -[TSWPTextMagnifierCaret frame](self, "frame");
  objc_msgSend(v7, "convertRect:fromView:", -[TSWPTextMagnifierCaret superview](self, "superview"), v8, v9, v10, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  TSUScreenScale();
  v21 = v20;
  v35.width = v17;
  v35.height = v19;
  UIGraphicsBeginImageContextWithOptions(v35, 1, v21);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_opt_class();
  v23 = TSUDynamicCast();
  if (v23)
  {
    v24 = (void *)v23;
    objc_opt_class();
    objc_msgSend(v24, "layerHost");
    v25 = (void *)objc_msgSend((id)TSUDynamicCast(), "backgroundColorForMagnifier");
    if (v25)
    {
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v25, "CGColor"));
      v36.origin.x = 0.0;
      v36.origin.y = 0.0;
      v36.size.width = v17;
      v36.size.height = v19;
      CGContextFillRect(CurrentContext, v36);
    }
  }
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextScaleCTM(CurrentContext, 1.2, 1.2);
  -[TSWPTextMagnifierCaret yOffset](self, "yOffset");
  CGContextTranslateCTM(CurrentContext, -v13, -v15 - v26);
  CGContextTranslateCTM(CurrentContext, v17 * -0.100000001, v19 * -0.899999999);
  v27 = (void *)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](v6, "layerHost"), "canvasLayer");
  objc_msgSend(v27, "shadowOpacity");
  v29 = v28;
  LODWORD(v30) = 0;
  objc_msgSend(v27, "setShadowOpacity:", v30);
  objc_msgSend(v27, "renderInContext:", CurrentContext);
  LODWORD(v31) = v29;
  objc_msgSend(v27, "setShadowOpacity:", v31);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  CGContextSaveGState(a4);
  v33 = (CGImage *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", -[TSWPTextMagnifierCaret maskImageName](self, "maskImageName"), TSWPBundle(), 0), "CGImage");
  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.width = v17;
  v37.size.height = v19;
  CGContextClipToMask(a4, v37, v33);
  v34 = -[UIImage CGImage](ImageFromCurrentImageContext, "CGImage");
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = v17;
  v38.size.height = v19;
  CGContextDrawImage(a4, v38, v34);
  CGContextRestoreGState(a4);
}

- (TSWPRep)target
{
  return self->_target;
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

- (double)yOffset
{
  return self->_yOffset;
}

- (void)setYOffset:(double)a3
{
  self->_yOffset = a3;
}

- (void)setAnimationPoint:(CGPoint)a3
{
  self->_magnificationPoint = a3;
}

@end
