@implementation TintedView

- (TintedView)init
{
  TintedView *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TintedView;
  v2 = -[TintedView init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TintedView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[TintedView layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayOnBoundsChange:", 0);

  }
  return v2;
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect v13;

  if (self->_image)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    -[TintedView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UIImage drawInRect:](self->_image, "drawInRect:");
    if (self->_tintColor)
    {
      CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceIn);
      -[UIColor set](self->_tintColor, "set");
      v13.origin.x = v6;
      v13.origin.y = v8;
      v13.size.width = v10;
      v13.size.height = v12;
      CGContextFillRect(CurrentContext, v13);
    }
  }
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    v6 = *MEMORY[0x24BDBEFB0];
    v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[UIImage size](self->_image, "size");
    -[TintedView setBounds:](self, "setBounds:", v6, v7, v8, v9);
    v10.receiver = self;
    v10.super_class = (Class)TintedView;
    -[TintedView setNeedsDisplay](&v10, sel_setNeedsDisplay);
  }

}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
