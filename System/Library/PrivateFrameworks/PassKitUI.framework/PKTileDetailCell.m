@implementation PKTileDetailCell

- (PKTileDetailCell)initWithSize:(CGSize)a3
{
  return -[PKTileDetailCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKTileDetailCell)initWithFrame:(CGRect)a3
{
  PKTileDetailCell *v3;
  PKTileDetailCell *v4;
  int v5;
  void *v6;
  UILabel *v7;
  UILabel *titleLabel;
  UILabel *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  UILabel *v13;
  UILabel *subtitleLabel;
  UILabel *v15;
  NSString *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  UILabel *textLabel;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  UILabel *detailLabel;
  UILabel *v28;
  void *v29;
  UILabel *v30;
  void *v31;
  UILabel *v32;
  UILabel *textSubtitleLabel;
  UILabel *v34;
  void *v35;
  UILabel *v36;
  void *v37;
  void *v38;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)PKTileDetailCell;
  v3 = -[PKTileDetailCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = -[PKTileDetailCell _shouldReverseLayoutDirection](v3, "_shouldReverseLayoutDirection");
    -[PKTileDetailCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v7;

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    v9 = v4->_titleLabel;
    v10 = (NSString *)*MEMORY[0x1E0DC48D0];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B60], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v11);

    if (v5)
      v12 = 2;
    else
      v12 = 0;
    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", v12);
    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(v6, "addSubview:", v4->_titleLabel);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v13;

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0);
    v15 = v4->_subtitleLabel;
    v16 = (NSString *)*MEMORY[0x1E0DC4A90];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A90], v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v17);

    v18 = v4->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v18, "setTextColor:", v19);

    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", v12);
    -[UILabel setAccessibilityIdentifier:](v4->_subtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    objc_msgSend(v6, "addSubview:", v4->_subtitleLabel);
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v20;

    -[UILabel setNumberOfLines:](v4->_textLabel, "setNumberOfLines:", 0);
    v22 = v4->_textLabel;
    PKFontForDefaultDesign(v16, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v22, "setFont:", v23);

    v24 = v4->_textLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v24, "setTextColor:", v25);

    -[UILabel setTextAlignment:](v4->_textLabel, "setTextAlignment:", 4);
    -[UILabel setAccessibilityIdentifier:](v4->_textLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FF0]);
    objc_msgSend(v6, "addSubview:", v4->_textLabel);
    v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v26;

    -[UILabel setNumberOfLines:](v4->_detailLabel, "setNumberOfLines:", 0);
    v28 = v4->_detailLabel;
    PKFontForDefaultDesign(v16, v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v28, "setFont:", v29);

    v30 = v4->_detailLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v30, "setTextColor:", v31);

    -[UILabel setTextAlignment:](v4->_detailLabel, "setTextAlignment:", 4);
    -[UILabel setAccessibilityIdentifier:](v4->_detailLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
    objc_msgSend(v6, "addSubview:", v4->_detailLabel);
    v32 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textSubtitleLabel = v4->_textSubtitleLabel;
    v4->_textSubtitleLabel = v32;

    -[UILabel setNumberOfLines:](v4->_textSubtitleLabel, "setNumberOfLines:", 0);
    v34 = v4->_textSubtitleLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AA0], v10);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v34, "setFont:", v35);

    v36 = v4->_textSubtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v36, "setTextColor:", v37);

    -[UILabel setTextAlignment:](v4->_textSubtitleLabel, "setTextAlignment:", 4);
    -[UILabel setAccessibilityIdentifier:](v4->_textSubtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE8]);
    objc_msgSend(v6, "addSubview:", v4->_textSubtitleLabel);
    objc_msgSend(v6, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setCornerRadius:", 10.0);
    objc_msgSend(v38, "setMasksToBounds:", 1);

  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  UIColor *v8;
  UIColor *backgroundColor;
  UIColor *v10;
  void *v11;
  UIColor *v12;
  _QWORD v13[5];
  UIColor *v14;
  objc_super v15;

  v3 = a3;
  if ((-[PKTileDetailCell isHighlighted](self, "isHighlighted") & 1) == 0 && !self->_backgroundColor)
  {
    -[PKTileDetailCell backgroundConfiguration](self, "backgroundConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[PKTileDetailCell backgroundColor](self, "backgroundColor");
      v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v8;

  }
  v15.receiver = self;
  v15.super_class = (Class)PKTileDetailCell;
  -[PKTileDetailCell setHighlighted:](&v15, sel_setHighlighted_, v3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = self->_backgroundColor;
  }
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __35__PKTileDetailCell_setHighlighted___block_invoke;
  v13[3] = &unk_1E3E61388;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v13, 0);

}

uint64_t __35__PKTileDetailCell_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTileDetailCell;
  -[PKTileDetailCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKTileDetailCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKTileDetailCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKTileDetailCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
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
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  int v15;
  CGRectEdge v16;
  CGRectEdge v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  void *v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  UIView *customView;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  double v76;
  double v77;
  double v78;
  CGFloat v79;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  CGSize v84;
  CGPoint origin;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect slice;
  CGRect remainder;
  CGRect v98;
  CGSize result;
  CGRect v100;
  CGRect v101;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = PKTableViewCellTextInset();
  v11 = x + v10;
  v12 = y + 15.0;
  v81 = PKTableViewCellTextInset();
  v82 = v10;
  v83 = width;
  v13 = width - (v10 + v81);
  v14 = -[PKTileDetailCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v15 = v14;
  if (v14)
    v16 = CGRectMaxXEdge;
  else
    v16 = CGRectMinXEdge;
  if (v14)
    v17 = CGRectMinXEdge;
  else
    v17 = CGRectMaxXEdge;
  memset(&v98, 0, sizeof(v98));
  remainder.origin.x = v11;
  remainder.origin.y = y + 15.0;
  remainder.size.width = v13;
  remainder.size.height = height + -30.0;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v13, height);
  v79 = v18;
  -[UILabel sizeThatFits:](self->_textSubtitleLabel, "sizeThatFits:", v13, height);
  v80 = v19;
  -[UIImageView sizeThatFits:](self->_accessoryView, "sizeThatFits:", v13, height);
  v21 = v20;
  v23 = v22;
  v24 = v20 + 5.0;
  if (!self->_accessoryView)
    v24 = 0.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v13 - v24, height + -30.0);
  v26 = fmax(v25, v23);
  v84 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  origin = slice.origin;
  slice.size = v84;
  v100.origin.x = v11;
  v100.origin.y = v12;
  v100.size.width = v13;
  v100.size.height = height + -30.0;
  CGRectDivide(v100, &slice, &remainder, v26, CGRectMinYEdge);
  PKSizeAlignedInRect();
  slice = v101;
  v27 = v26 + 0.0;
  memset(&v95, 0, sizeof(v95));
  CGRectDivide(v101, &v95, &slice, v21, v17);
  CGRectDivide(slice, &v98, &slice, 5.0, v17);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v95.origin.x = v28;
  v95.origin.y = v29;
  v95.size.width = v30;
  v95.size.height = v31;
  -[UILabel font](self->_titleLabel, "font");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "descender");
  v95.origin.y = v95.origin.y + v33 * -0.5;

  v94.origin = origin;
  v94.size = v84;
  if (self->_subtitleText)
  {
    CGRectDivide(remainder, &v98, &remainder, 5.0, CGRectMinYEdge);
    CGRectDivide(remainder, &v94, &remainder, v79, CGRectMinYEdge);
    PKSizeAlignedInRect();
    v94.origin.x = v34;
    v94.origin.y = v35;
    v94.size.width = v36;
    v94.size.height = v37;
    v27 = v79 + 5.0 + v27;
  }
  v93.origin = origin;
  v93.size = v84;
  if (self->_seperatorForCustomView)
  {
    CGRectDivide(remainder, &v98, &remainder, 15.0, CGRectMinYEdge);
    v38 = PKUIPixelLength();
    CGRectDivide(remainder, &v93, &remainder, v38, CGRectMinYEdge);
    PKSizeAlignedInRect();
    v93.origin.x = v40;
    v93.origin.y = v41;
    if (v15)
      v42 = v81;
    else
      v42 = v82;
    v93.size.width = v83 - v42;
    v93.size.height = v39;
    v27 = v27 + v38 + 15.0;
  }
  v92.origin = origin;
  v92.size = v84;
  customView = self->_customView;
  if (customView)
  {
    if (self->_seperatorForCustomView
      && (CGRectDivide(remainder, &v98, &remainder, 15.0, CGRectMinYEdge),
          v27 = v27 + 15.0,
          (customView = self->_customView) == 0))
    {
      v45 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    else
    {
      -[UIView sizeThatFits:](customView, "sizeThatFits:", v13, height);
      v45 = v44;
    }
    CGRectDivide(remainder, &v92, &remainder, v45, CGRectMinYEdge);
    PKSizeAlignedInRect();
    v92.origin.x = v46;
    v92.origin.y = v47;
    v92.size.width = v48;
    v92.size.height = v49;
    v27 = v27 + v45;
  }
  v91.origin = origin;
  v91.size = v84;
  if (self->_seperatorForText)
  {
    CGRectDivide(remainder, &v98, &remainder, 15.0, CGRectMinYEdge);
    v50 = PKUIPixelLength();
    CGRectDivide(remainder, &v91, &remainder, v50, CGRectMinYEdge);
    PKSizeAlignedInRect();
    v91.origin.x = v52;
    v91.origin.y = v53;
    if (v15)
      v54 = v81;
    else
      v54 = v82;
    v91.size.width = v83 - v54;
    v91.size.height = v51;
    v27 = v27 + v50 + 15.0;
  }
  v90.origin = origin;
  v90.size = v84;
  v89.origin = origin;
  v89.size = v84;
  v88.origin = origin;
  v88.size = v84;
  if (self->_text || self->_detailText || self->_textSubtitle)
  {
    CGRectDivide(remainder, &v98, &remainder, 15.0, CGRectMinYEdge);
    -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v13, height);
    v56 = v55;
    v58 = v57;
    -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v13, height);
    v61 = v60;
    if (v56 + v60 + 5.0 > v13)
    {
      v61 = v13 * 0.5 + -2.5;
      -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v61, height);
      v58 = v62;
      -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v61, height);
      v56 = v61;
    }
    memset(&v87, 0, sizeof(v87));
    v63 = fmax(v58, v59);
    CGRectDivide(remainder, &v87, &remainder, v63, CGRectMinYEdge);
    v64 = v27 + v63 + 15.0;
    CGRectDivide(v87, &v90, &v87, v56, v16);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v90.origin.x = v65;
    v90.origin.y = v66;
    v90.size.width = v67;
    v90.size.height = v68;
    memset(&v86, 0, sizeof(v86));
    CGRectDivide(v87, &v86, &v87, 5.0, v16);
    CGRectDivide(v87, &v89, &v87, v61, v17);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v89.origin.x = v69;
    v89.origin.y = v70;
    v89.size.width = v71;
    v89.size.height = v72;
    if (self->_text || self->_detailText)
    {
      CGRectDivide(remainder, &v98, &remainder, 5.0, CGRectMinYEdge);
      v64 = v64 + 5.0;
    }
    CGRectDivide(remainder, &v88, &remainder, v80, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v88.origin.x = v73;
    v88.origin.y = v74;
    v88.size.width = v75;
    v88.size.height = v76;
    v27 = v64 + v76;
  }
  if (!a4)
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v94.origin.x, v94.origin.y, v94.size.width, v94.size.height);
    -[UIView setFrame:](self->_seperatorForCustomView, "setFrame:", v93.origin.x, v93.origin.y, v93.size.width, v93.size.height);
    -[UIView setFrame:](self->_customView, "setFrame:", v92.origin.x, v92.origin.y, v92.size.width, v92.size.height);
    -[UIView setFrame:](self->_seperatorForText, "setFrame:", v91.origin.x, v91.origin.y, v91.size.width, v91.size.height);
    -[UILabel setFrame:](self->_textLabel, "setFrame:", v90.origin.x, v90.origin.y, v90.size.width, v90.size.height);
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", v89.origin.x, v89.origin.y, v89.size.width, v89.size.height);
    -[UILabel setFrame:](self->_textSubtitleLabel, "setFrame:", v88.origin.x, v88.origin.y, v88.size.width, v88.size.height);
    -[UIImageView setFrame:](self->_accessoryView, "setFrame:", v95.origin.x, v95.origin.y, v95.size.width, v95.size.height);
  }
  v77 = v27 + 30.0;
  v78 = v83;
  result.height = v77;
  result.width = v78;
  return result;
}

- (void)setTitleText:(id)a3
{
  id v5;
  NSString *titleText;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  titleText = self->_titleText;
  v9 = (NSString *)v5;
  v7 = titleText;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_titleText, a3);
    -[PKTileDetailCell _configureView](self, "_configureView");
  }
LABEL_9:

}

- (void)setSubtitleText:(id)a3
{
  id v5;
  NSString *subtitleText;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  subtitleText = self->_subtitleText;
  v9 = (NSString *)v5;
  v7 = subtitleText;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_subtitleText, a3);
    -[PKTileDetailCell _configureView](self, "_configureView");
  }
LABEL_9:

}

- (void)setText:(id)a3
{
  id v5;
  NSString *text;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  text = self->_text;
  v9 = (NSString *)v5;
  v7 = text;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_text, a3);
    -[PKTileDetailCell _configureView](self, "_configureView");
  }
LABEL_9:

}

- (void)setDetailText:(id)a3
{
  id v5;
  NSString *detailText;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  detailText = self->_detailText;
  v9 = (NSString *)v5;
  v7 = detailText;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_detailText, a3);
    -[PKTileDetailCell _configureView](self, "_configureView");
  }
LABEL_9:

}

- (void)setCustomView:(id)a3
{
  UIView *v5;
  UIView *customView;
  UIView *v7;

  v5 = (UIView *)a3;
  customView = self->_customView;
  if (customView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](customView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customView, a3);
    -[PKTileDetailCell addSubview:](self, "addSubview:", self->_customView);
    -[PKTileDetailCell _configureView](self, "_configureView");
    v5 = v7;
  }

}

- (void)setTextSubtitle:(id)a3
{
  id v5;
  NSString *textSubtitle;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  textSubtitle = self->_textSubtitle;
  v9 = (NSString *)v5;
  v7 = textSubtitle;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_textSubtitle, a3);
    -[PKTileDetailCell _configureView](self, "_configureView");
  }
LABEL_9:

}

- (void)setAccessory:(unint64_t)a3
{
  if (self->_accessory != a3)
  {
    self->_accessory = a3;
    -[PKTileDetailCell _configureView](self, "_configureView");
  }
}

- (void)_configureView
{
  UIView *v3;
  UIView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *seperatorForCustomView;
  UIView *v9;
  UIView *seperatorForText;
  UIView *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t accessory;
  UIImageView *v17;
  UIImageView *accessoryView;
  UIImageView *v19;
  UIImageView *v20;
  void *v21;
  void *v22;
  UIImageView *v23;
  uint64_t v24;
  UIImageView *v25;
  UIImageView *v26;
  UIImageView *v27;
  void *v28;
  void *v29;

  -[UILabel setText:](self->_titleLabel, "setText:", self->_titleText);
  -[UILabel setText:](self->_subtitleLabel, "setText:", self->_subtitleText);
  -[UILabel setText:](self->_textLabel, "setText:", self->_text);
  -[UILabel setText:](self->_detailLabel, "setText:", self->_detailText);
  -[UILabel setText:](self->_textSubtitleLabel, "setText:", self->_textSubtitle);
  if (*(_OWORD *)&self->_titleText == 0 || !self->_customView)
  {
    -[UIView removeFromSuperview](self->_seperatorForCustomView, "removeFromSuperview");
    seperatorForCustomView = self->_seperatorForCustomView;
    self->_seperatorForCustomView = 0;
  }
  else
  {
    if (self->_seperatorForCustomView)
      goto LABEL_7;
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v4 = self->_seperatorForCustomView;
    self->_seperatorForCustomView = v3;

    v5 = self->_seperatorForCustomView;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[UIView layer](self->_seperatorForCustomView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMasksToBounds:", 1);

    -[PKTileDetailCell contentView](self, "contentView");
    seperatorForCustomView = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(seperatorForCustomView, "addSubview:", self->_seperatorForCustomView);
  }

LABEL_7:
  if ((self->_text || self->_detailText || self->_textSubtitle)
    && (self->_customView || self->_titleText || self->_subtitleText))
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    seperatorForText = self->_seperatorForText;
    self->_seperatorForText = v9;

    v11 = self->_seperatorForText;
    v12 = 0x1E0DC3000uLL;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v13);

    -[UIView layer](self->_seperatorForText, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMasksToBounds:", 1);

    -[PKTileDetailCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", self->_seperatorForText);
  }
  else
  {
    -[UIView removeFromSuperview](self->_seperatorForText, "removeFromSuperview");
    v15 = self->_seperatorForText;
    self->_seperatorForText = 0;
    v12 = 0x1E0DC3000;
  }

  accessory = self->_accessory;
  switch(accessory)
  {
    case 2uLL:
      accessoryView = self->_accessoryView;
      if (!accessoryView)
      {
        v19 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v20 = self->_accessoryView;
        self->_accessoryView = v19;

        -[PKTileDetailCell contentView](self, "contentView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addSubview:", self->_accessoryView);

        accessoryView = self->_accessoryView;
      }
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](accessoryView, "setImage:", v22);

      v23 = self->_accessoryView;
      objc_msgSend(*(id *)(v12 + 1624), "systemGreenColor");
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 1uLL:
      v25 = self->_accessoryView;
      if (!v25)
      {
        v26 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v27 = self->_accessoryView;
        self->_accessoryView = v26;

        -[PKTileDetailCell contentView](self, "contentView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addSubview:", self->_accessoryView);

        v25 = self->_accessoryView;
      }
      PKUIChevronImage();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v25, "setImage:", v29);

      v23 = self->_accessoryView;
      objc_msgSend(*(id *)(v12 + 1624), "secondaryLabelColor");
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_24:
      v17 = (UIImageView *)v24;
      -[UIImageView setTintColor:](v23, "setTintColor:", v24);
      goto LABEL_25;
    case 0uLL:
      -[UIImageView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
      v17 = self->_accessoryView;
      self->_accessoryView = 0;
LABEL_25:

      break;
  }
  -[PKTileDetailCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  NSString *titleText;
  NSString *subtitleText;
  NSString *text;
  NSString *detailText;
  NSString *textSubtitle;
  UIColor *backgroundColor;
  UIView *seperatorForText;
  UIView *seperatorForCustomView;
  UIImageView *accessoryView;
  UIView *customView;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKTileDetailCell;
  -[PKTileDetailCell prepareForReuse](&v13, sel_prepareForReuse);
  titleText = self->_titleText;
  self->_titleText = 0;

  subtitleText = self->_subtitleText;
  self->_subtitleText = 0;

  text = self->_text;
  self->_text = 0;

  detailText = self->_detailText;
  self->_detailText = 0;

  textSubtitle = self->_textSubtitle;
  self->_textSubtitle = 0;

  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = 0;

  self->_accessory = 0;
  -[UIView removeFromSuperview](self->_seperatorForText, "removeFromSuperview");
  seperatorForText = self->_seperatorForText;
  self->_seperatorForText = 0;

  -[UIView removeFromSuperview](self->_seperatorForCustomView, "removeFromSuperview");
  seperatorForCustomView = self->_seperatorForCustomView;
  self->_seperatorForCustomView = 0;

  -[UIImageView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;

  -[UIView removeFromSuperview](self->_customView, "removeFromSuperview");
  customView = self->_customView;
  self->_customView = 0;

}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)textSubtitle
{
  return self->_textSubtitle;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIView)customView
{
  return self->_customView;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_textSubtitle, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_seperatorForText, 0);
  objc_storeStrong((id *)&self->_seperatorForCustomView, 0);
  objc_storeStrong((id *)&self->_textSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
