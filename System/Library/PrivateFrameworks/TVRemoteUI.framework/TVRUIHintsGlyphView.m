@implementation TVRUIHintsGlyphView

- (TVRUIHintsGlyphView)initWithImage:(id)a3 styleProvider:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TVRUIHintsGlyphView *v12;
  TVRUIHintsGlyphView *v13;
  id *p_styleProvider;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  UIView *backgroundView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIImageView *imageView;
  void *v26;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "size");
  v9 = v8;
  objc_msgSend(v6, "size");
  v11 = v10;
  v28.receiver = self;
  v28.super_class = (Class)TVRUIHintsGlyphView;
  v12 = -[TVRUIHintsGlyphView initWithFrame:](&v28, sel_initWithFrame_, 0.0, 0.0, v9, v10);
  v13 = v12;
  if (v12)
  {
    p_styleProvider = (id *)&v12->_styleProvider;
    objc_storeStrong((id *)&v12->_styleProvider, a4);
    objc_msgSend(v6, "size");
    v16 = v15 * 0.5;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsGlyphView setBackgroundColor:](v13, "setBackgroundColor:", v17);

    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, v9, v11);
    backgroundView = v13->_backgroundView;
    v13->_backgroundView = (UIView *)v18;

    -[UIView layer](v13->_backgroundView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerRadius:", v16);

    objc_msgSend(*p_styleProvider, "backgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13->_backgroundView, "setBackgroundColor:", v21);

    objc_msgSend(*p_styleProvider, "backgroundFilters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v13->_backgroundView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFilters:", v22);

    -[TVRUIHintsGlyphView addSubview:](v13, "addSubview:", v13->_backgroundView);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", 0.0, 0.0, v9, v11);
    imageView = v13->_imageView;
    v13->_imageView = (UIImageView *)v24;

    -[UIImageView setImage:](v13->_imageView, "setImage:", v6);
    -[UIImageView setContentMode:](v13->_imageView, "setContentMode:", 4);
    -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](v13->_imageView, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    objc_msgSend(*p_styleProvider, "primaryTintColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsGlyphView setTintColor:](v13, "setTintColor:", v26);

    -[TVRUIHintsGlyphView addSubview:](v13, "addSubview:", v13->_imageView);
  }

  return v13;
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
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TVRUIHintsGlyphView;
  -[TVRUIHintsGlyphView layoutSubviews](&v21, sel_layoutSubviews);
  -[TVRUIHintsGlyphView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TVRUIHintsGlyphView backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[TVRUIHintsGlyphView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[TVRUIHintsGlyphView imageView](self, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TVRUIHintsGlyphView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (TVRUIHintsStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end
