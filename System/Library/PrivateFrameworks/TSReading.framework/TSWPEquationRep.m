@implementation TSWPEquationRep

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  if (self->_equationLayer)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationRep dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationRep.m"), 33, CFSTR("layer should have been cleaned up in willBeRemoved"));
  }
  v5.receiver = self;
  v5.super_class = (Class)TSWPEquationRep;
  -[TSDRep dealloc](&v5, sel_dealloc);
}

- (void)willBeRemoved
{
  objc_super v3;

  -[CALayer setDelegate:](self->_equationLayer, "setDelegate:", 0);

  self->_equationLayer = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPEquationRep;
  -[TSDRep willBeRemoved](&v3, sel_willBeRemoved);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)didUpdateLayer:(id)a3
{
  TSDTilingLayer *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  TSDLayout *v14;
  double width;
  double height;
  TSDLayout *v17;
  double v18;
  double v19;
  double v20;
  double x;
  double y;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGAffineTransform v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v30.receiver = self;
  v30.super_class = (Class)TSWPEquationRep;
  -[TSDRep didUpdateLayer:](&v30, sel_didUpdateLayer_);
  if (-[TSDLayout equationIsValid](-[TSDRep layout](self, "layout"), "equationIsValid"))
  {
    if (!self->_equationLayer)
    {
      v5 = objc_alloc_init(TSDTilingLayer);
      self->_equationLayer = &v5->super;
      -[TSDTilingLayer setDelegate:](v5, "setDelegate:", self);
      -[CALayer setAnchorPoint:](self->_equationLayer, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
      -[CALayer setContentsScale:](self->_equationLayer, "setContentsScale:");
    }
    -[TSWPEquationRep clipRect](self, "clipRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = -[TSDRep layout](self, "layout");
    if (v14)
      -[TSDAbstractLayout transformInRoot](v14, "transformInRoot");
    else
      memset(&v29, 0, sizeof(v29));
    v31.origin.x = v7;
    v31.origin.y = v9;
    v31.size.width = v11;
    v31.size.height = v13;
    v32 = CGRectApplyAffineTransform(v31, &v29);
    width = v32.size.width;
    height = v32.size.height;
    v17 = -[TSDRep layout](self, "layout", v32.origin.x, v32.origin.y);
    if (v17)
    {
      -[TSDAbstractLayout transformInRoot](v17, "transformInRoot");
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
    }
    v18 = TSDTransformScale((double *)&v26);
    v19 = TSDMultiplyPointScalar(v7, v9, v18);
    -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "convertUnscaledToBoundsRect:", v19, v20, width, height);
    v34 = CGRectIntegral(v33);
    x = v34.origin.x;
    y = v34.origin.y;
    v23 = v34.size.width;
    v24 = v34.size.height;
    -[CALayer bounds](self->_equationLayer, "bounds");
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = v23;
    v36.size.height = v24;
    if (!CGRectEqualToRect(v35, v36))
    {
      -[CALayer setBounds:](self->_equationLayer, "setBounds:", x, y, v23, v24);
      objc_msgSend(a3, "bounds");
      -[CALayer setPosition:](self->_equationLayer, "setPosition:", TSDSubtractPoints(x, y, v25));
      -[CALayer setNeedsDisplay](self->_equationLayer, "setNeedsDisplay");
    }
    if (-[CALayer superlayer](self->_equationLayer, "superlayer", v26, v27, v28, *(_QWORD *)&v29.a, *(_QWORD *)&v29.b, *(_QWORD *)&v29.c, *(_QWORD *)&v29.d, *(_QWORD *)&v29.tx, *(_QWORD *)&v29.ty) != a3)objc_msgSend(a3, "addSublayer:", self->_equationLayer);
  }
}

- (void)screenScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPEquationRep;
  -[TSDRep screenScaleDidChange](&v3, sel_screenScaleDidChange);
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  -[CALayer setContentsScale:](self->_equationLayer, "setContentsScale:");
}

- (void)setNeedsDisplay
{
  if (-[TSDLayout equationIsValid](-[TSDRep layout](self, "layout"), "equationIsValid"))
  {
    if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
      -[TSDInteractiveCanvasController setNeedsDisplayOnLayer:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "setNeedsDisplayOnLayer:", self->_equationLayer);
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[TSDLayout equationIsValid](-[TSDRep layout](self, "layout"), "equationIsValid"))
  {
    if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
    {
      v12.origin.x = x;
      v12.origin.y = y;
      v12.size.width = width;
      v12.size.height = height;
      if (!CGRectIsNull(v12))
      {
        v13.origin.x = x;
        v13.origin.y = y;
        v13.size.width = width;
        v13.size.height = height;
        if (!CGRectIsEmpty(v13))
        {
          -[TSDRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:", x, y, width, height);
          -[TSDInteractiveCanvasController setNeedsDisplayInRect:onLayer:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "setNeedsDisplayInRect:onLayer:", self->_equationLayer, v8, v9, v10, v11);
        }
      }
    }
  }
}

- (CGRect)clipRect
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double width;
  double v12;
  double height;
  double x;
  double y;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  v3 = (void *)-[TSDLayout equationLayout](-[TSDRep layout](self, "layout"), "equationLayout");
  if (!v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationRep clipRect]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationRep.m"), 134, CFSTR("invalid nil value for '%s'"), "equationLayout");
  }
  v26.receiver = self;
  v26.super_class = (Class)TSWPEquationRep;
  -[TSDRep clipRect](&v26, sel_clipRect);
  v7 = v6;
  v9 = v8;
  width = v10;
  height = v12;
  if (-[TSDLayout equationIsValid](-[TSDRep layout](self, "layout"), "equationIsValid"))
  {
    objc_msgSend(v3, "erasableBounds");
    v28 = CGRectIntegral(v27);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
    objc_msgSend(v3, "height");
    v7 = x + 0.0;
    v9 = v16 + y;
    v17 = (void *)-[TSDLayout textShadow](-[TSDRep layout](self, "layout"), "textShadow");
    if (objc_msgSend(v17, "isEnabled"))
    {
      objc_msgSend(v17, "shadowBoundsForRect:", v7, v9, width, height);
      v7 = v18;
      v9 = v19;
      width = v20;
      height = v21;
    }
  }
  v22 = v7;
  v23 = v9;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;

  if (-[TSDLayout equationIsValid](-[TSDRep layout](self, "layout"), "equationIsValid"))
  {
    CGContextSaveGState(a3);
    CGContextSetFillColorWithColor(a3, (CGColorRef)-[TSDLayout textColor](-[TSDRep layout](self, "layout"), "textColor"));
    CGContextSetStrokeColorWithColor(a3, (CGColorRef)-[TSDLayout textColor](-[TSDRep layout](self, "layout"), "textColor"));
    v5 = (void *)-[TSDLayout textShadow](-[TSDRep layout](self, "layout"), "textShadow");
    -[TSDCanvas viewScale](self->super.mCanvas, "viewScale");
    objc_msgSend(v5, "applyToContext:viewScale:flipped:", a3, 0);
    v6 = (void *)-[TSDLayout equationLayout](-[TSDRep layout](self, "layout"), "equationLayout");
    if (!v6)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationRep drawInContext:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationRep.m"), 175, CFSTR("invalid nil value for '%s'"), "equationLayout");
    }
    objc_msgSend(v6, "height");
    objc_msgSend(v6, "renderIntoContext:offset:", a3, 0.0, v9);
    CGContextRestoreGState(a3);
  }
}

- (void)drawInLayerContext:(CGContext *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationRep drawInLayerContext:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationRep.m"), 185, CFSTR("shouldn't draw into our own layer"));
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  void *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;

  if (self->_equationLayer == a3)
  {
    CGContextSaveGState(a4);
    -[TSDRep setupForDrawingInLayer:context:](self, "setupForDrawingInLayer:context:", self->_equationLayer, a4);
    CGContextSetFillColorWithColor(a4, (CGColorRef)-[TSDLayout textColor](-[TSDRep layout](self, "layout"), "textColor"));
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)-[TSDLayout textColor](-[TSDRep layout](self, "layout"), "textColor"));
    v6 = (void *)-[TSDLayout textShadow](-[TSDRep layout](self, "layout"), "textShadow");
    -[TSDCanvas viewScale](self->super.mCanvas, "viewScale");
    objc_msgSend(v6, "applyToContext:viewScale:flipped:", a4, -[CALayer contentsAreFlipped](self->_equationLayer, "contentsAreFlipped"), v7);
    v8 = (void *)-[TSDLayout equationLayout](-[TSDRep layout](self, "layout"), "equationLayout");
    if (!v8)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationRep drawLayer:inContext:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationRep.m"), 203, CFSTR("invalid nil value for '%s'"), "equationLayout");
    }
    objc_msgSend(v8, "height");
    objc_msgSend(v8, "renderIntoContext:offset:", a4, 0.0, v11);
    -[TSDRep didDrawInLayer:context:](self, "didDrawInLayer:context:", self->_equationLayer, a4);
    CGContextRestoreGState(a4);
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  if (self->_equationLayer == a3)
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  else
    return 0;
}

- (CGRect)visibleBoundsForTilingLayer:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSDInteractiveCanvasController visibleBoundsForTilingLayer:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "visibleBoundsForTilingLayer:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CALayer)equationLayer
{
  return self->_equationLayer;
}

- (void)setEquationLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

@end
