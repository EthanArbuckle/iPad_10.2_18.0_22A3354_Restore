@implementation CRLCanvasShapeRenderable

- (CRLCanvasShapeRenderable)initWithShapeLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasShapeRenderable;
  return -[CRLCanvasRenderable initWithCALayer:](&v4, "initWithCALayer:", a3);
}

+ (id)renderableFromShapeLayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithShapeLayer:", v4);

  return v5;
}

+ (id)renderable
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  v4 = objc_msgSend(v2, "initWithShapeLayer:", v3);

  return v4;
}

- (CAShapeLayer)shapeLayer
{
  CALayer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasShapeRenderable;
  v2 = -[CRLCanvasRenderable layer](&v4, "layer");
  return (CAShapeLayer *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (CGPath)path
{
  void *v2;
  CGPath *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  v3 = (CGPath *)objc_msgSend(v2, "path");

  return v3;
}

- (void)setPath:(CGPath *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v4, "setPath:", a3);

}

- (CGColor)strokeColor
{
  void *v2;
  CGColor *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  v3 = (CGColor *)objc_msgSend(v2, "strokeColor");

  return v3;
}

- (void)setStrokeColor:(CGColor *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v4, "setStrokeColor:", a3);

}

- (CGColor)fillColor
{
  void *v2;
  CGColor *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  v3 = (CGColor *)objc_msgSend(v2, "fillColor");

  return v3;
}

- (void)setFillColor:(CGColor *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v4, "setFillColor:", a3);

}

- (double)lineWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v2, "lineWidth");
  v4 = v3;

  return v4;
}

- (void)setLineWidth:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v4, "setLineWidth:", a3);

}

- (NSArray)lineDashPattern
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lineDashPattern"));

  return (NSArray *)v3;
}

- (void)setLineDashPattern:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v5, "setLineDashPattern:", v4);

}

- (NSString)lineCap
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lineCap"));

  return (NSString *)v3;
}

- (void)setLineCap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v5, "setLineCap:", v4);

}

- (double)lineDashPhase
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v2, "lineDashPhase");
  v4 = v3;

  return v4;
}

- (void)setLineDashPhase:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v4, "setLineDashPhase:", a3);

}

- (NSString)lineJoin
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lineJoin"));

  return (NSString *)v3;
}

- (void)setLineJoin:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v5, "setLineJoin:", v4);

}

- (double)miterLimit
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v2, "miterLimit");
  v4 = v3;

  return v4;
}

- (void)setMiterLimit:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v4, "setMiterLimit:", a3);

}

- (double)strokeEnd
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v2, "strokeEnd");
  v4 = v3;

  return v4;
}

- (void)setStrokeEnd:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasShapeRenderable shapeLayer](self, "shapeLayer"));
  objc_msgSend(v4, "setStrokeEnd:", a3);

}

- (void)setCGLineCap:(int)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("butt");
  if (a3 == 1)
    v3 = CFSTR("round");
  if (a3 == 2)
    v4 = CFSTR("square");
  else
    v4 = v3;
  -[CRLCanvasShapeRenderable setLineCap:](self, "setLineCap:", v4);
}

- (void)setCGLineJoin:(int)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("miter");
  if (a3 == 1)
    v3 = CFSTR("round");
  if (a3 == 2)
    v4 = CFSTR("bevel");
  else
    v4 = v3;
  -[CRLCanvasShapeRenderable setLineJoin:](self, "setLineJoin:", v4);
}

@end
