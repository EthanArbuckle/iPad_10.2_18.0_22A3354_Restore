@implementation PKRewardsTierTableViewCell

- (PKRewardsTierTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKRewardsTierTableViewCell *v4;
  PKRewardsTierTableViewCell *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *tierIcon;
  void *v9;
  UILabel *v10;
  UILabel *titleLabel;
  UILabel *v12;
  NSString *v13;
  NSString *v14;
  void *v15;
  UILabel *v16;
  UILabel *subtitleLabel;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  UIButton *v22;
  UIButton *linkButton;
  void *v24;
  void *v25;
  void *v26;
  UIButton *v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PKRewardsTierTableViewCell;
  v4 = -[PKRewardsTierTableViewCell initWithStyle:reuseIdentifier:](&v30, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PKRewardsTierTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    tierIcon = v5->_tierIcon;
    v5->_tierIcon = v7;

    -[UIImageView setContentMode:](v5->_tierIcon, "setContentMode:", 1);
    -[UIImageView layer](v5->_tierIcon, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(v9, "setCornerRadius:", 6.0);
    objc_msgSend(v9, "setMasksToBounds:", 1);
    objc_msgSend(v6, "addSubview:", v5->_tierIcon);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v10;

    v12 = v5->_titleLabel;
    v13 = (NSString *)*MEMORY[0x1E0DC4B10];
    v14 = (NSString *)*MEMORY[0x1E0DC48C8];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48C8], *MEMORY[0x1E0DC1420]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v15);

    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    objc_msgSend(v6, "addSubview:", v5->_titleLabel);
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v16;

    v18 = v5->_subtitleLabel;
    PKFontForDefaultDesign(v13, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18, "setFont:", v19);

    -[UILabel setNumberOfLines:](v5->_subtitleLabel, "setNumberOfLines:", 0);
    v20 = v5->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    objc_msgSend(v6, "addSubview:", v5->_subtitleLabel);
    v22 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    linkButton = v5->_linkButton;
    v5->_linkButton = v22;

    -[UIButton titleLabel](v5->_linkButton, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setNumberOfLines:", 0);

    -[UIButton setContentHorizontalAlignment:](v5->_linkButton, "setContentHorizontalAlignment:", 1);
    -[UIButton titleLabel](v5->_linkButton, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign(v13, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFont:", v26);

    v27 = v5->_linkButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v27, "setTitleColor:forState:", v28, 0);

    -[UIButton addTarget:action:forControlEvents:](v5->_linkButton, "addTarget:action:forControlEvents:", v5, sel_linkAction, 64);
    objc_msgSend(v6, "addSubview:", v5->_linkButton);

  }
  return v5;
}

- (void)linkAction
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didPressLinkInCell:", self);

}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *title;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  title = self->_title;
  v10 = (NSString *)v4;
  v6 = title;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = -[NSString isEqualToString:](v10, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    v9 = self->_title;
    self->_title = v8;

    -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
    -[PKRewardsTierTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setSubtitle:(id)a3
{
  id v4;
  NSString *subtitle;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  subtitle = self->_subtitle;
  v10 = (NSString *)v4;
  v6 = subtitle;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = -[NSString isEqualToString:](v10, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    v9 = self->_subtitle;
    self->_subtitle = v8;

    -[UILabel setText:](self->_subtitleLabel, "setText:", self->_subtitle);
    -[PKRewardsTierTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setLink:(id)a3
{
  id v4;
  NSString *link;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  link = self->_link;
  v10 = (NSString *)v4;
  v6 = link;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = -[NSString isEqualToString:](v10, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    v9 = self->_link;
    self->_link = v8;

    -[UIButton setTitle:forState:](self->_linkButton, "setTitle:forState:", self->_link, 0);
    -[PKRewardsTierTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKRewardsTierTableViewCell;
  -[PKRewardsTierTableViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKRewardsTierTableViewCell bounds](self, "bounds");
  -[PKRewardsTierTableViewCell _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKRewardsTierTableViewCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRectEdge v8;
  UIImageView *tierIcon;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect slice;
  CGRect remainder;
  CGSize result;
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PKRewardsTierTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v8 = CGRectMaxXEdge;
  else
    v8 = CGRectMinXEdge;
  memset(&slice, 0, sizeof(slice));
  v28.origin.x = x + 16.0;
  v28.origin.y = y + 16.0;
  v28.size.width = width + -32.0;
  remainder.origin.x = x + 16.0;
  remainder.origin.y = y + 16.0;
  v28.size.height = height + -32.0;
  remainder.size.width = width + -32.0;
  remainder.size.height = height + -32.0;
  CGRectDivide(v28, &slice, &remainder, 40.0, v8);
  if (!self->_isTemplateLayout)
  {
    memset(&v24, 0, sizeof(v24));
    CGRectDivide(slice, &v24, &slice, 10.0, CGRectMinYEdge);
    tierIcon = self->_tierIcon;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](tierIcon, "setFrame:");
  }
  CGRectDivide(remainder, &slice, &remainder, 16.0, v8);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v11 = v10;
  CGRectDivide(remainder, &slice, &remainder, v10, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  CGRectDivide(remainder, &slice, &remainder, 4.0, CGRectMinYEdge);
  v12 = v11 + 16.0 + 4.0;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v14 = v13;
  CGRectDivide(remainder, &slice, &remainder, v13, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  v15 = v12 + v14;
  -[UIButton titleLabel](self->_linkButton, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    CGRectDivide(remainder, &slice, &remainder, 11.0, CGRectMinYEdge);
    v19 = v15 + 11.0;
    -[UIButton sizeThatFits:](self->_linkButton, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v21 = v20;
    CGRectDivide(remainder, &slice, &remainder, v20, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
      -[UIButton setFrame:](self->_linkButton, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    v15 = v19 + v21;
  }
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v22 = CGRectGetWidth(v29);
  v23 = v15 + 16.0;
  result.height = v23;
  result.width = v22;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImageView)tierIcon
{
  return self->_tierIcon;
}

- (NSString)link
{
  return self->_link;
}

- (PKRewardsTierTableViewCellDelegate)delegate
{
  return (PKRewardsTierTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_tierIcon, 0);
}

@end
