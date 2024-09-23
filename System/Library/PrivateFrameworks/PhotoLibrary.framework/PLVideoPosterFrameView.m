@implementation PLVideoPosterFrameView

- (PLVideoPosterFrameView)initWithFrame:(CGRect)a3
{
  PLVideoPosterFrameView *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLVideoPosterFrameView;
  v3 = -[PLVideoPosterFrameView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[PLVideoPosterFrameView bounds](v3, "bounds");
    v3->_imageView = (UIImageView *)objc_msgSend(v4, "initWithFrame:");
    v3->_scaleMode = 1;
    -[PLVideoPosterFrameView addSubview:](v3, "addSubview:", v3->_imageView);
    -[PLVideoPosterFrameView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLVideoPosterFrameView;
  -[PLVideoPosterFrameView dealloc](&v3, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  UIImageView *imageView;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PLVideoPosterFrameView frame](self, "frame");
  v15.origin.x = v8;
  v15.origin.y = v9;
  v15.size.width = v10;
  v15.size.height = v11;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  if (!CGRectEqualToRect(v14, v15))
  {
    v13.receiver = self;
    v13.super_class = (Class)PLVideoPosterFrameView;
    -[PLVideoPosterFrameView setFrame:](&v13, sel_setFrame_, x, y, width, height);
    imageView = self->_imageView;
    -[PLVideoPosterFrameView bounds](self, "bounds");
    -[UIImageView setFrame:](imageView, "setFrame:");
    -[PLVideoPosterFrameView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIImage *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t scaleMode;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIImageView *imageView;
  CGAffineTransform v20;
  CGAffineTransform v21;

  -[PLVideoPosterFrameView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = -[UIImageView image](self->_imageView, "image");
  if (v7)
  {
    -[UIImage size](v7, "size");
    v9 = v4 / v8;
    v11 = v6 / v10;
    scaleMode = self->_scaleMode;
    if (v9 >= v11)
      v13 = v11;
    else
      v13 = v9;
    if (v9 >= v11)
      v14 = v9;
    else
      v14 = v11;
    if (scaleMode == 2)
    {
      v9 = v14;
      v11 = v14;
    }
    if (scaleMode == 1)
      v9 = v13;
    memset(&v21.c, 0, 32);
    if (scaleMode == 1)
      v11 = v13;
    *(_OWORD *)&v21.a = 0uLL;
    CGAffineTransformMakeScale(&v21, v9, v11);
    -[UIImageView center](self->_imageView, "center");
    v16 = v15;
    v18 = v17;
    -[UIImageView bounds](self->_imageView, "bounds");
    -[UIImageView setBounds:](self->_imageView, "setBounds:");
    -[UIImageView setCenter:](self->_imageView, "setCenter:", v16, v18);
    imageView = self->_imageView;
    v20 = v21;
    -[UIImageView setTransform:](imageView, "setTransform:", &v20);
  }
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
  -[PLVideoPosterFrameView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setScaleMode:(int64_t)a3
{
  if (self->_scaleMode != a3)
  {
    self->_scaleMode = a3;
    -[PLVideoPosterFrameView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (id)imageView
{
  return self->_imageView;
}

- (CGRect)imageFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIImageView frame](self->_imageView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end
