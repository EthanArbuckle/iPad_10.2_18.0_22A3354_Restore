@implementation VUISeasonPickerCollectionViewCell

+ (void)configureSeasonPickerCell:(id)a3 withMedia:(id)a4 traitCollection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  SEL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  VUITextLayout *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  VUITextLayout *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  VUITextLayout *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  VUITextLayout *v52;
  void *v53;
  void *v54;
  id v55;

  v55 = a3;
  v7 = a4;
  v8 = a5;
  +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:imageType:](VUIMediaEntityImageLoadParamsFactory, "imageLoadParamsWithMediaEntity:imageType:", v7, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "seasonImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v55, "seasonImageView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DC6A20]);
  }
  v11 = v10;

  objc_msgSend(v11, "setUserInteractionEnabled:", 0);
  +[VUILibraryViewFactory tvPlaceholderImage](VUILibraryViewFactory, "tvPlaceholderImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlaceholderImage:", v12);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14 * 102.0;

  v16 = (void *)MEMORY[0x1E0DC6A08];
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageBorderColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "decoratorWithOutlineColor:outlineWidths:", v17, 1.0, 1.0, 1.0, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setScaleToSize:", v15, v15);
  +[VUIUtilities imageCornerRadiusWithStyle:](VUIUtilities, "imageCornerRadiusWithStyle:", 0);
  v20 = v19;
  objc_msgSend(MEMORY[0x1E0DC69B0], "radiiFromRadius:");
  objc_msgSend(v18, "setCornerRadii:");
  v21 = NSSelectorFromString(CFSTR("artworkURL"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ((void (*)(id, SEL))objc_msgSend(v7, "methodForSelector:", v21))(v7, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "length"))
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6A50]), "initWithSrc:size:", v22, v15, v15);
      +[VUIUtilities placeholderImageResourceName:](VUIUtilities, "placeholderImageResourceName:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setPlaceholderSrc:", v24);

      objc_msgSend(MEMORY[0x1E0DC69B0], "radiiFromRadius:", v20);
      objc_msgSend(v23, "setBorderRadii:");
      objc_msgSend(v23, "setExtension:", CFSTR("jpeg"));
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageBorderColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setBackgroundColor:", v25);

      v26 = (void *)MEMORY[0x1E0DC6A00];
      objc_msgSend(v55, "seasonImageView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "makeImageViewWithDescriptor:existingView:", v23, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "setCornerRadius:", 4.0);
      objc_msgSend(v28, "setImageContainsCornerRadius:", 1);

      v11 = v28;
    }
  }
  else
  {
    if (!v54)
      goto LABEL_10;
    v29 = objc_alloc(MEMORY[0x1E0DC6A10]);
    objc_msgSend(v7, "mediaLibrary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v29, "initWithObject:imageLoader:groupType:", v54, v30, 0);

    objc_msgSend(v22, "setDecorator:", v18);
    objc_msgSend(v11, "setImageProxy:", v22);
    objc_msgSend(v11, "setCornerRadius:", 4.0);
    objc_msgSend(v11, "setImageContainsCornerRadius:", 1);
  }

LABEL_10:
  objc_msgSend(v55, "setSeasonImageView:", v11);
  v31 = objc_alloc_init(VUITextLayout);
  -[VUITextLayout setTextStyle:](v31, "setTextStyle:", 13);
  -[VUITextLayout setFontWeight:](v31, "setFontWeight:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v31, "setColor:", v32);

  -[VUITextLayout setNumberOfLines:](v31, "setNumberOfLines:", 1);
  objc_msgSend(v7, "title");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v33, v31, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setTitleLabel:", v35);

  LODWORD(v35) = objc_msgSend(v8, "isAXEnabled");
  v36 = objc_alloc_init(VUITextLayout);
  -[VUITextLayout setTextStyle:](v36, "setTextStyle:", 20);
  -[VUITextLayout setFontWeight:](v36, "setFontWeight:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v36, "setColor:", v37);

  v53 = v18;
  if ((_DWORD)v35)
  {
    -[VUITextLayout setNumberOfLines:](v36, "setNumberOfLines:", 0);
    objc_msgSend(v7, "genreTitle");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v38;
    if (v38)
      v40 = (const __CFString *)v38;
    else
      v40 = &stru_1E9FF3598;
    objc_msgSend(v55, "subtitleLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v40, v36, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setSubtitleLabel:", v42);

    v43 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v43, "setTextStyle:", 20);
    -[VUITextLayout setFontWeight:](v43, "setFontWeight:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v43, "setColor:", v44);

    -[VUITextLayout setNumberOfLines:](v43, "setNumberOfLines:", 0);
    objc_msgSend(v7, "releaseYear");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringValue");
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v46;
    if (v46)
      v48 = (const __CFString *)v46;
    else
      v48 = &stru_1E9FF3598;
    objc_msgSend(v55, "secondSubtitleLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v48, v43, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setSecondSubtitleLabel:", v50);
    goto LABEL_27;
  }
  -[VUITextLayout setNumberOfLines:](v36, "setNumberOfLines:", 1);
  objc_msgSend(v7, "genreTitle");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "releaseYear");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v45, "length");
  if (v51 && v47)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), v45, CFSTR("·"), v47);
    v52 = (VUITextLayout *)objc_claimAutoreleasedReturnValue();
  }
  else if (v51)
  {
    v52 = v45;
  }
  else
  {
    if (!v47)
    {
      v43 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v47, "stringValue");
    v52 = (VUITextLayout *)objc_claimAutoreleasedReturnValue();
  }
  v43 = v52;
  if (v52)
  {
    objc_msgSend(v55, "subtitleLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v43, v36, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setSubtitleLabel:", v50);
LABEL_27:

  }
LABEL_28:

}

- (VUISeasonPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  VUISeasonPickerCollectionViewCell *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUISeasonPickerCollectionViewCell;
  v3 = -[VUISeasonPickerCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIListCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryFillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIListCollectionViewCell setHighlightedBackgroundColor:](v3, "setHighlightedBackgroundColor:", v5);

  }
  return v3;
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
      -[VUISeasonPickerCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_titleLabel);

    }
    -[VUISeasonPickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setSubtitleLabel:(id)a3
{
  VUILabel *v5;
  VUILabel **p_subtitleLabel;
  VUILabel *subtitleLabel;
  void *v8;
  VUILabel *v9;

  v5 = (VUILabel *)a3;
  p_subtitleLabel = &self->_subtitleLabel;
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel != v5)
  {
    v9 = v5;
    -[VUILabel removeFromSuperview](subtitleLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
    if (*p_subtitleLabel)
    {
      -[VUISeasonPickerCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_subtitleLabel);

    }
    -[VUISeasonPickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setSecondSubtitleLabel:(id)a3
{
  VUILabel *v5;
  VUILabel **p_secondSubtitleLabel;
  VUILabel *secondSubtitleLabel;
  void *v8;
  VUILabel *v9;

  v5 = (VUILabel *)a3;
  p_secondSubtitleLabel = &self->_secondSubtitleLabel;
  secondSubtitleLabel = self->_secondSubtitleLabel;
  if (secondSubtitleLabel != v5)
  {
    v9 = v5;
    -[VUILabel removeFromSuperview](secondSubtitleLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_secondSubtitleLabel, a3);
    if (*p_secondSubtitleLabel)
    {
      -[VUISeasonPickerCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_secondSubtitleLabel);

    }
    -[VUISeasonPickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setSeasonImageView:(id)a3
{
  VUIImageView *v5;
  VUIImageView **p_seasonImageView;
  void *v7;
  VUIImageView *v8;

  v5 = (VUIImageView *)a3;
  p_seasonImageView = &self->_seasonImageView;
  if (self->_seasonImageView != v5)
  {
    v8 = v5;
    -[VUIImageView removeFromSuperview](v5, "removeFromSuperview");
    objc_storeStrong((id *)&self->_seasonImageView, a3);
    if (*p_seasonImageView)
    {
      -[VUISeasonPickerCollectionViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", *p_seasonImageView);

    }
    -[VUISeasonPickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setTopSeparatorView:(id)a3
{
  VUISeparatorView *v5;
  VUISeparatorView **p_topSeparatorView;
  VUISeparatorView *topSeparatorView;
  void *v8;
  VUISeparatorView *v9;

  v5 = (VUISeparatorView *)a3;
  p_topSeparatorView = &self->_topSeparatorView;
  topSeparatorView = self->_topSeparatorView;
  if (topSeparatorView != v5)
  {
    v9 = v5;
    -[VUISeparatorView removeFromSuperview](topSeparatorView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_topSeparatorView, a3);
    if (*p_topSeparatorView)
    {
      -[VUISeasonPickerCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_topSeparatorView);

    }
    -[VUISeasonPickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setBottomSeparatorView:(id)a3
{
  VUISeparatorView *v5;
  VUISeparatorView **p_bottomSeparatorView;
  VUISeparatorView *bottomSeparatorView;
  void *v8;
  VUISeparatorView *v9;

  v5 = (VUISeparatorView *)a3;
  p_bottomSeparatorView = &self->_bottomSeparatorView;
  bottomSeparatorView = self->_bottomSeparatorView;
  if (bottomSeparatorView != v5)
  {
    v9 = v5;
    -[VUISeparatorView removeFromSuperview](bottomSeparatorView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bottomSeparatorView, a3);
    if (*p_bottomSeparatorView)
    {
      -[VUISeasonPickerCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_bottomSeparatorView);

    }
    -[VUISeasonPickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

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
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  VUILabel *secondSubtitleLabel;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  unint64_t v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  unint64_t v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  unint64_t v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGSize result;

  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(MEMORY[0x1E0DC6960], "contentSizeCategoryIsAccessibility:", objc_msgSend(MEMORY[0x1E0DC69B0], "vuiContentSizeCategoryFor:", v10));
  if (v11)
    v12 = 102.0;
  else
    v12 = 0.0;
  v13 = width - (v6 + v8);
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v13, 1.79769313e308);
  v15 = v14;
  -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v13, 1.79769313e308);
  v17 = v16;
  -[VUILabel sizeThatFits:](self->_secondSubtitleLabel, "sizeThatFits:", v13, 1.79769313e308);
  v19 = v18;
  -[VUISeasonPickerCollectionViewCell traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v20, 18.0);
  v22 = v21;
  -[UILabel vui_heightToBaseline](self->_subtitleLabel, "vui_heightToBaseline");
  v24 = v22 - v23;

  -[UILabel vui_heightToBaseline](self->_titleLabel, "vui_heightToBaseline");
  v26 = v12 + v25;
  -[UILabel vui_heightToBaseline](self->_subtitleLabel, "vui_heightToBaseline");
  v28 = v24 + v26 + v27;
  secondSubtitleLabel = self->_secondSubtitleLabel;
  if (secondSubtitleLabel)
  {
    -[UILabel vui_heightToBaseline](secondSubtitleLabel, "vui_heightToBaseline");
    v31 = v28 + v30;
    -[VUISeasonPickerCollectionViewCell traitCollection](self, "traitCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v32, 18.0);
    v34 = v33;
    -[UILabel vui_heightToBaseline](self->_secondSubtitleLabel, "vui_heightToBaseline");
    v28 = v31 + v34 - v35;

    -[VUILabel font](self->_secondSubtitleLabel, "font");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "lineHeight");
    v38 = vcvtad_u64_f64(v19 / v37);

    if (v38 >= 2)
    {
      -[VUILabel font](self->_secondSubtitleLabel, "font");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "lineHeight");
      v28 = v28 + v40 * (double)(v38 - 1);

    }
  }
  -[VUILabel font](self->_titleLabel, "font");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "lineHeight");
  v43 = vcvtad_u64_f64(v15 / v42);

  if (v43 >= 2)
  {
    -[VUILabel font](self->_titleLabel, "font");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "lineHeight");
    v28 = v28 + v45 * (double)(v43 - 1);

  }
  -[VUILabel font](self->_subtitleLabel, "font");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "lineHeight");
  v48 = vcvtad_u64_f64(v17 / v47);

  if (v48 >= 2)
  {
    -[VUILabel font](self->_subtitleLabel, "font");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "lineHeight");
    v28 = v28 + v50 * (double)(v48 - 1);

  }
  v51 = v28 + 20.0;
  if (!v11)
    v51 = v28;
  v52 = fmax(v51, 118.0);

  v53 = width;
  v54 = v52;
  result.height = v54;
  result.width = v53;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  VUISeparatorView *topSeparatorView;
  double v8;
  double v9;
  double v10;
  VUISeparatorView *bottomSeparatorView;
  double v12;
  double v13;
  double v14;
  void *v15;
  double MaxY;
  VUILabel *titleLabel;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  VUILabel *subtitleLabel;
  void *v25;
  double v26;
  double v27;
  double v28;
  VUILabel *secondSubtitleLabel;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  unint64_t v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  unint64_t v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double MidY;
  double v69;
  void *v70;
  double v71;
  unint64_t v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double *v84;
  void *v85;
  double v86;
  unint64_t v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  void *v94;
  double v95;
  VUISeparatorView *v96;
  VUISeparatorView *v97;
  VUIImageView *seasonImageView;
  VUILabel *v99;
  VUILabel *v100;
  VUILabel *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;

  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
  v4 = v3;
  v6 = v5;
  topSeparatorView = self->_topSeparatorView;
  -[VUISeasonPickerCollectionViewCell bounds](self, "bounds");
  -[VUIBaseView sizeThatFits:](topSeparatorView, "sizeThatFits:", v8, 1.79769313e308);
  v109 = v9;
  v110 = v10;
  bottomSeparatorView = self->_bottomSeparatorView;
  -[VUISeasonPickerCollectionViewCell bounds](self, "bounds");
  -[VUIBaseView sizeThatFits:](bottomSeparatorView, "sizeThatFits:", v12, 1.79769313e308);
  v111 = v13;
  v112 = v14;
  -[VUISeasonPickerCollectionViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  MaxY = CGRectGetMaxY(v119);

  titleLabel = self->_titleLabel;
  -[VUISeasonPickerCollectionViewCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v19 = v4 + v6;
  -[VUILabel sizeThatFits:](titleLabel, "sizeThatFits:", v20 - v19, 1.79769313e308);
  v113 = v21;
  v23 = v22;

  subtitleLabel = self->_subtitleLabel;
  -[VUISeasonPickerCollectionViewCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  -[VUILabel sizeThatFits:](subtitleLabel, "sizeThatFits:", v26 - v19, 1.79769313e308);
  v115 = v27;
  v118 = v28;

  secondSubtitleLabel = self->_secondSubtitleLabel;
  -[VUISeasonPickerCollectionViewCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  -[VUILabel sizeThatFits:](secondSubtitleLabel, "sizeThatFits:", v31 - v19, 1.79769313e308);
  v33 = v32;
  v117 = v34;

  -[UILabel vui_heightToBaseline](self->_titleLabel, "vui_heightToBaseline");
  v36 = v35;
  -[UILabel vui_heightToBaseline](self->_subtitleLabel, "vui_heightToBaseline");
  v38 = v37;
  -[VUISeasonPickerCollectionViewCell traitCollection](self, "traitCollection");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v39, 18.0);
  v41 = v40 - v38;

  v42 = v36 + v41;
  -[VUISeasonPickerCollectionViewCell traitCollection](self, "traitCollection");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v39) = objc_msgSend(v43, "isAXEnabled");

  v114 = v23;
  if ((_DWORD)v39)
  {
    v44 = v33;
    -[VUISeasonPickerCollectionViewCell traitCollection](self, "traitCollection");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v45, 18.0);
    v47 = v46;
    -[UILabel vui_heightToBaseline](self->_secondSubtitleLabel, "vui_heightToBaseline");
    v49 = v38 + v42 + v47 - v48;

    -[VUILabel font](self->_titleLabel, "font");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "lineHeight");
    v52 = vcvtad_u64_f64(v23 / v51);

    if (v52 >= 2)
    {
      -[VUILabel font](self->_titleLabel, "font");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "lineHeight");
      v54 = (double)(v52 - 1);
      v42 = v42 + v55 * v54;

      -[VUILabel font](self->_titleLabel, "font");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "lineHeight");
      v49 = v49 + v57 * v54;

    }
    -[VUILabel font](self->_subtitleLabel, "font");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "lineHeight");
    v60 = vcvtad_u64_f64(v118 / v59);

    v61 = v44;
    if (v60 >= 2)
    {
      -[VUILabel font](self->_subtitleLabel, "font");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "lineHeight");
      v49 = v49 + v63 * (double)(v60 - 1);

    }
    v120.size.width = 102.0;
    v116 = 10.0;
    v120.origin.y = 10.0;
    v120.origin.x = v4;
    v120.size.height = 102.0;
    v64 = CGRectGetMaxY(v120);
    v107 = v42 + v64;
    v108 = v4;
    v65 = v49 + v64;
    v66 = v4;
    v106 = v4;
  }
  else
  {
    -[VUISeasonPickerCollectionViewCell contentView](self, "contentView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "bounds");
    MidY = CGRectGetMidY(v121);

    v69 = v36 + 0.0 + v38 + v41;
    -[VUILabel font](self->_titleLabel, "font");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "lineHeight");
    v72 = vcvtad_u64_f64(v23 / v71);

    if (v72 >= 2)
    {
      -[VUILabel font](self->_titleLabel, "font");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "lineHeight");
      v75 = v74;
      v76 = (double)(v72 - 1);
      -[VUILabel font](self->_titleLabel, "font");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "descender");
      v69 = v69 + v78 + v75 * v76;

      -[VUILabel font](self->_titleLabel, "font");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "lineHeight");
      v81 = v80;
      -[VUILabel font](self->_titleLabel, "font");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "descender");
      v42 = v42 + v83 + v81 * v76;

    }
    v84 = (double *)MEMORY[0x1E0C9D648];
    v116 = MidY + -51.0;
    -[VUILabel font](self->_titleLabel, "font");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "lineHeight");
    v87 = vcvtad_u64_f64(v118 / v86);

    if (v87 >= 2)
    {
      -[VUILabel font](self->_subtitleLabel, "font");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "lineHeight");
      v90 = v89;
      v91 = (double)(v87 - 1);
      -[VUILabel font](self->_subtitleLabel, "font");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "descender");
      v69 = v69 + v93 + v90 * v91;

    }
    v65 = v84[1];
    v108 = *v84;
    v61 = v84[2];
    v117 = v84[3];
    -[VUISeasonPickerCollectionViewCell contentView](self, "contentView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "bounds");
    v64 = CGRectGetMidY(v122) + v69 * -0.5;

    v107 = v42 + v64;
    v123.origin.x = v4;
    v123.origin.y = v116;
    v123.size.width = 102.0;
    v123.size.height = 102.0;
    v106 = CGRectGetMaxX(v123) + 16.0;
    v124.origin.x = v4;
    v124.origin.y = v116;
    v124.size.width = 102.0;
    v124.size.height = 102.0;
    v66 = CGRectGetMaxX(v124) + 16.0;
  }
  v95 = MaxY - v112;
  if (-[VUISeasonPickerCollectionViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    -[VUISeasonPickerCollectionViewCell bounds](self, "bounds");
    v96 = self->_topSeparatorView;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUISeparatorView setFrame:](v96, "setFrame:");
    v97 = self->_bottomSeparatorView;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUISeparatorView setFrame:](v97, "setFrame:");
    seasonImageView = self->_seasonImageView;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUIImageView setFrame:](seasonImageView, "setFrame:");
    v99 = self->_titleLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILabel setFrame:](v99, "setFrame:");
    v100 = self->_subtitleLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILabel setFrame:](v100, "setFrame:");
    v101 = self->_secondSubtitleLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v65 = v104;
    v61 = v105;
  }
  else
  {
    -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v4, 0.0, v109, v110);
    -[VUISeparatorView setFrame:](self->_bottomSeparatorView, "setFrame:", v4, v95, v111, v112);
    -[VUIImageView setFrame:](self->_seasonImageView, "setFrame:", v4, v116, 102.0, 102.0);
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v106, v64, v113, v114);
    -[VUILabel setFrame:](self->_subtitleLabel, "setFrame:", v66, v107, v115, v118);
    v101 = self->_secondSubtitleLabel;
    v103 = v117;
    v102 = v108;
  }
  -[VUILabel setFrame:](v101, "setFrame:", v102, v65, v61, v103);
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (VUILabel)secondSubtitleLabel
{
  return self->_secondSubtitleLabel;
}

- (VUIImageView)seasonImageView
{
  return self->_seasonImageView;
}

- (VUISeparatorView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (VUISeparatorView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_seasonImageView, 0);
  objc_storeStrong((id *)&self->_secondSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
