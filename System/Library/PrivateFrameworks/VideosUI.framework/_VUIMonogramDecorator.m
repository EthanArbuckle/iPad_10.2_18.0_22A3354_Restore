@implementation _VUIMonogramDecorator

- (id)decoratorIdentifier
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_VUIMonogramDecorator;
  -[VUIImageScaleDecorator decoratorIdentifier](&v5, sel_decoratorIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("_mono"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)needsAlphaForImage:(id)a3
{
  return 1;
}

- (void)drawInContext:(id)a3 imageRect:(CGRect)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CGContext *v11;
  void *v12;
  void *v13;
  UIColor *borderColor;
  id v15;
  CGRect v16;

  v5 = a3;
  objc_msgSend(v5, "currentImage");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v7 = v6;
  objc_msgSend(v15, "size");
  v9 = v8;
  +[VUIBezierPath bezierPathWithOvalInRect:](VUIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (CGContext *)objc_msgSend(v5, "CGContext");

  CGContextSetBlendMode(v11, kCGBlendModeCopy);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFill");

  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = v7;
  v16.size.height = v9;
  UIRectFill(v16);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFill");

  objc_msgSend(v10, "fill");
  objc_msgSend(v15, "drawInRect:blendMode:alpha:", 18, 0.0, 0.0, v7, v9, 1.0);
  borderColor = self->_borderColor;
  if (borderColor && self->_borderWidth > 0.0)
  {
    -[UIColor setStroke](borderColor, "setStroke");
    objc_msgSend(v10, "setLineWidth:", self->_borderWidth);
    objc_msgSend(v10, "stroke");
  }

}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
