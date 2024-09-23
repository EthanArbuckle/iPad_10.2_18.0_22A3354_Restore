@implementation MTChevronView

+ (id)chevronImage
{
  if (qword_100567578 != -1)
    dispatch_once(&qword_100567578, &stru_1004ABBB0);
  return (id)qword_100567570;
}

- (MTChevronView)initWithFrame:(CGRect)a3
{
  MTChevronView *v3;
  MTChevronView *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTChevronView;
  v3 = -[MTChevronView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend((id)objc_opt_class(v3), "chevronImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v6);
    -[MTChevronView setImageView:](v4, "setImageView:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTChevronView imageView](v4, "imageView"));
    objc_msgSend(v8, "sizeToFit");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTChevronView imageView](v4, "imageView"));
    -[MTChevronView addSubview:](v4, "addSubview:", v9);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MTChevronView;
  -[MTChevronView layoutSubviews](&v25, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTChevronView imageView](self, "imageView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[MTChevronView bounds](self, "bounds");
  v17 = CGRectCenterRectInRect(v12, v5, v7, v9, v11, v13, v14, v15, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTChevronView imageView](self, "imageView"));
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTChevronView imageView](self, "imageView"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
