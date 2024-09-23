@implementation SKUISwooshView

- (SKUISwooshView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISwooshView initWithFrame:].cold.1();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUISwooshView;
  v8 = -[SKUISwooshView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v10 = (void *)*((_QWORD *)v8 + 52);
    *((_QWORD *)v8 + 52) = v9;

    v11 = (void *)*((_QWORD *)v8 + 52);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v12);

    objc_msgSend(v8, "addSubview:", *((_QWORD *)v8 + 52));
    v13 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *((_OWORD *)v8 + 27) = *MEMORY[0x1E0DC49E8];
    *((_OWORD *)v8 + 28) = v13;
    *(_OWORD *)(v8 + 504) = xmmword_1BBED1BD0;
    *(_OWORD *)(v8 + 520) = xmmword_1BBED1BE0;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v8 + 61);
    *((_QWORD *)v8 + 61) = v14;

  }
  return (SKUISwooshView *)v8;
}

- (UIControl)chevronTitleControl
{
  SKUILinkButton *titleButton;
  SKUILinkButton *v4;
  SKUILinkButton *v5;
  SKUILinkButton *v6;
  void *v7;
  void *v8;
  void *v9;

  titleButton = self->_titleButton;
  if (!titleButton)
  {
    v4 = -[SKUILinkButton initWithArrowStyle:]([SKUILinkButton alloc], "initWithArrowStyle:", 4);
    v5 = self->_titleButton;
    self->_titleButton = v4;

    v6 = self->_titleButton;
    -[SKUISwooshView backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUILinkButton setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SKUILinkButton setTitleColor:forState:](self->_titleButton, "setTitleColor:forState:", self->_titleColor, 0);
    -[SKUILinkButton titleLabel](self->_titleButton, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    -[SKUILinkButton setHidden:](self->_titleButton, "setHidden:", 1);
    titleButton = self->_titleButton;
  }
  return (UIControl *)titleButton;
}

- (id)seeAllColorForControlState:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[SKUISwooshView seeAllControl](self, "seeAllControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleColorForState:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIControl)seeAllControl
{
  UIButton *seeAllButton;
  UIButton *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  UIButton *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  seeAllButton = self->_seeAllButton;
  if (!seeAllButton)
  {
    v4 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    v5 = self->_seeAllButton;
    self->_seeAllButton = v4;

    v6 = self->_seeAllButton;
    -[SKUISwooshView backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v8 = self->_seeAllButton;
    -[SKUISwooshView _seeAllArrowImage](self, "_seeAllArrowImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    -[UIButton setTitleEdgeInsets:](v8, "setTitleEdgeInsets:", 0.0, -(v10 + 5.0), 0.0, 0.0);

    -[UIButton titleLabel](self->_seeAllButton, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISwooshView setSeeAllColor:forControlState:](self, "setSeeAllColor:forControlState:", v13, 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISwooshView setSeeAllColor:forControlState:](self, "setSeeAllColor:forControlState:", v14, 1);

    seeAllButton = self->_seeAllButton;
  }
  return (UIControl *)seeAllButton;
}

- (NSString)seeAllTitle
{
  return -[UIButton titleForState:](self->_seeAllButton, "titleForState:", 0);
}

- (void)setCollectionView:(id)a3
{
  UICollectionView *v5;
  UICollectionView *collectionView;
  UICollectionView *v7;

  v5 = (UICollectionView *)a3;
  collectionView = self->_collectionView;
  v7 = v5;
  if (collectionView != v5)
  {
    -[UICollectionView removeFromSuperview](collectionView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_collectionView, a3);
    if (self->_collectionView)
      -[SKUISwooshView addSubview:](self, "addSubview:");
  }

}

- (void)setCollectionViewInsets:(UIEdgeInsets)a3
{
  if (self->_collectionViewInsets.left != a3.left
    || self->_collectionViewInsets.top != a3.top
    || self->_collectionViewInsets.right != a3.right
    || self->_collectionViewInsets.bottom != a3.bottom)
  {
    self->_collectionViewInsets = a3;
    -[SKUISwooshView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setColoringWithColorScheme:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[SKUISwooshView setBackgroundColor:](self, "setBackgroundColor:", v7);
  objc_msgSend(v14, "primaryTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SKUISwooshView setSeeAllColor:forControlState:](self, "setSeeAllColor:forControlState:", v8, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISwooshView setSeeAllColor:forControlState:](self, "setSeeAllColor:forControlState:", v9, 0);

  }
  objc_msgSend(v14, "highlightedTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SKUISwooshView setSeeAllColor:forControlState:](self, "setSeeAllColor:forControlState:", v10, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISwooshView setSeeAllColor:forControlState:](self, "setSeeAllColor:forControlState:", v11, 1);

  }
  objc_msgSend(v14, "secondaryTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v14, "primaryTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[SKUISwooshView setTitleColor:](self, "setTitleColor:", v12);

  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v7);
    -[UICollectionView reloadData](self->_collectionView, "reloadData");

  }
}

- (void)setSeeAllColor:(id)a3 forControlState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[SKUISwooshView seeAllControl](self, "seeAllControl");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUISwooshView _seeAllArrowImage](self, "_seeAllArrowImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SKUITintedImage(v7, 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:forState:", v8, a4);

  objc_msgSend(v9, "setTitleColor:forState:", v6, a4);
}

- (void)setSeeAllTitle:(id)a3
{
  id v4;
  void *v5;
  UIButton *seeAllButton;
  id v7;

  v7 = a3;
  -[SKUISwooshView seeAllTitle](self, "seeAllTitle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v7 && (objc_msgSend(v4, "isEqualToString:", v7) & 1) == 0)
  {
    -[SKUISwooshView seeAllControl](self, "seeAllControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:forState:", v7, 0);
    objc_msgSend(v5, "sizeToFit");
    seeAllButton = self->_seeAllButton;
    if (v7)
      -[SKUISwooshView addSubview:](self, "addSubview:", seeAllButton);
    else
      -[UIButton removeFromSuperview](seeAllButton, "removeFromSuperview");
    -[SKUISwooshView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setShowsChevronForTitle:(BOOL)a3
{
  id v5;

  if (self->_showsChevronForTitle != a3)
  {
    -[SKUISwooshView title](self, "title");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUISwooshView setTitle:](self, "setTitle:", 0);
    self->_showsChevronForTitle = a3;
    -[SKUISwooshView setTitle:](self, "setTitle:", v5);

  }
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  UILabel *titleLabel;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  id v14;

  v14 = a3;
  if (-[SKUISwooshView showsChevronForTitle](self, "showsChevronForTitle"))
  {
    -[SKUILinkButton titleForState:](self->_titleButton, "titleForState:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 != v14 && (objc_msgSend(v4, "isEqualToString:", v14) & 1) == 0)
    {
      if (v14)
      {
        -[SKUISwooshView chevronTitleControl](self, "chevronTitleControl");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setHidden:", 0);
        objc_msgSend(v5, "setTitle:forState:", v14, 0);
        -[SKUISwooshView addSubview:](self, "addSubview:", v5);

      }
      else
      {
        -[SKUILinkButton setHidden:](self->_titleButton, "setHidden:", 1);
        -[SKUILinkButton setTitle:forState:](self->_titleButton, "setTitle:forState:", 0, 0);
      }
LABEL_14:
      -[SKUISwooshView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {
    -[UILabel text](self->_titleLabel, "text");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 != v14 && (objc_msgSend(v4, "isEqualToString:", v14) & 1) == 0)
    {
      titleLabel = self->_titleLabel;
      if (v14)
      {
        if (!titleLabel)
        {
          v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
          v8 = self->_titleLabel;
          self->_titleLabel = v7;

          v9 = self->_titleLabel;
          -[SKUISwooshView backgroundColor](self, "backgroundColor");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

          v11 = self->_titleLabel;
          objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setFont:](v11, "setFont:", v12);

          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", self->_titleColor);
          -[SKUISwooshView addSubview:](self, "addSubview:", self->_titleLabel);
          titleLabel = self->_titleLabel;
        }
        -[UILabel setText:](titleLabel, "setText:");
      }
      else
      {
        -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
        v13 = self->_titleLabel;
        self->_titleLabel = 0;

      }
      goto LABEL_14;
    }
  }

}

- (void)setTitleColor:(id)a3
{
  UIColor *v4;
  UIColor *titleColor;
  id v6;

  if (self->_titleColor != a3)
  {
    v6 = a3;
    v4 = (UIColor *)objc_msgSend(v6, "copy");
    titleColor = self->_titleColor;
    self->_titleColor = v4;

    -[SKUILinkButton setTitleColor:forState:](self->_titleButton, "setTitleColor:forState:", self->_titleColor, 0);
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double top;
  UIButton *seeAllButton;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  UIButton *v16;
  double v17;
  double v18;
  SKUILinkButton *v19;
  int v20;
  UILabel *v21;
  UILabel *v22;
  double v23;
  double v24;
  double left;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  UICollectionView *collectionView;
  CGFloat v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  SKUILinkButton *v37;
  UILabel *v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  -[SKUISwooshView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = v3 - self->_contentInsets.right;
  top = self->_contentInsets.top;
  seeAllButton = self->_seeAllButton;
  v10 = MEMORY[0x1E0C9D5E0];
  if (seeAllButton)
  {
    -[UIButton frame](seeAllButton, "frame");
    -[UIButton sizeThatFits:](self->_seeAllButton, "sizeThatFits:", *(double *)(v10 + 16), *(double *)(v10 + 24));
    v12 = v11;
    v14 = v13 + 5.0;
    v15 = v7 - (v13 + 5.0);
    v16 = self->_seeAllButton;
    -[UIButton bounds](v16, "bounds");
    -[UIButton contentRectForBounds:](v16, "contentRectForBounds:");
    -[UIButton titleRectForContentRect:](v16, "titleRectForContentRect:");
    -[UIButton setImageEdgeInsets:](self->_seeAllButton, "setImageEdgeInsets:", 2.0, v17 + 5.0, 0.0, 0.0);
    v36 = v15;
    v39.origin.x = v15;
    v39.origin.y = top;
    v39.size.width = v14;
    v39.size.height = v12;
    v7 = CGRectGetMinX(v39) + -5.0;
    v18 = top;
  }
  else
  {
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v36 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v19 = self->_titleButton;
  v37 = v19;
  if (v19 && (v20 = -[SKUILinkButton isHidden](v19, "isHidden"), v21 = (UILabel *)v37, !v20)
    || (v22 = self->_titleLabel, v37, (v21 = v22) != 0))
  {
    v38 = v21;
    -[UILabel frame](v21, "frame");
    v35 = v14;
    v23 = v6;
    v24 = v4;
    left = self->_contentInsets.left;
    -[UILabel sizeThatFits:](v38, "sizeThatFits:", *(double *)(v10 + 16), *(double *)(v10 + 24));
    v28 = v27;
    if (v26 >= v7 - left)
      v29 = v7 - left;
    else
      v29 = v26;
    -[UILabel setFrame:](v38, "setFrame:", left, top, v29, v27);
    v40.origin.x = left;
    v40.origin.y = top;
    v40.size.width = v29;
    v40.size.height = v28;
    v18 = CGRectGetMaxY(v40) - v12 + -2.0;
    v41.origin.x = left;
    v4 = v24;
    v6 = v23;
    v14 = v35;
    v41.origin.y = top;
    v41.size.width = v29;
    v41.size.height = v28;
    top = CGRectGetMaxY(v41) + 10.0;
  }
  else
  {
    v38 = 0;
  }
  -[UIButton setFrame:](self->_seeAllButton, "setFrame:", v36, v18, v14, v12);
  collectionView = self->_collectionView;
  if (collectionView)
  {
    -[UICollectionView frame](collectionView, "frame");
    v31 = self->_contentInsets.left + self->_collectionViewInsets.left;
    -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v31, top + self->_collectionViewInsets.top, v4 - self->_contentInsets.right - self->_collectionViewInsets.right - v31);
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scale");
  v34 = 1.0 / v33;

  -[UIView setFrame:](self->_borderView, "setFrame:", 15.0, v6 - v34, v4 + -15.0, v34);
}

- (void)setBackgroundColor:(id)a3
{
  UICollectionView *collectionView;
  id v5;
  objc_super v6;

  collectionView = self->_collectionView;
  v5 = a3;
  -[UICollectionView setBackgroundColor:](collectionView, "setBackgroundColor:", v5);
  -[UIButton setBackgroundColor:](self->_seeAllButton, "setBackgroundColor:", v5);
  -[SKUILinkButton setBackgroundColor:](self->_titleButton, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUISwooshView;
  -[SKUISwooshView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  SKUILinkButton *titleButton;
  void *titleLabel;
  double v8;
  UICollectionView *collectionView;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  v5 = self->_contentInsets.bottom + self->_contentInsets.top;
  titleButton = self->_titleButton;
  if (titleButton && (-[SKUILinkButton isHidden](titleButton, "isHidden") & 1) == 0)
  {
    titleLabel = self->_titleButton;
    goto LABEL_6;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
LABEL_6:
    objc_msgSend(titleLabel, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    v5 = v5 + v8;
  }
  collectionView = self->_collectionView;
  if (collectionView)
  {
    -[UICollectionView frame](collectionView, "frame");
    v5 = v5 + v10 + self->_collectionViewInsets.top + self->_collectionViewInsets.bottom;
  }
  if (self->_titleLabel && self->_collectionView)
    v5 = v5 + 10.0;
  v11 = width;
  v12 = v5;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_seeAllArrowImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("ChevronSeeAll"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UIEdgeInsets)collectionViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_collectionViewInsets.top;
  left = self->_collectionViewInsets.left;
  bottom = self->_collectionViewInsets.bottom;
  right = self->_collectionViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)showsChevronForTitle
{
  return self->_showsChevronForTitle;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_seeAllButton, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISwooshView initWithFrame:]";
}

@end
