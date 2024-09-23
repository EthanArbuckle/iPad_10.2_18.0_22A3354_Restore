@implementation PKCollectionSectionHeaderView

- (PKCollectionSectionHeaderView)init
{
  return -[PKCollectionSectionHeaderView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKCollectionSectionHeaderView)initWithSize:(CGSize)a3
{
  return -[PKCollectionSectionHeaderView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
}

- (PKCollectionSectionHeaderView)initWithFrame:(CGRect)a3
{
  PKCollectionSectionHeaderView *v3;
  PKCollectionSectionHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKCollectionSectionHeaderView;
  v3 = -[PKCollectionSectionHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKCollectionSectionHeaderView _resetFont](v3, "_resetFont");
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCollectionSectionHeaderView;
  -[PKCollectionSectionHeaderView layoutSubviews](&v4, sel_layoutSubviews);
  -[PKCollectionSectionHeaderView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKCollectionSectionHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKCollectionSectionHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double topPadding;
  double bottomPadding;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
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
  CGFloat width;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v41;

  topPadding = self->_topPadding;
  bottomPadding = self->_bottomPadding;
  v8 = a3.origin.x + 4.0;
  v9 = a3.origin.y + topPadding;
  width = a3.size.width;
  v10 = a3.size.width + -8.0;
  v11 = a3.size.height - (topPadding + bottomPadding);
  -[PKCollectionSectionHeaderView contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_shouldReverseLayoutDirection");

  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v8;
  remainder.origin.y = v9;
  remainder.size.width = v10;
  remainder.size.height = v11;
  v13 = topPadding + 0.0 + bottomPadding;
  -[UILabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", v10, v11);
  v15 = v14;
  -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", v10, v11);
  v17 = v16;
  v41.origin.x = v8;
  v41.origin.y = v9;
  v41.size.width = v10;
  v41.size.height = v11;
  CGRectDivide(v41, &slice, &remainder, v15, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v20 = v19;
  v21 = v13 + v19;
  v35 = v23;
  v36 = v22;
  if (v15 <= 0.0 || v17 <= 0.0)
  {
    v24 = v18;
  }
  else
  {
    v24 = v18;
    CGRectDivide(remainder, &slice, &remainder, 5.0, CGRectMinYEdge);
    v21 = v21 + 5.0;
  }
  CGRectDivide(remainder, &slice, &remainder, v17, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v29 = v28;
  if (!a4)
  {
    v30 = v25;
    v31 = v26;
    v32 = v27;
    -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v24, v36, v35, v20);
    -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v30, v31, v32, v29);
  }
  v33 = v21 + v29;
  v34 = width;
  result.height = v33;
  result.width = v34;
  return result;
}

- (void)setPrimaryText:(id)a3
{
  id v5;
  NSString **p_primaryText;
  NSString *primaryText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  int v11;
  uint64_t v12;
  UILabel *primaryLabel;
  id v14;
  UILabel *v15;
  UILabel *v16;
  uint64_t v17;
  UILabel *v18;
  NSString *v19;

  v5 = a3;
  p_primaryText = &self->_primaryText;
  primaryText = self->_primaryText;
  v19 = (NSString *)v5;
  v8 = primaryText;
  if (v8 == v19)
  {

  }
  else
  {
    if (v19 && v8)
    {
      v9 = -[NSString isEqualToString:](v19, "isEqualToString:", v8);

      v10 = v19;
      if (v9)
        goto LABEL_17;
    }
    else
    {

    }
    v11 = -[PKCollectionSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    objc_storeStrong((id *)&self->_primaryText, a3);
    v12 = -[NSString length](*p_primaryText, "length");
    primaryLabel = self->_primaryLabel;
    if (v12)
    {
      if (!primaryLabel)
      {
        v14 = objc_alloc(MEMORY[0x1E0DC3990]);
        v15 = (UILabel *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v16 = self->_primaryLabel;
        self->_primaryLabel = v15;

        -[UILabel setFont:](self->_primaryLabel, "setFont:", self->_primaryFont);
        -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
        if (v11)
          v17 = 2;
        else
          v17 = 0;
        -[UILabel setTextAlignment:](self->_primaryLabel, "setTextAlignment:", v17);
        -[PKCollectionSectionHeaderView addSubview:](self, "addSubview:", self->_primaryLabel);
      }
    }
    else
    {
      -[UILabel removeFromSuperview](primaryLabel, "removeFromSuperview");
      v18 = self->_primaryLabel;
      self->_primaryLabel = 0;

    }
    -[UILabel setText:](self->_primaryLabel, "setText:", *p_primaryText);
    -[PKCollectionSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  v10 = v19;
LABEL_17:

}

- (void)setSecondaryText:(id)a3
{
  id v5;
  NSString **p_secondaryText;
  NSString *secondaryText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  int v11;
  uint64_t v12;
  UILabel *secondaryLabel;
  id v14;
  UILabel *v15;
  UILabel *v16;
  uint64_t v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  NSString *v21;

  v5 = a3;
  p_secondaryText = &self->_secondaryText;
  secondaryText = self->_secondaryText;
  v21 = (NSString *)v5;
  v8 = secondaryText;
  if (v8 == v21)
  {

  }
  else
  {
    if (v21 && v8)
    {
      v9 = -[NSString isEqualToString:](v21, "isEqualToString:", v8);

      v10 = v21;
      if (v9)
        goto LABEL_17;
    }
    else
    {

    }
    v11 = -[PKCollectionSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    objc_storeStrong((id *)&self->_secondaryText, a3);
    v12 = -[NSString length](*p_secondaryText, "length");
    secondaryLabel = self->_secondaryLabel;
    if (v12)
    {
      if (!secondaryLabel)
      {
        v14 = objc_alloc(MEMORY[0x1E0DC3990]);
        v15 = (UILabel *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v16 = self->_secondaryLabel;
        self->_secondaryLabel = v15;

        -[UILabel setFont:](self->_secondaryLabel, "setFont:", self->_secondaryFont);
        -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
        if (v11)
          v17 = 2;
        else
          v17 = 0;
        -[UILabel setTextAlignment:](self->_secondaryLabel, "setTextAlignment:", v17);
        v18 = self->_secondaryLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v18, "setTextColor:", v19);

        -[PKCollectionSectionHeaderView addSubview:](self, "addSubview:", self->_secondaryLabel);
      }
    }
    else
    {
      -[UILabel removeFromSuperview](secondaryLabel, "removeFromSuperview");
      v20 = self->_secondaryLabel;
      self->_secondaryLabel = 0;

    }
    -[UILabel setText:](self->_secondaryLabel, "setText:", *p_secondaryText);
    -[PKCollectionSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  v10 = v21;
LABEL_17:

}

- (void)setTopPadding:(double)a3
{
  if (self->_topPadding != a3)
  {
    self->_topPadding = a3;
    -[PKCollectionSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBottomPadding:(double)a3
{
  if (self->_bottomPadding != a3)
  {
    self->_bottomPadding = a3;
    -[PKCollectionSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_resetFont
{
  void *v3;
  UIFont *v4;
  UIFont *primaryFont;
  UIFont *v6;
  UIFont *secondaryFont;

  v3 = (void *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B58], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
  v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
  primaryFont = self->_primaryFont;
  self->_primaryFont = v4;

  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], v3, 0, 0);
  v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
  secondaryFont = self->_secondaryFont;
  self->_secondaryFont = v6;

}

- (void)prepareForReuse
{
  UILabel *primaryLabel;
  NSString *primaryText;
  UILabel *secondaryLabel;
  NSString *secondaryText;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKCollectionSectionHeaderView;
  -[PKCollectionSectionHeaderView prepareForReuse](&v7, sel_prepareForReuse);
  -[UILabel removeFromSuperview](self->_primaryLabel, "removeFromSuperview");
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = 0;

  primaryText = self->_primaryText;
  self->_primaryText = 0;

  -[UILabel removeFromSuperview](self->_secondaryLabel, "removeFromSuperview");
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = 0;

  secondaryText = self->_secondaryText;
  self->_secondaryText = 0;

  self->_topPadding = 0.0;
  self->_bottomPadding = 0.0;
  -[PKCollectionSectionHeaderView _resetFont](self, "_resetFont");
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (void)setPrimaryFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 904);
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (void)setSecondaryFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 912);
}

- (double)topPadding
{
  return self->_topPadding;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
