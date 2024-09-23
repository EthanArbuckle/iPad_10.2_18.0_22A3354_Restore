@implementation VUILibraryMenuItemViewCell

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0DC69B0];
  -[VUILibraryMenuItemViewCell vuiTraitCollection](self, "vuiTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scaleContentSizeValue:forTraitCollection:", v10, 20.0);
  v12 = v11;

  -[VUIVideosImageView image](self->_accessoryView, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  v15 = v14;

  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width - v6 - v8 + -10.0 + -10.0 - v15 - v12, 1.79769313e308);
  v17 = v16;
  -[VUILabel topMarginWithBaselineMargin:](self->_titleLabel, "topMarginWithBaselineMargin:", 32.0);
  v19 = v18;
  -[VUILabel bottomMarginWithBaselineMargin:](self->_titleLabel, "bottomMarginWithBaselineMargin:", 16.0);
  v21 = v17 + v19 + v20;
  v22 = width;
  result.height = v21;
  result.width = v22;
  return result;
}

- (void)setTopSeparatorView:(id)a3
{
  VUISeparatorView *v5;
  VUISeparatorView *topSeparatorView;
  VUISeparatorView *v7;

  v5 = (VUISeparatorView *)a3;
  topSeparatorView = self->_topSeparatorView;
  if (topSeparatorView != v5)
  {
    v7 = v5;
    -[VUISeparatorView removeFromSuperview](topSeparatorView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_topSeparatorView, a3);
    if (self->_topSeparatorView)
      -[VUILibraryMenuItemViewCell addSubview:](self, "addSubview:");
    -[VUILibraryMenuItemViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setImageName:(id)a3
{
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VUIVideosImageView *imageView;
  void *v11;
  void *v12;
  NSString *v13;

  v5 = (NSString *)a3;
  if (self->_imageName != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_imageName, a3);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationPreferringMonochrome");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v13, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageNamed:inBundle:withConfiguration:", v13, v9, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[VUIVideosImageView setImage:](self->_imageView, "setImage:", v7);
    imageView = self->_imageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithTintColor:renderingMode:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideosImageView setHighlightOrSelectedImage:](imageView, "setHighlightOrSelectedImage:", v12);

    -[VUILibraryMenuItemViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v13;
  }

}

- (void)setHideChevron:(BOOL)a3
{
  self->_hideChevron = a3;
}

- (void)layoutSubviews
{
  double Width;
  double Height;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  VUISeparatorView *topSeparatorView;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  VUISeparatorView *bottomSeparatorView;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _BOOL4 v45;
  double v46;
  double v47;
  _BOOL4 v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  double v57;
  objc_super v58;
  CGRect v59;
  CGRect v60;

  v58.receiver = self;
  v58.super_class = (Class)VUILibraryMenuItemViewCell;
  -[VUILibraryMenuItemViewCell layoutSubviews](&v58, sel_layoutSubviews);
  -[VUILibraryMenuItemViewCell bounds](self, "bounds");
  Width = CGRectGetWidth(v59);
  -[VUILibraryMenuItemViewCell bounds](self, "bounds");
  Height = CGRectGetHeight(v60);
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:", Width);
  v6 = v5;
  v57 = v7;
  -[VUILibraryMenuItemViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "effectiveUserInterfaceLayoutDirection");

  -[VUILibraryMenuItemViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");

  topSeparatorView = self->_topSeparatorView;
  if (topSeparatorView)
  {
    -[VUIBaseView sizeThatFits:](topSeparatorView, "sizeThatFits:", Width - v6, 1.79769313e308);
    v13 = v12;
    v15 = v14;
    v16 = 0.0;
    v17 = v6;
    if (v9 == 1)
      VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v17, v16, v13, v15);
  }
  bottomSeparatorView = self->_bottomSeparatorView;
  if (bottomSeparatorView)
  {
    -[VUIBaseView sizeThatFits:](bottomSeparatorView, "sizeThatFits:", Width - v6, 1.79769313e308);
    v20 = v19;
    v22 = v21;
    v23 = Height - v21;
    v24 = v6;
    if (v9 == 1)
      VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUISeparatorView setFrame:](self->_bottomSeparatorView, "setFrame:", v24, v23, v20, v22);
  }
  v25 = (void *)MEMORY[0x1E0DC69B0];
  -[VUILibraryMenuItemViewCell vuiTraitCollection](self, "vuiTraitCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scaleContentSizeValue:forTraitCollection:", v26, 20.0);
  v28 = v27;

  if (-[VUILibraryMenuItemViewCell hasImage](self, "hasImage"))
  {
    v29 = (Height - v28) * 0.5;
    v30 = v6;
    v31 = v28;
    v32 = v28;
    if (v9 == 1)
      VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUIVideosImageView setFrame:](self->_imageView, "setFrame:", v30, v29, v31, v32);
  }
  -[VUIVideosImageView image](self->_accessoryView, "image");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "size");
  v35 = v34;
  v37 = v36;

  if (!-[VUILibraryMenuItemViewCell hideChevron](self, "hideChevron"))
  {
    v38 = Width - v57 - v35;
    v39 = (Height - v37) * 0.5;
    v40 = v35;
    if (v9 == 1)
    {
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v37 = v41;
    }
    -[VUIVideosImageView setFrame:](self->_accessoryView, "setFrame:", v38, v39, v40, v37);
  }
  -[VUILabel topMarginWithBaselineMargin:](self->_titleLabel, "topMarginWithBaselineMargin:", 32.0);
  v43 = v42;
  v44 = Width - v6 - v57;
  v45 = -[VUILibraryMenuItemViewCell hideChevron](self, "hideChevron");
  v46 = v35 + 10.0;
  if (v45)
    v46 = 0.0;
  v47 = v44 - v46;
  v48 = -[VUILibraryMenuItemViewCell hasImage](self, "hasImage");
  v49 = v28 + 10.0;
  if (v48)
    v50 = v28 + 10.0;
  else
    v50 = 0.0;
  v51 = v47 - v50;
  if (!v48)
    v49 = -0.0;
  v52 = v6 + v49;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v51, 1.79769313e308);
  if (v9 == 1)
  {
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v52 = v53;
    v43 = v54;
    v51 = v55;
    v56 = 2;
  }
  else
  {
    v56 = 0;
  }
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v52, v43, v51);
  -[VUILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v56);
}

- (VUILibraryMenuItemViewCell)initWithFrame:(CGRect)a3
{
  VUILibraryMenuItemViewCell *v3;
  VUITextLayout *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  VUILabel *titleLabel;
  void *v9;
  VUISeparatorView *v10;
  VUISeparatorView *bottomSeparatorView;
  void *v12;
  void *v13;
  VUIVideosImageView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  VUIVideosImageView *accessoryView;
  VUIVideosImageView *v21;
  void *v22;
  void *v23;
  VUIVideosImageView *v24;
  void *v25;
  void *v26;
  void *v27;
  VUIVideosImageView *v28;
  VUIVideosImageView *imageView;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)VUILibraryMenuItemViewCell;
  v3 = -[VUILibraryMenuItemViewCell initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v4, "setTextStyle:", 2);
    -[VUITextLayout setFontWeight:](v4, "setFontWeight:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v4, "setColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setHighlightOrSelectedColor:](v4, "setHighlightOrSelectedColor:", v6);

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v4, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (VUILabel *)v7;

    -[VUILibraryMenuItemViewCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_titleLabel);

    v10 = objc_alloc_init(VUISeparatorView);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v10;

    -[VUILibraryMenuItemViewCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v3->_bottomSeparatorView);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [VUIVideosImageView alloc];
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v19 = -[VUIVideosImageView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], v16, v17, v18);
    accessoryView = v3->_accessoryView;
    v3->_accessoryView = (VUIVideosImageView *)v19;

    v21 = v3->_accessoryView;
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageWithTintColor:renderingMode:", v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideosImageView setImage:](v21, "setImage:", v23);

    v24 = v3->_accessoryView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageWithTintColor:renderingMode:", v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideosImageView setHighlightOrSelectedImage:](v24, "setHighlightOrSelectedImage:", v26);

    -[VUILibraryMenuItemViewCell contentView](v3, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v3->_accessoryView);

    v28 = -[VUIVideosImageView initWithFrame:]([VUIVideosImageView alloc], "initWithFrame:", v15, v16, v17, v18);
    imageView = v3->_imageView;
    v3->_imageView = v28;

    -[VUIVideosImageView setContentMode:](v3->_imageView, "setContentMode:", 2);
    -[VUILibraryMenuItemViewCell contentView](v3, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v3->_imageView);

    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIListCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v31);

    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIListCollectionViewCell setHighlightedBackgroundColor:](v3, "setHighlightedBackgroundColor:", v32);

    -[VUILibraryMenuItemViewCell setHideChevron:](v3, "setHideChevron:", 0);
  }
  return v3;
}

- (BOOL)hideChevron
{
  return self->_hideChevron;
}

- (BOOL)hasImage
{
  return -[NSString length](self->_imageName, "length") != 0;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (VUISeparatorView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (VUISeparatorView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (BOOL)shouldAppearAsHeader
{
  return self->_shouldAppearAsHeader;
}

- (void)setShouldAppearAsHeader:(BOOL)a3
{
  self->_shouldAppearAsHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
