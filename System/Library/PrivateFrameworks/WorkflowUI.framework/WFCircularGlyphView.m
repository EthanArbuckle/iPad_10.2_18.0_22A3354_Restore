@implementation WFCircularGlyphView

- (WFCircularGlyphView)initWithName:(id)a3 glyphColor:(id)a4 backgroundColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFCircularGlyphView *v11;
  WFCircularGlyphView *v12;
  void *v13;
  void *v14;
  WFCircularGlyphView *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WFCircularGlyphView;
  v11 = -[WFCircularGlyphView init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    -[WFCircularGlyphView setGlyphName:](v11, "setGlyphName:", v8);
    -[WFCircularGlyphView setGlyphColor:](v12, "setGlyphColor:", v9);
    -[WFCircularGlyphView setGlyphBackgroundColor:](v12, "setGlyphBackgroundColor:", v10);
    -[WFCircularGlyphView setImagePointSize:](v12, "setImagePointSize:", 35.0);
    -[WFCircularGlyphView backgroundColorView](v12, "backgroundColorView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCircularGlyphView addSubview:](v12, "addSubview:", v13);

    -[WFCircularGlyphView glyphImageView](v12, "glyphImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCircularGlyphView addSubview:](v12, "addSubview:", v14);

    v15 = v12;
  }

  return v12;
}

- (void)configureViews
{
  -[WFCircularGlyphView configureGlyphImageView](self, "configureGlyphImageView");
  -[WFCircularGlyphView configureBackgroundColorView](self, "configureBackgroundColorView");
}

- (UIImageView)glyphImageView
{
  UIImageView *glyphImageView;
  UIImageView *v4;
  UIImageView *v5;

  glyphImageView = self->_glyphImageView;
  if (!glyphImageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    v5 = self->_glyphImageView;
    self->_glyphImageView = v4;

    glyphImageView = self->_glyphImageView;
  }
  return glyphImageView;
}

- (UIView)backgroundColorView
{
  UIView *backgroundColorView;
  UIView *v4;
  UIView *v5;

  backgroundColorView = self->_backgroundColorView;
  if (!backgroundColorView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    v5 = self->_backgroundColorView;
    self->_backgroundColorView = v4;

    backgroundColorView = self->_backgroundColorView;
  }
  return backgroundColorView;
}

- (id)glyphImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BEBD640];
  -[WFCircularGlyphView glyphName](self, "glyphName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BEBD660];
  -[WFCircularGlyphView imagePointSize](self, "imagePointSize");
  objc_msgSend(v6, "configurationWithPointSize:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)configureGlyphImageView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[WFCircularGlyphView glyphImage](self, "glyphImage");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  v4 = v3;
  v6 = v5;
  -[WFCircularGlyphView glyphImageView](self, "glyphImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCircularGlyphView glyphImage](self, "glyphImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v8);

  -[WFCircularGlyphView glyphColor](self, "glyphColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "setTintColor:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v10);

  }
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

}

- (void)configureBackgroundColorView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  void *v20;
  id v21;
  CGRect v22;

  -[WFCircularGlyphView backgroundColorView](self, "backgroundColorView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCircularGlyphView glyphImageView](self, "glyphImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCircularGlyphView glyphBackgroundColor](self, "glyphBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v21, "setBackgroundColor:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v5);

  }
  objc_msgSend(v3, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v3, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentInsets");
  objc_msgSend(v21, "setFrame:", v7 + v18, v9 + v15, v11 - (v18 + v16), v13 - (v15 + v17));

  objc_msgSend(v21, "frame");
  v19 = CGRectGetWidth(v22) * 0.5;
  objc_msgSend(v21, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCornerRadius:", v19);

}

- (void)setImagePointSize:(double)a3
{
  id v4;

  if (self->_imagePointSize != a3)
  {
    self->_imagePointSize = a3 * 0.7;
    -[WFCircularGlyphView configureViews](self, "configureViews");
    -[WFCircularGlyphView glyphImageView](self, "glyphImageView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    -[WFCircularGlyphView setFrame:](self, "setFrame:");

  }
}

- (double)imagePointSize
{
  return self->_imagePointSize;
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (void)setGlyphName:(id)a3
{
  objc_storeStrong((id *)&self->_glyphName, a3);
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (void)setGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_glyphColor, a3);
}

- (UIColor)glyphBackgroundColor
{
  return self->_glyphBackgroundColor;
}

- (void)setGlyphBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_glyphBackgroundColor, a3);
}

- (void)setGlyphImageView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphImageView, a3);
}

- (void)setBackgroundColorView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_glyphBackgroundColor, 0);
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_glyphName, 0);
}

@end
