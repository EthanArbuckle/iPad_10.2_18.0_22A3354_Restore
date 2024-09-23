@implementation PRImageView

- (PRImageView)initWithFrame:(CGRect)a3
{
  PRImageView *v3;
  PRImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRImageView;
  v3 = -[PRImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_circular = 0;
    -[PRImageView setOpaque:](v3, "setOpaque:", 0);
  }
  return v4;
}

- (void)setImage:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIImage isEqual:](self->_image, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[PRImageView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[PRImageView isCircular](self, "isCircular", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    v4 = (void *)MEMORY[0x24BDF6870];
    -[PRImageView bounds](self, "bounds");
    objc_msgSend(v4, "bezierPathWithOvalInRect:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addClip");

  }
  -[PRImageView image](self, "image");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PRImageView bounds](self, "bounds");
  objc_msgSend(v6, "drawInRect:");

}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (void)setCircular:(BOOL)a3
{
  self->_circular = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
