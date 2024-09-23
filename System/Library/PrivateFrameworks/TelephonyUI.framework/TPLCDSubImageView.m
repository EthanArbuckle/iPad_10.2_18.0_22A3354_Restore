@implementation TPLCDSubImageView

- (TPLCDSubImageView)initWithDefaultSize
{
  TPLCDSubImageView *v2;
  TPLCDSubImageView *v3;

  v2 = -[TPLCDSubImageView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 61.0, 61.0);
  v3 = v2;
  if (v2)
    -[TPLCDSubImageView setOpaque:](v2, "setOpaque:", 0);
  return v3;
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[TPLCDSubImageView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  CGContext *CurrentContext;
  void *v12;
  void *v13;
  id v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)MEMORY[0x1E0DC3508];
  v15 = CGRectInset(a3, 1.5, 1.5);
  objc_msgSend(v8, "bezierPathWithOvalInRect:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3508];
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v17 = CGRectInset(v16, 1.0, 1.0);
  objc_msgSend(v9, "bezierPathWithOvalInRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_msgSend(v10, "addClip");
  -[UIImage drawInRect:blendMode:alpha:](self->_image, "drawInRect:blendMode:alpha:", 17, x, y, width, height, 1.0);
  CGContextRestoreGState(CurrentContext);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.100000001);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "set");

  objc_msgSend(v14, "stroke");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.300000012);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "set");

  objc_msgSend(v10, "stroke");
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
