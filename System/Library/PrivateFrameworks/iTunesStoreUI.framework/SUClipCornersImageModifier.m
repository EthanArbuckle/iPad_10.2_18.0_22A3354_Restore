@implementation SUClipCornersImageModifier

- (BOOL)isEqual:(id)a3
{
  int v5;
  double v6;
  double v7;
  double v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[SUClipCornersImageModifier corners](self, "corners");
  if (objc_msgSend(a3, "corners") != v5)
    return 0;
  -[SUClipCornersImageModifier cornerRadius](self, "cornerRadius");
  v7 = v6;
  objc_msgSend(a3, "cornerRadius");
  return v7 == v8;
}

- (void)drawAfterImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  CGContextRestoreGState(a3);
}

- (void)drawBeforeImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  CGPath *v11;
  const CGPath *v12;
  CGPath *v13;
  const CGPath *v14;
  CGRect v15;
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  CGContextSaveGState(a3);
  v11 = -[SUClipCornersImageModifier _copyClippingPathForRect:](self, "_copyClippingPathForRect:", x, y, width, height);
  if (v11)
  {
    v12 = v11;
    CGContextAddPath(a3, v11);
    CGContextClip(a3);
    CGPathRelease(v12);
  }
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v16 = CGRectInset(v15, 0.5, 0.5);
  v13 = -[SUClipCornersImageModifier _copyClippingPathForRect:](self, "_copyClippingPathForRect:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  if (v13)
  {
    v14 = v13;
    CGContextAddPath(a3, v13);
    CGPathRelease(v14);
  }
}

- (CGPath)_copyClippingPathForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  double v9;
  double v10;
  char v11;
  CGFloat MidX;
  CGFloat MinY;
  double MaxX;
  double v15;
  double v16;
  double MaxY;
  double MinX;
  double v19;
  double v20;
  double v21;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  -[SUClipCornersImageModifier cornerRadius](self, "cornerRadius");
  v10 = v9;
  v11 = -[SUClipCornersImageModifier corners](self, "corners");
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MidX = CGRectGetMidX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinY = CGRectGetMinY(v24);
  CGPathMoveToPoint(Mutable, 0, MidX, MinY);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v15 = CGRectGetMinY(v26);
  if ((v11 & 8) != 0)
    CGPathAddArc(Mutable, 0, MaxX - v10, v10 + v15, v10, 4.71238898, 6.28318531, 0);
  else
    CGPathAddLineToPoint(Mutable, 0, MaxX, v15);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v16 = CGRectGetMaxX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MaxY = CGRectGetMaxY(v28);
  if ((v11 & 2) != 0)
    CGPathAddArc(Mutable, 0, v16 - v10, MaxY - v10, v10, 0.0, 1.57079633, 0);
  else
    CGPathAddLineToPoint(Mutable, 0, v16, MaxY);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  MinX = CGRectGetMinX(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v19 = CGRectGetMaxY(v30);
  if ((v11 & 1) != 0)
    CGPathAddArc(Mutable, 0, v10 + MinX, v19 - v10, v10, 1.57079633, 3.14159265, 0);
  else
    CGPathAddLineToPoint(Mutable, 0, MinX, v19);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v20 = CGRectGetMinX(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v21 = CGRectGetMinY(v32);
  if ((v11 & 4) != 0)
    CGPathAddArc(Mutable, 0, v10 + v20, v10 + v21, v10, 3.14159265, 4.71238898, 0);
  else
    CGPathAddLineToPoint(Mutable, 0, v20, v21);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (int)corners
{
  return self->_corners;
}

- (void)setCorners:(int)a3
{
  self->_corners = a3;
}

@end
