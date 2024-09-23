@implementation WFCompactPlatterView

- (WFCompactPlatterView)initWithFrame:(CGRect)a3
{
  WFCompactPlatterView *v3;
  WFCompactPlatterView *v4;
  void *v5;
  WFCompactTitledPlatterView *v6;
  WFCompactTitledPlatterView *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;
  void *v15;
  void *v16;
  void *v17;
  UIView *contentViewSeparatorView;
  UIView *v19;
  UIView *footerView;
  UIView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  WFCompactPlatterView *v29;
  void *v31;
  UIView *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)WFCompactPlatterView;
  v3 = -[WFCompactPlatterView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_footerViewHidden = 1;
    v3->_sashVisible = 0;
    -[WFCompactPlatterView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("junior_platter_view"));
    -[WFCompactPlatterView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    v6 = [WFCompactTitledPlatterView alloc];
    -[WFCompactPlatterView bounds](v4, "bounds");
    v7 = -[PLPlatterView initWithFrame:](v6, "initWithFrame:");
    -[WFCompactTitledPlatterView setDelegate:](v7, "setDelegate:", v4);
    -[WFCompactTitledPlatterView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    -[WFCompactPlatterView addSubview:](v4, "addSubview:", v7);
    objc_storeWeak((id *)&v4->_platterView, v7);
    -[PLPlatterView customContentView](v7, "customContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v9, "setNumberOfLines:", 0);
    objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v8, "addSubview:", v9);
    objc_storeWeak((id *)&v4->_primaryLabel, v9);
    v10 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v10, "setNumberOfLines:", 0);
    objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v8, "addSubview:", v10);
    objc_storeWeak((id *)&v4->_secondaryLabel, v10);
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v11, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v12);

    objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v34, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v13);

    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 1200);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBDAF0], "effectForBlurEffect:style:", v33, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v31);
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorWithAlphaComponent:", 0.6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView contentView](v14, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

    objc_msgSend(v8, "addSubview:", v14);
    contentViewSeparatorView = v4->_contentViewSeparatorView;
    v4->_contentViewSeparatorView = v14;
    v32 = v14;

    -[WFCompactPlatterView updateContentViewSeparatorVisibility](v4, "updateContentViewSeparatorVisibility");
    v19 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[UIView setHidden:](v19, "setHidden:", -[WFCompactPlatterView footerViewHidden](v4, "footerViewHidden"));
    objc_msgSend(v8, "addSubview:", v19);
    footerView = v4->_footerView;
    v4->_footerView = v19;
    v21 = v19;

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v31);
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "colorWithAlphaComponent:", 0.6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", v24);

    objc_msgSend(v22, "setHidden:", -[WFCompactPlatterView footerViewHidden](v4, "footerViewHidden"));
    objc_msgSend(v8, "addSubview:", v22);
    objc_storeWeak((id *)&v4->_footerViewSeparatorView, v22);
    v26 = (void *)objc_opt_new();
    objc_msgSend(v26, "setClipsToBounds:", 1);
    objc_msgSend(v8, "addSubview:", v26);
    objc_storeWeak((id *)&v4->_clippingContentView, v26);
    v27 = (void *)objc_opt_new();

    objc_msgSend(v26, "addSubview:", v27);
    objc_storeWeak((id *)&v4->_clippingAutoLayoutContainerView, v27);
    v28 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
    *(_OWORD *)&v4->_separatorInsets.top = *MEMORY[0x24BEBE158];
    *(_OWORD *)&v4->_separatorInsets.bottom = v28;
    *(_OWORD *)&v4->_labelInsets.top = xmmword_220336C20;
    *(_OWORD *)&v4->_labelInsets.bottom = xmmword_220336C30;
    v29 = v4;

  }
  return v4;
}

- (UIEdgeInsets)shadowOutsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 110.0;
  v3 = 800.0;
  v4 = 100.0;
  v5 = 100.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (void)applyMaterialViewStyling
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[WFCompactPlatterView platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaterialRecipe:", 53);

  -[WFCompactPlatterView platterView](self, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v6 = v5;
  -[WFCompactPlatterView platterView](self, "platterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContinuousCornerRadius:", v6);

  -[WFCompactPlatterView platterView](self, "platterView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHasShadow:", 1);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[WFCompactPlatterView platterView](self, "platterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFitsContentWithSize:", width, 0.0);
  v8 = v7;

  -[WFCompactPlatterView staticContentSizeForSize:](self, "staticContentSizeForSize:", width, fmax(height - v8, 0.0));
  v10 = v8 + v9;
  v11 = width;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGSize)staticContentSizeForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[WFCompactPlatterView labelInsets](self, "labelInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[WFCompactPlatterView primaryLabel](self, "primaryLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterView secondaryLabel](self, "secondaryLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  objc_msgSend(v15, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  v20 = v17 | v19;
  if (v17 | v19)
    v21 = v7 + 0.0;
  else
    v21 = 0.0;
  if (v17)
  {
    objc_msgSend(v14, "sizeThatFits:", width - v9 - v13, height - v21);
    v23 = v21 + v22;
    v24 = v21 + v22 + 3.0;
    if (v19)
      v21 = v24;
    else
      v21 = v23;
  }
  if (v19)
  {
    objc_msgSend(v15, "sizeThatFits:", width - v9 - v13, height - v21);
    v21 = v21 + v25 + 3.0;
  }
  -[WFCompactPlatterView contentViewSeparatorView](self, "contentViewSeparatorView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "isHidden") & 1) == 0)
  {
    -[WFCompactPlatterView separatorHeight](self, "separatorHeight");
    v28 = v21 + v27;
    v29 = -0.0;
    if (v20)
      v29 = v11;
    v21 = v29 + v28;
  }
  if (!-[WFCompactPlatterView footerViewHidden](self, "footerViewHidden"))
  {
    -[WFCompactPlatterView separatorHeight](self, "separatorHeight");
    v31 = v21 + v30;
    -[WFCompactPlatterView footerViewHeight](self, "footerViewHeight");
    v21 = v31 + v32;
  }
  -[WFCompactPlatterView actionGroupView](self, "actionGroupView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    objc_msgSend(v33, "layoutIfNeeded");
    LODWORD(v35) = 1148846080;
    LODWORD(v36) = 1112014848;
    objc_msgSend(v34, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height - v21, v35, v36);
    v21 = v21 + v37;
  }

  v38 = width;
  v39 = v21;
  result.height = v39;
  result.width = v38;
  return result;
}

- (double)separatorHeight
{
  void *v3;
  NSString *v4;
  double v5;
  void *v6;
  double v7;

  -[WFCompactPlatterView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = 1.0;
  if (!UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    -[WFCompactPlatterView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    v5 = 1.0 / v7;

  }
  return v5;
}

- (void)setNeedsLayoutAndSizeInvalidation
{
  void *v3;
  _QWORD block[5];

  -[WFCompactPlatterView platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  if (!-[WFCompactPlatterView hasScheduledSizeInvalidation](self, "hasScheduledSizeInvalidation"))
  {
    -[WFCompactPlatterView setHasScheduledSizeInvalidation:](self, "setHasScheduledSizeInvalidation:", 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__WFCompactPlatterView_setNeedsLayoutAndSizeInvalidation__block_invoke;
    block[3] = &unk_24E604D88;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (void)layoutCustomContentViewForPlatterView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  id v53;

  objc_msgSend(a3, "customContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  -[WFCompactPlatterView labelInsets](self, "labelInsets");
  v10 = v9;
  v12 = v11;
  v51 = v13;
  v15 = v14;
  -[WFCompactPlatterView separatorInsets](self, "separatorInsets");
  v52 = v16;
  v18 = v17;
  -[WFCompactPlatterView primaryLabel](self, "primaryLabel");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterView secondaryLabel](self, "secondaryLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  objc_msgSend(v19, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v21 | v23)
    v24 = v10 + 0.0;
  else
    v24 = 0.0;
  if (v21)
  {
    objc_msgSend(v53, "sizeThatFits:", v6 - v12 - v15, v8 - v24);
    v26 = v25;
    objc_msgSend(v53, "setFrame:", v12, v24, v6 - v12 - v15, v25);
    if (v23)
      v24 = v24 + v26 + 3.0;
    else
      v24 = v24 + v26;
  }
  if (v23)
  {
    objc_msgSend(v19, "sizeThatFits:", v6 - v12 - v15, v8 - v24);
    v28 = v27;
    objc_msgSend(v19, "setFrame:", v12, v24, v6 - v12 - v15, v27);
    v24 = v24 + v28 + 3.0;
  }
  v29 = -0.0;
  if (v21 | v23)
    v29 = v51;
  v30 = v29 + v24;
  v31 = v6 - (v52 + v18);
  -[WFCompactPlatterView contentViewSeparatorView](self, "contentViewSeparatorView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v32, "isHidden") & 1) == 0)
  {
    -[WFCompactPlatterView separatorHeight](self, "separatorHeight");
    v34 = v33;
    objc_msgSend(v32, "setFrame:", v52, v30, v31, v33);
    v30 = v30 + v34;
  }
  -[WFCompactPlatterView footerView](self, "footerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterView footerViewHeight](self, "footerViewHeight");
  v37 = v36;
  -[WFCompactPlatterView separatorHeight](self, "separatorHeight");
  v39 = v38;
  v40 = -[WFCompactPlatterView footerViewHidden](self, "footerViewHidden");
  -[WFCompactPlatterView actionGroupView](self, "actionGroupView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v41;
  if (v41)
  {
    v44 = v37 + v39;
    if (v40)
      v44 = 0.0;
    LODWORD(v42) = 1112014848;
    objc_msgSend(v41, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, v8 - v30 - v44, COERCE_DOUBLE(1148846080), v42);
    v46 = v45;
  }
  else
  {
    v46 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  objc_msgSend(v43, "setFrame:", 0.0, v8 - v46, v6, v46);
  -[WFCompactPlatterView footerViewSeparatorView](self, "footerViewSeparatorView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", 0.0, v8 - v46 - v37 - v39, v6, v39);
  objc_msgSend(v35, "setFrame:", v52, v8 - v46 - v37, v31, v37);
  -[WFCompactPlatterView clippingContentView](self, "clippingContentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterView contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_msgSend(v48, "setHidden:", 0);
    v50 = v37 + v39;
    if (v40)
      v50 = 0.0;
    objc_msgSend(v48, "setFrame:", 0.0, v30, v6, v8 - v30 - v46 - v50);
    -[WFCompactPlatterView layoutContentInsideClippingView](self, "layoutContentInsideClippingView");
  }
  else
  {
    objc_msgSend(v48, "setHidden:", 1);
  }

}

- (void)layoutContentInsideClippingView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  -[WFCompactPlatterView clippingContentView](self, "clippingContentView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterView clippingAutoLayoutContainerView](self, "clippingAutoLayoutContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFCompactPlatterView isClippingContent](self, "isClippingContent")
    && (-[WFCompactPlatterView contentClippingDelegate](self, "contentClippingDelegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    -[WFCompactPlatterView contentVerticalOffsetWhenClipped](self, "contentVerticalOffsetWhenClipped");
    v8 = v11;
    objc_msgSend(v14, "bounds");
    v10 = v12;
    -[WFCompactPlatterView contentHeightWhenClipped](self, "contentHeightWhenClipped");
    v6 = v13;
    v5 = 0.0;
  }
  else
  {
    objc_msgSend(v14, "bounds");
    v8 = v7;
    v10 = v9;
  }
  objc_msgSend(v3, "setFrame:", v5, v8, v10, v6);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFCompactPlatterView;
  -[WFCompactPlatterView traitCollectionDidChange:](&v18, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v7)
  {

  }
  else
  {
    v8 = (void *)v7;
    objc_msgSend(v4, "preferredContentSizeCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCompactPlatterView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredContentSizeCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
      -[WFCompactPlatterView setNeedsLayoutAndSizeInvalidation](self, "setNeedsLayoutAndSizeInvalidation");
  }
  objc_msgSend(v4, "displayScale");
  v14 = v13;
  -[WFCompactPlatterView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  v17 = v16;

  if (v14 != v17)
    -[WFCompactPlatterView setNeedsLayoutAndSizeInvalidation](self, "setNeedsLayoutAndSizeInvalidation");

}

- (void)setAttribution:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_storeStrong((id *)&self->_attribution, a3);
  objc_msgSend(v14, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterView platterView](self, "platterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIcon:", v5);

  objc_msgSend(v14, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterView platterView](self, "platterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

  objc_msgSend(v14, "appBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEC1720]);

  if ((_DWORD)v8)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.941176474, 0.701960802, 0.0, 1.0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v14, "appBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEC1700]);

    if (v12)
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;
  -[WFCompactPlatterView setTintColor:](self, "setTintColor:", v10);

}

- (void)setPrimaryText:(id)a3
{
  NSString *v4;
  NSString *primaryText;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  primaryText = self->_primaryText;
  if (primaryText != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](primaryText, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_primaryText;
      self->_primaryText = v7;

      -[WFCompactPlatterView primaryLabel](self, "primaryLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v10);

      -[WFCompactPlatterView _labelContentChanged](self, "_labelContentChanged");
      v4 = v10;
    }
  }

}

- (void)setPrimaryTextAlignment:(int64_t)a3
{
  int64_t v4;
  void *v5;

  if (self->_primaryTextAlignment != a3)
  {
    self->_primaryTextAlignment = a3;
    v4 = -[WFCompactPlatterView primaryTextAlignment](self, "primaryTextAlignment");
    -[WFCompactPlatterView primaryLabel](self, "primaryLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextAlignment:", v4);

    -[WFCompactPlatterView _labelContentChanged](self, "_labelContentChanged");
  }
}

- (void)setSecondaryText:(id)a3
{
  NSString *v4;
  NSString *secondaryText;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  secondaryText = self->_secondaryText;
  if (secondaryText != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](secondaryText, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_secondaryText;
      self->_secondaryText = v7;

      -[WFCompactPlatterView secondaryLabel](self, "secondaryLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v10);

      -[WFCompactPlatterView _labelContentChanged](self, "_labelContentChanged");
      v4 = v10;
    }
  }

}

- (void)setSecondaryTextAlignment:(int64_t)a3
{
  int64_t v4;
  void *v5;

  if (self->_secondaryTextAlignment != a3)
  {
    self->_secondaryTextAlignment = a3;
    v4 = -[WFCompactPlatterView secondaryTextAlignment](self, "secondaryTextAlignment");
    -[WFCompactPlatterView secondaryLabel](self, "secondaryLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextAlignment:", v4);

    -[WFCompactPlatterView _labelContentChanged](self, "_labelContentChanged");
  }
}

- (void)setSecondaryTextFontStyle:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;

  v8 = (NSString *)a3;
  if (self->_secondaryTextFontStyle != v8)
  {
    objc_storeStrong((id *)&self->_secondaryTextFontStyle, a3);
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v5, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCompactPlatterView secondaryLabel](self, "secondaryLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    -[WFCompactPlatterView _labelContentChanged](self, "_labelContentChanged");
  }

}

- (void)_labelContentChanged
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;

  -[WFCompactPlatterView primaryText](self, "primaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;
  -[WFCompactPlatterView primaryLabel](self, "primaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

  -[WFCompactPlatterView secondaryText](self, "secondaryText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length") == 0;
  -[WFCompactPlatterView secondaryLabel](self, "secondaryLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7);

  -[WFCompactPlatterView updateContentViewSeparatorVisibility](self, "updateContentViewSeparatorVisibility");
  -[WFCompactPlatterView setNeedsLayoutAndSizeInvalidation](self, "setNeedsLayoutAndSizeInvalidation");
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    if (v5)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[WFCompactPlatterView clippingAutoLayoutContainerView](self, "clippingAutoLayoutContainerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v5);

      v18 = (void *)MEMORY[0x24BDD1628];
      -[UIView topAnchor](v5, "topAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCompactPlatterView clippingAutoLayoutContainerView](self, "clippingAutoLayoutContainerView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v22;
      -[UIView leadingAnchor](v5, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCompactPlatterView clippingAutoLayoutContainerView](self, "clippingAutoLayoutContainerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v17;
      -[UIView trailingAnchor](v5, "trailingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCompactPlatterView clippingAutoLayoutContainerView](self, "clippingAutoLayoutContainerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trailingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v10;
      -[UIView bottomAnchor](v5, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCompactPlatterView clippingAutoLayoutContainerView](self, "clippingAutoLayoutContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activateConstraints:", v15);

    }
    -[WFCompactPlatterView updateContentViewSeparatorVisibility](self, "updateContentViewSeparatorVisibility");
    -[WFCompactPlatterView setNeedsLayoutAndSizeInvalidation](self, "setNeedsLayoutAndSizeInvalidation");
  }

}

- (void)setHidesContentViewTopSeparator:(BOOL)a3
{
  if (self->_hidesContentViewTopSeparator != a3)
  {
    self->_hidesContentViewTopSeparator = a3;
    -[WFCompactPlatterView updateContentViewSeparatorVisibility](self, "updateContentViewSeparatorVisibility");
  }
}

- (void)setShowsTopScrollingSeparator:(BOOL)a3
{
  self->_showsTopScrollingSeparator = a3;
  -[WFCompactPlatterView updateContentViewSeparatorVisibility](self, "updateContentViewSeparatorVisibility");
}

- (void)updateContentViewSeparatorVisibility
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  if (-[WFCompactPlatterView showsTopScrollingSeparator](self, "showsTopScrollingSeparator"))
  {
    v3 = 0;
  }
  else
  {
    -[WFCompactPlatterView contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[WFCompactPlatterView primaryText](self, "primaryText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
      {
        v3 = -[WFCompactPlatterView hidesContentViewTopSeparator](self, "hidesContentViewTopSeparator");
      }
      else
      {
        -[WFCompactPlatterView secondaryText](self, "secondaryText");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "length"))
          v3 = -[WFCompactPlatterView hidesContentViewTopSeparator](self, "hidesContentViewTopSeparator");
        else
          v3 = 1;

      }
    }
    else
    {
      v3 = 1;
    }

  }
  -[WFCompactPlatterView contentViewSeparatorView](self, "contentViewSeparatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");

  if (v3 != v8)
  {
    -[WFCompactPlatterView contentViewSeparatorView](self, "contentViewSeparatorView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v3);

    -[WFCompactPlatterView setNeedsLayoutAndSizeInvalidation](self, "setNeedsLayoutAndSizeInvalidation");
  }
}

- (void)setShowsBottomScrollingSeparator:(BOOL)a3
{
  self->_showsBottomScrollingSeparator = a3;
  -[WFCompactPlatterView updateFooterViewSeparatorVisibility](self, "updateFooterViewSeparatorVisibility");
}

- (void)updateFooterViewSeparatorVisibility
{
  _BOOL8 v3;
  void *v4;
  int v5;
  void *v6;

  v3 = !-[WFCompactPlatterView showsBottomScrollingSeparator](self, "showsBottomScrollingSeparator")
    && -[WFCompactPlatterView footerViewHidden](self, "footerViewHidden");
  -[WFCompactPlatterView footerViewSeparatorView](self, "footerViewSeparatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  if (v3 != v5)
  {
    -[WFCompactPlatterView footerViewSeparatorView](self, "footerViewSeparatorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v3);

    -[WFCompactPlatterView setNeedsLayoutAndSizeInvalidation](self, "setNeedsLayoutAndSizeInvalidation");
  }
}

- (void)setActions:(id)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  WFCompactActionGroupView *v9;
  NSArray *actions;
  void *v11;
  WFCompactActionGroupView *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionGroupView);
  objc_msgSend(WeakRetained, "removeFromSuperview");

  objc_storeStrong((id *)&self->_actions, a3);
  if (self->_actions)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "heightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToConstant:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

    v9 = [WFCompactActionGroupView alloc];
    actions = self->_actions;
    -[WFCompactPlatterView appearanceProvider](self, "appearanceProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFCompactActionGroupView initWithActions:appearanceProvider:](v9, "initWithActions:appearanceProvider:", actions, v11);

    objc_storeWeak((id *)&self->_actionGroupView, v12);
    -[WFCompactPlatterView platterView](self, "platterView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "customContentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v12);

    -[WFCompactPlatterView setNeedsLayoutAndSizeInvalidation](self, "setNeedsLayoutAndSizeInvalidation");
  }
  else
  {
    -[WFCompactPlatterView setNeedsLayoutAndSizeInvalidation](self, "setNeedsLayoutAndSizeInvalidation");
  }

}

- (void)setFooterViewHeight:(double)a3
{
  if (self->_footerViewHeight != a3)
  {
    self->_footerViewHeight = a3;
    if (!-[WFCompactPlatterView footerViewHidden](self, "footerViewHidden"))
      -[WFCompactPlatterView setNeedsLayoutAndSizeInvalidation](self, "setNeedsLayoutAndSizeInvalidation");
  }
}

- (void)setFooterViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_footerViewHidden != a3)
  {
    v3 = a3;
    self->_footerViewHidden = a3;
    -[WFCompactPlatterView footerView](self, "footerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v3);

    -[WFCompactPlatterView updateFooterViewSeparatorVisibility](self, "updateFooterViewSeparatorVisibility");
    -[WFCompactPlatterView setNeedsLayoutAndSizeInvalidation](self, "setNeedsLayoutAndSizeInvalidation");
  }
}

- (void)setClippingContent:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;

  if (self->_clippingContent != a3)
  {
    v3 = a3;
    self->_clippingContent = a3;
    -[WFCompactPlatterView contentClippingDelegate](self, "contentClippingDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WFCompactPlatterView contentClippingDelegate](self, "contentClippingDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0.0;
      if (v3)
        -[WFCompactPlatterView contentVerticalOffsetWhenClipped](self, "contentVerticalOffsetWhenClipped", 0.0);
      objc_msgSend(v6, "platterView:didUpdateContentVerticalOffset:", self, v7);

    }
    -[WFCompactPlatterView layoutContentInsideClippingView](self, "layoutContentInsideClippingView");
  }
}

- (void)setContentHeightWhenClipped:(double)a3
{
  if (self->_contentHeightWhenClipped != a3)
  {
    self->_contentHeightWhenClipped = a3;
    -[WFCompactPlatterView layoutContentInsideClippingView](self, "layoutContentInsideClippingView");
  }
}

- (void)setContentVerticalOffsetWhenClipped:(double)a3
{
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;

  if (self->_contentVerticalOffsetWhenClipped != a3)
  {
    self->_contentVerticalOffsetWhenClipped = a3;
    -[WFCompactPlatterView contentClippingDelegate](self, "contentClippingDelegate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = -[WFCompactPlatterView isClippingContent](self, "isClippingContent");

      if (v7)
      {
        -[WFCompactPlatterView contentClippingDelegate](self, "contentClippingDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "platterView:didUpdateContentVerticalOffset:", self, a3);

      }
    }
    -[WFCompactPlatterView layoutContentInsideClippingView](self, "layoutContentInsideClippingView");
  }
}

- (void)setSashVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  self->_sashVisible = a3;
  -[WFCompactPlatterView platterView](self, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSashVisible:", v3);

  -[WFCompactPlatterView setNeedsLayoutAndSizeInvalidation](self, "setNeedsLayoutAndSizeInvalidation");
  -[WFCompactPlatterView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setAppearanceProvider:(id)a3
{
  id WeakRetained;
  id v6;
  id v7;

  objc_storeStrong((id *)&self->_appearanceProvider, a3);
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);
  objc_msgSend(WeakRetained, "setAppearanceProvider:", v7);

  v6 = objc_loadWeakRetained((id *)&self->_actionGroupView);
  objc_msgSend(v6, "setAppearanceProvider:", v7);

  objc_msgSend(v7, "configurePlatterView:", self);
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  void *v4;
  void *v5;

  -[WFCompactPlatterView platterView](self, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualStylingProviderForCategory:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (int64_t)primaryTextAlignment
{
  return self->_primaryTextAlignment;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (int64_t)secondaryTextAlignment
{
  return self->_secondaryTextAlignment;
}

- (NSString)secondaryTextFontStyle
{
  return self->_secondaryTextFontStyle;
}

- (UIEdgeInsets)labelInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_labelInsets.top;
  left = self->_labelInsets.left;
  bottom = self->_labelInsets.bottom;
  right = self->_labelInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLabelInsets:(UIEdgeInsets)a3
{
  self->_labelInsets = a3;
}

- (UIEdgeInsets)separatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorInsets.top;
  left = self->_separatorInsets.left;
  bottom = self->_separatorInsets.bottom;
  right = self->_separatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  self->_separatorInsets = a3;
}

- (BOOL)sashVisible
{
  return self->_sashVisible;
}

- (WFCompactAppearanceProvider)appearanceProvider
{
  return self->_appearanceProvider;
}

- (NSArray)actions
{
  return self->_actions;
}

- (WFCompactActionGroupView)actionGroupView
{
  return (WFCompactActionGroupView *)objc_loadWeakRetained((id *)&self->_actionGroupView);
}

- (void)setActionGroupView:(id)a3
{
  objc_storeWeak((id *)&self->_actionGroupView, a3);
}

- (BOOL)arrangeActionsVertically
{
  return self->_arrangeActionsVertically;
}

- (void)setArrangeActionsVertically:(BOOL)a3
{
  self->_arrangeActionsVertically = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)contentViewSeparatorView
{
  return self->_contentViewSeparatorView;
}

- (BOOL)showsTopScrollingSeparator
{
  return self->_showsTopScrollingSeparator;
}

- (BOOL)showsBottomScrollingSeparator
{
  return self->_showsBottomScrollingSeparator;
}

- (BOOL)hidesContentViewTopSeparator
{
  return self->_hidesContentViewTopSeparator;
}

- (BOOL)isClippingContent
{
  return self->_clippingContent;
}

- (double)contentHeightWhenClipped
{
  return self->_contentHeightWhenClipped;
}

- (double)contentVerticalOffsetWhenClipped
{
  return self->_contentVerticalOffsetWhenClipped;
}

- (WFCompactPlatterContentClippingDelegate)contentClippingDelegate
{
  return (WFCompactPlatterContentClippingDelegate *)objc_loadWeakRetained((id *)&self->_contentClippingDelegate);
}

- (void)setContentClippingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contentClippingDelegate, a3);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (double)footerViewHeight
{
  return self->_footerViewHeight;
}

- (BOOL)footerViewHidden
{
  return self->_footerViewHidden;
}

- (WFCompactPlatterSizingDelegate)sizingDelegate
{
  return (WFCompactPlatterSizingDelegate *)objc_loadWeakRetained((id *)&self->_sizingDelegate);
}

- (void)setSizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sizingDelegate, a3);
}

- (WFCompactTitledPlatterView)platterView
{
  return (WFCompactTitledPlatterView *)objc_loadWeakRetained((id *)&self->_platterView);
}

- (void)setPlatterView:(id)a3
{
  objc_storeWeak((id *)&self->_platterView, a3);
}

- (UILabel)primaryLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_primaryLabel);
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeWeak((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_secondaryLabel);
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeWeak((id *)&self->_secondaryLabel, a3);
}

- (UIView)clippingContentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_clippingContentView);
}

- (void)setClippingContentView:(id)a3
{
  objc_storeWeak((id *)&self->_clippingContentView, a3);
}

- (UIView)clippingAutoLayoutContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_clippingAutoLayoutContainerView);
}

- (void)setClippingAutoLayoutContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_clippingAutoLayoutContainerView, a3);
}

- (UIView)footerViewSeparatorView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_footerViewSeparatorView);
}

- (void)setFooterViewSeparatorView:(id)a3
{
  objc_storeWeak((id *)&self->_footerViewSeparatorView, a3);
}

- (BOOL)hasScheduledSizeInvalidation
{
  return self->_hasScheduledSizeInvalidation;
}

- (void)setHasScheduledSizeInvalidation:(BOOL)a3
{
  self->_hasScheduledSizeInvalidation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_footerViewSeparatorView);
  objc_destroyWeak((id *)&self->_clippingAutoLayoutContainerView);
  objc_destroyWeak((id *)&self->_clippingContentView);
  objc_destroyWeak((id *)&self->_secondaryLabel);
  objc_destroyWeak((id *)&self->_primaryLabel);
  objc_destroyWeak((id *)&self->_platterView);
  objc_destroyWeak((id *)&self->_sizingDelegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_destroyWeak((id *)&self->_contentClippingDelegate);
  objc_storeStrong((id *)&self->_contentViewSeparatorView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_actionGroupView);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_storeStrong((id *)&self->_secondaryTextFontStyle, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

uint64_t __57__WFCompactPlatterView_setNeedsLayoutAndSizeInvalidation__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "sizingDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterViewDidInvalidateSize:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "setHasScheduledSizeInvalidation:", 0);
}

@end
