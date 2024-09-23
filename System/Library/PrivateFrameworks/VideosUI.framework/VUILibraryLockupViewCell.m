@implementation VUILibraryLockupViewCell

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
  VUIRentalExpirationLabel *expirationLabel;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  width = a3.width;
  v5 = ceil(a3.width * self->_imageAspectRatio);
  if (!-[VUILibraryLockupViewCell hideTitleLabel](self, "hideTitleLabel"))
  {
    -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, 1.79769313e308);
    v7 = v6;
    -[VUILabel topMarginWithBaselineMargin:](self->_titleLabel, "topMarginWithBaselineMargin:", 20.0);
    v5 = v5 + v7 + v8;
  }
  expirationLabel = self->_expirationLabel;
  if (expirationLabel)
  {
    -[VUILabel sizeThatFits:](expirationLabel, "sizeThatFits:", width, 1.79769313e308);
    v11 = v10;
    -[VUILabel topMarginToLabel:withBaselineMargin:](self->_expirationLabel, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, 20.0);
    v13 = v12;
    if (-[VUILibraryLockupViewCell hideTitleLabel](self, "hideTitleLabel"))
    {
      -[VUILabel topMarginWithBaselineMargin:](self->_expirationLabel, "topMarginWithBaselineMargin:", 20.0);
      v13 = v14;
    }
    v5 = v5 + v11 + v13;
  }
  v15 = width;
  v16 = v5;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)setTitleLabel:(id)a3
{
  VUILabel *v5;
  VUILabel **p_titleLabel;
  VUILabel *titleLabel;
  void *v8;
  VUILabel *v9;

  v5 = (VUILabel *)a3;
  p_titleLabel = &self->_titleLabel;
  titleLabel = self->_titleLabel;
  if (titleLabel != v5)
  {
    v9 = v5;
    -[VUILabel removeFromSuperview](titleLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titleLabel, a3);
    if (*p_titleLabel)
    {
      -[VUILibraryLockupViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_titleLabel);

    }
    -[VUILibraryLockupViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setImageView:(id)a3
{
  VUIImageView *v5;
  VUIImageView **p_imageView;
  void *v7;
  VUIImageView *v8;

  v5 = (VUIImageView *)a3;
  p_imageView = &self->_imageView;
  if (self->_imageView != v5)
  {
    v8 = v5;
    -[VUIImageView removeFromSuperview](v5, "removeFromSuperview");
    objc_storeStrong((id *)&self->_imageView, a3);
    if (*p_imageView)
    {
      -[VUILibraryLockupViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", *p_imageView);

    }
    -[VUILibraryLockupViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setImageAspectRatio:(double)a3
{
  self->_imageAspectRatio = a3;
}

- (void)setHideTitleLabel:(BOOL)a3
{
  self->_hideTitleLabel = a3;
}

- (void)layoutSubviews
{
  double Width;
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
  VUIRentalExpirationLabel *expirationLabel;
  double v15;
  objc_super v16;
  CGRect v17;

  v16.receiver = self;
  v16.super_class = (Class)VUILibraryLockupViewCell;
  -[VUILibraryLockupViewCell layoutSubviews](&v16, sel_layoutSubviews);
  -[VUILibraryLockupViewCell bounds](self, "bounds");
  Width = CGRectGetWidth(v17);
  v4 = ceil(Width * self->_imageAspectRatio);
  -[VUIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, Width, v4);
  -[VUILabel topMarginToLabel:withBaselineMargin:](self->_expirationLabel, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, 20.0);
  v6 = v5;
  -[VUILabel topMarginWithBaselineMargin:](self->_expirationLabel, "topMarginWithBaselineMargin:", 20.0);
  v8 = v7;
  if (-[VUILibraryLockupViewCell hideTitleLabel](self, "hideTitleLabel"))
  {
    v9 = v4 + v8;
  }
  else
  {
    -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", Width, 1.79769313e308);
    v11 = v10;
    -[VUILabel topMarginWithBaselineMargin:](self->_titleLabel, "topMarginWithBaselineMargin:", 20.0);
    v13 = v4 + v12;
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, v13, Width, v11);
    v9 = v6 + v11 + v13;
  }
  expirationLabel = self->_expirationLabel;
  if (expirationLabel)
  {
    -[VUILabel sizeThatFits:](expirationLabel, "sizeThatFits:", Width, 1.79769313e308);
    -[VUIRentalExpirationLabel setFrame:](self->_expirationLabel, "setFrame:", 0.0, v9, Width, v15);
  }
}

- (VUILibraryLockupViewCell)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILibraryLockupViewCell;
  return -[VUILibraryLockupViewCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (VUIImageView)imageView
{
  return self->_imageView;
}

- (double)imageAspectRatio
{
  return self->_imageAspectRatio;
}

- (BOOL)hideTitleLabel
{
  return self->_hideTitleLabel;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  VUIRentalExpirationLabel *expirationLabel;
  VUILabel *v5;
  double v7;
  double v8;

  expirationLabel = self->_expirationLabel;
  if (expirationLabel)
  {
    v5 = expirationLabel;
  }
  else
  {
    v5 = self->_titleLabel;
    if (!v5)
    {
      -[VUILibraryLockupViewCell traitCollection](self, "traitCollection");
      v5 = (VUILabel *)objc_claimAutoreleasedReturnValue();
      +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v5, a3);
      goto LABEL_5;
    }
  }
  -[VUILabel bottomMarginWithBaselineMargin:](v5, "bottomMarginWithBaselineMargin:", a3);
LABEL_5:
  v8 = v7;

  return v8;
}

+ (void)configureLockupCell:(id)a3 withMedia:(id)a4 width:(double)a5 forMetrics:(BOOL)a6
{
  id v9;
  VUITextLayout *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v9 = a4;
  objc_msgSend(v20, "setImageAspectRatio:", 0.5625);
  if (!a6)
    +[VUILibraryLockupViewCell configureImageViewArtworkForLockupCell:withMedia:width:](VUILibraryLockupViewCell, "configureImageViewArtworkForLockupCell:withMedia:width:", v20, v9, a5);
  v10 = objc_alloc_init(VUITextLayout);
  -[VUITextLayout setTextStyle:](v10, "setTextStyle:", 20);
  -[VUITextLayout setFontWeight:](v10, "setFontWeight:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v10, "setColor:", v11);

  -[VUITextLayout setNumberOfLines:](v10, "setNumberOfLines:", 1);
  objc_msgSend(v9, "title");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1E9FF3598;
  objc_msgSend(v20, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v14, v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitleLabel:", v16);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "rentalExpirationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v9, "rentalExpirationDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIRentalExpirationLabel labelWithExpirationDate:textLayout:existingLabel:locStringPrefix:](VUIRentalExpirationLabel, "labelWithExpirationDate:textLayout:existingLabel:locStringPrefix:", v18, 0, 0, CFSTR("EXPIRATION_LEFT"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setExpirationLabel:", v19);

    }
  }
  objc_msgSend(v20, "setExclusiveTouch:", 1);
  objc_msgSend(v20, "setHideTitleLabel:", 0);

}

+ (void)configureImageViewArtworkForLockupCell:(id)a3 withMedia:(id)a4 width:(double)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  SEL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;

  v31 = a3;
  v7 = a4;
  objc_msgSend(v31, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v31, "imageView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC6A20]);
  }
  v10 = v9;

  +[VUIUtilities imageCornerRadiusWithStyle:](VUIUtilities, "imageCornerRadiusWithStyle:", 1);
  v12 = v11;
  objc_msgSend(v31, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIUtilities placeholderImageResourceName:](VUIUtilities, "placeholderImageResourceName:", objc_msgSend(v14, "userInterfaceStyle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIImageResourceMap imageForResourceName:](VUIImageResourceMap, "imageForResourceName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:imageType:](VUIMediaEntityImageLoadParamsFactory, "imageLoadParamsWithMediaEntity:imageType:", v7, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "imageAspectRatio");
  v19 = ceil(v18 * a5);
  objc_msgSend(v10, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageHighlightColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setFocusedColor:", v20);

  objc_msgSend(v10, "setPlaceholderImage:", v16);
  v21 = NSSelectorFromString(CFSTR("artworkURL"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ((void (*)(id, SEL))objc_msgSend(v7, "methodForSelector:", v21))(v7, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v22, "length"))
    {
LABEL_10:

      goto LABEL_11;
    }
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6A50]), "initWithSrc:size:", v22, a5, v19);
    +[VUIUtilities placeholderImageResourceName:](VUIUtilities, "placeholderImageResourceName:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPlaceholderSrc:", v24);

    objc_msgSend(MEMORY[0x1E0DC69B0], "radiiFromRadius:", v12);
    objc_msgSend(v23, "setBorderRadii:");
    objc_msgSend(v23, "setExtension:", CFSTR("jpeg"));
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageBorderColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v25);

    objc_msgSend(MEMORY[0x1E0DC6A00], "makeImageViewWithDescriptor:existingView:", v23, v10);
    v26 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v26;
LABEL_9:

    goto LABEL_10;
  }
  if (v17)
  {
    v27 = (void *)MEMORY[0x1E0DC6A08];
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageBorderColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "decoratorWithOutlineColor:outlineWidths:", v28, 1.0, 1.0, 1.0, 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_alloc(MEMORY[0x1E0DC6A10]);
    objc_msgSend(v7, "mediaLibrary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v29, "initWithObject:imageLoader:groupType:", v17, v30, 0);

    objc_msgSend(v22, "setScaleToSize:", a5, v19);
    objc_msgSend(MEMORY[0x1E0DC69B0], "radiiFromRadius:", v12);
    objc_msgSend(v22, "setCornerRadii:");
    objc_msgSend(v23, "setDecorator:", v22);
    objc_msgSend(v10, "setImageProxy:", v23);
    objc_msgSend(v10, "setCornerRadius:", v12);
    goto LABEL_9;
  }
LABEL_11:
  objc_msgSend(v31, "setImageView:", v10);

}

- (void)setExpirationLabel:(id)a3
{
  VUIRentalExpirationLabel *v5;
  VUIRentalExpirationLabel **p_expirationLabel;
  VUIRentalExpirationLabel *expirationLabel;
  void *v8;
  VUIRentalExpirationLabel *v9;

  v5 = (VUIRentalExpirationLabel *)a3;
  p_expirationLabel = &self->_expirationLabel;
  expirationLabel = self->_expirationLabel;
  if (expirationLabel != v5)
  {
    v9 = v5;
    -[VUIRentalExpirationLabel removeFromSuperview](expirationLabel, "removeFromSuperview");
    -[VUIRentalExpirationLabel setDelegate:](*p_expirationLabel, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_expirationLabel, a3);
    if (*p_expirationLabel)
    {
      -[VUIRentalExpirationLabel setDelegate:](*p_expirationLabel, "setDelegate:", self);
      -[VUILibraryLockupViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_expirationLabel);

    }
    -[VUILibraryLockupViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUILibraryLockupViewCell;
  -[VUILibraryLockupViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[VUIRentalExpirationLabel invalidateTimer](self->_expirationLabel, "invalidateTimer");
  -[VUIImageView setImage:](self->_imageView, "setImage:", 0);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)VUILibraryLockupViewCell;
  -[VUILibraryLockupViewCell setHighlighted:](&v16, sel_setHighlighted_);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[VUILibraryLockupViewCell contentView](self, "contentView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "setHighlighted:", v3);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

}

- (VUIRentalExpirationLabel)expirationLabel
{
  return self->_expirationLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
