@implementation PKPaymentAuthorizationSummaryItemsView

- (PKPaymentAuthorizationSummaryItemsView)initWithFrame:(CGRect)a3
{
  PKPaymentAuthorizationSummaryItemsView *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *labelViews;
  NSMutableArray *v7;
  NSMutableArray *valueViews;
  NSMutableArray *v9;
  NSMutableArray *titleViews;
  NSMutableArray *v11;
  NSMutableArray *hasBottomPadding;
  NSMutableArray *v13;
  NSMutableArray *usesLargeFont;
  NSString *v15;
  uint64_t v16;
  UIFont *titleFont;
  uint64_t v18;
  UIFont *labelLargeFont;
  uint64_t v20;
  UIFont *labelRegularFont;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKPaymentAuthorizationSummaryItemsView;
  v3 = -[PKPaymentAuthorizationSummaryItemsView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationSummaryItemsView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PKPaymentAuthorizationSummaryItemsView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    labelViews = v3->_labelViews;
    v3->_labelViews = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    valueViews = v3->_valueViews;
    v3->_valueViews = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    titleViews = v3->_titleViews;
    v3->_titleViews = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    hasBottomPadding = v3->_hasBottomPadding;
    v3->_hasBottomPadding = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    usesLargeFont = v3->_usesLargeFont;
    v3->_usesLargeFont = v13;

    v15 = (NSString *)*MEMORY[0x1E0DC48D0];
    PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E0DC48D0], 0);
    v16 = objc_claimAutoreleasedReturnValue();
    titleFont = v3->_titleFont;
    v3->_titleFont = (UIFont *)v16;

    PKConstrainedAuthorizationViewBodyFont(v15);
    v18 = objc_claimAutoreleasedReturnValue();
    labelLargeFont = v3->_labelLargeFont;
    v3->_labelLargeFont = (UIFont *)v18;

    PKConstrainedAuthorizationViewCellLabelSmallFont(v15, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    labelRegularFont = v3->_labelRegularFont;
    v3->_labelRegularFont = (UIFont *)v20;

    v3->_showsBoldValueText = 0;
  }
  return v3;
}

- (PKPaymentAuthorizationSummaryItemsView)initWithLayout:(id)a3
{
  id v4;
  PKPaymentAuthorizationSummaryItemsView *v5;
  PKPaymentAuthorizationSummaryItemsView *v6;

  v4 = a3;
  v5 = -[PKPaymentAuthorizationSummaryItemsView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_layout, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentAuthorizationSummaryItemsView;
  -[PKPaymentAuthorizationSummaryItemsView dealloc](&v2, sel_dealloc);
}

- (void)setTitle:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_title, a3);
  if (self->_title)
  {
    -[NSMutableArray firstObject](self->_titleViews, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (!v7)
    {
      -[PKPaymentAuthorizationSummaryItemsView titleLabel](self, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", self->_title);

      -[UILabel superview](self->_titleLabel, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        goto LABEL_7;
      -[PKPaymentAuthorizationSummaryItemsView addSubview:](self, "addSubview:", self->_titleLabel);
      goto LABEL_5;
    }
  }
  -[UILabel superview](self->_titleLabel, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
LABEL_5:
    -[PKPaymentAuthorizationSummaryItemsView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_7:

}

- (id)titleLabel
{
  UILabel *titleLabel;
  UILabel *v4;
  UILabel *v5;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    -[PKPaymentAuthorizationSummaryItemsView makeTitleLabel](self, "makeTitleLabel");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (void)removeLabelsAndValues
{
  void *v3;
  NSString *title;

  -[PKPaymentAuthorizationSummaryItemsView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[NSMutableArray removeAllObjects](self->_labelViews, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_valueViews, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_titleViews, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_hasBottomPadding, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_usesLargeFont, "removeAllObjects");
  title = self->_title;
  self->_title = 0;

  if (self->_separatorView)
    -[PKPaymentAuthorizationSummaryItemsView addSubview:](self, "addSubview:");
  -[PKPaymentAuthorizationSummaryItemsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)addLabel:(id)a3 value:(id)a4 title:(id)a5 itemType:(unint64_t)a6 maxLabelLines:(int64_t)a7 maxValueLines:(int64_t)a8 hasBottomPadding:(BOOL)a9 useDarkColor:(BOOL)a10 useLargeFont:(BOOL)a11
{
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSMutableArray *hasBottomPadding;
  void *v25;
  NSMutableArray *usesLargeFont;
  void *v27;
  NSString *title;
  id v30;

  v30 = a5;
  v16 = (objc_class *)MEMORY[0x1E0DC3990];
  v17 = a4;
  v18 = a3;
  v19 = objc_alloc_init(v16);
  objc_msgSend(v19, "setOpaque:", 0);
  objc_msgSend(v19, "setNumberOfLines:", a7);
  -[PKPaymentAuthorizationSummaryItemsView _labelAttributedStringWithString:withDarkColor:largeFont:](self, "_labelAttributedStringWithString:withDarkColor:largeFont:", v18, a10, a11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setAttributedText:", v20);
  -[PKPaymentAuthorizationSummaryItemsView addSubview:](self, "addSubview:", v19);
  -[NSMutableArray addObject:](self->_labelViews, "addObject:", v19);
  v21 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v21, "setOpaque:", 0);
  objc_msgSend(v21, "setNumberOfLines:", a8);
  -[PKPaymentAuthorizationSummaryItemsView _valueAttributedStringWithString:type:](self, "_valueAttributedStringWithString:type:", v17, a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setAttributedText:", v22);
  -[PKPaymentAuthorizationSummaryItemsView addSubview:](self, "addSubview:", v21);
  -[NSMutableArray addObject:](self->_valueViews, "addObject:", v21);
  -[PKPaymentAuthorizationSummaryItemsView makeTitleLabel](self, "makeTitleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v30);
  -[PKPaymentAuthorizationSummaryItemsView addSubview:](self, "addSubview:", v23);
  -[NSMutableArray addObject:](self->_titleViews, "addObject:", v23);
  hasBottomPadding = self->_hasBottomPadding;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](hasBottomPadding, "addObject:", v25);

  usesLargeFont = self->_usesLargeFont;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](usesLargeFont, "addObject:", v27);

  if (-[NSMutableArray count](self->_titleViews, "count") == 1 && objc_msgSend(v30, "length"))
  {
    title = self->_title;
    self->_title = 0;

  }
  -[PKPaymentAuthorizationSummaryItemsView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setShowsTopSeparator:(BOOL)a3
{
  UIView *v4;
  UIView *separatorView;
  UIView *v6;
  void *v7;
  UIView *v8;

  if (((!self->_showsTopSeparator ^ a3) & 1) == 0)
  {
    self->_showsTopSeparator = a3;
    if (a3)
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      separatorView = self->_separatorView;
      self->_separatorView = v4;

      v6 = self->_separatorView;
      PKAuthorizationSeparatorColor();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

      -[PKPaymentAuthorizationSummaryItemsView addSubview:](self, "addSubview:", self->_separatorView);
    }
    else
    {
      -[UIView removeFromSuperview](self->_separatorView, "removeFromSuperview");
      v8 = self->_separatorView;
      self->_separatorView = 0;

    }
  }
}

- (id)makeTitleLabel
{
  id v3;
  double v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setTextAlignment:", 2);
  objc_msgSend(v3, "setOpaque:", 0);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  objc_msgSend(v3, "setLineBreakMode:", 0);
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "_setHyphenationFactor:", v4);
  objc_msgSend(v3, "setFont:", self->_titleFont);
  PKAuthorizationViewLabelColor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v5);

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPaymentAuthorizationSummaryItemsView sizeThatFits:andLayout:](self, "sizeThatFits:andLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationSummaryItemsView;
  -[PKPaymentAuthorizationSummaryItemsView layoutSubviews](&v5, sel_layoutSubviews);
  -[PKPaymentAuthorizationSummaryItemsView bounds](self, "bounds");
  -[PKPaymentAuthorizationSummaryItemsView sizeThatFits:andLayout:](self, "sizeThatFits:andLayout:", 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3 andLayout:(BOOL)a4
{
  _BOOL4 v4;
  PKPaymentAuthorizationSummaryItemsView *v6;
  _BOOL4 v7;
  id *v8;
  NSString *v9;
  BOOL v10;
  NSString *v11;
  BOOL IsAccessibilityCategory;
  BOOL v13;
  id WeakRetained;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
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
  id v30;
  double v31;
  UIView *separatorView;
  double v33;
  UILabel *titleLabel;
  void *v35;
  double v36;
  double v37;
  double v38;
  UILabel *v39;
  void *v40;
  double v41;
  id *p_isa;
  uint64_t v43;
  unint64_t v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  int v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  _BOOL4 v86;
  double v87;
  int v88;
  double v89;
  double v90;
  double width;
  PKPaymentAuthorizationSummaryItemsView *v92;
  unint64_t v93;
  double v94;
  double v95;
  uint64_t v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  int v103;
  CGSize result;

  v4 = a4;
  width = a3.width;
  if (-[NSMutableArray count](self->_labelViews, "count", a3.width, a3.height))
  {
    v88 = -[PKPaymentAuthorizationSummaryItemsView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v6 = self;
    v7 = -[UIView pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
    v8 = (id *)MEMORY[0x1E0DC4730];
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = UIContentSizeCategoryCompareToCategory(v9, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]) == NSOrderedDescending;

    objc_msgSend(*v8, "preferredContentSizeCategory");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

    if (v7)
      v13 = IsAccessibilityCategory;
    else
      v13 = v10;
    v92 = v6;
    WeakRetained = objc_loadWeakRetained((id *)&v6->_layout);
    v15 = WeakRetained;
    if (v13)
      objc_msgSend(WeakRetained, "contentHorizontalMargin");
    else
      objc_msgSend(WeakRetained, "valueLeftMargin");
    v89 = v16;

    PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E0DC48D0], 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_bodyLeading");

    PKFloatCeilToPixel();
    v97 = v20;
    PKFloatCeilToPixel();
    v99 = v21;
    -[UIFont lineHeight](v6->_titleFont, "lineHeight");
    v23 = v22;
    -[UIFont ascender](v6->_titleFont, "ascender");
    v25 = v24;
    -[UIFont lineHeight](v6->_labelLargeFont, "lineHeight");
    v27 = v26;
    -[UIFont ascender](v6->_labelLargeFont, "ascender");
    v29 = v28;
    v30 = objc_loadWeakRetained((id *)&v6->_layout);
    objc_msgSend(v30, "contentHorizontalMargin");
    v90 = v31;

    separatorView = v6->_separatorView;
    if (separatorView && v4)
    {
      if (v6->_occludesBodyView)
        v33 = 0.0;
      else
        v33 = (double)(uint64_t)v90;
      -[UIView setFrame:](separatorView, "setFrame:", v33, 0.0, width - v33, PKUIPixelLength());
    }
    v101 = v89 + v90 * -2.0;
    titleLabel = v6->_titleLabel;
    if (titleLabel)
    {
      -[UILabel superview](titleLabel, "superview");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        -[UILabel sizeThatFits:](v6->_titleLabel, "sizeThatFits:", v101, 3.40282347e38);
        v37 = v36;
        if (v4)
        {
          if (v88)
            v38 = width - v101 - v90;
          else
            v38 = v90;
          v39 = v6->_titleLabel;
          -[UILabel font](v39, "font");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "lineHeight");
          -[UILabel setFrame:](v39, "setFrame:", v38, v97 - v41, v101, v37);

        }
      }
    }
    p_isa = (id *)&v6->super.super.super.isa;
    v43 = -[NSMutableArray count](v6->_labelViews, "count");
    if (v43)
    {
      v44 = 0;
      v95 = width - v89 - v90;
      v98 = v27 - v29 - (v23 - v25);
      v94 = v95 - v101 + -8.0;
      v93 = v43 - 1;
      v45 = width - v101 - v90;
      if (!v88)
        v45 = v90;
      v87 = v45;
      v46 = v97;
      v86 = v4;
      v96 = v43;
      do
      {
        objc_msgSend(p_isa[52], "objectAtIndex:", v44);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_isa[53], "objectAtIndex:", v44);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_isa[54], "objectAtIndex:", v44);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_isa[55], "objectAtIndex:", v44);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend(v50, "BOOLValue");

        objc_msgSend(p_isa[56], "objectAtIndex:", v44);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "BOOLValue");

        objc_msgSend(v49, "font");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "lineHeight");
        v100 = v54;

        v55 = 0.0;
        if (v44 < v93)
        {
          objc_msgSend(p_isa[54], "objectAtIndex:", v44 + 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "text");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v57, "length");

          p_isa = (id *)&v92->super.super.super.isa;
          if (v58)
            v55 = v99 + 0.0;
          else
            v55 = 0.0;
          -[NSMutableArray objectAtIndex:](v92->_usesLargeFont, "objectAtIndex:", v44 + 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "BOOLValue");

          if (v60)
          {
            -[UIFont lineHeight](v92->_labelLargeFont, "lineHeight");
            v55 = v55 + v98 + v61 - v99;
          }
          v4 = v86;
        }
        v102 = v55;
        objc_msgSend(v47, "font");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "lineHeight");
        v64 = v46 - v63;

        v65 = -0.0;
        if (v52)
          v65 = v98;
        v66 = v65 + v64;
        v67 = v95 - v101 + -8.0;
        objc_msgSend(v48, "sizeThatFits:", v94, 3.40282347e38);
        if (v68 < v94)
          v67 = v68;
        PKSizeCeilToPixel();
        v70 = v69;
        v72 = v71;
        v73 = v95 - v67 + -8.0;
        if (v101 > v73)
          v73 = v89 + v90 * -2.0;
        objc_msgSend(v47, "sizeThatFits:", v73, 3.40282347e38);
        PKSizeCeilToPixel();
        v75 = v74;
        v77 = v76;
        objc_msgSend(v49, "sizeThatFits:", v101, 3.40282347e38);
        if (v4)
        {
          v79 = v78;
          v80 = v46 - v100;
          v81 = width - v89 - v75;
          if (v88)
          {
            v82 = v90;
          }
          else
          {
            v81 = v89;
            v82 = width - v70 - v90;
          }
          objc_msgSend(v47, "setFrame:", v81, v66, v75, v77);
          if (v77 <= v72)
            v83 = v66;
          else
            v83 = v66 + v77 - v72;
          objc_msgSend(v48, "setFrame:", v82, v83, v70, v72);
          objc_msgSend(v49, "setFrame:", v87, v80, v101, v79);
        }
        if (v72 <= v77)
          v84 = v77;
        else
          v84 = v72;
        v85 = v97;
        if (!v103)
          v85 = v99;
        v46 = v66 + v102 + v85 + v84;

        ++v44;
      }
      while (v96 != v44);
    }
    PKSizeCeilToPixel();
  }
  else
  {
    v17 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)_labelAttributedStringWithString:(id)a3 withDarkColor:(BOOL)a4 largeFont:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v5 = a5;
  v8 = (void *)MEMORY[0x1E0DC1290];
  v9 = a3;
  objc_msgSend(v8, "defaultParagraphStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setLineBreakMode:", 4);
  if (a4)
    PKAuthorizationViewValueLabelColor();
  else
    PKAuthorizationViewLabelColor();
  v12 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v12;
  v15 = 7;
  if (v5)
    v15 = 6;
  v16 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR___PKPaymentAuthorizationSummaryItemsView__labelViews[v15]);
  v17 = *MEMORY[0x1E0DC1178];
  v20[0] = *MEMORY[0x1E0DC1138];
  v20[1] = v17;
  v21[0] = v16;
  v21[1] = v11;
  v20[2] = *MEMORY[0x1E0DC1140];
  v21[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, v18);

  return v19;
}

- (id)_valueAttributedStringWithString:(id)a3 type:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v6 = (void *)MEMORY[0x1E0DC1290];
  v7 = a3;
  objc_msgSend(v6, "defaultParagraphStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setLineBreakMode:", 0);
  if (-[PKPaymentAuthorizationSummaryItemsView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v10 = 0;
  else
    v10 = 2;
  objc_msgSend(v9, "setAlignment:", v10);
  if (a4)
    PKAuthorizationViewLabelColor();
  else
    PKAuthorizationViewValueLabelColor();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = *MEMORY[0x1E0DC1138];
  PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E0DC48D0], self->_showsBoldValueText);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC1178];
  v19[0] = v13;
  v19[1] = v9;
  v15 = *MEMORY[0x1E0DC1140];
  v18[1] = v14;
  v18[2] = v15;
  v19[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v16);
  return v17;
}

- (PKPaymentAuthorizationLayout)layout
{
  return (PKPaymentAuthorizationLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (void)setLayout:(id)a3
{
  objc_storeWeak((id *)&self->_layout, a3);
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)showsBoldValueText
{
  return self->_showsBoldValueText;
}

- (void)setShowsBoldValueText:(BOOL)a3
{
  self->_showsBoldValueText = a3;
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (BOOL)occludesBodyView
{
  return self->_occludesBodyView;
}

- (void)setOccludesBodyView:(BOOL)a3
{
  self->_occludesBodyView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_layout);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_labelRegularFont, 0);
  objc_storeStrong((id *)&self->_labelLargeFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_usesLargeFont, 0);
  objc_storeStrong((id *)&self->_hasBottomPadding, 0);
  objc_storeStrong((id *)&self->_titleViews, 0);
  objc_storeStrong((id *)&self->_valueViews, 0);
  objc_storeStrong((id *)&self->_labelViews, 0);
}

@end
