@implementation PKPaymentTransactionLocationTableViewCell

- (PKPaymentTransactionLocationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKPaymentTransactionLocationTableViewCell *v4;
  PKPaymentTransactionLocationTableViewCell *v5;
  void *v6;
  UILabel *v7;
  UILabel *titleLabel;
  PKTransactionMapView *v9;
  PKTransactionMapView *mapView;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKPaymentTransactionLocationTableViewCell;
  v4 = -[PKPaymentTransactionLocationTableViewCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PKPaymentTransactionLocationTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v7;

    v9 = objc_alloc_init(PKTransactionMapView);
    mapView = v5->_mapView;
    v5->_mapView = v9;

    -[PKTransactionMapView setShowsMerchantName:](v5->_mapView, "setShowsMerchantName:", 1);
    v11 = v5->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    v13 = v5->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setAccessibilityIdentifier:](v5->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(v6, "addSubview:", v5->_titleLabel);
    objc_msgSend(v6, "addSubview:", v5->_mapView);
    -[PKPaymentTransactionLocationTableViewCell _disclosureView](v5, "_disclosureView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v15);

    -[PKPaymentTransactionLocationTableViewCell setPreservesSuperviewLayoutMargins:](v5, "setPreservesSuperviewLayoutMargins:", 1);
    -[PKPaymentTransactionLocationTableViewCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D08]);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRectEdge v12;
  PKTransactionMapView *mapView;
  void *v20;
  double v21;
  double v22;
  UIImageView *disclosureView;
  UILabel *titleLabel;
  CGRect v25;
  CGRect remainder;
  objc_super v27;
  CGRect v28;
  CGRect v29;

  v27.receiver = self;
  v27.super_class = (Class)PKPaymentTransactionLocationTableViewCell;
  -[PKPaymentTransactionLocationTableViewCell layoutSubviews](&v27, sel_layoutSubviews);
  -[PKPaymentTransactionLocationTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  remainder.origin.x = v5;
  remainder.origin.y = v7;
  remainder.size.width = v9;
  remainder.size.height = v11;
  if (-[PKPaymentTransactionLocationTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", 0, 0, 0, 0))v12 = CGRectMinXEdge;
  else
    v12 = CGRectMaxXEdge;
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  CGRectGetWidth(v28);
  mapView = self->_mapView;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[PKTransactionMapView setFrame:](mapView, "setFrame:");
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  CGRectDivide(v29, &v25, &remainder, 181.0, CGRectMinYEdge);
  __asm
  {
    FMOV            V0.2D, #14.0
    FMOV            V1.2D, #-28.0
  }
  remainder.origin = (CGPoint)vaddq_f64((float64x2_t)remainder.origin, _Q0);
  remainder.size = (CGSize)vaddq_f64((float64x2_t)remainder.size, _Q1);
  -[PKPaymentTransactionLocationTableViewCell _disclosureView](self, "_disclosureView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;

  disclosureView = self->_disclosureView;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](disclosureView, "setFrame:");
  CGRectDivide(remainder, &v25, &remainder, v22 + 14.0, v12);
  -[UILabel pkui_sizeThatFits:](self->_titleLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
  titleLabel = self->_titleLabel;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](titleLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
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
    v8 = v7 + 14.0 + 14.0 + 181.0;

  }
  else
  {
    v8 = 181.0;
  }
  v9 = width;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setTransaction:(id)a3
{
  PKPaymentTransaction *v5;
  PKPaymentTransaction **p_transaction;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  PKPaymentTransaction *v15;

  v5 = (PKPaymentTransaction *)a3;
  p_transaction = &self->_transaction;
  if (self->_transaction != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_transaction, a3);
    -[PKPaymentTransaction merchant](v15, "merchant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_17;
    -[PKPaymentTransaction displayLocation](*p_transaction, "displayLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_17;
    -[PKPaymentTransaction startStation](*p_transaction, "startStation");
    v9 = objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransaction endStation](*p_transaction, "endStation");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12)
    {
      if (!(v9 | v10))
      {
        v8 = 0;
        goto LABEL_16;
      }
      if (v9)
        v13 = (void *)v9;
      else
        v13 = (void *)v10;
      v14 = v13;
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("TRANSIT_TRANSACTION_STATIONS_FORMAT"), CFSTR("%1$@%2$@"), v9, v10);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v14;
LABEL_16:

LABEL_17:
    -[UILabel setText:](self->_titleLabel, "setText:", v8);
    -[PKTransactionMapView setTransaction:](self->_mapView, "setTransaction:", v15);
    -[UIImageView setHidden:](self->_disclosureView, "setHidden:", -[PKPaymentTransactionLocationTableViewCell _shouldShowDisclosureIndicator](self, "_shouldShowDisclosureIndicator") ^ 1);

    v5 = v15;
  }

}

- (void)setTitleLabelColor:(id)a3
{
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", a3);
}

- (BOOL)usesDarkMapAppearance
{
  return -[PKTransactionMapView usesDarkAppearance](self->_mapView, "usesDarkAppearance");
}

- (void)setUsesDarkMapAppearance:(BOOL)a3
{
  -[PKTransactionMapView setUsesDarkAppearance:](self->_mapView, "setUsesDarkAppearance:", a3);
}

- (BOOL)_shouldShowDisclosureIndicator
{
  void *v2;
  BOOL v3;
  void *v4;

  -[PKPaymentTransaction merchant](self->_transaction, "merchant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "useRawMerchantData") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "mapsMerchant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "identifier") != 0;

  }
  return v3;
}

- (id)_disclosureView
{
  UIImageView *disclosureView;
  id v4;
  void *v5;
  UIImageView *v6;
  void *v7;
  UIImageView *v8;

  disclosureView = self->_disclosureView;
  if (!disclosureView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIChevronImage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v6, "setTintColor:", v7);

    v8 = self->_disclosureView;
    self->_disclosureView = v6;

    disclosureView = self->_disclosureView;
  }
  return disclosureView;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
