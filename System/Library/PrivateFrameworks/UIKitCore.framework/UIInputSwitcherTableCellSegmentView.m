@implementation UIInputSwitcherTableCellSegmentView

+ (id)_fontForBiasLabel
{
  return (id)objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 14.0);
}

- (UIInputSwitcherTableCellSegmentView)initWithFrame:(CGRect)a3
{
  UIInputSwitcherTableCellSegmentView *v3;
  UIInputSwitcherTableCellBackgroundView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIInputSwitcherTableCellBackgroundView *backgroundView;
  void *v11;
  UILabel *v12;
  UILabel *label;
  void *v14;
  void *v15;
  UIImageView *v16;
  UIImageView *imageView;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)UIInputSwitcherTableCellSegmentView;
  v3 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIInputSwitcherTableCellBackgroundView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIInputSwitcherTableCellBackgroundView *)v9;

    -[UIView setOpaque:](v3->_backgroundView, "setOpaque:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_backgroundView, "setBackgroundColor:", v11);

    -[UIView setUserInteractionEnabled:](v3->_backgroundView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](v3, "addSubview:", v3->_backgroundView);
    v12 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v5, v6, v7, v8);
    label = v3->_label;
    v3->_label = v12;

    objc_msgSend((id)objc_opt_class(), "_fontForBiasLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v14);

    +[UIColor clearColor](UIColor, "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_label, "setBackgroundColor:", v15);

    -[UIView addSubview:](v3, "addSubview:", v3->_label);
    v16 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v5, v6, v7, v8);
    imageView = v3->_imageView;
    v3->_imageView = v16;

    -[UIView addSubview:](v3, "addSubview:", v3->_imageView);
    +[UIColor clearColor](UIColor, "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v18);

  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  self->_selected = a3;
  -[UIInputSwitcherTableCellSegmentView backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", v3);

  if (v3 || -[UIInputSwitcherTableCellSegmentView usesDarkTheme](self, "usesDarkTheme"))
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v6;
  -[UIInputSwitcherTableCellSegmentView label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v9);

  -[UIInputSwitcherTableCellSegmentView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v9);

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
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  UIImageView *imageView;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)UIInputSwitcherTableCellSegmentView;
  -[UIView layoutSubviews](&v28, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_backgroundView, "setFrame:", round(v4 + (v3 + -64.0) * 0.5), round(v6 + (v5 + -39.0) * 0.5), 64.0, 39.0);
  -[UIView sizeToFit](self->_label, "sizeToFit");
  -[UIView frame](self->_label, "frame");
  v8 = v7;
  v10 = v9;
  -[UIView bounds](self, "bounds");
  -[UILabel setFrame:](self->_label, "setFrame:", round(v12 + (v11 - v8) * 0.5), round(v14 + (v13 - v10) * 0.5), v8, v10);
  -[UIImageView image](self->_imageView, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  imageView = self->_imageView;
  if (v15)
  {
    -[UIImageView setHidden:](imageView, "setHidden:", 0);
    -[UIImageView image](self->_imageView, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    v19 = v18;
    v21 = v20;

    -[UIView bounds](self, "bounds");
    v24 = round(v23 + (v22 - v19) * 0.5);
    v27 = round(v26 + (v25 - v21) * 0.5);
  }
  else
  {
    v24 = *MEMORY[0x1E0C9D648];
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    -[UIImageView setHidden:](imageView, "setHidden:", 1);
  }
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v24, v27, v19, v21);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 64.0;
  v3 = 39.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  self->_usesDarkTheme = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIInputSwitcherTableCellBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
