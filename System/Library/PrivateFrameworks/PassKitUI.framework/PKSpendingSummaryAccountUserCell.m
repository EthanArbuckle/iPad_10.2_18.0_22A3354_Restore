@implementation PKSpendingSummaryAccountUserCell

- (PKSpendingSummaryAccountUserCell)initWithFrame:(CGRect)a3
{
  PKSpendingSummaryAccountUserCell *v3;
  void *v4;
  uint64_t v5;
  NSString *identifier;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  UILabel *amountLabel;
  UILabel *v14;
  void *v15;
  uint64_t v16;
  UILabel *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UILabel *nameLabel;
  UILabel *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIImageView *avatarView;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)PKSpendingSummaryAccountUserCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v5;

    v7 = objc_alloc(MEMORY[0x1E0DC3990]);
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
    amountLabel = v3->_amountLabel;
    v3->_amountLabel = (UILabel *)v12;

    -[UILabel setNumberOfLines:](v3->_amountLabel, "setNumberOfLines:", 1);
    v14 = v3->_amountLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    v16 = PKUIGetMinScreenWidthType();
    v17 = v3->_amountLabel;
    v18 = v16 == 0;
    if (v16)
      v19 = (void *)*MEMORY[0x1E0DC4A88];
    else
      v19 = (void *)*MEMORY[0x1E0DC4B10];
    v20 = (void *)*MEMORY[0x1E0DC4938];
    if (v18)
      v21 = (void *)*MEMORY[0x1E0DC4AB8];
    else
      v21 = (void *)*MEMORY[0x1E0DC4B10];
    PKFontForDefaultDesign(v19, (void *)*MEMORY[0x1E0DC4938], 0x8000, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v22);

    -[PKSpendingSummaryAccountUserCell contentView](v3, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v3->_amountLabel);

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v8, v9, v10, v11);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = (UILabel *)v24;

    -[UILabel setNumberOfLines:](v3->_nameLabel, "setNumberOfLines:", 1);
    v26 = v3->_nameLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v26, "setTextColor:", v27);

    v28 = v3->_nameLabel;
    PKFontForDefaultDesign(v21, v20, 0x8000, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v28, "setFont:", v29);

    -[PKSpendingSummaryAccountUserCell contentView](v3, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v3->_nameLabel);

    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v8, v9, v10, v11);
    avatarView = v3->_avatarView;
    v3->_avatarView = (UIImageView *)v31;

    -[UIImageView layer](v3->_avatarView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v33, "setBorderColor:", objc_msgSend(v34, "CGColor"));

    -[UIImageView layer](v3->_avatarView, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBorderWidth:", 1.0);

    -[UIImageView layer](v3->_avatarView, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setMasksToBounds:", 1);

    -[UIImageView layer](v3->_avatarView, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setCornerRadius:", 12.0);

    -[PKSpendingSummaryAccountUserCell contentView](v3, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v3->_avatarView);

    -[PKDashboardCollectionViewCell setMaskType:](v3, "setMaskType:", 3);
    -[UILabel setText:](v3->_nameLabel, "setText:", CFSTR(" "));
    -[UILabel setText:](v3->_amountLabel, "setText:", CFSTR(" "));
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSpendingSummaryAccountUserCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKSpendingSummaryAccountUserCell bounds](self, "bounds");
  -[PKSpendingSummaryAccountUserCell _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKSpendingSummaryAccountUserCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double width;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  UIImageView *avatarView;
  CGFloat v9;
  double v10;
  UILabel *nameLabel;
  CGFloat v12;
  double v13;
  UILabel *amountLabel;
  double v15;
  double v16;
  CGRect v17;
  CGRect slice;
  CGSize result;
  CGRect v20;

  width = a3.size.width;
  v5 = a3.origin.x + 12.0;
  v6 = a3.origin.y + 11.0;
  v7 = a3.size.height + -18.0;
  memset(&slice, 0, sizeof(slice));
  -[PKSpendingSummaryAccountUserCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v17.origin.x = v5;
  v17.origin.y = v6;
  v17.size.width = width + -24.0;
  v17.size.height = v7;
  v20.origin.x = v5;
  v20.origin.y = v6;
  v20.size.width = width + -24.0;
  v20.size.height = v7;
  CGRectDivide(v20, &slice, &v17, 24.0, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    avatarView = self->_avatarView;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](avatarView, "setFrame:");
  }
  CGRectDivide(v17, &slice, &v17, 2.0, CGRectMinYEdge);
  -[UILabel sizeThatFits:](self->_nameLabel, "sizeThatFits:", v17.size.width, v17.size.height);
  v10 = v9;
  CGRectDivide(v17, &slice, &v17, v9, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    nameLabel = self->_nameLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](nameLabel, "setFrame:");
  }
  CGRectDivide(v17, &slice, &v17, 0.0, CGRectMinYEdge);
  -[UILabel sizeThatFits:](self->_amountLabel, "sizeThatFits:", v17.size.width, v17.size.height);
  v13 = v12;
  CGRectDivide(v17, &slice, &v17, v12, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    amountLabel = self->_amountLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](amountLabel, "setFrame:");
  }
  CGRectDivide(v17, &slice, &v17, 0.0, CGRectMinYEdge);
  v15 = v10 + 0.0 + 37.0 + v13 + 7.0;
  v16 = width;
  result.height = v15;
  result.width = v16;
  return result;
}

- (void)setAmount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;

  v4 = a3;
  -[UILabel text](self->_amountLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = objc_msgSend(v8, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[UILabel setText:](self->_amountLabel, "setText:", v8);
    -[PKSpendingSummaryAccountUserCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;

  v4 = a3;
  -[UILabel text](self->_nameLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = objc_msgSend(v8, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[UILabel setText:](self->_nameLabel, "setText:", v8);
    -[PKSpendingSummaryAccountUserCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setAvatar:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UIImageView image](self->_avatarView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[UIImageView setImage:](self->_avatarView, "setImage:", v6);
    -[PKSpendingSummaryAccountUserCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)amount
{
  return self->_amount;
}

- (UIImage)avatar
{
  return self->_avatar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
}

@end
