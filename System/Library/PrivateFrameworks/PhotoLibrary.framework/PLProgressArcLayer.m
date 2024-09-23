@implementation PLProgressArcLayer

- (PLProgressArcLayer)init
{
  PLProgressArcLayer *v2;
  PLProgressArcLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLProgressArcLayer;
  v2 = -[PLProgressArcLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lineWidth = 1.0;
    -[PLProgressArcLayer setNeedsDisplayOnBoundsChange:](v2, "setNeedsDisplayOnBoundsChange:", 1);
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
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat MidY;
  CGFloat MidX;
  _QWORD v20[12];
  CGRect v21;
  CGRect v22;

  CGContextSaveGState(a3);
  -[PLProgressArcLayer bounds](self, "bounds");
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MidY = CGRectGetMidY(v22);
  -[PLProgressArcLayer radius](self, "radius");
  v10 = v9;
  -[PLProgressArcLayer lineWidth](self, "lineWidth");
  v12 = v11;
  -[PLProgressArcLayer startAngle](self, "startAngle");
  v14 = v13;
  -[PLProgressArcLayer endAngle](self, "endAngle");
  v16 = v15;
  v20[0] = MEMORY[0x1E0C809B0];
  v17 = v10 + v12 * -0.5;
  v20[1] = 3221225472;
  v20[2] = __36__PLProgressArcLayer_drawInContext___block_invoke;
  v20[3] = &__block_descriptor_96_e8_v16__0d8l;
  *(CGFloat *)&v20[4] = x;
  *(CGFloat *)&v20[5] = y;
  *(CGFloat *)&v20[6] = width;
  *(CGFloat *)&v20[7] = height;
  *(double *)&v20[8] = v12;
  *(CGFloat *)&v20[9] = MidX;
  *(CGFloat *)&v20[10] = MidY;
  v20[11] = a3;
  __36__PLProgressArcLayer_drawInContext___block_invoke((uint64_t)v20, v14);
  __36__PLProgressArcLayer_drawInContext___block_invoke((uint64_t)v20, v16);
  CGContextSetLineWidth(a3, v12);
  CGContextAddArc(a3, MidX, MidY, v17, v14, v16, 0);
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"), "CGColor"));
  CGContextStrokePath(a3);
  CGContextAddArc(a3, MidX, MidY, v17, v16, v14 + 6.28318531, 0);
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.600000024), "CGColor"));
  CGContextStrokePath(a3);
  CGContextRestoreGState(a3);
}

- (void)setRadius:(double)a3
{
  if (self->_radius != a3)
  {
    self->_radius = a3;
    -[PLProgressArcLayer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setStartAngle:(double)a3
{
  if (self->_startAngle != a3)
  {
    self->_startAngle = a3;
    -[PLProgressArcLayer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setEndAngle:(double)a3
{
  if (self->_endAngle != a3)
  {
    self->_endAngle = a3;
    -[PLProgressArcLayer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setLineWidth:(double)a3
{
  if (self->_lineWidth != a3)
  {
    self->_lineWidth = a3;
    -[PLProgressArcLayer setNeedsDisplay](self, "setNeedsDisplay");
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

void __36__PLProgressArcLayer_drawInContext___block_invoke(uint64_t a1, CGFloat a2)
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

@end
