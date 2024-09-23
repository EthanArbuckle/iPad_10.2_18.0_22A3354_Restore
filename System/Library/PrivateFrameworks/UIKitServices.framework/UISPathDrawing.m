@implementation UISPathDrawing

- (UISPathDrawing)initWithType:(int64_t)a3 path:(CGPath *)a4 size:(CGSize)a5 fillColor:(CGColor *)a6
{
  CGFloat height;
  CGFloat width;
  UISPathDrawing *v11;
  UISPathDrawing *v12;
  objc_super v14;

  height = a5.height;
  width = a5.width;
  v14.receiver = self;
  v14.super_class = (Class)UISPathDrawing;
  v11 = -[UISPathDrawing init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v11->_path = CGPathRetain(a4);
    v12->_size.width = width;
    v12->_size.height = height;
    v12->_fillColor = CGColorRetain(a6);
  }
  return v12;
}

- (UISPathDrawing)initWithEllipseSize:(CGSize)a3 fillColor:(CGColor *)a4
{
  return -[UISPathDrawing initWithType:path:size:fillColor:](self, "initWithType:path:size:fillColor:", 1, 0, a4, a3.width, a3.height);
}

- (UISPathDrawing)initWithPath:(CGPath *)a3 size:(CGSize)a4 fillColor:(CGColor *)a5
{
  return -[UISPathDrawing initWithType:path:size:fillColor:](self, "initWithType:path:size:fillColor:", 2, a3, a5, a4.width, a4.height);
}

- (UISPathDrawing)initWithRectSize:(CGSize)a3 fillColor:(CGColor *)a4
{
  return -[UISPathDrawing initWithType:path:size:fillColor:](self, "initWithType:path:size:fillColor:", 0, 0, a4, a3.width, a3.height);
}

- (UISPathDrawing)initWithRoundedRectSize:(CGSize)a3 cornerRadii:(double)a4[4] fillColor:(CGColor *)a5
{
  double height;
  double width;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v15;
  const CGPath *v16;
  UISPathDrawing *v17;
  CGRect v19;

  height = a3.height;
  width = a3.width;
  v9 = *a4;
  v10 = a4[1];
  v12 = a4[2];
  v11 = a4[3];
  if (*a4 != v10 || v10 != v12 || v12 != v11)
  {
    v15 = CGPathCreateWithUnevenCornersRoundedRect();
LABEL_12:
    v16 = (const CGPath *)v15;
    goto LABEL_13;
  }
  if (v9 != 0.0)
  {
    v19.size.width = a3.width;
    v19.size.height = a3.height;
    v19.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v19.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
    v15 = (uint64_t)CGPathCreateWithRoundedRect(v19, v9, *a4, 0);
    goto LABEL_12;
  }
  v16 = 0;
LABEL_13:
  v17 = -[UISPathDrawing initWithType:path:size:fillColor:](self, "initWithType:path:size:fillColor:", 2 * (v16 != 0), v16, a5, width, height, v11);
  CGPathRelease(v16);
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_path);
  CGColorRelease(self->_fillColor);
  v3.receiver = self;
  v3.super_class = (Class)UISPathDrawing;
  -[UISPathDrawing dealloc](&v3, sel_dealloc);
}

- (CGRect)alignmentRect
{
  double width;
  double height;
  double v4;
  double v5;
  CGRect result;

  width = self->_size.width;
  height = self->_size.height;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGSize)drawingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  int64_t type;
  CGRect v10;
  CGRect v11;

  y = a4.y;
  x = a4.x;
  CGContextSetFillColorWithColor(a3, self->_fillColor);
  type = self->_type;
  switch(type)
  {
    case 2:
      if (x != *MEMORY[0x1E0C9D538] || y != *(double *)(MEMORY[0x1E0C9D538] + 8))
        CGContextTranslateCTM(a3, x, y);
      CGContextAddPath(a3, self->_path);
      CGContextFillPath(a3);
      break;
    case 1:
      v11.size.width = self->_size.width;
      v11.size.height = self->_size.height;
      v11.origin.x = x;
      v11.origin.y = y;
      CGContextFillEllipseInRect(a3, v11);
      break;
    case 0:
      v10.size.width = self->_size.width;
      v10.size.height = self->_size.height;
      v10.origin.x = x;
      v10.origin.y = y;
      CGContextFillRect(a3, v10);
      break;
  }
}

@end
