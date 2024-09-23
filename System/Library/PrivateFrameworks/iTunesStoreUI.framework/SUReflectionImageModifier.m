@implementation SUReflectionImageModifier

- (void)dealloc
{
  objc_super v3;

  self->_gradient = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUReflectionImageModifier;
  -[SUReflectionImageModifier dealloc](&v3, sel_dealloc);
}

- (CGSize)finalSizeForSize:(CGSize)a3 originalSize:(CGSize)a4
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a4.height;
  width = a3.width;
  -[SUReflectionImageModifier reflectionHeight](self, "reflectionHeight", a3.width, a3.height, a4.width);
  v7 = height + v6;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (CGRect)imageFrameForImage:(id)a3 currentFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  -[SUReflectionImageModifier reflectionHeight](self, "reflectionHeight", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
  v9 = v8;
  v10 = x;
  v11 = width;
  v12 = height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

- (void)drawAfterImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height;
  double width;
  CGFloat x;
  CGImageRef Image;
  CGImage *v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGImageRef v15;
  CGImage *v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  Image = CGBitmapContextCreateImage(a3);
  if (Image)
  {
    v11 = Image;
    -[SUReflectionImageModifier reflectionHeight](self, "reflectionHeight");
    v13 = v12;
    v14 = height - v12;
    CGContextGetBaseCTM();
    v18.origin.x = x;
    v18.origin.y = v14;
    v18.size.width = width;
    v18.size.height = v13;
    v19 = CGRectApplyAffineTransform(v18, &v17);
    v15 = CGImageCreateWithImageInRect(v11, v19);
    if (v15)
    {
      v16 = v15;
      CGContextSaveGState(a3);
      CGContextTranslateCTM(a3, 0.0, v13);
      CGContextScaleCTM(a3, 1.0, -1.0);
      v20.origin.x = 0.0;
      v20.origin.y = 0.0;
      v20.size.width = width;
      v20.size.height = v13;
      CGContextDrawImage(a3, v20, v16);
      if (self->_gradient)
      {
        CGContextSetCompositeOperation();
        -[UIGradient fillRect:inContext:](self->_gradient, "fillRect:inContext:", a3, 0.0, 0.0, width, v13);
      }
      CGContextRestoreGState(a3);
      CGImageRelease(v16);
    }
    CGImageRelease(v11);
  }
}

- (UIGradient)gradient
{
  return self->_gradient;
}

- (void)setGradient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (double)reflectionHeight
{
  return self->_reflectionHeight;
}

- (void)setReflectionHeight:(double)a3
{
  self->_reflectionHeight = a3;
}

@end
