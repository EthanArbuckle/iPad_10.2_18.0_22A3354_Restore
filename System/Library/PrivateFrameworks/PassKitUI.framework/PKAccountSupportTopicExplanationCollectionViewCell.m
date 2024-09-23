@implementation PKAccountSupportTopicExplanationCollectionViewCell

- (void)setExplanationContent:(id)a3
{
  id v4;
  UILabel *v5;
  UILabel *primaryLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  UILabel *secondaryLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *iconImageView;
  UIImageView *v19;
  void *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  UIImageView *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v4 = a3;
  -[PKAccountSupportTopicExplanationCollectionViewCell contentView](self, "contentView");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_primaryLabel)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    primaryLabel = self->_primaryLabel;
    self->_primaryLabel = v5;

    -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
    v7 = self->_primaryLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = self->_primaryLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    objc_msgSend(v30, "addSubview:", self->_primaryLabel);
  }
  if (!self->_secondaryLabel)
  {
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryLabel = self->_secondaryLabel;
    self->_secondaryLabel = v11;

    -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
    v13 = self->_secondaryLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v14);

    v15 = self->_secondaryLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    objc_msgSend(v30, "addSubview:", self->_secondaryLabel);
  }
  if (!self->_iconImageView)
  {
    v17 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = self->_iconImageView;
    self->_iconImageView = v17;

    -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:", 1);
    v19 = self->_iconImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v19, "setTintColor:", v20);

    objc_msgSend(v30, "addSubview:", self->_iconImageView);
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBackgroundColor:", v21);

  v22 = self->_primaryLabel;
  objc_msgSend(v4, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v22, "setText:", v23);

  v24 = self->_secondaryLabel;
  objc_msgSend(v4, "subtitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v24, "setText:", v25);

  v26 = self->_iconImageView;
  v27 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v4, "systemImageName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "systemImageNamed:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](v26, "setImage:", v29);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKAccountSupportTopicExplanationCollectionViewCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAccountSupportTopicExplanationCollectionViewCell;
  -[PKAccountSupportTopicExplanationCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKAccountSupportTopicExplanationCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKAccountSupportTopicExplanationCollectionViewCell _layoutWithBounds:](self, "_layoutWithBounds:");

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAccountSupportTopicExplanationCollectionViewCell;
  -[PKAccountSupportTopicExplanationCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UILabel setText:](self->_primaryLabel, "setText:", 0);
  -[UILabel setText:](self->_secondaryLabel, "setText:", 0);
  -[UIImageView setImage:](self->_iconImageView, "setImage:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRectEdge v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  UIImageView *iconImageView;
  void *v17;
  uint64_t v18;
  CGFloat v19;
  double v20;
  UILabel *primaryLabel;
  void *v22;
  uint64_t v23;
  CGFloat v24;
  UILabel *secondaryLabel;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v37;
  CGRect v38;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PKAccountSupportTopicExplanationCollectionViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v8 = CGRectMaxXEdge;
  else
    v8 = CGRectMinXEdge;
  memset(&slice, 0, sizeof(slice));
  v9 = x + 16.0;
  v10 = y + 20.0;
  v11 = height + -40.0;
  remainder.origin.x = v9;
  remainder.origin.y = v10;
  remainder.size.width = width + -32.0;
  remainder.size.height = height + -40.0;
  -[UIImageView image](self->_iconImageView, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    PKContentAlignmentMake();
    -[UILabel font](self->_primaryLabel, "font", 0, 0, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lineHeight");
    v15 = v14;

    v37.origin.x = v9;
    v37.origin.y = v10;
    v37.size.width = width + -32.0;
    v37.size.height = v11;
    CGRectDivide(v37, &v33, &remainder, v15, v8);
    CGRectDivide(remainder, &slice, &remainder, 4.0, v8);
    iconImageView = self->_iconImageView;
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](iconImageView, "setFrame:");
  }
  else
  {
    v15 = 0.0;
  }
  -[UILabel text](self->_primaryLabel, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    memset(&v33, 0, sizeof(v33));
    -[UILabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height, 0, 0, 0, 0);
    v20 = v19;
    CGRectDivide(remainder, &v33, &remainder, v19, CGRectMinYEdge);
    primaryLabel = self->_primaryLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](primaryLabel, "setFrame:");
    v15 = fmax(v20, v15);
  }
  -[UILabel text](self->_secondaryLabel, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v23)
  {
    if (v15 > 0.0)
    {
      remainder.origin.x = v9;
      remainder.origin.y = v10;
      remainder.size.width = width + -32.0;
      remainder.size.height = v11;
      v38.origin.x = v9;
      v38.origin.y = v10;
      v38.size.width = width + -32.0;
      v38.size.height = v11;
      CGRectDivide(v38, &slice, &remainder, v15, CGRectMinYEdge);
      CGRectDivide(remainder, &slice, &remainder, 14.0, CGRectMinYEdge);
    }
    memset(&v33, 0, sizeof(v33));
    -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height, 0, 0, 0, 0);
    CGRectDivide(remainder, &v33, &remainder, v24, CGRectMinYEdge);
    secondaryLabel = self->_secondaryLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](secondaryLabel, "setFrame:");
  }
  v26 = 20.0;
  if (v15 > 0.0)
  {
    v27 = v15 + 20.0;
    -[UILabel text](self->_secondaryLabel, "text");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    if (v29)
      v26 = v27 + 14.0;
    else
      v26 = v27;
  }
  -[UILabel frame](self->_secondaryLabel, "frame");
  v31 = v26 + v30 + 20.0;
  v32 = width;
  result.height = v31;
  result.width = v32;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
