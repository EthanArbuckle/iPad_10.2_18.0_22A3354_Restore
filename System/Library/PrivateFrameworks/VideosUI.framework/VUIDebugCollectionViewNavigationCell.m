@implementation VUIDebugCollectionViewNavigationCell

- (VUIDebugCollectionViewNavigationCell)initWithFrame:(CGRect)a3
{
  VUIDebugCollectionViewNavigationCell *v3;
  VUITextLayout *v4;
  void *v5;
  VUITextLayout *titleLayout;
  VUITextLayout *v7;
  uint64_t v8;
  VUILabel *titleLabel;
  void *v10;
  void *v11;
  uint64_t v12;
  UIImageView *accessoryView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  VUISeparatorView *v18;
  VUISeparatorView *separatorView;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VUIDebugCollectionViewNavigationCell;
  v3 = -[VUIDebugCollectionViewNavigationCell initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setNumberOfLines:](v4, "setNumberOfLines:", 1);
    -[VUITextLayout setNumberOfLinesAXSmall:](v4, "setNumberOfLinesAXSmall:", 1);
    -[VUITextLayout setNumberOfLinesAXLarge:](v4, "setNumberOfLinesAXLarge:", 1);
    -[VUITextLayout setTextStyle:](v4, "setTextStyle:", 3);
    -[VUITextLayout setMaximumContentSizeCategory:](v4, "setMaximumContentSizeCategory:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v4, "setColor:", v5);

    titleLayout = v3->_titleLayout;
    v3->_titleLayout = v4;
    v7 = v4;

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (VUILabel *)v8;

    -[VUIDebugCollectionViewNavigationCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v3->_titleLabel);

    +[VUIImageResourceMap imageForResourceName:](VUIImageResourceMap, "imageForResourceName:", CFSTR("list-chevron"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v11);
    accessoryView = v3->_accessoryView;
    v3->_accessoryView = (UIImageView *)v12;

    -[UIImageView sizeToFit](v3->_accessoryView, "sizeToFit");
    -[VUIDebugCollectionViewNavigationCell contentView](v3, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v3->_accessoryView);

    -[VUIDebugCollectionViewNavigationCell contentView](v3, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v16);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIListCollectionViewCell setHighlightedBackgroundColor:](v3, "setHighlightedBackgroundColor:", v17);

    v18 = objc_alloc_init(VUISeparatorView);
    separatorView = v3->_separatorView;
    v3->_separatorView = v18;

    -[VUIDebugCollectionViewNavigationCell addSubview:](v3, "addSubview:", v3->_separatorView);
  }
  return v3;
}

- (void)configureWithTitle:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[VUIDebugCollectionViewNavigationCell titleLayout](self, "titleLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDebugCollectionViewNavigationCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v7, v4, v5);

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat Width;
  CGFloat *v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Height;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  VUISeparatorView *separatorView;
  CGFloat v33;
  double v34;
  CGFloat rect;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  -[VUIDebugCollectionViewNavigationCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
  v12 = v11;
  v14 = v13;
  v34 = v13;
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  Width = CGRectGetWidth(v36);
  v16 = (CGFloat *)MEMORY[0x1E0C9D648];
  v17 = Width - v12 - v14;
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v37.origin.x = v4;
  rect = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v17, CGRectGetHeight(v37));
  v20 = v19;
  v22 = v21;
  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  Height = CGRectGetHeight(v38);
  v39.origin.x = v12;
  v39.origin.y = v18;
  v39.size.width = v20;
  v39.size.height = v22;
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v12, (Height - CGRectGetHeight(v39)) * 0.5, v20, v22);
  v24 = *v16;
  -[UIImageView bounds](self->_accessoryView, "bounds");
  v26 = v25;
  v28 = v27;
  -[VUIDebugCollectionViewNavigationCell bounds](self, "bounds");
  v29 = CGRectGetWidth(v40) - v34;
  v41.origin.x = v24;
  v41.origin.y = v18;
  v41.size.width = v26;
  v41.size.height = v28;
  v30 = v29 - CGRectGetWidth(v41);
  v42.origin.x = rect;
  v42.origin.y = v6;
  v42.size.width = v8;
  v42.size.height = v10;
  v31 = CGRectGetHeight(v42);
  v43.origin.x = v30;
  v43.origin.y = v18;
  v43.size.width = v26;
  v43.size.height = v28;
  -[UIImageView setFrame:](self->_accessoryView, "setFrame:", v30, (v31 - CGRectGetHeight(v43)) * 0.5, v26, v28);
  separatorView = self->_separatorView;
  -[VUIDebugCollectionViewNavigationCell bounds](self, "bounds");
  v33 = CGRectGetHeight(v44) + -1.0;
  v45.origin.x = rect;
  v45.origin.y = v6;
  v45.size.width = v8;
  v45.size.height = v10;
  -[VUISeparatorView setFrame:](separatorView, "setFrame:", 0.0, v33, CGRectGetWidth(v45), 1.0);
}

- (VUITextLayout)titleLayout
{
  return self->_titleLayout;
}

- (void)setTitleLayout:(id)a3
{
  objc_storeStrong((id *)&self->_titleLayout, a3);
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryView, a3);
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleLayout, 0);
}

@end
