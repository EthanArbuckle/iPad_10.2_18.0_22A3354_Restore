@implementation SKUIBrowseItemCell

- (SKUIBrowseItemCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIBrowseItemCell *v8;
  UILabel *v9;
  UILabel *titleLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  UILabel *subtitleLabel;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  UIView *v19;
  UIView *borderView;
  UIView *v21;
  void *v22;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrowseItemCell initWithFrame:].cold.1();
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIBrowseItemCell;
  v8 = -[SKUIBrowseItemCell initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v9;

    v11 = v8->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    -[UILabel setNumberOfLines:](v8->_titleLabel, "setNumberOfLines:", 1);
    -[SKUIBrowseItemCell addSubview:](v8, "addSubview:", v8->_titleLabel);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v8->_subtitleLabel;
    v8->_subtitleLabel = v13;

    v15 = v8->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v16);

    -[UILabel setNumberOfLines:](v8->_subtitleLabel, "setNumberOfLines:", 1);
    v17 = v8->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    -[SKUIBrowseItemCell addSubview:](v8, "addSubview:", v8->_subtitleLabel);
    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    borderView = v8->_borderView;
    v8->_borderView = v19;

    v21 = v8->_borderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[SKUIBrowseItemCell addSubview:](v8, "addSubview:", v8->_borderView);
    -[SKUIBrowseItemCell setSemanticContentAttribute:](v8, "setSemanticContentAttribute:", storeSemanticContentAttribute());
  }
  return v8;
}

- (void)setDecorationImage:(id)a3
{
  UIImage **p_decorationImage;
  UIImageView *decorationImageView;
  UIImage *v7;
  UIImageView *v8;
  UIImageView *v9;
  UIImageView *v10;
  id v11;

  p_decorationImage = &self->_decorationImage;
  v11 = a3;
  if (v11)
  {
    objc_storeStrong((id *)&self->_decorationImage, a3);
    decorationImageView = self->_decorationImageView;
    if (decorationImageView)
    {
      -[UIImageView setImage:](decorationImageView, "setImage:", *p_decorationImage);
    }
    else
    {
      v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_decorationImage);
      v10 = self->_decorationImageView;
      self->_decorationImageView = v9;

      -[SKUIBrowseItemCell addSubview:](self, "addSubview:", self->_decorationImageView);
    }
  }
  else
  {
    v7 = *p_decorationImage;
    *p_decorationImage = 0;

    -[UIImageView removeFromSuperview](self->_decorationImageView, "removeFromSuperview");
    v8 = self->_decorationImageView;
    self->_decorationImageView = 0;

  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_titleLabel, "setText:", v6);
    -[SKUIBrowseItemCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel text](self->_subtitleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_subtitleLabel, "setText:", v6);
    -[SKUIBrowseItemCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setShowTopBorder:(BOOL)a3
{
  UIView *topBorderView;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  UIView *v9;

  self->_showTopBorder = a3;
  topBorderView = self->_topBorderView;
  if (a3)
  {
    if (!topBorderView)
    {
      v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v6 = self->_topBorderView;
      self->_topBorderView = v5;

      v7 = self->_topBorderView;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

      -[SKUIBrowseItemCell addSubview:](self, "addSubview:", self->_topBorderView);
    }
  }
  else if (topBorderView)
  {
    -[UIView removeFromSuperview](topBorderView, "removeFromSuperview");
    v9 = self->_topBorderView;
    self->_topBorderView = 0;

  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIBrowseItemCell;
  -[SKUIBrowseItemCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SKUIBrowseItemCell _reloadHighlightState](self, "_reloadHighlightState");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIBrowseItemCell;
  -[SKUIBrowseItemCell setSelected:](&v4, sel_setSelected_, a3);
  -[SKUIBrowseItemCell _reloadHighlightState](self, "_reloadHighlightState");
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  int ShouldReverseLayoutDirection;
  UIImageView *decorationImageView;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  UIImageView *v16;
  uint64_t v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  UILabel *subtitleLabel;
  CGFloat v25;
  CGFloat v26;
  UILabel *titleLabel;
  void *v28;
  double v29;
  CGFloat v30;
  CGFloat MaxY;
  UIView *borderView;
  void *v33;
  double v34;
  CGFloat v35;
  UIView *topBorderView;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37.receiver = self;
  v37.super_class = (Class)SKUIBrowseItemCell;
  -[SKUIBrowseItemCell layoutSubviews](&v37, sel_layoutSubviews);
  -[SKUIBrowseItemCell bounds](self, "bounds");
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  v7 = CGRectGetMaxX(v38) + -15.0;
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  decorationImageView = self->_decorationImageView;
  if (decorationImageView)
  {
    -[UIImageView frame](decorationImageView, "frame");
    v11 = v10;
    v13 = v12;
    v14 = v7 - v10;
    v15 = y + (height - v12) * 0.5;
    v16 = self->_decorationImageView;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v14, v15, v10, v12, x, y, width, height);
    -[UIImageView setFrame:](v16, "setFrame:");
    v39.origin.x = v14;
    v39.origin.y = v15;
    v39.size.width = v11;
    v39.size.height = v13;
    v7 = CGRectGetMinX(v39) + -10.0;
  }
  if (ShouldReverseLayoutDirection)
    v17 = 2;
  else
    v17 = 0;
  -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
  -[UILabel frame](self->_subtitleLabel, "frame");
  v19 = v18;
  v21 = v20;
  v22 = v7 - v18;
  v23 = y + (height - v20) * 0.5;
  subtitleLabel = self->_subtitleLabel;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v22, v23, v18, v20, x, y, width, height);
  -[UILabel setFrame:](subtitleLabel, "setFrame:");
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", v17);
  v40.origin.x = v22;
  v40.origin.y = v23;
  v40.size.width = v19;
  v40.size.height = v21;
  v25 = CGRectGetMinX(v40) + -10.0;
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[UILabel frame](self->_titleLabel, "frame");
  titleLabel = self->_titleLabel;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x + 15.0, y + (height - v26) * 0.5, v25 - x + -15.0, v26, x, y, width, height);
  -[UILabel setFrame:](titleLabel, "setFrame:");
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v17);
  -[UIView frame](self->_borderView, "frame");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "scale");
  v30 = 1.0 / v29;

  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  MaxY = CGRectGetMaxY(v41);
  borderView = self->_borderView;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, MaxY - v30, width + -15.0, v30, x, y, width, height);
  -[UIView setFrame:](borderView, "setFrame:");
  -[UIView frame](self->_topBorderView, "frame");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "scale");
  v35 = 1.0 / v34;

  topBorderView = self->_topBorderView;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, 0.0, width + -15.0, v35, x, y, width, height);
  -[UIView setFrame:](topBorderView, "setFrame:");
}

- (void)_reloadHighlightState
{
  _BOOL4 hasBlueBackgroundWhenSelected;
  char v4;
  char v5;
  UILabel *titleLabel;
  void *v7;
  UILabel *subtitleLabel;
  void *v9;
  uint64_t v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  UIView *borderView;
  uint64_t v18;
  UIView *topBorderView;
  uint64_t v20;

  hasBlueBackgroundWhenSelected = self->_hasBlueBackgroundWhenSelected;
  v4 = -[SKUIBrowseItemCell isHighlighted](self, "isHighlighted");
  v5 = v4;
  if (hasBlueBackgroundWhenSelected)
  {
    if ((v4 & 1) != 0 || -[SKUIBrowseItemCell isSelected](self, "isSelected"))
    {
      titleLabel = self->_titleLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v7);

      subtitleLabel = self->_subtitleLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](subtitleLabel, "setTextColor:", v9);

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.298039216, 0.631372549, 1.0, 1.0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v12 = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    v14 = self->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    v11 = (void *)MEMORY[0x1E0DC3658];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0DC3658];
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  objc_msgSend(v11, "whiteColor");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v16 = (void *)v10;
  -[SKUIBrowseItemCell setBackgroundColor:](self, "setBackgroundColor:", v10);

  borderView = self->_borderView;
  if ((-[SKUIBrowseItemCell isHighlighted](self, "isHighlighted") & 1) != 0)
    v18 = 1;
  else
    v18 = -[SKUIBrowseItemCell isSelected](self, "isSelected");
  -[UIView setHidden:](borderView, "setHidden:", v18);
  topBorderView = self->_topBorderView;
  if ((-[SKUIBrowseItemCell isHighlighted](self, "isHighlighted") & 1) != 0)
    v20 = 1;
  else
    v20 = -[SKUIBrowseItemCell isSelected](self, "isSelected");
  -[UIView setHidden:](topBorderView, "setHidden:", v20);
}

- (UIImage)decorationImage
{
  return self->_decorationImage;
}

- (BOOL)showTopBorder
{
  return self->_showTopBorder;
}

- (BOOL)hasBlueBackgroundWhenSelected
{
  return self->_hasBlueBackgroundWhenSelected;
}

- (void)setHasBlueBackgroundWhenSelected:(BOOL)a3
{
  self->_hasBlueBackgroundWhenSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationImage, 0);
  objc_storeStrong((id *)&self->_decorationImageView, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBrowseItemCell initWithFrame:]";
}

@end
