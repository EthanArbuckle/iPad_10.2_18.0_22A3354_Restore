@implementation XBViewMatchingImageView

- (XBViewMatchingImageView)initWithMatchingView:(id)a3 image:(id)a4 bottom:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  XBViewMatchingImageView *v10;
  XBViewMatchingImageView *v11;
  id v12;
  uint64_t v13;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)XBViewMatchingImageView;
  v10 = -[XBViewMatchingImageView init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    -[XBViewMatchingImageView setMatchingView:](v10, "setMatchingView:", v8);
    if (v9)
    {
      v12 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v9);
      -[XBViewMatchingImageView setImageView:](v11, "setImageView:", v12);

    }
    -[XBViewMatchingImageView setBottom:](v11, "setBottom:", v5);
    if (v5)
      v13 = 10;
    else
      v13 = 34;
    objc_msgSend(v8, "setAutoresizingMask:", v13);
    objc_msgSend(v8, "setHidden:", v9 != 0);
    -[XBViewMatchingImageView addSubview:](v11, "addSubview:", v8);
    -[XBViewMatchingImageView addSubview:](v11, "addSubview:", v11->_imageView);
  }

  return v11;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 bottom;
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
  double v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)XBViewMatchingImageView;
  -[XBViewMatchingImageView layoutSubviews](&v25, "layoutSubviews");
  -[UIView sizeToFit](self->_matchingView, "sizeToFit");
  -[UIView frame](self->_matchingView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  bottom = self->_bottom;
  v12 = -[XBViewMatchingImageView safeAreaInsets](self, "safeAreaInsets");
  if (bottom)
  {
    v15 = UIRectInset(v12, v4, v6, v8, v10, -v14, 0.0, 0.0, 0.0);
    v17 = v16;
    v19 = v18;
    -[XBViewMatchingImageView frame](self, "frame");
    v21 = v20 - v19;
  }
  else
  {
    v15 = UIRectInset(v12, v4, v6, v8, v10, 0.0, 0.0, -v13, 0.0);
    v21 = v22;
    v17 = v23;
    v19 = v24;
  }
  -[UIView setFrame:](self->_matchingView, "setFrame:", v15, v21, v17, v19);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v15, v21, v17, v19);
}

- (UIView)matchingView
{
  return self->_matchingView;
}

- (void)setMatchingView:(id)a3
{
  objc_storeStrong((id *)&self->_matchingView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (BOOL)bottom
{
  return self->_bottom;
}

- (void)setBottom:(BOOL)a3
{
  self->_bottom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_matchingView, 0);
}

@end
