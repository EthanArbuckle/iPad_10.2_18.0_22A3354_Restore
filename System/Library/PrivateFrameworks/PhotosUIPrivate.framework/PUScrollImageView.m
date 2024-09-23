@implementation PUScrollImageView

- (PUScrollImageView)initWithFrame:(CGRect)a3 image:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PUScrollImageView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PUScrollImageView;
  v10 = -[PUScrollImageView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    -[PUScrollImageView setImageView:](v10, "setImageView:", v11);

    -[PUScrollImageView imageView](v10, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentMode:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUScrollImageView imageView](v10, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    -[PUScrollImageView setDelegate:](v10, "setDelegate:", v10);
    -[PUScrollImageView imageView](v10, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUScrollImageView addSubview:](v10, "addSubview:", v15);

  }
  return v10;
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_getProperty(self, a2, 2072, 1);
}

- (void)setImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 2072);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
