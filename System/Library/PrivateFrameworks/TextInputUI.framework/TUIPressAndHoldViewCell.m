@implementation TUIPressAndHoldViewCell

- (TUIPressAndHoldViewCell)initWithFrame:(CGRect)a3
{
  TUIPressAndHoldViewCell *v3;
  TUIPressAndHoldViewCell *v4;
  id v5;
  double Width;
  uint64_t v7;
  UILabel *textLabel;
  void *v9;
  id v10;
  uint64_t v11;
  UILabel *accentVariantNumberLabel;
  void *v13;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)TUIPressAndHoldViewCell;
  v3 = -[TUIPressAndHoldViewCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_alignment = 1;
    -[TUIPressAndHoldViewCell _setCornerRadius:](v3, "_setCornerRadius:", 6.0);
    -[TUIPressAndHoldViewCell setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[TUIPressAndHoldViewCell bounds](v4, "bounds");
    Width = CGRectGetWidth(v16);
    -[TUIPressAndHoldViewCell bounds](v4, "bounds");
    v7 = objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v17));
    textLabel = v4->_textLabel;
    v4->_textLabel = (UILabel *)v7;

    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_textLabel, "setAdjustsFontSizeToFitWidth:", 0);
    -[UILabel setTextAlignment:](v4->_textLabel, "setTextAlignment:", 1);
    -[TUIPressAndHoldViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_textLabel);

    v10 = objc_alloc(MEMORY[0x1E0DC3990]);
    v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    accentVariantNumberLabel = v4->_accentVariantNumberLabel;
    v4->_accentVariantNumberLabel = (UILabel *)v11;

    -[UILabel setTextAlignment:](v4->_accentVariantNumberLabel, "setTextAlignment:", 1);
    -[TUIPressAndHoldViewCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_accentVariantNumberLabel);

  }
  return v4;
}

- (void)setAccentVariant:(id)a3
{
  NSString *v5;
  NSString *accentVariant;
  char v7;
  void *v8;
  NSString *v9;

  v5 = (NSString *)a3;
  accentVariant = self->_accentVariant;
  if (accentVariant != v5)
  {
    v9 = v5;
    v7 = -[NSString isEqual:](accentVariant, "isEqual:");
    v5 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_accentVariant, a3);
      if (-[NSString length](v9, "length") || self->_textLabel)
      {
        -[TUIPressAndHoldViewCell textLabel](self, "textLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", v9);

      }
      -[TUIPressAndHoldViewCell setNeedsLayout](self, "setNeedsLayout");
      v5 = v9;
    }
  }

}

- (void)setAccentVariantNumber:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_accentVariantNumber != a3)
  {
    self->_accentVariantNumber = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[TUIPressAndHoldViewCell accentVariantNumberLabel](self, "accentVariantNumberLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

    -[TUIPressAndHoldViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIPressAndHoldViewCell;
  -[TUIPressAndHoldViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[TUIPressAndHoldViewCell updateLabels](self, "updateLabels");
  -[TUIPressAndHoldViewCell updateColors](self, "updateColors");
}

- (void)updateLabels
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double Width;
  double v23;
  double v24;
  uint64_t v25;
  _QWORD v26[2];
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v26[1] = *MEMORY[0x1E0C80C00];
  -[TUIPressAndHoldViewCell accentVariant](self, "accentVariant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUIPressAndHoldViewCell bounds](self, "bounds");
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v6 = v5 + v4;
    v8 = *MEMORY[0x1E0DC49E8] + v7;
    v10 = v9 - (v4 + *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v12 = v11 - (*MEMORY[0x1E0DC49E8] + *(double *)(MEMORY[0x1E0DC49E8] + 16));
    v25 = *MEMORY[0x1E0DC32A0];
    -[UILabel font](self->_textLabel, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel text](self->_textLabel, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizeWithAttributes:", v14);
    v17 = v16;

    -[UILabel text](self->_textLabel, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeWithAttributes:", v14);
    v20 = v19;

    v27.origin.x = v6;
    v27.origin.y = v8;
    v27.size.width = v10;
    v27.size.height = v12;
    v21 = CGRectGetMinY(v27) + 3.0;
    -[TUIPressAndHoldViewCell bounds](self, "bounds");
    Width = CGRectGetWidth(v28);
    -[TUIPressAndHoldViewCell bounds](self, "bounds");
    v23 = CGRectGetWidth(v29);
    v24 = TUIScreenScaleForView(self);
    -[UILabel setFrame:](self->_textLabel, "setFrame:", TUIRectIntegralWithScale(0.0, v21, Width, v17, v24));
    -[UILabel setFrame:](self->_accentVariantNumberLabel, "setFrame:", TUIRectIntegralWithScale(0.0, v17 + 3.0 + 3.0, v23, v20, v24));

  }
}

- (void)updateColors
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if ((-[TUIPressAndHoldViewCell isSelected](self, "isSelected") & 1) != 0
    || (-[TUIPressAndHoldViewCell isHighlighted](self, "isHighlighted") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
  }
  -[TUIPressAndHoldViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[TUIPressAndHoldViewCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (v6 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v7);

    if ((v4 & 1) == 0)
      goto LABEL_12;
  }
  else
  {
    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v10);

LABEL_12:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v8);

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v11 = (id)v9;
  -[UILabel setTextColor:](self->_accentVariantNumberLabel, "setTextColor:", v9);

}

- (NSString)accentVariant
{
  return self->_accentVariant;
}

- (unint64_t)accentVariantNumber
{
  return self->_accentVariantNumber;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UILabel)accentVariantNumberLabel
{
  return self->_accentVariantNumberLabel;
}

- (void)setAccentVariantNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accentVariantNumberLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accentVariantNumberLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_accentVariant, 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("TUIPressAndHoldViewCell");
}

@end
