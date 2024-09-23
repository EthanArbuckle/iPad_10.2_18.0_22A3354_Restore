@implementation PKPayLaterFinancingPlanFundingSourceCell

- (PKPayLaterFinancingPlanFundingSourceCell)init
{
  return -[PKPayLaterFinancingPlanFundingSourceCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKPayLaterFinancingPlanFundingSourceCell)initWithFrame:(CGRect)a3
{
  PKPayLaterFinancingPlanFundingSourceCell *v3;
  uint64_t v4;
  PKPassLibrary *passLibrary;
  void *v6;
  UIImageView *v7;
  UIImageView *imageView;
  UILabel *v9;
  UILabel *titleLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  NSString *v14;
  NSString *v15;
  void *v16;
  UILabel *v17;
  UILabel *detailLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterFinancingPlanFundingSourceCell;
  v3 = -[PKPayLaterFinancingPlanFundingSourceCell initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    passLibrary = v3->_passLibrary;
    v3->_passLibrary = (PKPassLibrary *)v4;

    -[PKPayLaterFinancingPlanFundingSourceCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v7;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    objc_msgSend(v6, "addSubview:", v3->_imageView);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v9;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    v11 = v3->_titleLabel;
    PKLocalizedCocoonString(CFSTR("PAYMENT_METHOD"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v11, "setText:", v12);

    v13 = v3->_titleLabel;
    v14 = (NSString *)*MEMORY[0x1E0DC4A88];
    v15 = (NSString *)*MEMORY[0x1E0DC48D0];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v16);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 4);
    objc_msgSend(v6, "addSubview:", v3->_titleLabel);
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = v17;

    -[UILabel setNumberOfLines:](v3->_detailLabel, "setNumberOfLines:", 0);
    v19 = v3->_detailLabel;
    PKFontForDefaultDesign(v14, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19, "setFont:", v20);

    v21 = v3->_detailLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    -[UILabel setTextAlignment:](v3->_detailLabel, "setTextAlignment:", 4);
    objc_msgSend(v6, "addSubview:", v3->_detailLabel);

  }
  return v3;
}

- (void)setFundingSource:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fundingSource, a3);
    -[PKPayLaterFinancingPlanFundingSourceCell _populateIconForFundingSource](self, "_populateIconForFundingSource");
    -[PKPayLaterFinancingPlanFundingSourceCell _updateText](self, "_updateText");
    -[PKPayLaterFinancingPlanFundingSourceCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_populateIconForFundingSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  CGFloat v8;
  CGFloat v9;
  PKPassView *v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  id v14;

  if ((-[PKPayLaterFinancingPlanFundingSource type](self->_fundingSource, "type") | 2) != 3)
  {
    v7 = 0;
    goto LABEL_13;
  }
  -[PKPayLaterFinancingPlanFundingSource paymentPassDetails](self->_fundingSource, "paymentPassDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dpanIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fpanIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6 = 0;
LABEL_7:
    if (v5)
    {
      -[PKPassLibrary passWithFPANIdentifier:](self->_passLibrary, "passWithFPANIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_9;
  }
  -[PKPassLibrary passWithDPANIdentifier:](self->_passLibrary, "passWithDPANIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
LABEL_9:
  if (v6)
  {
    objc_msgSend(v6, "style");
    PKPassFrontFaceContentSize();
    PKSizeAspectFit();
    self->_iconSize.width = v8;
    self->_iconSize.height = v9;
    v10 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", v6, 4, 2039);
    -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v10, "snapshotOfFrontFaceWithRequestedSize:", self->_iconSize.width, self->_iconSize.height);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PKUINetworkImageForCredentialType(objc_msgSend(v3, "cardNetwork"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    self->_iconSize.width = v11;
    self->_iconSize.height = v12;
  }

  v7 = v13;
LABEL_13:
  v14 = v7;
  -[UIImageView setImage:](self->_imageView, "setImage:", v7);

}

- (void)_updateText
{
  UILabel *detailLabel;
  void *v4;
  void *v5;
  id v6;

  if ((-[PKPayLaterFinancingPlanFundingSource type](self->_fundingSource, "type") | 2) == 3)
  {
    -[PKPayLaterFinancingPlanFundingSource paymentPassDetails](self->_fundingSource, "paymentPassDetails");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    detailLabel = self->_detailLabel;
    objc_msgSend(v6, "cardSuffix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKMaskedPaymentPAN();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](detailLabel, "setText:", v5);

  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterFinancingPlanFundingSourceCell;
  -[PKPayLaterFinancingPlanFundingSourceCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKPayLaterFinancingPlanFundingSourceCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKPayLaterFinancingPlanFundingSourceCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPayLaterFinancingPlanFundingSourceCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
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
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  CGRectEdge v18;
  CGRectEdge v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  CGRect v45;
  CGRect v46;
  CGRect slice;
  CGRect remainder;
  CGRect v49;
  CGSize result;
  CGRect v51;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKPayLaterFinancingPlanFundingSourceCell accessories](self, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = x + 16.0;
  v13 = y + 16.0;
  v14 = 32.0;
  if (v11)
    v14 = 26.0;
  v44 = width;
  v15 = width - v14;
  v16 = height + -32.0;
  v17 = -[PKPayLaterFinancingPlanFundingSourceCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v17)
    v18 = CGRectMaxXEdge;
  else
    v18 = CGRectMinXEdge;
  if (v17)
    v19 = CGRectMinXEdge;
  else
    v19 = CGRectMaxXEdge;
  memset(&v49, 0, sizeof(v49));
  remainder.origin.x = x + 16.0;
  remainder.origin.y = y + 16.0;
  remainder.size.width = v15;
  remainder.size.height = height + -32.0;
  v20 = self->_iconSize.height;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v15, height, *(_QWORD *)&self->_iconSize.width);
  v22 = v21;
  v24 = v23;
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v15, height);
  v26 = v25;
  v28 = fmax(v24, fmax(v27, v20));
  memset(&slice, 0, sizeof(slice));
  v51.origin.x = v12;
  v51.origin.y = v13;
  v51.size.width = v15;
  v51.size.height = v16;
  CGRectDivide(v51, &slice, &remainder, v22, v18);
  PKSizeAlignedInRect();
  slice.origin.x = v29;
  slice.origin.y = v30;
  slice.size.width = v31;
  slice.size.height = v32;
  memset(&v46, 0, sizeof(v46));
  CGRectDivide(remainder, &v46, &remainder, v26, v19);
  PKSizeAlignedInRect();
  v46.origin.x = v33;
  v46.origin.y = v34;
  v46.size.width = v35;
  v46.size.height = v36;
  CGRectDivide(remainder, &v49, &remainder, 5.0, v19);
  memset(&v45, 0, sizeof(v45));
  CGRectDivide(remainder, &v45, &remainder, v43, v19);
  PKSizeAlignedInRect();
  v45.origin.x = v37;
  v45.origin.y = v38;
  v45.size.width = v39;
  v45.size.height = v40;
  if (!a4)
  {
    -[UIImageView setFrame:](self->_imageView, "setFrame:");
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
  }
  v41 = v28 + 0.0 + 32.0;
  v42 = v44;
  result.height = v41;
  result.width = v42;
  return result;
}

- (void)prepareForReuse
{
  PKPayLaterFinancingPlanFundingSource *fundingSource;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterFinancingPlanFundingSourceCell;
  -[PKPayLaterFinancingPlanFundingSourceCell prepareForReuse](&v4, sel_prepareForReuse);
  fundingSource = self->_fundingSource;
  self->_fundingSource = 0;

  self->_iconSize = (CGSize)*MEMORY[0x1E0C9D820];
}

- (PKPayLaterFinancingPlanFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end
