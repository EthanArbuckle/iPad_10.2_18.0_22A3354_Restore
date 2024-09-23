@implementation STSProgressArcLayer

- (STSProgressArcLayer)init
{
  STSProgressArcLayer *v2;
  STSProgressArcLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSProgressArcLayer;
  v2 = -[STSProgressArcLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lineWidth = 1.0;
    -[STSProgressArcLayer setNeedsDisplayOnBoundsChange:](v2, "setNeedsDisplayOnBoundsChange:", 1);
  }
  return v3;
}

- (void)drawInContext:(CGContext *)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void (**v17)(double);
  id v18;
  id v19;
  CGFloat MidY;
  CGFloat v21;
  CGFloat MidX;
  _QWORD v23[12];
  CGRect v24;
  CGRect v25;

  CGContextSaveGState(a3);
  -[STSProgressArcLayer bounds](self, "bounds");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  MidX = CGRectGetMidX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MidY = CGRectGetMidY(v25);
  -[STSProgressArcLayer radius](self, "radius");
  v10 = v9;
  -[STSProgressArcLayer lineWidth](self, "lineWidth");
  v12 = v11;
  -[STSProgressArcLayer startAngle](self, "startAngle");
  v14 = v13;
  -[STSProgressArcLayer endAngle](self, "endAngle");
  v16 = v15;
  v23[0] = MEMORY[0x24BDAC760];
  v21 = v10 + v12 * -0.5;
  v23[1] = 3221225472;
  v23[2] = __37__STSProgressArcLayer_drawInContext___block_invoke;
  v23[3] = &__block_descriptor_96_e8_v16__0d8l;
  *(CGFloat *)&v23[4] = x;
  *(CGFloat *)&v23[5] = y;
  *(CGFloat *)&v23[6] = width;
  *(CGFloat *)&v23[7] = height;
  *(double *)&v23[8] = v12;
  *(CGFloat *)&v23[9] = MidX;
  *(CGFloat *)&v23[10] = MidY;
  v23[11] = a3;
  v17 = (void (**)(double))MEMORY[0x227672A18](v23);
  v17[2](v14);
  ((void (*)(void (**)(double), double))v17[2])(v17, v16);
  CGContextSetLineWidth(a3, v12);
  CGContextAddArc(a3, MidX, MidY, v21, v14, v16, 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v18, "CGColor"));

  CGContextStrokePath(a3);
  CGContextAddArc(a3, MidX, MidY, v21, v16, v14 + 6.28318531, 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.600000024);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v19, "CGColor"));

  CGContextStrokePath(a3);
  CGContextRestoreGState(a3);

}

void __37__STSProgressArcLayer_drawInContext___block_invoke(uint64_t a1, CGFloat a2)
{
  CGPath *Mutable;
  CGFloat v5;
  CGFloat v6;
  CGAffineTransform v7;
  CGAffineTransform m;
  CGRect v9;

  Mutable = CGPathCreateMutable();
  CGPathAddRect(Mutable, 0, *(CGRect *)(a1 + 32));
  v5 = *(double *)(a1 + 72);
  v6 = *(double *)(a1 + 64) * 0.5;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeTranslation(&v7, v5, *(CGFloat *)(a1 + 80));
  CGAffineTransformRotate(&m, &v7, a2);
  v9.size.width = CGRectGetWidth(*(CGRect *)(a1 + 32)) * 0.5;
  v9.origin.x = 0.0;
  v9.origin.y = v6 * -0.5;
  v9.size.height = v6;
  CGPathAddRect(Mutable, &m, v9);
  CGContextAddPath(*(CGContextRef *)(a1 + 88), Mutable);
  CGContextEOClip(*(CGContextRef *)(a1 + 88));
  CGPathRelease(Mutable);
}

- (void)setRadius:(double)a3
{
  if (self->_radius != a3)
  {
    self->_radius = a3;
    -[STSProgressArcLayer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setStartAngle:(double)a3
{
  if (self->_startAngle != a3)
  {
    self->_startAngle = a3;
    -[STSProgressArcLayer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setEndAngle:(double)a3
{
  if (self->_endAngle != a3)
  {
    self->_endAngle = a3;
    -[STSProgressArcLayer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setLineWidth:(double)a3
{
  if (self->_lineWidth != a3)
  {
    self->_lineWidth = a3;
    -[STSProgressArcLayer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (double)radius
{
  return self->_radius;
}

- (double)startAngle
{
  return self->_startAngle;
}

- (double)endAngle
{
  return self->_endAngle;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

@end
