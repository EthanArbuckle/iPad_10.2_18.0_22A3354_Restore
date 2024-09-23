@implementation UIGraphicsRendererContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
}

- (void)set__createsImages:(BOOL)a3
{
  self->___createsImages = a3;
}

- (UIGraphicsRendererContext)initWithCGContext:(CGContext *)a3 format:(id)a4
{
  id v6;
  UIGraphicsRendererContext *v7;
  uint64_t v8;
  UIGraphicsRendererFormat *format;

  v6 = a4;
  v7 = -[UIGraphicsRendererContext init](self, "init");
  if (v7)
  {
    v7->_backingContext = CGContextRetain(a3);
    v8 = objc_msgSend(v6, "copy");
    format = v7->_format;
    v7->_format = (UIGraphicsRendererFormat *)v8;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CGContextRelease(self->_backingContext);
  v3.receiver = self;
  v3.super_class = (Class)UIGraphicsRendererContext;
  -[UIGraphicsRendererContext dealloc](&v3, sel_dealloc);
}

- (UIGraphicsRendererFormat)format
{
  return self->_format;
}

- (CGContextRef)CGContext
{
  return self->_backingContext;
}

- (void)fillRect:(CGRect)rect
{
  -[UIGraphicsRendererContext fillRect:blendMode:](self, "fillRect:blendMode:", 17, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

- (void)fillRect:(CGRect)rect blendMode:(CGBlendMode)blendMode
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *v9;
  CGBlendMode v10;
  CGBlendMode v11;
  CGRect v12;
  CGRect v13;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v9 = -[UIGraphicsRendererContext CGContext](self, "CGContext");
  v10 = CGContextGetBlendMode();
  if (v10 == blendMode)
  {
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    CGContextFillRect(v9, v12);
  }
  else
  {
    v11 = v10;
    CGContextSetBlendMode(v9, blendMode);
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    CGContextFillRect(v9, v13);
    CGContextSetBlendMode(v9, v11);
  }
}

- (void)strokeRect:(CGRect)rect
{
  -[UIGraphicsRendererContext strokeRect:blendMode:](self, "strokeRect:blendMode:", 17, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

- (void)strokeRect:(CGRect)rect blendMode:(CGBlendMode)blendMode
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *v9;
  CGBlendMode v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v9 = -[UIGraphicsRendererContext CGContext](self, "CGContext");
  v10 = CGContextGetBlendMode();
  CGContextGetLineWidth();
  v12 = v11;
  if (v10 != blendMode)
    CGContextSetBlendMode(v9, blendMode);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v14 = CGRectInset(v13, v12 * 0.5, v12 * 0.5);
  CGContextStrokeRect(v9, v14);
  if (v10 != blendMode)
    CGContextSetBlendMode(v9, v10);
  CGContextSetLineWidth(v9, v12);
}

- (void)clipToRect:(CGRect)rect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *v7;
  CGRect v8;

  if (rect.size.width >= 0.0)
  {
    height = rect.size.height;
    if (rect.size.height >= 0.0)
    {
      width = rect.size.width;
      y = rect.origin.y;
      x = rect.origin.x;
      v7 = -[UIGraphicsRendererContext CGContext](self, "CGContext");
      v8.origin.x = x;
      v8.origin.y = y;
      v8.size.width = width;
      v8.size.height = height;
      CGContextClipToRect(v7, v8);
    }
  }
}

- (BOOL)__createsImages
{
  return self->___createsImages;
}

@end
