@implementation PXPhotosGridPromptHeaderView

- (PXPhotosGridPromptHeaderView)initWithFrame:(CGRect)a3
{
  PXPhotosGridPromptHeaderView *v3;
  uint64_t v4;
  UILabel *titleLabel;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIView *v12;
  UIView *separatorView;
  void *v14;
  UIView *v15;
  UIView *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PXPhotosGridPromptHeaderView;
  v3 = -[PXPhotosGridPromptHeaderView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend((id)objc_opt_class(), "_newTitleLabel");
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v4;

    -[PXPhotosGridPromptHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    -[PXPhotosGridPromptHeaderView traitCollection](v3, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    v8 = 1.0 / v7;

    -[PXPhotosGridPromptHeaderView bounds](v3, "bounds");
    v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v10, v9 - v8, v11, v8);
    -[UIView setAutoresizingMask:](v12, "setAutoresizingMask:", 10);
    separatorView = v3->_separatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](separatorView, "setBackgroundColor:", v14);

    v15 = v3->_separatorView;
    v3->_separatorView = v12;
    v16 = v12;

    -[PXPhotosGridPromptHeaderView addSubview:](v3, "addSubview:", v16);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosGridPromptHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v17);
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;

  if (self->_title != a3)
  {
    v4 = a3;
    v5 = (NSString *)objc_msgSend(v4, "copy");
    title = self->_title;
    self->_title = v5;

    -[UILabel setText:](self->_titleLabel, "setText:", v4);
    -[PXPhotosGridPromptHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_opt_class();
  -[PXPhotosGridPromptHeaderView title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:forTitle:", v7, width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[PXPhotosGridPromptHeaderView title](self, "title");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridPromptHeaderView bounds](self, "bounds");
  objc_msgSend((id)objc_opt_class(), "_instanceLayoutSubviews:forTitle:inBounds:", self, v7, v3, v4, v5, v6);

}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

+ (id)_newTitleLabel
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v4);

  objc_msgSend(v2, "setNumberOfLines:", 0);
  return v2;
}

+ (CGSize)_instanceLayoutSubviews:(id)a3 forTitle:(id)a4 inBounds:(CGRect)a5
{
  double height;
  double width;
  id *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;
  CGRect v19;
  CGRect v20;

  height = a5.size.height;
  width = a5.size.width;
  v9 = (id *)a3;
  v10 = a4;
  if (v9)
  {
    v11 = v9[62];
  }
  else
  {
    v11 = (id)objc_msgSend(a1, "_newTitleLabel");
    objc_msgSend(v11, "setText:", v10);
  }
  objc_msgSend(v11, "sizeThatFits:", fmax(width + -22.0, 0.0), height);
  v13 = v12;
  v15 = v14 + 28.0;
  if (v9)
  {
    objc_msgSend(v11, "frame");
    v19.origin.x = (width - v13) * 0.5;
    v19.origin.y = (height - v15) * 0.5;
    v19.size.width = v13;
    v19.size.height = v15;
    v20 = CGRectIntegral(v19);
    objc_msgSend(v11, "setFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  }

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3 forTitle:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a1, "_instanceLayoutSubviews:forTitle:inBounds:", 0, a4, 0.0, 0.0, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

@end
