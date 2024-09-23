@implementation PKSettingsDetailValueCell

- (PKSettingsDetailValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PKSettingsDetailValueCell *v9;
  uint64_t v10;
  UITableViewCellLayoutManager *layoutManager;
  void *v12;
  UILabel *v13;
  UILabel *textLabel;
  UILabel *v15;
  uint64_t v16;
  void *v17;
  UILabel *v18;
  UILabel *detailTextLabel;
  UILabel *v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v8 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PKSettingsDetailValueCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v27, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DC3D58], "layoutManagerForTableViewCellStyle:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    layoutManager = v9->_layoutManager;
    v9->_layoutManager = (UITableViewCellLayoutManager *)v10;

    -[PKSettingsDetailValueCell contentView](v9, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v9->_textLabel;
    v9->_textLabel = v13;

    v15 = v9->_textLabel;
    v16 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v17);

    objc_msgSend(v12, "addSubview:", v9->_textLabel);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailTextLabel = v9->_detailTextLabel;
    v9->_detailTextLabel = v18;

    -[UILabel setNumberOfLines:](v9->_detailTextLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v9->_detailTextLabel, "setLineBreakMode:", 0);
    v20 = v9->_detailTextLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    objc_msgSend(v12, "addSubview:", v9->_detailTextLabel);
    -[PKSettingsDetailValueCell traitCollection](v9, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferredContentSizeCategory");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();

    v9->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v23, (UIContentSizeCategory)*MEMORY[0x1E0DC4918]) == NSOrderedDescending;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pkSettingsContext"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_settingsContext = (int)objc_msgSend(v24, "intValue");

    if (v9->_settingsContext == 1)
    {
      PKBridgeAppearanceGetAppearanceSpecifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PKAppearanceApplyToContainer(v25, v9);

    }
  }

  return v9;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSettingsDetailValueCell;
  -[PSTableCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKSettingsDetailValueCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKSettingsDetailValueCell _layoutWithContentViewBounds:applyLayout:](self, "_layoutWithContentViewBounds:applyLayout:", 1);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[UITableViewCellLayoutManager contentRectForCell:forState:rowWidth:](self->_layoutManager, "contentRectForCell:forState:rowWidth:", self, 0, a3.width, a3.height);
  -[PKSettingsDetailValueCell _layoutWithContentViewBounds:applyLayout:](self, "_layoutWithContentViewBounds:applyLayout:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithContentViewBounds:(CGRect)a3 applyLayout:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  int v10;
  CGRectEdge v11;
  CGRectEdge v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  UILabel *v23;
  void *v24;
  double v25;
  uint64_t v26;
  double v27;
  UILabel *textLabel;
  UILabel *detailTextLabel;
  void *v30;
  double v31;
  double v32;
  UILabel *v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect remainder;
  CGSize result;
  CGRect v39;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[PKSettingsDetailValueCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v10)
    v11 = CGRectMaxXEdge;
  else
    v11 = CGRectMinXEdge;
  if (v10)
    v12 = CGRectMinXEdge;
  else
    v12 = CGRectMaxXEdge;
  v13 = PKTableViewCellTextInset();
  memset(&v36, 0, sizeof(v36));
  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = height;
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  CGRectDivide(v39, &v36, &remainder, v13, v11);
  if (self->_settingsContext == 1)
    CGRectDivide(remainder, &v36, &remainder, 8.0, v12);
  v14 = remainder.size.width;
  -[UILabel attributedText](self->_textLabel, "attributedText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pkui_sizeThatFits:withNumberOfLines:", 1, v14, 1.79769313e308);
  v17 = v16;
  v19 = v18;

  -[UILabel attributedText](self->_detailTextLabel, "attributedText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pkui_sizeThatFits:withNumberOfLines:", 1, v14, 1.79769313e308);
  v22 = v21;

  if (v13 + v13 + v17 + 16.0 + v22 <= width)
  {
    v27 = fmax(v19 + 11.0 + 11.0, 44.0);
    if (v4)
    {
      CGRectDivide(remainder, &v36, &remainder, v17, v11);
      textLabel = self->_textLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](textLabel, "setFrame:");
      CGRectDivide(remainder, &v36, &remainder, v22, v12);
      detailTextLabel = self->_detailTextLabel;
LABEL_17:
      PKSizeAlignedInRect();
      -[UILabel setFrame:](detailTextLabel, "setFrame:");
    }
  }
  else
  {
    v23 = self->_textLabel;
    if (self->_usesAccessibilityLayout)
    {
      -[UILabel attributedText](v23, "attributedText");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "pkui_sizeThatFits:", v14, 1.79769313e308);
      v19 = v25;

      -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", 0);
      v26 = 0;
    }
    else
    {
      -[UILabel setNumberOfLines:](v23, "setNumberOfLines:", 1);
      v26 = 4;
    }
    -[UILabel setLineBreakMode:](self->_textLabel, "setLineBreakMode:", v26);
    -[UILabel attributedText](self->_detailTextLabel, "attributedText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "pkui_sizeThatFits:", v14, 1.79769313e308);
    v32 = v31;

    v27 = fmax(v19 + 11.0 + 3.0 + v32 + 11.0, 44.0);
    if (v4)
    {
      CGRectDivide(remainder, &v36, &remainder, 11.0, CGRectMinYEdge);
      CGRectDivide(remainder, &v36, &remainder, 11.0, CGRectMaxYEdge);
      CGRectDivide(remainder, &v36, &remainder, v19, CGRectMinYEdge);
      v33 = self->_textLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v33, "setFrame:");
      CGRectDivide(remainder, &v36, &remainder, v32, CGRectMaxYEdge);
      detailTextLabel = self->_detailTextLabel;
      goto LABEL_17;
    }
  }
  v34 = width;
  v35 = v27;
  result.height = v35;
  result.width = v34;
  return result;
}

- (id)textLabel
{
  return self->_textLabel;
}

- (id)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
