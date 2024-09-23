@implementation PKExpiredPassesTableViewCell

+ (double)height
{
  uint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 80.0;
  if (!v2)
    return 64.0;
  return result;
}

- (PKExpiredPassesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{

  return 0;
}

- (PKExpiredPassesTableViewCell)initWithReuseIdentifier:(id)a3
{
  PKExpiredPassesTableViewCell *v3;
  PKExpiredPassesTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKExpiredPassesTableViewCell;
  v3 = -[PKExpiredPassesTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, 3, a3);
  v4 = v3;
  if (v3)
  {
    v3->_isRTL = -[PKExpiredPassesTableViewCell _shouldReverseLayoutDirection](v3, "_shouldReverseLayoutDirection");
    v4->_configuration.small = PKUIGetMinScreenWidthType() == 0;
    -[PKExpiredPassesTableViewCell _determineAccessibilitySettings](v4);
    -[PKExpiredPassesTableViewCell textLabel](v4, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExpiredPassesTableViewCell _configurePrimaryTextLabel](v4);
    objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    -[PKExpiredPassesTableViewCell detailTextLabel](v4, "detailTextLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExpiredPassesTableViewCell _configureDetailTextLabel](v4);
    objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    v11[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)-[PKExpiredPassesTableViewCell registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v7, &__block_literal_global_181);

    -[PKExpiredPassesTableViewCell setSeparatorInset:](v4, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[PKExpiredPassesTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67DE0]);

  }
  return v4;
}

- (void)_determineAccessibilitySettings
{
  void *v2;
  NSComparisonResult v3;
  BOOL v4;
  NSString *category;

  if (a1)
  {
    objc_msgSend(a1, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredContentSizeCategory");
    category = (NSString *)objc_claimAutoreleasedReturnValue();

    if (UIContentSizeCategoryIsAccessibilityCategory(category))
    {
      a1[1025] = 1;
      v3 = UIContentSizeCategoryCompareToCategory(category, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]);
      a1[1026] = 1;
      if (v3 != NSOrderedAscending)
      {
        a1[1027] = 1;
LABEL_10:

        return;
      }
    }
    else
    {
      a1[1026] = UIContentSizeCategoryCompareToCategory(category, (UIContentSizeCategory)*MEMORY[0x1E0DC48F0]) == NSOrderedSame;
      if (a1[1026])
        v4 = 1;
      else
        v4 = PKUIGetMinScreenWidthType() == 0;
      a1[1025] = v4;
    }
    a1[1027] = 0;
    goto LABEL_10;
  }
}

- (void)_configurePrimaryTextLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1, "textLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48B8], 0x8000, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v2);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v3);

    if (a1[1027])
      v4 = 2;
    else
      v4 = 1;
    objc_msgSend(v5, "setNumberOfLines:", v4);
    objc_msgSend(v5, "setLineBreakMode:", 4 * (a1[1027] == 0));

  }
}

- (void)_configureDetailTextLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a1, "detailTextLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], (void *)*MEMORY[0x1E0DC48C0], 0x8000, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v2);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v3);

    if (a1[1027])
    {
      v4 = 4;
    }
    else
    {
      if (a1[1024])
      {
        v5 = 4;
        v4 = 1;
        goto LABEL_7;
      }
      v4 = 2;
    }
    v5 = 0;
LABEL_7:
    objc_msgSend(v6, "setNumberOfLines:", v4);
    objc_msgSend(v6, "setLineBreakMode:", v5);

  }
}

void __56__PKExpiredPassesTableViewCell_initWithReuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v2;

  v2 = a2;
  -[PKExpiredPassesTableViewCell _determineAccessibilitySettings](v2);
  -[PKExpiredPassesTableViewCell _configurePrimaryTextLabel](v2);
  -[PKExpiredPassesTableViewCell _configureDetailTextLabel](v2);
  objc_msgSend(v2, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  if (self->_shouldTreatAsAX && self->_isAccessibilityCategory)
  {
    self->_sizing = 1;
    width = -[PKExpiredPassesTableViewCell _layoutWithBounds:]((uint64_t)self, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, 1.79769313e308);
    self->_sizing = 0;
  }
  else
  {
    v5 = 80.0;
    if (self->_configuration.small)
      v5 = 64.0;
  }
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (double)_layoutWithBounds:(double)a3
{
  CGRectEdge v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  char v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  int v24;
  CGFloat v25;
  CGRectEdge v26;
  double x;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v41;
  double v42;
  CGRect slice;
  CGRect remainder;
  _QWORD v45[2];
  unsigned __int8 v46;
  CGRect v47;

  if (!a1)
    return 0.0;
  v10 = 2 * *(unsigned __int8 *)(a1 + 1028);
  PKContentAlignmentMake();
  memset(&slice, 0, sizeof(slice));
  v11 = 10.0;
  if (!*(_BYTE *)(a1 + 1028))
    v11 = 16.0;
  v12 = a2 + v11;
  v13 = a3 + 8.0;
  objc_msgSend((id)a1, "contentView", *(_QWORD *)&a3, *(_QWORD *)&a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15 + -26.0;

  remainder.origin.x = v12;
  remainder.origin.y = a3 + 8.0;
  v17 = *(_BYTE *)(a1 + 1024);
  remainder.size.width = v16;
  remainder.size.height = a5 + -16.0;
  v18 = 64.0;
  if ((v17 & 1) == 0)
    v18 = 80.0;
  v19 = v18 + -8.0;
  v20 = v18 + -6.0;
  if ((v17 & 1) != 0)
    v21 = v19;
  else
    v21 = v20;
  if ((v17 & 1) != 0)
    v22 = 36.0;
  else
    v22 = 80.0;
  v23 = *(_QWORD *)(a1 + 1032);
  if (v23)
  {
    -[PKPassThumbnailView _layoutWithBounds:commit:](v23, 0, (uint64_t)v45, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v22, v21);
    v22 = *(double *)v45;
    v21 = *(double *)&v45[1];
    v24 = v46;
  }
  else
  {
    v24 = 0;
  }
  if (*(_BYTE *)(a1 + 1027))
    v25 = v21;
  else
    v25 = v22;
  if (*(_BYTE *)(a1 + 1027))
    v26 = CGRectMinYEdge;
  else
    v26 = v10;
  v47.origin.x = v12;
  v47.origin.y = v13;
  v47.size.width = v16;
  v47.size.height = a5 + -16.0;
  CGRectDivide(v47, &slice, &remainder, v25, v26);
  x = slice.origin.x;
  if (*(_BYTE *)(a1 + 1025))
  {
    if (*(_BYTE *)(a1 + 1027))
    {
      v28 = a4;
      goto LABEL_30;
    }
    v28 = a4;
    if (*(_QWORD *)(a1 + 1056) && *(_QWORD *)(a1 + 1064))
      goto LABEL_28;
  }
  else
  {
    v28 = a4;
    if (!v24)
    {
LABEL_28:
      PKFloatRoundToPixel();
      v13 = v13 + v29;
      goto LABEL_30;
    }
  }
  v13 = v41 + v42 - v21;
LABEL_30:
  objc_msgSend(*(id *)(a1 + 1032), "setFrame:", x, v13, v22, v21);
  if (!*(_BYTE *)(a1 + 1027))
    CGRectDivide(remainder, &slice, &remainder, 12.0, v10);
  v30 = 0.0;
  objc_msgSend((id)a1, "setSeparatorInset:", 0.0, remainder.origin.x, 0.0, 0.0);
  objc_msgSend((id)a1, "textLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "detailTextLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &slice, &remainder, v33, CGRectMinYEdge);
  if (!*(_BYTE *)(a1 + 1029))
  {
    PKSizeAlignedInRect();
    objc_msgSend(v31, "setFrame:");
  }
  objc_msgSend(v32, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &slice, &remainder, v34, CGRectMinYEdge);
  if (!*(_BYTE *)(a1 + 1029))
  {
    PKSizeAlignedInRect();
    v37 = v35 + v36;
    objc_msgSend(v32, "setFrame:");
    v30 = (double)(uint64_t)v37;
  }
  if (*(_BYTE *)(a1 + 1029) || *(_BYTE *)(a1 + 1027))
    goto LABEL_44;
  if (v30 >= v41 + v42)
  {
    PKFloatRoundToPixel();
    v38 = -v39;
LABEL_42:
    if ((uint64_t)v38)
    {
      __50__PKExpiredPassesTableViewCell__layoutWithBounds___block_invoke(v31);
      __50__PKExpiredPassesTableViewCell__layoutWithBounds___block_invoke(v32);
    }
    goto LABEL_44;
  }
  if (remainder.size.height != 0.0)
  {
    PKFloatRoundToPixel();
    goto LABEL_42;
  }
LABEL_44:

  return v28;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKExpiredPassesTableViewCell;
  -[PKExpiredPassesTableViewCell layoutSubviews](&v7, sel_layoutSubviews);
  -[PKExpiredPassesTableViewCell bounds](self, "bounds");
  -[PKExpiredPassesTableViewCell _layoutWithBounds:]((uint64_t)self, v3, v4, v5, v6);
}

void __50__PKExpiredPassesTableViewCell__layoutWithBounds___block_invoke(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "frame");
  objc_msgSend(v1, "setFrame:");

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKExpiredPassesTableViewCell;
  -[PKExpiredPassesTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKExpiredPassesTableViewCell setPass:](self, "setPass:", 0);
  -[PKExpiredPassesTableViewCell setPrimaryText:](self, "setPrimaryText:", 0);
  -[PKExpiredPassesTableViewCell setDetailText:](self, "setDetailText:", 0);
  -[PKExpiredPassesTableViewCell setSecondaryDetailText:](self, "setSecondaryDetailText:", 0);
}

- (void)setPass:(id)a3
{
  PKPass *v5;
  void **p_pass;
  PKPassThumbnailView *thumbnailView;
  void *v8;
  PKPass *v9;
  PKPass *v10;
  PKPassThumbnailView *v11;
  PKPassThumbnailView *v12;
  PKPassThumbnailView *v13;
  void *v14;
  PKPassThumbnailView *v15;
  PKPass *v16;

  v5 = (PKPass *)a3;
  p_pass = (void **)&self->_pass;
  if (self->_pass != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_pass, a3);
    thumbnailView = self->_thumbnailView;
    v8 = *p_pass;
    if (thumbnailView)
    {
      if (!v8)
      {
LABEL_12:
        -[PKPassThumbnailView removeFromSuperview](self->_thumbnailView, "removeFromSuperview");
        v15 = self->_thumbnailView;
        self->_thumbnailView = 0;

        goto LABEL_13;
      }
      v9 = thumbnailView->_pass;
      v10 = (PKPass *)*p_pass;

      v8 = *p_pass;
      if (v9 != v10)
      {
        -[PKPassThumbnailView setPass:]((uint64_t)self->_thumbnailView, v8);
LABEL_13:
        v5 = v16;
        goto LABEL_14;
      }
    }
    if (v8)
    {
      v11 = [PKPassThumbnailView alloc];
      if (v11)
        v11 = (PKPassThumbnailView *)-[PKPassThumbnailView initWithPass:suppressedContent:rendererState:options:](v11, *p_pass, 0, 0, 0);
      v12 = self->_thumbnailView;
      self->_thumbnailView = v11;

      -[PKPassThumbnailView setShadowVisibility:]((uint64_t)self->_thumbnailView, 0.0);
      v13 = self->_thumbnailView;
      if (v13)
        v13->_preferMinimumHeight = 0;
      -[PKExpiredPassesTableViewCell contentView](self, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", self->_thumbnailView);

      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_14:

}

- (void)setPrimaryText:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *primaryText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;

  v4 = a3;
  -[PKExpiredPassesTableViewCell textLabel](self, "textLabel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && !v5)
  {

    v4 = 0;
  }
  primaryText = self->_primaryText;
  v12 = (NSString *)v4;
  v8 = primaryText;
  if (v12 == v8)
  {

  }
  else
  {
    if (v12 && v8)
    {
      v9 = -[NSString isEqualToString:](v12, "isEqualToString:", v8);

      if (v9)
        goto LABEL_13;
    }
    else
    {

    }
    v10 = (NSString *)-[NSString copy](v12, "copy");
    v11 = self->_primaryText;
    self->_primaryText = v10;

    if (v6)
    {
      objc_msgSend(v6, "setText:", self->_primaryText);
      -[PKExpiredPassesTableViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
LABEL_13:

}

- (void)setDetailText:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *detailText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  NSString *v13;

  v4 = a3;
  -[PKExpiredPassesTableViewCell detailTextLabel](self, "detailTextLabel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && !v5)
  {

    v4 = 0;
  }
  detailText = self->_detailText;
  v13 = (NSString *)v4;
  v8 = detailText;
  if (v13 == v8)
  {

  }
  else
  {
    if (v13 && v8)
    {
      v9 = -[NSString isEqualToString:](v13, "isEqualToString:", v8);

      if (v9)
        goto LABEL_13;
    }
    else
    {

    }
    v10 = (NSString *)-[NSString copy](v13, "copy");
    v11 = self->_detailText;
    self->_detailText = v10;

    if (v6)
    {
      -[PKExpiredPassesTableViewCell buildDetailTextLabelContent](self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setText:", v12);

      -[PKExpiredPassesTableViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
LABEL_13:

}

- (_QWORD)buildDetailTextLabelContent
{
  void *v1;
  void *v2;

  if (a1)
  {
    v1 = (void *)a1[132];
    v2 = (void *)a1[133];
    if (v1)
    {
      if (!v2)
        return v1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v1, v2);
      a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2)
        return v2;
      a1 = 0;
    }
  }
  return a1;
}

- (void)setSecondaryDetailText:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *secondaryDetailText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  NSString *v13;

  v4 = a3;
  -[PKExpiredPassesTableViewCell detailTextLabel](self, "detailTextLabel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && !v5)
  {

    v4 = 0;
  }
  secondaryDetailText = self->_secondaryDetailText;
  v13 = (NSString *)v4;
  v8 = secondaryDetailText;
  if (v13 == v8)
  {

  }
  else
  {
    if (v13 && v8)
    {
      v9 = -[NSString isEqualToString:](v13, "isEqualToString:", v8);

      if (v9)
        goto LABEL_13;
    }
    else
    {

    }
    v10 = (NSString *)-[NSString copy](v13, "copy");
    v11 = self->_secondaryDetailText;
    self->_secondaryDetailText = v10;

    if (v6)
    {
      -[PKExpiredPassesTableViewCell buildDetailTextLabelContent](self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setText:", v12);

      -[PKExpiredPassesTableViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
LABEL_13:

}

- (PKPass)pass
{
  return self->_pass;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSString)secondaryDetailText
{
  return self->_secondaryDetailText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryDetailText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
}

@end
