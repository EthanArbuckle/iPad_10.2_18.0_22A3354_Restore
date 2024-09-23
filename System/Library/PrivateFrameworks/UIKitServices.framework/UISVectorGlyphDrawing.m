@implementation UISVectorGlyphDrawing

- (UISVectorGlyphDrawing)initWithVectorGlyph:(id)a3 tintColor:(CGColor *)a4
{
  id v6;
  UISVectorGlyphDrawing *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat width;
  double v22;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UISVectorGlyphDrawing;
  v7 = -[UISVectorGlyphDrawing init](&v24, sel_init);
  if (v7)
  {
    v7->_image = CGImageRetain((CGImageRef)objc_msgSend(v6, "image"));
    v7->_tintColor = CGColorRetain(a4);
    objc_msgSend(v6, "alignmentRect");
    v7->_imageFrame.origin.x = v8;
    v7->_imageFrame.origin.y = v9;
    v7->_imageFrame.size.width = v10;
    v7->_imageFrame.size.height = v11;
    objc_msgSend(v6, "contentBounds");
    v7->_size.width = v12;
    v7->_size.height = v13;
    objc_msgSend(v6, "baselineOffset");
    v15 = v14;
    objc_msgSend(v6, "pointSize");
    objc_msgSend(v6, "scale");
    v17 = v16;
    CTFontGetAscentForSystemFontOfSize();
    v19 = v18;
    CTFontGetDescentForSystemFontOfSize();
    v20 = v7->_imageFrame.origin.y + v7->_imageFrame.size.height - v15 - round(v17 * v19) / v17;
    width = v7->_size.width;
    v7->_alignmentRect.origin.x = 0.0;
    v7->_alignmentRect.origin.y = v20;
    v7->_alignmentRect.size.width = width;
    v7->_alignmentRect.size.height = ceil(v17 * (v19 + v22)) / v17;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_image);
  CGColorRelease(self->_tintColor);
  v3.receiver = self;
  v3.super_class = (Class)UISVectorGlyphDrawing;
  -[UISVectorGlyphDrawing dealloc](&v3, sel_dealloc);
}

- (CGRect)alignmentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_alignmentRect.origin.x;
  y = self->_alignmentRect.origin.y;
  width = self->_alignmentRect.size.width;
  height = self->_alignmentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
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
  double height;
  CGColor *tintColor;
  CGAffineTransform v8;

  height = self->_size.height;
  v8.a = 1.0;
  v8.b = 0.0;
  v8.c = 0.0;
  v8.d = -1.0;
  v8.tx = a4.x;
  v8.ty = a4.y + height;
  CGContextConcatCTM(a3, &v8);
  if (self->_tintColor)
    CGContextBeginTransparencyLayerWithRect(a3, self->_imageFrame, 0);
  CGContextDrawImage(a3, self->_imageFrame, self->_image);
  tintColor = self->_tintColor;
  if (tintColor)
  {
    CGContextSetFillColorWithColor(a3, tintColor);
    CGContextSetBlendMode(a3, kCGBlendModeSourceIn);
    CGContextFillRect(a3, self->_imageFrame);
    CGContextEndTransparencyLayer(a3);
  }
}

@end
