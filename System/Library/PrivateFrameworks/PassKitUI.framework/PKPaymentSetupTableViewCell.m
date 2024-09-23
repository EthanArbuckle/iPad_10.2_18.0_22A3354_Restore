@implementation PKPaymentSetupTableViewCell

- (PKPaymentSetupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKPaymentSetupTableViewCell *v4;
  PKPaymentSetupTableViewCell *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  UIImageView *cardImageView;
  uint64_t v14;
  UIImageView *iconImageView;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *betaLabel;
  UILabel *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PKPaymentSetupTableViewCell;
  v4 = -[PKPaymentSetupTableViewCell initWithStyle:reuseIdentifier:](&v28, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PKPaymentSetupTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0DC3890]);
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
    cardImageView = v5->_cardImageView;
    v5->_cardImageView = (UIImageView *)v12;

    -[UIImageView setAccessibilityIgnoresInvertColors:](v5->_cardImageView, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(v6, "addSubview:", v5->_cardImageView);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v8, v9, v10, v11);
    iconImageView = v5->_iconImageView;
    v5->_iconImageView = (UIImageView *)v14;

    -[UIImageView setAccessibilityIgnoresInvertColors:](v5->_iconImageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIImageView setContentMode:](v5->_iconImageView, "setContentMode:", 1);
    objc_msgSend(v6, "addSubview:", v5->_iconImageView);
    -[UIImageView layer](v5->_cardImageView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKUIPixelLength();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.21);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v17, "CGColor");
    PKPaymentStyleApplyCorners();

    objc_msgSend(v16, "setShouldRasterize:", 1);
    objc_msgSend(v16, "setRasterizationScale:", PKUIScreenScale());
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.909803922, 0.364705882, 0.0, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    betaLabel = v5->_betaLabel;
    v5->_betaLabel = v20;

    v22 = v5->_betaLabel;
    PKLocalizedPaymentString(CFSTR("CARD_TYPE_BETA_BADGE_TITLE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v22, "setText:", v23);

    -[UILabel layer](v5->_betaLabel, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setBorderWidth:", 1.0);
    objc_msgSend(v24, "setCornerRadius:", 3.0);
    v25 = objc_retainAutorelease(v19);
    objc_msgSend(v24, "setBorderColor:", objc_msgSend(v25, "CGColor"));
    -[UILabel setTextColor:](v5->_betaLabel, "setTextColor:", v25);
    -[UILabel setFont:](v5->_betaLabel, "setFont:", v18);
    -[UILabel setTextAlignment:](v5->_betaLabel, "setTextAlignment:", 1);
    -[PKPaymentSetupTableViewCell textLabel](v5, "textLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNumberOfLines:", 2);

  }
  return v5;
}

- (void)setShowBetaBadge:(BOOL)a3
{
  void *v5;

  if (self->_showBetaBadge != a3)
  {
    if (a3)
    {
      -[PKPaymentSetupTableViewCell contentView](self, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSubview:", self->_betaLabel);

    }
    else
    {
      -[UILabel removeFromSuperview](self->_betaLabel, "removeFromSuperview");
    }
  }
  self->_showBetaBadge = a3;
}

- (void)setThumbnail:(id)a3 type:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  UIImage *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];
  UIImage *v13;
  BOOL v14;

  v5 = a5;
  v9 = (UIImage *)a3;
  if (self->_thumbnail != v9 || self->_thumbnailType != a4)
  {
    objc_storeStrong((id *)&self->_thumbnail, a3);
    self->_thumbnailType = a4;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PKPaymentSetupTableViewCell_setThumbnail_type_animated___block_invoke;
    aBlock[3] = &unk_1E3E64908;
    aBlock[4] = self;
    v13 = v9;
    v14 = v5;
    v10 = _Block_copy(aBlock);
    v11 = v10;
    if (v5)
      objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", self, 5242880, v10, 0, 0.3);
    else
      (*((void (**)(void *))v10 + 2))(v10);

  }
}

uint64_t __58__PKPaymentSetupTableViewCell_setThumbnail_type_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 1088);
  if (v3 == 1)
  {
    objc_msgSend(*(id *)(v2 + 1080), "setImage:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setAlpha:", 1.0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 1072;
  }
  else
  {
    if (v3)
      goto LABEL_6;
    objc_msgSend(*(id *)(v2 + 1072), "setImage:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setAlpha:", 1.0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 1080;
  }
  objc_msgSend(*(id *)(v4 + v5), "setImage:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v5), "setAlpha:", 0.0);
  v2 = *(_QWORD *)(a1 + 32);
LABEL_6:
  result = objc_msgSend((id)v2, "setNeedsLayout");
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return result;
}

- (void)layoutSubviews
{
  int v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Width;
  CGFloat Height;
  UIImage *thumbnail;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIImageView *iconImageView;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  objc_super v56;
  uint64_t v57;
  _QWORD v58[2];
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v58[1] = *MEMORY[0x1E0C80C00];
  v56.receiver = self;
  v56.super_class = (Class)PKPaymentSetupTableViewCell;
  -[PKPaymentSetupTableViewCell layoutSubviews](&v56, sel_layoutSubviews);
  v3 = -[PKPaymentSetupTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKPaymentSetupTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v59.origin.x = v6;
  v59.origin.y = v8;
  v59.size.width = v10;
  v59.size.height = v12;
  Width = CGRectGetWidth(v59);
  v60.origin.x = v6;
  v60.origin.y = v8;
  v60.size.width = v10;
  v60.size.height = v12;
  Height = CGRectGetHeight(v60);
  thumbnail = self->_thumbnail;
  v16 = *MEMORY[0x1E0C9D648];
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v54 = Height;
  if (thumbnail)
  {
    PKFloatRoundToPixel();
    v19 = v18;
    if (v3)
      v20 = Width + -53.0 + -15.0;
    else
      v20 = 15.0;
    v21 = 53.0;
    v22 = 32.0;
  }
  else
  {
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v20 = *MEMORY[0x1E0C9D648];
  }
  -[UIImageView setFrame:](self->_cardImageView, "setFrame:", v20, v19, v21, v22, *(_QWORD *)&v54);
  iconImageView = self->_iconImageView;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](iconImageView, "setFrame:");
  if (thumbnail)
  {
    if (-[PKPaymentSetupTableViewCell accessoryType](self, "accessoryType"))
      v24 = 0.0;
    else
      v24 = 40.0;
    v61.origin.x = v20;
    v61.origin.y = v19;
    v61.size.width = v21;
    v61.size.height = v22;
    v25 = Width - CGRectGetWidth(v61) + -30.0 - v24;
    -[PKPaymentSetupTableViewCell textLabel](self, "textLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sizeToFit");
    objc_msgSend(v26, "sizeThatFits:", v25, 1.79769313e308);
    v29 = v28;
    if (v25 >= v27)
      v25 = v27;
    v62.origin.x = v16;
    v62.origin.y = v17;
    v62.size.width = v25;
    v62.size.height = v29;
    v30 = (v55 - CGRectGetHeight(v62)) * 0.5;
    v31 = v20;
    v32 = v19;
    v33 = v21;
    v34 = v22;
    if (v3)
      v35 = CGRectGetMinX(*(CGRect *)&v31) + -15.0 - v25;
    else
      v35 = CGRectGetMaxX(*(CGRect *)&v31) + 15.0;
    objc_msgSend(v26, "setFrame:", v35, v30, v25, v29);

  }
  if (self->_showBetaBadge)
  {
    -[UILabel frame](self->_betaLabel, "frame");
    if (v36 >= 40.0)
      v38 = v36;
    else
      v38 = 40.0;
    if (v37 >= 19.0)
      v39 = v37;
    else
      v39 = 19.0;
    -[UILabel text](self->_betaLabel, "text");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = *MEMORY[0x1E0DC1138];
    -[UILabel font](self->_betaLabel, "font");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sizeWithAttributes:", v42);
    v44 = v43;

    if (v38 >= v44 + 20.0)
      v45 = v38;
    else
      v45 = v44 + 20.0;
    -[PKPaymentSetupTableViewCell textLabel](self, "textLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "frame");
    v48 = v47;
    v50 = v49;

    PKFloatRoundToPixel();
    v52 = v51;
    v53 = v48 - v45 + -11.0;
    if (!v3)
      v53 = v48 + v50 + 11.0;
    -[UILabel setFrame:](self->_betaLabel, "setFrame:", v53, v52, v45, v39);
  }
}

+ (CGSize)defaultImageViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 53.0;
  v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupTableViewCell;
  -[PKTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[PKPaymentSetupTableViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[PKPaymentSetupTableViewCell setThumbnail:type:animated:](self, "setThumbnail:type:animated:", 0, 0, 0);
  -[PKPaymentSetupTableViewCell setShowBetaBadge:](self, "setShowBetaBadge:", 0);
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (BOOL)showBetaBadge
{
  return self->_showBetaBadge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_cardImageView, 0);
  objc_storeStrong((id *)&self->_betaLabel, 0);
}

@end
