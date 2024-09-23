@implementation TFAppLockupView

- (TFAppLockupView)initWithFrame:(CGRect)a3
{
  TFAppLockupView *v3;
  TFAppLockupViewSpecification *v4;
  void *v5;
  uint64_t v6;
  TFAppLockupViewSpecification *specification;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UIImageView *iconView;
  uint64_t v15;
  UILabel *titleLabel;
  uint64_t v17;
  UILabel *primarySubtitleLabel;
  uint64_t v19;
  UILabel *secondarySubtitleLabel;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)TFAppLockupView;
  v3 = -[TFAppLockupView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [TFAppLockupViewSpecification alloc];
    -[TFAppLockupView traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TFAppLockupViewSpecification initWithTraitCollection:](v4, "initWithTraitCollection:", v5);
    specification = v3->_specification;
    v3->_specification = (TFAppLockupViewSpecification *)v6;

    v8 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v9 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], v10, v11, v12);
    iconView = v3->_iconView;
    v3->_iconView = (UIImageView *)v13;

    -[TFAppLockupView addSubview:](v3, "addSubview:", v3->_iconView);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v15;

    -[TFAppLockupView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
    primarySubtitleLabel = v3->_primarySubtitleLabel;
    v3->_primarySubtitleLabel = (UILabel *)v17;

    -[TFAppLockupView addSubview:](v3, "addSubview:", v3->_primarySubtitleLabel);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
    secondarySubtitleLabel = v3->_secondarySubtitleLabel;
    v3->_secondarySubtitleLabel = (UILabel *)v19;

    -[TFAppLockupView addSubview:](v3, "addSubview:", v3->_secondarySubtitleLabel);
    -[TFAppLockupView _styleSubviews](v3, "_styleSubviews");
    -[TFAppLockupView traitCollection](v3, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFAppLockupView _prepareForDisplayWithTraitCollection:](v3, "_prepareForDisplayWithTraitCollection:", v21);

  }
  return v3;
}

- (void)_styleSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  -[TFAppLockupView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFAppLockupView specification](self, "specification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  -[TFAppLockupView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFAppLockupView specification](self, "specification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v8);

  -[TFAppLockupView titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfLines:", 2);

  -[TFAppLockupView titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineBreakMode:", 0);

  -[TFAppLockupView primarySubtitleLabel](self, "primarySubtitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFAppLockupView specification](self, "specification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subtitleLabelFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v13);

  -[TFAppLockupView primarySubtitleLabel](self, "primarySubtitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFAppLockupView specification](self, "specification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subtitleTextColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v16);

  -[TFAppLockupView primarySubtitleLabel](self, "primarySubtitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNumberOfLines:", 1);

  -[TFAppLockupView primarySubtitleLabel](self, "primarySubtitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLineBreakMode:", 4);

  -[TFAppLockupView secondarySubtitleLabel](self, "secondarySubtitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFAppLockupView specification](self, "specification");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "subtitleLabelFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v21);

  -[TFAppLockupView secondarySubtitleLabel](self, "secondarySubtitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFAppLockupView specification](self, "specification");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "subtitleTextColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTextColor:", v24);

  -[TFAppLockupView secondarySubtitleLabel](self, "secondarySubtitleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setNumberOfLines:", 1);

  -[TFAppLockupView secondarySubtitleLabel](self, "secondarySubtitleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLineBreakMode:", 4);

  -[TFAppLockupView iconView](self, "iconView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFAppLockupView specification](self, "specification");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "iconPlaceholderColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBackgroundColor:", v29);

  -[TFAppLockupView iconView](self, "iconView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClipsToBounds:", 1);

  -[TFAppLockupView iconView](self, "iconView");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_setContinuousCornerRadius:", 24.0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TFAppLockupView specification](self, "specification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconSize");
  v8 = v7;

  -[TFAppLockupView specification](self, "specification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paddingBetweenIconAndText");
  v11 = width - v10 - v8;

  -[TFAppLockupView titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", v11, height);
  v14 = v13;

  -[TFAppLockupView primarySubtitleLabel](self, "primarySubtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeThatFits:", v11, height);
  v17 = v16;

  -[TFAppLockupView secondarySubtitleLabel](self, "secondarySubtitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeThatFits:", v11, height);
  v20 = v19;

  if (v14 + v17 + v20 >= v8)
    v21 = v14 + v17 + v20;
  else
    v21 = v8;
  v22 = width;
  result.height = v21;
  result.width = v22;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TFAppLockupView;
  -[TFAppLockupView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[TFAppLockupView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFAppLockupView _prepareForDisplayWithTraitCollection:](self, "_prepareForDisplayWithTraitCollection:", v4);

  -[TFAppLockupView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double MinY;
  void *v26;
  double MinX;
  double v28;
  double Height;
  double v30;
  double v31;
  void *v32;
  double MaxX;
  void *v34;
  double v35;
  double v36;
  double Width;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v38.receiver = self;
  v38.super_class = (Class)TFAppLockupView;
  -[TFAppLockupView layoutSubviews](&v38, sel_layoutSubviews);
  -[TFAppLockupView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TFAppLockupView specification](self, "specification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconSize");
  v13 = v12;
  v15 = v14;

  v39.origin.x = v4;
  v39.origin.y = v6;
  v39.size.width = v8;
  v39.size.height = v10;
  Width = CGRectGetWidth(v39);
  -[TFAppLockupView specification](self, "specification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "paddingBetweenIconAndText");
  v36 = v17;

  -[TFAppLockupView traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "layoutDirection");

  v20 = v4;
  v21 = v6;
  v22 = v8;
  v23 = v10;
  if (v19 == 1)
  {
    v24 = CGRectGetMaxX(*(CGRect *)&v20) - v13;
    v40.origin.x = v4;
    v40.origin.y = v6;
    v40.size.width = v8;
    v40.size.height = v10;
    MinY = CGRectGetMinY(v40);
    -[TFAppLockupView iconView](self, "iconView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v24, MinY, v13, v15);

    v41.origin.x = v4;
    v41.origin.y = v6;
    v41.size.width = v8;
    v41.size.height = v10;
    MinX = CGRectGetMinX(v41);
    v42.origin.x = v24;
    v42.origin.y = MinY;
    v42.size.width = v13;
    v42.size.height = v15;
    v28 = CGRectGetMinY(v42);
    v43.origin.x = v24;
    v43.origin.y = MinY;
    v43.size.width = v13;
    v43.size.height = v15;
    Height = CGRectGetHeight(v43);
  }
  else
  {
    v30 = CGRectGetMinX(*(CGRect *)&v20);
    v44.origin.x = v4;
    v44.origin.y = v6;
    v44.size.width = v8;
    v44.size.height = v10;
    v31 = CGRectGetMinY(v44);
    -[TFAppLockupView iconView](self, "iconView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", v30, v31, v13, v15);

    v45.origin.x = v30;
    v45.origin.y = v31;
    v45.size.width = v13;
    v45.size.height = v15;
    MaxX = CGRectGetMaxX(v45);
    -[TFAppLockupView specification](self, "specification");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "paddingBetweenIconAndText");
    MinX = MaxX + v35;
    v46.origin.x = v30;
    v46.origin.y = v31;
    v46.size.width = v13;
    v46.size.height = v15;
    v28 = CGRectGetMinY(v46);
    v47.origin.x = v30;
    v47.origin.y = v31;
    v47.size.width = v13;
    v47.size.height = v15;
    Height = CGRectGetHeight(v47);

  }
  -[TFAppLockupView _layoutLabelsInLayoutBounds:](self, "_layoutLabelsInLayoutBounds:", MinX, v28, Width - v36 - v13, Height, *(_QWORD *)&v36);
}

- (void)_layoutLabelsInLayoutBounds:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MaxY;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  CGFloat v55;
  double v56;
  double MinX;
  double v58;
  double v59;
  id v60;
  id v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TFAppLockupView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;
  v59 = v9;

  -[TFAppLockupView primarySubtitleLabel](self, "primarySubtitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", width, height);
  v13 = v12;

  -[TFAppLockupView secondarySubtitleLabel](self, "secondarySubtitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", width, height);
  v60 = v15;

  -[TFAppLockupView titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_firstBaselineOffsetFromTop");
  v18 = v17;
  -[TFAppLockupView specification](self, "specification");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "titleLabelBaselineToFirstSubtitleLabelBaseline");
  v21 = v18 + v20;
  -[TFAppLockupView specification](self, "specification");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstSubtitleLabelBaselineToSecondSubtitleLabelBaseline");
  v24 = v21 + v23;
  -[TFAppLockupView secondarySubtitleLabel](self, "secondarySubtitleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_baselineOffsetFromBottom");
  v27 = v24 + v26;

  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v28 = (CGRectGetHeight(v62) - v27) * 0.5;
  if (v28 >= 0.0)
    v29 = v28;
  else
    v29 = 0.0;
  v58 = v29;
  v63.origin.x = x;
  v63.origin.y = y;
  v63.size.width = width;
  v63.size.height = height;
  MinX = CGRectGetMinX(v63);
  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  v65.size.width = CGRectGetWidth(v64);
  v56 = v65.size.width;
  v65.origin.x = MinX;
  v65.origin.y = v29;
  v65.size.height = v10;
  MaxY = CGRectGetMaxY(v65);
  -[TFAppLockupView titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_baselineOffsetFromBottom");
  v33 = MaxY - v32;
  -[TFAppLockupView specification](self, "specification");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "titleLabelBaselineToFirstSubtitleLabelBaseline");
  v36 = v33 + v35;
  -[TFAppLockupView primarySubtitleLabel](self, "primarySubtitleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "_firstBaselineOffsetFromTop");
  v55 = v36 - v38;

  v66.origin.x = x;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  v54 = CGRectGetMinX(v66);
  v67.origin.x = x;
  v67.origin.y = y;
  v67.size.width = width;
  v67.size.height = height;
  v39 = CGRectGetWidth(v67);
  v68.origin.x = v54;
  v68.origin.y = v55;
  v68.size.width = v39;
  v68.size.height = v13;
  v40 = CGRectGetMaxY(v68);
  -[TFAppLockupView primarySubtitleLabel](self, "primarySubtitleLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "_baselineOffsetFromBottom");
  v43 = v40 - v42;
  -[TFAppLockupView specification](self, "specification");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "firstSubtitleLabelBaselineToSecondSubtitleLabelBaseline");
  v46 = v43 + v45;
  -[TFAppLockupView secondarySubtitleLabel](self, "secondarySubtitleLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "_firstBaselineOffsetFromTop");
  v49 = v46 - v48;

  v69.origin.x = x;
  v69.origin.y = y;
  v69.size.width = width;
  v69.size.height = height;
  v50 = CGRectGetMinX(v69);
  v70.origin.x = x;
  v70.origin.y = y;
  v70.size.width = width;
  v70.size.height = height;
  v51 = CGRectGetWidth(v70);
  -[TFAppLockupView secondarySubtitleLabel](self, "secondarySubtitleLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", v50, v49, v51, *(double *)&v60);

  -[TFAppLockupView titleLabel](self, "titleLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFrame:", MinX, v58, v56, v59);

  -[TFAppLockupView primarySubtitleLabel](self, "primarySubtitleLabel");
  v61 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setFrame:", v54, v55, v39, v13);

}

- (void)_prepareForDisplayWithTraitCollection:(id)a3
{
  TFAppLockupViewSpecification *v4;
  void *v5;
  TFAppLockupViewSpecification *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = [TFAppLockupViewSpecification alloc];
  -[TFAppLockupView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TFAppLockupViewSpecification initWithTraitCollection:](v4, "initWithTraitCollection:", v5);
  -[TFAppLockupView setSpecification:](self, "setSpecification:", v6);

  -[TFAppLockupView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFAppLockupView specification](self, "specification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleLabelFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v9);

  -[TFAppLockupView primarySubtitleLabel](self, "primarySubtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFAppLockupView specification](self, "specification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subtitleLabelFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v12);

  -[TFAppLockupView secondarySubtitleLabel](self, "secondarySubtitleLabel");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[TFAppLockupView specification](self, "specification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subtitleLabelFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

}

- (CGSize)displayedIconSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TFAppLockupView specification](self, "specification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v6 = a3;
  -[TFAppLockupView iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDE57E8], "animation");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDuration:", 0.3);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimingFunction:", v8);

    objc_msgSend(v11, "setType:", *MEMORY[0x24BDE5E00]);
    -[TFAppLockupView iconView](self, "iconView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAnimation:forKey:", v11, 0);

  }
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)primarySubtitleLabel
{
  return self->_primarySubtitleLabel;
}

- (UILabel)secondarySubtitleLabel
{
  return self->_secondarySubtitleLabel;
}

- (TFAppLockupViewSpecification)specification
{
  return self->_specification;
}

- (void)setSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_specification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_secondarySubtitleLabel, 0);
  objc_storeStrong((id *)&self->_primarySubtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
