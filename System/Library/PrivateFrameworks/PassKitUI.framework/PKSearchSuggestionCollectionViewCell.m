@implementation PKSearchSuggestionCollectionViewCell

- (PKSearchSuggestionCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKSearchSuggestionCollectionViewCell *v3;
  PKSearchSuggestionCollectionViewCell *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UILabel *labelSuggestion;
  uint64_t v13;
  UIImageView *imageViewIcon;
  UIImageView *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKSearchSuggestionCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKSearchSuggestionCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    labelSuggestion = v4->_labelSuggestion;
    v4->_labelSuggestion = (UILabel *)v11;

    -[UILabel setLineBreakMode:](v4->_labelSuggestion, "setLineBreakMode:", 4);
    objc_msgSend(v5, "addSubview:", v4->_labelSuggestion);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v7, v8, v9, v10);
    imageViewIcon = v4->_imageViewIcon;
    v4->_imageViewIcon = (UIImageView *)v13;

    -[UIImageView setContentMode:](v4->_imageViewIcon, "setContentMode:", 1);
    v15 = v4->_imageViewIcon;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v15, "setTintColor:", v16);

    objc_msgSend(v5, "addSubview:", v4->_imageViewIcon);
    -[PKSearchSuggestionCollectionViewCell resetFonts](v4, "resetFonts");

  }
  return v4;
}

- (void)resetFonts
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  UILabel *labelSuggestion;
  id v7;

  -[PKSearchSuggestionCollectionViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  -[UILabel setNumberOfLines:](self->_labelSuggestion, "setNumberOfLines:", !IsAccessibilityCategory);
  labelSuggestion = self->_labelSuggestion;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4938]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](labelSuggestion, "setFont:", v7);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSearchSuggestionCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKSearchSuggestionCollectionViewCell bounds](self, "bounds");
  -[PKSearchSuggestionCollectionViewCell _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKSearchSuggestionCollectionViewCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  int v8;
  CGRectEdge v9;
  CGRectEdge v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIImageView *imageViewIcon;
  double v20;
  double v21;
  CGRect v22;
  CGRect slice;
  CGSize result;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[PKSearchSuggestionCollectionViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  memset(&slice, 0, sizeof(slice));
  if (v8)
    v9 = CGRectMaxXEdge;
  else
    v9 = CGRectMinXEdge;
  if (v8)
    v10 = CGRectMinXEdge;
  else
    v10 = CGRectMaxXEdge;
  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset", *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width);
  v12 = v11;
  -[UILabel font](self->_labelSuggestion, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lineHeight");
  v15 = v14;

  -[UILabel sizeThatFits:](self->_labelSuggestion, "sizeThatFits:", width - v15 + -8.0 + v12 * -2.0, height + -20.0);
  v17 = v16 + 20.0;
  if (v16 + 20.0 >= 44.0)
    v18 = v16 + 20.0;
  else
    v18 = 44.0;
  v22.size.height = v18;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = v18;
  CGRectDivide(v25, &slice, &v22, 10.0, CGRectMinYEdge);
  CGRectDivide(v22, &slice, &v22, 10.0, CGRectMaxYEdge);
  CGRectDivide(v22, &slice, &v22, v12, v9);
  CGRectDivide(v22, &slice, &v22, v12, v10);
  CGRectDivide(v22, &slice, &v22, v15, v9);
  if (!self->_isTemplateLayout)
  {
    imageViewIcon = self->_imageViewIcon;
    if (v17 >= 44.0)
      PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](imageViewIcon, "setFrame:");
  }
  CGRectDivide(v22, &slice, &v22, 8.0, v9);
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_labelSuggestion, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  v20 = width;
  v21 = v18;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKSearchSuggestionCollectionViewCell;
  -[PKSearchSuggestionCollectionViewCell traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKSearchSuggestionCollectionViewCell traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
        -[PKSearchSuggestionCollectionViewCell resetFonts](self, "resetFonts");
    }
  }

}

- (void)setIcon:(id)a3
{
  -[UIImageView setImage:](self->_imageViewIcon, "setImage:", a3);
}

- (void)setSuggestion:(id)a3
{
  -[UILabel setText:](self->_labelSuggestion, "setText:", a3);
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_imageViewIcon, 0);
  objc_storeStrong((id *)&self->_labelSuggestion, 0);
}

@end
