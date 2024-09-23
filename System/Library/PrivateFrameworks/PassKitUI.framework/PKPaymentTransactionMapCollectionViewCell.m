@implementation PKPaymentTransactionMapCollectionViewCell

- (PKPaymentTransactionMapCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKPaymentTransactionMapCollectionViewCell *v3;
  PKTransactionMapView *v4;
  PKTransactionMapView *mapView;
  void *v6;
  UILabel *v7;
  UILabel *titleLabel;
  UILabel *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  UIImageView *v14;
  void *v15;
  UIImageView *disclosureView;
  UIImageView *v17;
  uint64_t v18;
  UIActivityIndicatorView *spinner;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PKPaymentTransactionMapCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PKTransactionMapView);
    mapView = v3->_mapView;
    v3->_mapView = v4;

    -[PKTransactionMapView setShowsMerchantName:](v3->_mapView, "setShowsMerchantName:", 1);
    -[PKPaymentTransactionMapCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_mapView);

    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    v9 = v3->_titleLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4938]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v10);

    -[PKPaymentTransactionMapCollectionViewCell contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v3->_titleLabel);

    v12 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIChevronImage();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (UIImageView *)objc_msgSend(v12, "initWithImage:", v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v14, "setTintColor:", v15);

    disclosureView = v3->_disclosureView;
    v3->_disclosureView = v14;
    v17 = v14;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v18;

    -[UIActivityIndicatorView sizeToFit](v3->_spinner, "sizeToFit");
    -[PKPaymentTransactionMapCollectionViewCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68130]);
  }
  return v3;
}

- (void)setShowDisclosureIndicator:(BOOL)a3
{
  if (self->_showDisclosureIndicator != a3)
  {
    self->_showDisclosureIndicator = a3;
    -[PKPaymentTransactionMapCollectionViewCell _updateSpinnerAndDisclosureIndicator](self, "_updateSpinnerAndDisclosureIndicator");
  }
}

- (void)setShowSpinner:(BOOL)a3
{
  UIActivityIndicatorView *spinner;

  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    spinner = self->_spinner;
    if (a3)
      -[UIActivityIndicatorView startAnimating](spinner, "startAnimating");
    else
      -[UIActivityIndicatorView stopAnimating](spinner, "stopAnimating");
    -[PKPaymentTransactionMapCollectionViewCell _updateSpinnerAndDisclosureIndicator](self, "_updateSpinnerAndDisclosureIndicator");
  }
}

- (void)_updateSpinnerAndDisclosureIndicator
{
  int *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_showSpinner)
  {
    v3 = &OBJC_IVAR___PKPaymentTransactionMapCollectionViewCell__disclosureView;
    -[UIActivityIndicatorView superview](self->_spinner, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[PKPaymentTransactionMapCollectionViewCell contentView](self, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSubview:", self->_spinner);

    }
  }
  else if (self->_showDisclosureIndicator)
  {
    v3 = &OBJC_IVAR___PKPaymentTransactionMapCollectionViewCell__spinner;
    -[UIImageView superview](self->_disclosureView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[PKPaymentTransactionMapCollectionViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_disclosureView);

      v3 = &OBJC_IVAR___PKPaymentTransactionMapCollectionViewCell__spinner;
    }
  }
  else
  {
    v3 = &OBJC_IVAR___PKPaymentTransactionMapCollectionViewCell__disclosureView;
    -[UIActivityIndicatorView removeFromSuperview](self->_spinner, "removeFromSuperview");
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + *v3), "removeFromSuperview");
  -[PKPaymentTransactionMapCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  PKDashboardTransactionMapItem *item;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionMapCollectionViewCell;
  -[PKDashboardCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  item = self->_item;
  self->_item = 0;

  -[UILabel setText:](self->_titleLabel, "setText:", 0);
  -[PKPaymentTransactionMapCollectionViewCell setShowSpinner:](self, "setShowSpinner:", 0);
  -[PKPaymentTransactionMapCollectionViewCell setShowDisclosureIndicator:](self, "setShowDisclosureIndicator:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  -[UILabel text](self->_titleLabel, "text", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UILabel font](self->_titleLabel, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lineHeight");
    v8 = v7 + 28.0 + 200.0;

  }
  else
  {
    v8 = 200.0;
  }
  -[PKPaymentTransactionMapCollectionViewCell maxWidthForTransactionCellInWidth:](self, "maxWidthForTransactionCellInWidth:", width);
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  UIActivityIndicatorView *spinner;
  double v16;
  void *v17;
  CGFloat v18;
  UIImageView *disclosureView;
  UILabel *titleLabel;
  CGRect v21;
  CGRect remainder;
  objc_super v23;
  CGRect v24;

  v23.receiver = self;
  v23.super_class = (Class)PKPaymentTransactionMapCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v23, sel_layoutSubviews);
  -[PKPaymentTransactionMapCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  remainder.origin.x = v4;
  remainder.origin.y = v6;
  remainder.size.width = v8;
  remainder.size.height = v10;

  memset(&v21, 0, sizeof(v21));
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  CGRectDivide(v24, &v21, &remainder, 200.0, CGRectMinYEdge);
  -[PKTransactionMapView setFrame:](self->_mapView, "setFrame:", *(_OWORD *)&v21.origin, *(_OWORD *)&v21.size);
  CGRectDivide(remainder, &v21, &remainder, 14.0, CGRectMinYEdge);
  CGRectDivide(remainder, &v21, &remainder, 14.0, CGRectMinXEdge);
  CGRectDivide(remainder, &v21, &remainder, 14.0, CGRectMaxXEdge);
  CGRectDivide(remainder, &v21, &remainder, 14.0, CGRectMaxYEdge);
  -[UIActivityIndicatorView superview](self->_spinner, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIActivityIndicatorView frame](self->_spinner, "frame");
    PKSizeAspectFit();
    v14 = v13;
    spinner = self->_spinner;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIActivityIndicatorView setFrame:](spinner, "setFrame:");
    v16 = v14 + 14.0;
LABEL_5:
    CGRectDivide(remainder, &v21, &remainder, v16, CGRectMaxXEdge);
    goto LABEL_6;
  }
  -[UIImageView superview](self->_disclosureView, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[UIImageView frame](self->_disclosureView, "frame");
    CGRectDivide(remainder, &v21, &remainder, v18, CGRectMaxXEdge);
    disclosureView = self->_disclosureView;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](disclosureView, "setFrame:");
    v16 = 14.0;
    goto LABEL_5;
  }
LABEL_6:
  -[UILabel pkui_sizeThatFits:](self->_titleLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
  titleLabel = self->_titleLabel;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](titleLabel, "setFrame:");
}

- (double)maxWidthForTransactionCellInWidth:(double)a3
{
  double v4;

  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
  return a3 + v4 * -2.0;
}

- (PKDashboardTransactionMapItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (PKTransactionMapView)mapView
{
  return self->_mapView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (BOOL)showDisclosureIndicator
{
  return self->_showDisclosureIndicator;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
}

@end
