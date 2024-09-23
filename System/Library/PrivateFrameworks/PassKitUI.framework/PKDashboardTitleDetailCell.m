@implementation PKDashboardTitleDetailCell

- (PKDashboardTitleDetailCell)initWithFrame:(CGRect)a3
{
  PKDashboardTitleDetailCell *v3;
  PKDashboardTitleDetailCell *v4;
  void *v5;
  uint64_t v6;
  UIColor *defaultTitleTextColor;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UILabel *titleLabel;
  UILabel *v15;
  NSString *v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  UILabel *subtitleLabel;
  UILabel *v21;
  void *v22;
  NSNumberFormatter *v23;
  NSNumberFormatter *numberFormatter;
  uint64_t v25;
  UIActivityIndicatorView *spinnerView;
  id v27;
  void *v28;
  uint64_t v29;
  UIImageView *disclosureView;
  UIImageView *v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)PKDashboardTitleDetailCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKDashboardTitleDetailCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = objc_claimAutoreleasedReturnValue();
    defaultTitleTextColor = v4->_defaultTitleTextColor;
    v4->_defaultTitleTextColor = (UIColor *)v6;

    v8 = objc_alloc(MEMORY[0x1E0DC3990]);
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], v10, v11, v12);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v13;

    v15 = v4->_titleLabel;
    v16 = (NSString *)*MEMORY[0x1E0DC4A88];
    v17 = (NSString *)*MEMORY[0x1E0DC48D0];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v18);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v9, v10, v11, v12);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v19;

    v21 = v4->_subtitleLabel;
    PKFontForDefaultDesign(v16, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v21, "setFont:", v22);

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_subtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    objc_msgSend(v5, "addSubview:", v4->_subtitleLabel);
    v23 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    numberFormatter = v4->_numberFormatter;
    v4->_numberFormatter = v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinnerView = v4->_spinnerView;
    v4->_spinnerView = (UIActivityIndicatorView *)v25;

    -[UIActivityIndicatorView startAnimating](v4->_spinnerView, "startAnimating");
    -[UIActivityIndicatorView setHidden:](v4->_spinnerView, "setHidden:", 1);
    objc_msgSend(v5, "addSubview:", v4->_spinnerView);
    v27 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIChevronImage();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "initWithImage:", v28);
    disclosureView = v4->_disclosureView;
    v4->_disclosureView = (UIImageView *)v29;

    v31 = v4->_disclosureView;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v31, "setTintColor:", v32);

    -[UIImageView setHidden:](v4->_disclosureView, "setHidden:", 1);
    objc_msgSend(v5, "addSubview:", v4->_disclosureView);
    -[PKDashboardTitleDetailCell _updateDefaultValues](v4, "_updateDefaultValues");

  }
  return v4;
}

- (void)setTitleText:(id)a3 detail:(id)a4
{
  id v7;
  id v8;
  NSString *titleText;
  NSString *v10;
  _BOOL4 v11;
  NSString *detailText;
  NSString *v13;
  NSString *v14;
  BOOL v15;
  NSString *v16;

  v7 = a3;
  v8 = a4;
  titleText = self->_titleText;
  v16 = (NSString *)v7;
  v10 = titleText;
  if (v10 == v16)
  {

LABEL_7:
    detailText = self->_detailText;
    v13 = (NSString *)v8;
    v14 = detailText;
    if (v14 == v13)
    {

      goto LABEL_16;
    }
    v10 = v14;
    if (v13 && v14)
    {
      v15 = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

      if (v15)
        goto LABEL_16;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v16 && v10)
  {
    v11 = -[NSString isEqualToString:](v16, "isEqualToString:", v10);

    if (!v11)
      goto LABEL_14;
    goto LABEL_7;
  }
  v13 = v16;
LABEL_13:

LABEL_14:
  objc_storeStrong((id *)&self->_titleText, a3);
  objc_storeStrong((id *)&self->_detailText, a4);
  -[UILabel setText:](self->_titleLabel, "setText:", self->_titleText);
  -[UILabel setText:](self->_subtitleLabel, "setText:", self->_detailText);
  -[PKDashboardTitleDetailCell setNeedsLayout](self, "setNeedsLayout");
LABEL_16:

}

- (void)setTitleTextColor:(id)a3
{
  char v4;
  UIColor *v5;
  UIColor *defaultTitleTextColor;
  UIColor *v7;

  v7 = (UIColor *)a3;
  v4 = PKEqualObjects();
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    defaultTitleTextColor = v7;
    if (!v7)
      defaultTitleTextColor = self->_defaultTitleTextColor;
    objc_storeStrong((id *)&self->_titleTextColor, defaultTitleTextColor);
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", self->_titleTextColor);
    v5 = v7;
  }

}

- (void)setDetailTextColor:(id)a3
{
  char v4;
  UIColor *v5;
  UIColor *defaultTitleTextColor;
  UIColor *v7;

  v7 = (UIColor *)a3;
  v4 = PKEqualObjects();
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    defaultTitleTextColor = v7;
    if (!v7)
      defaultTitleTextColor = self->_defaultTitleTextColor;
    objc_storeStrong((id *)&self->_detailTextColor, defaultTitleTextColor);
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", self->_detailTextColor);
    v5 = v7;
  }

}

- (void)setAccessory:(unint64_t)a3
{
  uint64_t v4;

  if (self->_accessory != a3)
  {
    self->_accessory = a3;
    if (a3 <= 2)
    {
      v4 = (3u >> (a3 & 7)) & 1;
      -[UIImageView setHidden:](self->_disclosureView, "setHidden:", (a3 & 1) == 0);
      -[UIActivityIndicatorView setHidden:](self->_spinnerView, "setHidden:", v4);
    }
  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDashboardTitleDetailCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKDashboardTitleDetailCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKDashboardTitleDetailCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKDashboardTitleDetailCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  CGRectEdge v15;
  CGRectEdge v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  CGSize v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGSize v66;
  double v67;
  CGPoint v68;
  double v69;
  double v70;
  CGRect v71;
  CGRect slice;
  CGRect remainder;
  CGRect v74;
  objc_super v75;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v75.receiver = self;
  v75.super_class = (Class)PKDashboardTitleDetailCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v75, sel_layoutSubviews);
  v10 = x + 12.0;
  v11 = y + 12.0;
  v69 = width;
  v12 = width + -24.0;
  memset(&v74, 0, sizeof(v74));
  remainder.origin.x = v10;
  remainder.origin.y = y + 12.0;
  v13 = height + -24.0;
  remainder.size.width = v12;
  remainder.size.height = height + -24.0;
  v14 = -[PKDashboardTitleDetailCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v14)
    v15 = CGRectMaxXEdge;
  else
    v15 = CGRectMinXEdge;
  if (v14)
    v16 = CGRectMinXEdge;
  else
    v16 = CGRectMaxXEdge;
  -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", v12, 3.40282347e38);
  v18 = v17;
  v20 = v19;
  -[UIActivityIndicatorView sizeThatFits:](self->_spinnerView, "sizeThatFits:", v12, 3.40282347e38);
  v22 = fmax(v18, v21);
  v24 = fmax(v20, v23);
  v25 = MEMORY[0x1E0C9D648];
  v26 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v70 = *MEMORY[0x1E0C9D648];
  if (v22 <= 0.0)
  {
    v43 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v45 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v62 = v43;
    v64 = v45;
    v58 = *MEMORY[0x1E0C9D648];
    v60 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
    v31 = v24;
  }
  else
  {
    v67 = v24;
    v27 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    slice.size = v27;
    v28 = v10;
    v27.width = v11;
    v29 = v12;
    v30 = v13;
    CGRectDivide(*(CGRect *)((char *)&v27 - 8), &slice, &remainder, v22, v16);
    CGRectDivide(remainder, &v74, &remainder, 11.0, v16);
    PKContentAlignmentMake();
    v31 = v67;
    PKSizeAlignedInRect();
    slice.origin.x = v32;
    slice.origin.y = v33;
    slice.size.width = v34;
    slice.size.height = v35;
    PKRectCenteredIntegralRect();
    v58 = v36;
    v60 = v37;
    v62 = v38;
    v64 = v39;
    PKRectCenteredIntegralRect();
    v70 = v40;
    v26 = v41;
    v43 = v42;
    v45 = v44;
    v12 = remainder.size.width;
  }
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v12 * 0.5, 3.40282347e38, v58, v60, *(_QWORD *)&v62, *(_QWORD *)&v64);
  v66 = *(CGSize *)(v25 + 16);
  v68 = *(CGPoint *)v25;
  slice.origin = *(CGPoint *)v25;
  slice.size = v66;
  if (v46 > 0.0)
  {
    CGRectDivide(remainder, &slice, &remainder, v46, v16);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    slice.origin.x = v47;
    slice.origin.y = v48;
    slice.size.width = v49;
    slice.size.height = v50;
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, 3.40282347e38);
  v71.origin = v68;
  v71.size = v66;
  if (v51 > 0.0)
  {
    CGRectDivide(remainder, &v71, &remainder, v51, v15);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v71.origin.x = v52;
    v71.origin.y = v53;
    v71.size.width = v54;
    v71.size.height = v55;
  }
  if (!a4)
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v71.origin.x, v71.origin.y, v71.size.width, v71.size.height);
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v70, v26, v43, v45);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", v59, v61, v63, v65);
  }
  v56 = fmax(v71.size.height, fmax(slice.size.height, v31)) + 24.0;
  v57 = v69;
  result.height = v56;
  result.width = v57;
  return result;
}

- (void)_updateDefaultValues
{
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", self->_defaultTitleTextColor);
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", self->_defaultTitleTextColor);
}

- (void)prepareForReuse
{
  NSString *titleText;
  NSString *detailText;
  UIColor *titleTextColor;
  UIColor *detailTextColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDashboardTitleDetailCell;
  -[PKDashboardCollectionViewCell prepareForReuse](&v7, sel_prepareForReuse);
  titleText = self->_titleText;
  self->_titleText = 0;

  detailText = self->_detailText;
  self->_detailText = 0;

  titleTextColor = self->_titleTextColor;
  self->_titleTextColor = 0;

  detailTextColor = self->_detailTextColor;
  self->_detailTextColor = 0;

  self->_accessory = 0;
  -[UIImageView setHidden:](self->_disclosureView, "setHidden:", 1);
  -[UIActivityIndicatorView setHidden:](self->_spinnerView, "setHidden:", 1);
  -[PKDashboardTitleDetailCell _updateDefaultValues](self, "_updateDefaultValues");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_defaultTitleTextColor, 0);
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
