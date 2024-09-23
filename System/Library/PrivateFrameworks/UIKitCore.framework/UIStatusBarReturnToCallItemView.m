@implementation UIStatusBarReturnToCallItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  UILabel *textLabel;
  UILabel *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  objc_super v19;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "doubleHeightStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_textLabel, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  if ((v9 & 1) == 0)
  {
    textLabel = self->_textLabel;
    if (!v7 || textLabel)
    {
      -[UILabel setText:](textLabel, "setText:", v7);
    }
    else
    {
      v11 = objc_alloc_init(UILabel);
      v12 = self->_textLabel;
      self->_textLabel = v11;

      -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textFontForStyle:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_textLabel, "setFont:", v14);

      +[UIColor whiteColor](UIColor, "whiteColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v15);

      -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", 1);
      -[UIView addSubview:](self, "addSubview:", self->_textLabel);
      -[UILabel setText:](self->_textLabel, "setText:", v7);
      -[UIStatusBarItemView layoutManager](self, "layoutManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStatusBarButtonActionItemView updateContentsAndWidth](self, "updateContentsAndWidth");
      objc_msgSend(v16, "itemView:sizeChangedBy:", self);

    }
  }
  v19.receiver = self;
  v19.super_class = (Class)UIStatusBarReturnToCallItemView;
  v17 = -[UIStatusBarItemView updateForNewData:actions:](&v19, sel_updateForNewData_actions_, v6, v4);

  return v17;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)UIStatusBarReturnToCallItemView;
  -[UIStatusBarButtonActionItemView layoutSubviews](&v19, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  if (self->_textLabel)
  {
    v6 = v3;
    v7 = v4;
    v8 = v5;
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "height");
    v11 = v10;

    v12 = v6 + (v7 - v11) * 0.5;
    -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v11, v8);
    v14 = v13;
    -[UIStatusBarAppIconItemView contentsImage](self, "contentsImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "size");
    v18 = v17 + 8.0;

    -[UILabel setFrame:](self->_textLabel, "setFrame:", v12, v18, v11, v14);
  }
}

- (double)neededSizeForImageSet:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIStatusBarReturnToCallItemView;
  -[UIStatusBarItemView neededSizeForImageSet:](&v10, sel_neededSizeForImageSet_, a3);
  v5 = v4;
  -[UIView bounds](self, "bounds");
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v6, 1.79769313e308);
  v8 = v7 + 8.0;
  if (v7 <= 0.0)
    v8 = -0.0;
  return v5 + v8;
}

- (id)_appBundleIdentifier
{
  return CFSTR("com.apple.mobilephone");
}

- (int64_t)buttonType
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
